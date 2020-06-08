package com.softeem.controller;

import com.softeem.model.LayuiAllInfoResult;
import com.softeem.server.Impl.SongListServerImpl;
import com.softeem.server.SongListServer;
import com.softeem.utils.JsonUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/songListInfoPage.am")
public class GetLayuiSongListInfoResultServlet extends HttpServlet {
    private SongListServer songListServer;

    public GetLayuiSongListInfoResultServlet() {
        this.songListServer = new SongListServerImpl();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String page = req.getParameter("page");
        String limit = req.getParameter("limit");
        String name = req.getParameter("name");
        //调用数据库，进行分页查询
        LayuiAllInfoResult layuiSongListInfoResult = songListServer.getLayuiSongListInfoResult(Integer.parseInt(page), Integer.parseInt(limit),name);
        resp.getWriter().println(JsonUtils.objectToJson(layuiSongListInfoResult));
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
