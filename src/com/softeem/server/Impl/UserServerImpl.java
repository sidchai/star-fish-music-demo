package com.softeem.server.Impl;

import com.softeem.dao.UserDao;
import com.softeem.model.LayuiAllInfoResult;
import com.softeem.pojo.User;
import com.softeem.server.UserServer;
import com.softeem.utils.JsonUtils;
import com.softeem.utils.MD5Util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Date;
import java.util.List;

public class UserServerImpl implements UserServer {
    private UserDao userDao;

    public UserServerImpl() {
        this.userDao = new UserDao();
    }

    //查询手机号是否存在
    @Override
    public boolean verifyPhone(String phone) {
        return userDao.getUserByPhone(phone) == null;
    }

    //查询用户名是否存在
    @Override
    public boolean verifyUsername(String username) {
        return userDao.getUserByUsername(username) == null;
    }

    //注册
    @Override
    public boolean register(User user) {
        return userDao.register(user) > 0;
    }

    //用户名登录
    @Override
    public boolean loginByUsername(User user, HttpServletRequest req, HttpServletResponse resp) {
        User resultUser = userDao.getUserByUsername(user.getUsername());
        if(resultUser == null){
            //登录失败尝试删除cookie信息
            Cookie cookie = new Cookie("USER_INFO","");
            cookie.setMaxAge(0);
            resp.addCookie(cookie);
            return false;
        }
        if(resultUser.getPassword().equals(MD5Util.encrypt(user.getPassword()))){
            //保存用户信息到session中
            HttpSession session = req.getSession();
            int isAdmin = userDao.getUserIsAdmin(user.getUsername());
            if(isAdmin == 0){
                session.setAttribute("USER_INFO",resultUser);
                //更新登录状态
                resultUser.setLastTime(resultUser.getThisTime());
                resultUser.setThisTime(new Date());
                //重新写入数据库中
                userDao.setUserById(resultUser);
                //清楚密码信息
                resultUser.setPassword("");
                //创建Cookie保存数据
                try {
                    Cookie cookie = new Cookie("USER_INFO", URLEncoder.encode(JsonUtils.objectToJson(user),"UTF-8"));
                    //判断是否勾选了记住密码
                    String remember = req.getParameter("remember");
                    if("on".equals(remember)){
                        cookie.setMaxAge(30*24*3600);
                    }else {
                        cookie.setMaxAge(0);
                    }
                    resp.addCookie(cookie);
                } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                }
            }else {
                session.setAttribute("ADMIN_INFO",resultUser);
                //更新登录状态
                resultUser.setLastTime(resultUser.getThisTime());
                resultUser.setThisTime(new Date());
                //重新写入数据库中
                userDao.setUserById(resultUser);
                //清楚密码信息
                resultUser.setPassword("");
                //创建Cookie保存数据
                try {
                    Cookie cookie = new Cookie("ADMIN_INFO", URLEncoder.encode(JsonUtils.objectToJson(user),"UTF-8"));
                    //判断是否勾选了记住密码
                    String remember = req.getParameter("remember");
                    if("on".equals(remember)){
                        cookie.setMaxAge(30*24*3600);
                    }else {
                        cookie.setMaxAge(0);
                    }
                    resp.addCookie(cookie);
                } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                }
            }

            return true;
        }
        return false;
    }

    //手机号登录
    @Override
    public boolean loginByPhone(User user, HttpServletRequest req, HttpServletResponse resp) {
        User resultUser = userDao.getUserByPhone(user.getPhone());
        if(resultUser == null){
            //登录失败尝试删除cookie信息
            Cookie cookie = new Cookie("USER_INFO","");
            cookie.setMaxAge(0);
            resp.addCookie(cookie);
            return false;
        }
        if(resultUser.getPassword().equals(MD5Util.encrypt(user.getPassword()))){
            //保存用户信息到session中
            HttpSession session = req.getSession();
            session.setAttribute("USER_INFO",resultUser);
            //更新登录状态
            resultUser.setLastTime(resultUser.getThisTime());
            resultUser.setThisTime(new Date());
            //重新写入数据库中
            userDao.setUserById(resultUser);
            //清除密码信息
            resultUser.setPassword("");
            //创建Cookie保存数据
            try {
                Cookie cookie = new Cookie("USER_INFO", URLEncoder.encode(JsonUtils.objectToJson(user),"UTF-8"));
                //判断是否勾选了记住密码
                String remember = req.getParameter("remember");
                if("on".equals(remember)){
                    cookie.setMaxAge(30*24*3600);
                }else {
                    cookie.setMaxAge(0);
                }
                resp.addCookie(cookie);
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
            return true;
        }
        return false;
    }

    //根据用户名查询用户权限
    public int getIsAdminByUsername(String username){
        return userDao.getUserIsAdmin(username);
    }

    //分页查询所有用户
    @Override
    public LayuiAllInfoResult<User> getLayuiUserInfoResult(int page, int limit,String name) {
        LayuiAllInfoResult<User> userInfoResult = new LayuiAllInfoResult<>();
        //返回成功
        userInfoResult.setCode(0);
        userInfoResult.setMsg("");
        List<User> users = userDao.userInfoPage(page, limit,name);
        for (User user : users) {
            user.setIsAdmin("0".equals(user.getIsAdmin()) == true  ? "普通用户" : "管理员");
        }
        userInfoResult.setData(users);
        userInfoResult.setCount(userDao.getUserInfoCount(name));
        return userInfoResult;
    }

    //根据id查询用户信息
    @Override
    public User selectUserInfoByUsername(String username) {
        return userDao.getUserByUsername(username);
    }

    //修改用户信息
    @Override
    public int updateUserInfo(User user) {
        return userDao.updateUserInfo(user);
    }

    //根据id删除用户信息
    @Override
    public int deleteUserInfoById(int id) {
        return userDao.deleteUserInfoById(id);
    }

    //查询用户总数
    @Override
    public Long getUserInfoCount(String name) {
        return userDao.getUserInfoCount(name);
    }

    @Override
    public int setUserPic(User user) {
        return userDao.setUserPic(user);
    }
}
