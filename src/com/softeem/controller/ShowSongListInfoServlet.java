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

@WebServlet("/showSongListInfo.do")
public class ShowSongListInfoServlet extends HttpServlet {
    private SongListServer songListServer;

    public ShowSongListInfoServlet() {
        this.songListServer = new SongListServerImpl();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String cId = req.getParameter("cId");//得到歌单id
        //查询相关歌单信息
        SongList songList = songListServer.selectSongListInfoById(Integer.parseInt(cId));
        req.setAttribute("show_song_list_info",songList);
        req.getRequestDispatcher("collect.jsp").forward(req,resp);
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
