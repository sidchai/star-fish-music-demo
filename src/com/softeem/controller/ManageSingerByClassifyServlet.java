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

@WebServlet("/manageSingerByClassify.do")
public class ManageSingerByClassifyServlet extends HttpServlet {
    private SingerServer singerServer;

    public ManageSingerByClassifyServlet() {
        this.singerServer = new SingerServerImpl();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String page = req.getParameter("page");
        String limit = req.getParameter("limit");
        String cId = req.getParameter("cId");
        List<Singer> singerInfoByClassify = singerServer.getSingerInfoByClassify(Integer.parseInt(cId),Integer.parseInt(page),Integer.parseInt(limit));
        Page<Singer> singerPageByClassify = new Page<>();
        singerPageByClassify.setPage(Integer.parseInt(page));
        singerPageByClassify.setLimit(Integer.parseInt(limit));
        singerPageByClassify.setData(singerInfoByClassify);
        singerPageByClassify.setCount(singerServer.getSingerInfoCountByClassify(Integer.parseInt(cId)));
        resp.getWriter().println(JsonUtils.objectToJson(singerPageByClassify));
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
