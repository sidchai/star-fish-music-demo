package com.softeem.controller;

import com.softeem.model.LayuiAllInfoResult;
import com.softeem.server.CarouselServer;
import com.softeem.server.Impl.CarouselServerImpl;
import com.softeem.utils.JsonUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/carouselPage.am")
public class GetLayuiCarouselResultServlet extends HttpServlet {
    private CarouselServer carouselServer;

    public GetLayuiCarouselResultServlet() {
        this.carouselServer = new CarouselServerImpl();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String page = req.getParameter("page");
        String limit = req.getParameter("limit");
        String name = req.getParameter("name");
        //调用数据库，进行分页查询
        LayuiAllInfoResult layuiCarouselResult = carouselServer.getLayuiCarouselResult(Integer.parseInt(page), Integer.parseInt(limit),name);
        resp.getWriter().println(JsonUtils.objectToJson(layuiCarouselResult));
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
