package com.softeem.server;

import com.softeem.model.LayuiAllInfoResult;
import com.softeem.pojo.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface UserServer {
    //查询手机号是否存在
    public abstract boolean verifyPhone(String phone);
    //查询用户名是否存在
    public abstract boolean verifyUsername(String username);
    //注册
    public abstract boolean register(User user);
    //用户名登录
    public abstract boolean loginByUsername(User user, HttpServletRequest req, HttpServletResponse resp);
    //手机号登录
    public abstract boolean loginByPhone(User user, HttpServletRequest req, HttpServletResponse resp);
    //查询用户登录权限
    public abstract int getIsAdminByUsername(String username);
    ////分页查询所有用户
    public abstract LayuiAllInfoResult<User> getLayuiUserInfoResult(int page, int limit,String name);
    //根据用户名查询用户信息
    public abstract User selectUserInfoByUsername(String username);
    //修改用户信息
    public abstract int updateUserInfo(User user);
    //根据id删除用户信息
    public abstract int deleteUserInfoById(int id);
    //查询用户总数
    public abstract Long getUserInfoCount(String name);
    //修改用户输入信息
    public abstract int setUserPic(User user);
}
