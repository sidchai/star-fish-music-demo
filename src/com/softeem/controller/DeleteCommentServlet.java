package com.softeem.controller;

import com.softeem.server.CommentServer;
import com.softeem.server.Impl.CommentServerImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/deleteComment.am")
public class DeleteCommentServlet extends HttpServlet {
    private CommentServer commentServer;

    public DeleteCommentServlet() {
        this.commentServer = new CommentServerImpl();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            //接收评论id
            String id = req.getParameter("id");
            //删除数据库
            commentServer.deleteCommentInfo(Integer.parseInt(id));
            resp.getWriter().println(true);
        } catch (Exception e) {
            resp.getWriter().println(false);
        }
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
