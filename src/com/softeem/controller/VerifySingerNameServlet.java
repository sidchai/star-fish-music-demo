package com.softeem.controller;

import com.softeem.server.Impl.SingerServerImpl;
import com.softeem.server.SingerServer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/*
    判断歌手是否存在
 */
@WebServlet("/verifySingerName.am")
public class VerifySingerNameServlet extends HttpServlet {
    private SingerServer singerServer;

    public VerifySingerNameServlet() {
        this.singerServer = new SingerServerImpl();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //得到用户输入的歌手名
        String singerName = req.getParameter("singerName");
        //返回验证结果
        resp.getWriter().println(singerServer.verifySingerName(singerName));
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
