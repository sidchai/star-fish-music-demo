package com.softeem.controller;

import com.softeem.server.Impl.MySongServerImpl;
import com.softeem.server.MySongServer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/verifySong.do")
public class VerifySongServlet extends HttpServlet {
    private MySongServer mySongServer;

    public VerifySongServlet() {
        this.mySongServer = new MySongServerImpl();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String songId = req.getParameter("songId");//得到歌曲id
        boolean result = mySongServer.verifySongCollect(Integer.parseInt(songId));
        resp.getWriter().println(result);
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
