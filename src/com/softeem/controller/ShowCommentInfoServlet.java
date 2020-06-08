package com.softeem.controller;

import com.softeem.pojo.Comment;
import com.softeem.server.CommentServer;
import com.softeem.server.Impl.CommentServerImpl;
import com.softeem.utils.JsonUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/showCommentInfo.do")
public class ShowCommentInfoServlet extends HttpServlet {
    private CommentServer commentServer;

    public ShowCommentInfoServlet() {
        this.commentServer = new CommentServerImpl();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String songId = req.getParameter("songId");
        List<Comment> commentInfoBySongId = commentServer.getCommentInfoBySongId(Integer.parseInt(songId));
        resp.getWriter().println(JsonUtils.objectToJson(commentInfoBySongId));
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
