package com.softeem.controller;

import com.softeem.server.Impl.UserServerImpl;
import com.softeem.server.UserServer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;

@WebServlet("/deleteUserInfo.am")
public class DeleteUserInfoServlet extends HttpServlet {
    private UserServer userServer;

    public DeleteUserInfoServlet() {
        this.userServer = new UserServerImpl();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取删除信息的id
        String id = req.getParameter("id");
        //获取删除文件的url
        String[] userUrl = req.getParameter("url").split("/");
        String songFileName = userUrl[userUrl.length - 1];
        try {
            //删除数据库
            userServer.deleteUserInfoById(Integer.parseInt(id));
            //删除用户图片
            File file = new File("E:/IDEA-workspace/StarFishMusic/web/img/userPic/" + songFileName);
            file.delete();
            resp.getWriter().println(true);
        } catch (Exception e) {
            resp.getWriter().println(false);
        }
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
