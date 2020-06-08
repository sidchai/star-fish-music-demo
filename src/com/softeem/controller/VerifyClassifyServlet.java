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
@WebServlet("/verifyClassify.am")
public class VerifyClassifyServlet extends HttpServlet {
    private SingerServer singerServer;

    public VerifyClassifyServlet() {
        this.singerServer = new SingerServerImpl();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //得到用户输入的歌手名
        String classify = req.getParameter("classify");
        //返回验证结果
        int result = singerServer.getClassify(classify);
        if(result > 0){
            resp.getWriter().println(true);
        }else{
            resp.getWriter().println(false);
        }
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
