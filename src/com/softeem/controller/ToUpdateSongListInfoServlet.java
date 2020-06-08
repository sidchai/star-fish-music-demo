package com.softeem.controller;

import com.softeem.pojo.SongList;
import com.softeem.server.Impl.SongListServerImpl;
import com.softeem.server.SongListServer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/toUpdateSongListInfo.am")
public class ToUpdateSongListInfoServlet extends HttpServlet {
    private SongListServer songListServer;

    public ToUpdateSongListInfoServlet() {
        this.songListServer = new SongListServerImpl();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //得到用户传递过来歌单id
        String id = req.getParameter("id");
        //根据id得到当前歌单信息
        SongList songList = songListServer.selectSongListInfoById(Integer.parseInt(id));
        //把该歌单信息存入session域中
        req.getSession().setAttribute("SONG_LIST_INFO",songList);
        req.getRequestDispatcher("/WEB-INF/StarFishMusic-admin/updateSongListInfo.jsp").forward(req,resp);
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
