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

@WebServlet("/toUpdateCarousel.am")
public class ToUpdateCarouselServlet extends HttpServlet {
    private CarouselServer carouselServer;

    public ToUpdateCarouselServlet() {
        this.carouselServer = new CarouselServerImpl();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //得到用户传递过来轮播图id
        String id = req.getParameter("id");
        //根据id得到当前轮播图信息
        Carousel carousel = carouselServer.selectCarouselById(Integer.parseInt(id));
        //把该歌曲信息存入request域中
        req.getSession().setAttribute("CAROUSEL_INFO",carousel);
        req.getRequestDispatcher("/WEB-INF/StarFishMusic-admin/updateCarousel.jsp").forward(req,resp);
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
