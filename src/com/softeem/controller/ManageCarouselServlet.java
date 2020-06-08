package com.softeem.controller;

import com.softeem.pojo.Carousel;
import com.softeem.server.CarouselServer;
import com.softeem.server.Impl.CarouselServerImpl;
import com.softeem.utils.JsonUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/manageCarousel.do")
public class ManageCarouselServlet extends HttpServlet {
    private CarouselServer carouselServer;

    public ManageCarouselServlet() {
        this.carouselServer = new CarouselServerImpl();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int limit = 4;
        List<Carousel> carousels = carouselServer.selectCarouselInfo(limit);
        resp.getWriter().println(JsonUtils.objectToJson(carousels));
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
