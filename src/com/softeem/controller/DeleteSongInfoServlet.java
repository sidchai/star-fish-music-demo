package com.softeem.controller;

import com.softeem.server.Impl.SongServerImpl;
import com.softeem.server.SongServer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;

@WebServlet("/deleteSongInfo.am")
public class DeleteSongInfoServlet extends HttpServlet {
    private SongServer songServer;

    public DeleteSongInfoServlet() {
        this.songServer = new SongServerImpl();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取删除信息的id
        String id = req.getParameter("id");
        //获取删除歌曲文件的url
        String[] songUrl = req.getParameter("url").split("/");
        String[] lyricUrl = req.getParameter("lyric").split("/");
        String songFileName = songUrl[songUrl.length - 1];
        String lyricFileName = lyricUrl[lyricUrl.length - 1];
        try {
            //删除数据库
            songServer.deleteSongInfoById(Integer.parseInt(id));
            //删除歌曲文件
            File file = new File("E:/IDEA-workspace/StarFishMusic/web/media/song/" + songFileName);
            file.delete();
            //删除歌词文件
            File file1 = new File("E:/IDEA-workspace/StarFishMusic/web/media/lyric/" + lyricFileName);
            file1.delete();
            resp.getWriter().println(true);
        } catch (Exception e) {
            resp.getWriter().println(false);
        }
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
