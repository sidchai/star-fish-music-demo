package com.softeem.controller;

import com.softeem.pojo.Carousel;
import com.softeem.server.CarouselServer;
import com.softeem.server.Impl.CarouselServerImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/updateCarousel.am")
public class UpdateCarouselServlet extends HttpServlet {
    private CarouselServer carouselServer;

    public UpdateCarouselServlet() {
        this.carouselServer = new CarouselServerImpl();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //接收信息
        String title = req.getParameter("title");
        String sort = req.getParameter("sort");
        Carousel carousel = (Carousel) req.getSession().getAttribute("CAROUSEL_INFO");
        //保存修改信息
        carousel.setTitle(title);
        carousel.setSort(sort);
        //重新加入数据库
        carouselServer.updateCarousel(carousel);
        //跳回主页
        resp.sendRedirect(req.getContextPath() + "/toCarousel.am");

    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
