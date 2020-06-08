package com.softeem.controller;

import com.softeem.pojo.User;
import com.softeem.server.Impl.UserServerImpl;
import com.softeem.server.UserServer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/toUpdateUserInfo.am")
public class ToUpdateUserInfoServlet extends HttpServlet {
    private UserServer userServer;

    public ToUpdateUserInfoServlet() {
        this.userServer = new UserServerImpl();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //得到用户传递过来用户名
        String username = req.getParameter("username");
        //根据用户名得到当前用户信息
        User user = userServer.selectUserInfoByUsername(username);
        //把该用户信息存入session域中
        req.getSession().setAttribute("UPDATE_USER_INFO",user);
        req.getRequestDispatcher("/WEB-INF/StarFishMusic-admin/updateUserInfo.jsp").forward(req,resp);
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
