package com.softeem.controller;

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

@WebServlet("/manageSongListStyle.do")
public class ManageSongListStyleServlet extends HttpServlet {
    private SongListServer songListServer;

    public ManageSongListStyleServlet() {
        this.songListServer = new SongListServerImpl();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<SongList> songLists = songListServer.groupByStyle();
        resp.getWriter().println(JsonUtils.objectToJson(songLists));
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
