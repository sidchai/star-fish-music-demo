package com.softeem.controller;

import com.softeem.pojo.Song;
import com.softeem.server.Impl.SongServerImpl;
import com.softeem.server.SongServer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/toUpdateSongInfo.am")
public class ToUpdateSongInfoServlet extends HttpServlet {
    private SongServer songServer;

    public ToUpdateSongInfoServlet() {
        this.songServer = new SongServerImpl();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //得到用户传递过来歌曲id
        String id = req.getParameter("id");
        //根据id得到当前歌曲信息
        Song song = songServer.selectSongInfoById(Integer.parseInt(id));
        //把该歌曲信息存入request域中
        req.getSession().setAttribute("SONG_INFO",song);
        req.getRequestDispatcher("/WEB-INF/StarFishMusic-admin/updateSongInfo.jsp").forward(req,resp);
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
