package com.softeem.controller;

import com.softeem.server.Impl.SongListSongServerImpl;
import com.softeem.server.SongListSongServer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/deleteSongListSongInfo.am")
public class DeleteSongListSongInfoServlet extends HttpServlet {
    private SongListSongServer songListSongServer;

    public DeleteSongListSongInfoServlet() {
        this.songListSongServer = new SongListSongServerImpl();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            //接收歌曲id
            String id = req.getParameter("id");
            System.out.println("id = " + id);
            //删除数据库
            songListSongServer.deleteSongListSongInfo(Integer.parseInt(id));
            resp.getWriter().println(true);
        } catch (Exception e) {
            resp.getWriter().println(false);
        }
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
