package com.softeem.controller;

import com.softeem.model.Page;
import com.softeem.pojo.SongList;
import com.softeem.server.Impl.SongListServerImpl;
import com.softeem.server.SongListServer;
import com.softeem.utils.JsonUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/manageSongListByStyle.do")
public class ManageSongListByStyleServlet extends HttpServlet {
    private SongListServer songListServer;

    public ManageSongListByStyleServlet() {
        this.songListServer = new SongListServerImpl();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getSession().removeAttribute("song_list_style_count");
        String style = req.getParameter("style");
        String page = req.getParameter("page");
        String limit = req.getParameter("limit");
        /*req.getSession().setAttribute("song_list_style_count",songListServer.getSongListInfoCountByStyle(style));*/
        List<SongList> songListsByStyle = songListServer.selectSongListInfo(Integer.parseInt(page),Integer.parseInt(limit), style);
        Page<SongList> songListPage = new Page<>();
        songListPage.setPage(Integer.parseInt(page));
        songListPage.setLimit(Integer.parseInt(limit));
        songListPage.setData(songListsByStyle);
        songListPage.setCount(songListServer.getSongListInfoCountByStyle(style));
        resp.getWriter().println(JsonUtils.objectToJson(songListPage));
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
