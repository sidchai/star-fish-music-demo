package com.softeem.controller;

import com.softeem.server.Impl.SingerServerImpl;
import com.softeem.server.Impl.SongListServerImpl;
import com.softeem.server.Impl.SongServerImpl;
import com.softeem.server.Impl.UserServerImpl;
import com.softeem.server.SingerServer;
import com.softeem.server.SongListServer;
import com.softeem.server.SongServer;
import com.softeem.server.UserServer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/toAdminHome.am")
public class ToAdminHomeServlet extends HttpServlet {
    private UserServer userServer;
    private SongServer songServer;
    private SingerServer singerServer;
    private SongListServer songListServer;

    public ToAdminHomeServlet() {
        this.userServer = new UserServerImpl();
        this.songServer = new SongServerImpl();
        this.singerServer = new SingerServerImpl();
        this.songListServer = new SongListServerImpl();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        Long userInfoCount = userServer.getUserInfoCount(name);
        Long songInfoCount = songServer.getSongInfoCount(name);
        Long singerInfoCount = singerServer.getSingerInfoCount(name);
        Long songListInfoCount = songListServer.getSongListInfoCount(name);
        req.setAttribute("user_info_count",userInfoCount);
        req.setAttribute("song_info_count",songInfoCount);
        req.setAttribute("singer_info_count",singerInfoCount);
        req.setAttribute("song_list_info_count",songListInfoCount);
        req.getRequestDispatcher("/WEB-INF/StarFishMusic-admin/adminHome.jsp").forward(req,resp);
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
