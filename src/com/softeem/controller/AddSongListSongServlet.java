package com.softeem.controller;

import com.softeem.server.Impl.SongListSongServerImpl;
import com.softeem.server.SongListSongServer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/addSongListSong.am")
public class AddSongListSongServlet extends HttpServlet {
    private SongListSongServer songListSongServer;

    public AddSongListSongServlet() {
        this.songListSongServer = new SongListSongServerImpl();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //得到歌曲id
        String songId = req.getParameter("songId");
        //得到歌单id
        String songListId = (String) req.getSession().getAttribute("song_list_id");
        //插入数据库
        songListSongServer.addSongListSong(Integer.parseInt(songId),Integer.parseInt(songListId));
        //回到主页
        resp.sendRedirect(req.getContextPath()+"/toContent.am?id=" + songListId);
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
