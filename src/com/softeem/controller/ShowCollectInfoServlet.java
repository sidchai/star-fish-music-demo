package com.softeem.controller;

import com.softeem.model.LayuiAllInfoResult;
import com.softeem.pojo.Song;
import com.softeem.server.Impl.SongListSongServerImpl;
import com.softeem.server.SongListSongServer;
import com.softeem.utils.JsonUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/showCollectInfo.do")
public class ShowCollectInfoServlet extends HttpServlet {
    private SongListSongServer songListSongServer;

    public ShowCollectInfoServlet() {
        this.songListSongServer = new SongListSongServerImpl();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String page = req.getParameter("page");
        String limit = req.getParameter("limit");
        String name = req.getParameter("name");
        String cId = req.getParameter("cId");//得到歌单id
        LayuiAllInfoResult<Song> collectInfo = songListSongServer.getSongListSongInfo(Integer.parseInt(page),Integer.parseInt(limit),name,Integer.parseInt(cId));
        resp.getWriter().println(JsonUtils.objectToJson(collectInfo));
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
