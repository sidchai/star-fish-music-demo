package com.softeem.controller;

import com.softeem.server.Impl.UserServerImpl;
import com.softeem.server.UserServer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
/*
    判断验证码是否一致
 */
@WebServlet("/verifyCaptcha.do")
public class VerifyCaptchaServlet extends HttpServlet {
    private UserServer userServer;

    public VerifyCaptchaServlet() {
        this.userServer = new UserServerImpl();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //得到用户输入的验证码
        String vercode = req.getParameter("vercode");
        //创建session对象
        HttpSession session = req.getSession();
        //得到session中保存的验证码信息
        //返回验证结果
        resp.getWriter().println(session.getAttribute("_code").equals(vercode.toLowerCase()));
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
