package com.softeem.controller;

import com.softeem.server.Impl.UserServerImpl;
import com.softeem.server.UserServer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
/*
    判断用户名是否存在
 */
@WebServlet("/verifyUsername.do")
public class VerifyUsernameServlet extends HttpServlet {
    private UserServer userServer;

    public VerifyUsernameServlet() {
        this.userServer = new UserServerImpl();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //得到用户输入的用户名
        String username = req.getParameter("username");
        //返回验证结果
        resp.getWriter().println(userServer.verifyUsername(username));
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
