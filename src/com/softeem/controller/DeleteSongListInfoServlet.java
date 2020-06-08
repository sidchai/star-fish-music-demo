package com.softeem.controller;

import com.softeem.server.Impl.SongListServerImpl;
import com.softeem.server.SongListServer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;

@WebServlet("/deleteSongListInfo.am")
public class DeleteSongListInfoServlet extends HttpServlet {
    private SongListServer songListServer;

    public DeleteSongListInfoServlet() {
        this.songListServer = new SongListServerImpl();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取删除信息的id
        String id = req.getParameter("id");
        //获取删除歌单图片url
        String[] songListUrl = req.getParameter("url").split("/");
        String songFileName = songListUrl[songListUrl.length - 1];
        try {
            //删除数据库
            songListServer.deleteSongListInfoById(Integer.parseInt(id));
            //删除歌单图片文件
            File file = new File("E:/IDEA-workspace/StarFishMusic/web/img/songListPic/" + songFileName);
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
