package com.softeem.controller;

import com.softeem.model.Page;
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

@WebServlet("/manageSingerAll.do")
public class ManageSingerAllServlet extends HttpServlet {
    private SingerServer singerServer;

    public ManageSingerAllServlet() {
        this.singerServer = new SingerServerImpl();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String page = req.getParameter("page");
        String limit = req.getParameter("limit");
        List<Singer> singers = singerServer.getSingerInfoByClassify(0,Integer.parseInt(page),Integer.parseInt(limit));
        Page<Singer> singerPage = new Page<>();
        singerPage.setPage(Integer.parseInt(page));
        singerPage.setLimit(Integer.parseInt(limit));
        singerPage.setData(singers);
        singerPage.setCount(singerServer.getSingerInfoCount(""));
        resp.getWriter().println(JsonUtils.objectToJson(singerPage));
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
