package com.softeem.controller;

import com.softeem.server.Impl.MySongServerImpl;
import com.softeem.server.MySongServer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/collectSong.do")
public class CollectSongServlet extends HttpServlet {
    private MySongServer mySongServer;

    public CollectSongServlet() {
        this.mySongServer = new MySongServerImpl();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uId = req.getParameter("uId");//接收用户id
        String sId = req.getParameter("sId");//接收歌曲id
        mySongServer.addMySongInfo(Integer.parseInt(uId),Integer.parseInt(sId));//插入数据库
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
