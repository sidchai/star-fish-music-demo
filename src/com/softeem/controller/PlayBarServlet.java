package com.softeem.controller;

import com.softeem.pojo.Song;
import com.softeem.server.Impl.SingerServerImpl;
import com.softeem.server.Impl.SongServerImpl;
import com.softeem.server.SingerServer;
import com.softeem.server.SongServer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/playBar.do")
public class PlayBarServlet extends HttpServlet {
    private SongServer songServer;
    private SingerServer singerServer;
    public PlayBarServlet() {
        this.songServer = new SongServerImpl();
        this.singerServer = new SingerServerImpl();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String songId = req.getParameter("songId");
        String singerName = req.getParameter("singerName");
        Song playBarSong = songServer.selectSongInfoById(Integer.parseInt(songId));
        playBarSong.setCount(playBarSong.getCount()+1);//修改播放次数
        //重新插入数据
        songServer.updateSongInfo(playBarSong);
        req.getSession().setAttribute("play_bar_song",playBarSong);
        req.getSession().setAttribute("play_bar_singer",singerServer.selectSingerInfoByName(singerName));
        req.getRequestDispatcher("playBar.jsp").forward(req,resp);
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
