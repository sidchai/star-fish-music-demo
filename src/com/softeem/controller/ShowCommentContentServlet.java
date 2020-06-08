package com.softeem.controller;

import com.softeem.model.LayuiAllInfoResult;
import com.softeem.server.CommentServer;
import com.softeem.server.Impl.CommentServerImpl;
import com.softeem.utils.JsonUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/showCommentContent.am")
public class ShowCommentContentServlet extends HttpServlet {
    private CommentServer commentServer;

    public ShowCommentContentServlet() {
        this.commentServer = new CommentServerImpl();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String page = req.getParameter("page");
        String limit = req.getParameter("limit");
        String songId = (String) req.getSession().getAttribute("song_id");
        LayuiAllInfoResult layuiAllInfoResult = commentServer.getCommentInfo(Integer.parseInt(page),Integer.parseInt(limit),Integer.parseInt(songId));
        resp.getWriter().println(JsonUtils.objectToJson(layuiAllInfoResult));
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
