package com.softeem.controller;

import com.softeem.pojo.Singer;
import com.softeem.server.Impl.SingerServerImpl;
import com.softeem.server.SingerServer;
import com.softeem.utils.JsonUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/manageSingerRank.do")
public class ManageSingerRankServlet extends HttpServlet {
    private SingerServer singerServer;

    public ManageSingerRankServlet() {
        this.singerServer = new SingerServerImpl();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int rank = 5;
        List<Singer> singers = singerServer.selectSingerInfo(rank);
        resp.getWriter().println(JsonUtils.objectToJson(singers));
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
