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
import java.util.List;

@WebServlet("/selectSong.am")
public class SelectSongServlet extends HttpServlet {
    private SongServer songServer;

    public SelectSongServlet() {
        this.songServer = new SongServerImpl();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Song> songInfoAll = songServer.getSongInfo();
        req.setAttribute("song_info_all",songInfoAll);
        req.getRequestDispatcher("/WEB-INF/StarFishMusic-admin/selectContent.jsp").forward(req,resp);
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
