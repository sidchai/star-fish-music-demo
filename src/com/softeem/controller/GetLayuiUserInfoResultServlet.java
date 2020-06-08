package com.softeem.controller;

import com.softeem.model.LayuiAllInfoResult;
import com.softeem.server.Impl.UserServerImpl;
import com.softeem.server.UserServer;
import com.softeem.utils.JsonUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/userInfoPage.am")
public class GetLayuiUserInfoResultServlet extends HttpServlet {
    private UserServer userServer;

    public GetLayuiUserInfoResultServlet() {
        this.userServer = new UserServerImpl();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String page = req.getParameter("page");
        String limit = req.getParameter("limit");
        String name = req.getParameter("name");
        //调用数据库，进行分页查询
        LayuiAllInfoResult layuiUserInfoResult = userServer.getLayuiUserInfoResult(Integer.parseInt(page), Integer.parseInt(limit),name);
        resp.getWriter().println(JsonUtils.objectToJson(layuiUserInfoResult));
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
