package com.softeem.controller;

import com.softeem.pojo.User;
import com.softeem.server.Impl.UserServerImpl;
import com.softeem.server.UserServer;
import org.apache.commons.lang3.time.DateUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.util.Date;

@WebServlet("/userUpdateUserInfo.do")
public class UserUpdateUserInfoServlet extends HttpServlet {
    private UserServer userServer;

    public UserUpdateUserInfoServlet() {
        this.userServer = new UserServerImpl();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取用户信息
        String password = req.getParameter("password");
        String sex = req.getParameter("sex");
        String email = req.getParameter("email");
        String birthdays = req.getParameter("birthday");
        String signature = req.getParameter("signature");
        String region = req.getParameter("city");

        //上传成功修改上传的信息
        //封装数据
        User user = (User) req.getSession().getAttribute("USER_INFO");
        user.setPassword(password);
        user.setSex("0".equals(sex) == true ? "男" : "女");
        user.setEmail(email);
        //将String日期装成Date保存
        Date birthday = null;
        try {
            birthday = DateUtils.parseDate(birthdays, "yyyy-MM-dd");
        } catch (ParseException e) {
            e.printStackTrace();
        }
        user.setBirthday(birthday);
        user.setSignature(signature);
        user.setRegion(region);
        //将数据插入数据库
        userServer.updateUserInfo(user);
        //跳回主页
        req.getSession().removeAttribute("USER_INFO");//删除原session中用户信息
        Cookie cookie = new Cookie("USER_INFO","");
        cookie.setMaxAge(0);
        resp.addCookie(cookie);
        resp.sendRedirect(req.getContextPath() + "/index.jsp");
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
