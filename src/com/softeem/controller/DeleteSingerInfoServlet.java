package com.softeem.controller;

import com.softeem.server.Impl.SingerServerImpl;
import com.softeem.server.SingerServer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;

@WebServlet("/deleteSingerInfo.am")
public class DeleteSingerInfoServlet extends HttpServlet {
    private SingerServer singerServer;

    public DeleteSingerInfoServlet() {
        this.singerServer = new SingerServerImpl();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取删除信息的id
        String id = req.getParameter("id");
        //获取删除文件的url
        String[] singerUrl = req.getParameter("url").split("/");
        String songFileName = singerUrl[singerUrl.length - 1];
        try {
            //删除数据库
            singerServer.deleteSingerInfoById(Integer.parseInt(id));
            //删除歌手图片
            File file = new File("E:/IDEA-workspace/StarFishMusic/web/img/singerListPic/" + songFileName);
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
