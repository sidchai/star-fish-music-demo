package com.softeem.controller;

import com.softeem.pojo.Comment;
import com.softeem.server.CommentServer;
import com.softeem.server.Impl.CommentServerImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

@WebServlet("/addUserComment.do")
public class AddUserCommentServlet extends HttpServlet {
    private CommentServer commentServer;

    public AddUserCommentServlet() {
        this.commentServer = new CommentServerImpl();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String desc = req.getParameter("desc");
        String userId = req.getParameter("userId");
        String songId = req.getParameter("songId");
        //封装数据
        Comment comment = new Comment();
        comment.setContent(desc);
        comment.setCommentTime(new Date());
        comment.setUserId(Integer.parseInt(userId));
        comment.setSongId(Integer.parseInt(songId));
        //添加到数据库
        commentServer.addUserCommentInfo(comment);
        resp.getWriter().println(true);
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
