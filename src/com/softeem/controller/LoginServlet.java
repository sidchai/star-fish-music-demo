package com.softeem.controller;

import com.softeem.pojo.User;
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
    登录
 */
@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
    private UserServer userServer;

    public LoginServlet() {
        this.userServer = new UserServerImpl();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //接收用户登录信息
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String phone = req.getParameter("phone");

        //得到session对象
        HttpSession session = req.getSession();
        /*if(userServer.getIsAdminByUsername(username) == 0){
            if(session.getAttribute("USER_INFO") != null){
                resp.sendRedirect(req.getContextPath()+"/index.jsp");
                return;
            }
        }else {
            if(session.getAttribute("ADMIN_INFO") != null){
                req.getRequestDispatcher("/WEB-INF/StarFishMusic-admin/adminHome.jsp").forward(req,resp);
                return;
            }
        }*/
        //封装数据
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setPhone(phone);
        String thisURI = (String) req.getSession().getAttribute("thisURI");
        if(userServer.getIsAdminByUsername(username) == 0){
            //普通用户
            if(username == null || "".equals(username)){
                resp.sendRedirect(req.getContextPath()+"/login.jsp");
                return;
            }
            //登录逻辑处理
            if(userServer.loginByUsername(user,req,resp)){
                //登录成功
                resp.sendRedirect(thisURI == null ? req.getContextPath()+"/index.jsp" : req.getContextPath()+thisURI);
            }else {
                //登录失败
                //设置错误信息
                session.setAttribute("login_msg",true);
                resp.sendRedirect(req.getContextPath()+"/login.jsp");
            }
        }else {
            //管理员
            if(userServer.loginByUsername(user,req,resp)){
                //登录成功
                req.getRequestDispatcher(req.getContextPath()+"/toAdminHome.am").forward(req,resp);
            }else {
                //登录失败
                //设置错误信息
                session.setAttribute("login_msg",true);
                resp.sendRedirect(req.getContextPath()+"/adminLogin.jsp");
                return;
            }
        }

    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
