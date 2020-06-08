package com.softeem.controller;

import com.softeem.pojo.Singer;
import com.softeem.server.Impl.SingerServerImpl;
import com.softeem.server.SingerServer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/showArtistSingerInfo.do")
public class ShowArtistSingerInfoServlet extends HttpServlet {
    private SingerServer singerServer;

    public ShowArtistSingerInfoServlet() {
        this.singerServer = new SingerServerImpl();

    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String sId = req.getParameter("sId");//得到歌手id
        //根据歌手id查询相关信息
        Singer singer = singerServer.selectSingerInfoById(Integer.parseInt(sId));
        req.setAttribute("show_singer_info",singer);
        req.getRequestDispatcher("artist.jsp").forward(req,resp);
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
