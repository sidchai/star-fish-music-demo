package com.softeem.controller;

import com.softeem.model.LayuiAllInfoResult;
import com.softeem.server.Impl.SongServerImpl;
import com.softeem.server.SongServer;
import com.softeem.utils.JsonUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/songInfoPage.am")
public class GetLayuiSongInfoResultServlet extends HttpServlet {
    private SongServer songServer;

    public GetLayuiSongInfoResultServlet() {
        this.songServer = new SongServerImpl();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String page = req.getParameter("page");
        String limit = req.getParameter("limit");
        String name = req.getParameter("name");
        //调用数据库，进行分页查询
        LayuiAllInfoResult layuiSongInfoResult = songServer.getLayuiSongInfoResult(Integer.parseInt(page), Integer.parseInt(limit),name);
        resp.getWriter().println(JsonUtils.objectToJson(layuiSongInfoResult));
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
