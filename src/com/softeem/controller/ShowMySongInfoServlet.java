package com.softeem.controller;

import com.softeem.model.LayuiAllInfoResult;
import com.softeem.pojo.Song;
import com.softeem.server.Impl.MySongServerImpl;
import com.softeem.server.MySongServer;
import com.softeem.utils.JsonUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/showMySongInfo.do")
public class ShowMySongInfoServlet extends HttpServlet {
    private MySongServer mySongServer;
    public ShowMySongInfoServlet() {
        this.mySongServer = new MySongServerImpl();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String page = req.getParameter("page");
        String limit = req.getParameter("limit");
        String uId = req.getParameter("uId");//得到用户id
        LayuiAllInfoResult<Song> mySongInfo = mySongServer.getMySongByUserId(Integer.parseInt(uId), Integer.parseInt(page), Integer.parseInt(limit));
        resp.getWriter().println(JsonUtils.objectToJson(mySongInfo));
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
