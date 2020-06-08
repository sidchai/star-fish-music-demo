package com.softeem.controller;

import com.softeem.model.LayuiAllInfoResult;
import com.softeem.pojo.Song;
import com.softeem.server.Impl.SongServerImpl;
import com.softeem.server.SongServer;
import com.softeem.utils.JsonUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/showArtistSongInfo.do")
public class ShowArtistSongInfoServlet extends HttpServlet {
    private SongServer songServer;

    public ShowArtistSongInfoServlet() {
        this.songServer = new SongServerImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String page = req.getParameter("page");
        String limit = req.getParameter("limit");
        String sId = req.getParameter("sId");//得到歌手id
        LayuiAllInfoResult<Song> artistSongInfo = songServer.selectSongInfoPageBySingerId(Integer.parseInt(page), Integer.parseInt(limit), Integer.parseInt(sId));
        resp.getWriter().println(JsonUtils.objectToJson(artistSongInfo));
    }
}
