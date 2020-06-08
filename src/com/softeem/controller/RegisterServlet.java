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
/*
    注册
 */
@WebServlet("/register.do")
public class RegisterServlet extends HttpServlet {
    private UserServer userServer;

    public RegisterServlet() {
        this.userServer = new UserServerImpl();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //接收用户注册信息
        String phone = req.getParameter("phone");
        String password = req.getParameter("password");
        String username = req.getParameter("username");
        String email = req.getParameter("email");

        if(username == null || "".equals(username)){
            resp.sendRedirect(req.getContextPath()+"/register.jsp");
            return;
        }

        //封装数据
        User user = new User();
        user.setPhone(phone);
        user.setPassword(password);
        user.setUsername(username);
        user.setEmail(email);
        user.setIsAdmin("0");
        user.setPic("userPic/admin.jpg");//给用户默认头像
        user.setSex("男");//给用户默认性别
        System.out.println(req.getContextPath());
        //注册逻辑处理
        if(userServer.register(user)){
            resp.sendRedirect(req.getContextPath()+"/login.jsp");
        }else {
            //封装错误信息
            req.getSession().setAttribute("reg_msg",true);
            resp.sendRedirect(req.getContextPath()+"/register.jsp");
        }
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
