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

@WebServlet("/showSongListSongPage.am")
public class ShowSongListSongPageServlet extends HttpServlet {
    private SongListSongServer songListSongServer;
    public ShowSongListSongPageServlet() {
        this.songListSongServer = new SongListSongServerImpl();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String page = req.getParameter("page");
        String limit = req.getParameter("limit");
        String name = req.getParameter("name");
        String songListId = (String) req.getSession().getAttribute("song_list_id");
        LayuiAllInfoResult<Song> layuiSongInfoResult = songListSongServer.getSongListSongInfo(Integer.parseInt(page),Integer.parseInt(limit),name,Integer.parseInt(songListId));
        resp.getWriter().println(JsonUtils.objectToJson(layuiSongInfoResult));
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
