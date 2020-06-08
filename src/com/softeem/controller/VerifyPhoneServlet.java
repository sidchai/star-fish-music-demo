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
    判断手机号是否存在
 */
@WebServlet("/verifyPhone.do")
public class VerifyPhoneServlet extends HttpServlet {
    private UserServer userServer;

    public VerifyPhoneServlet() {
        this.userServer = new UserServerImpl();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //得到用户输入的手机号
        String phone = req.getParameter("phone");
        //返回验证结果
        resp.getWriter().println(userServer.verifyPhone(phone));
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
