package com.softeem.controller;

import com.softeem.pojo.Singer;
import com.softeem.server.Impl.SingerServerImpl;
import com.softeem.server.SingerServer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/toUpdateSingerInfo.am")
public class ToUpdateSingerInfoServlet extends HttpServlet {
    private SingerServer singerServer;

    public ToUpdateSingerInfoServlet() {
        this.singerServer = new SingerServerImpl();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //得到用户传递过来歌曲id
        String id = req.getParameter("id");
        String classifyId = req.getParameter("classifyId");
        //根据id得到当前歌曲信息
        Singer singer = singerServer.selectSingerInfoById(Integer.parseInt(id));
        //把该歌曲信息存入request域中
        req.getSession().setAttribute("SINGER_INFO",singer);
        //将歌手类型存入request域中
        String classify = singerServer.getClassifyById(Integer.parseInt(classifyId));
        req.setAttribute("classify",classify);
        req.getRequestDispatcher("/WEB-INF/StarFishMusic-admin/updateSingerInfo.jsp").forward(req,resp);
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
