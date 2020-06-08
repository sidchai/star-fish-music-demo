package com.softeem.server.Impl;

import com.softeem.dao.CarouselDao;
import com.softeem.model.LayuiAllInfoResult;
import com.softeem.pojo.Carousel;
import com.softeem.server.CarouselServer;

import java.util.List;

public class CarouselServerImpl implements CarouselServer {
    private CarouselDao carouselDao;

    public CarouselServerImpl() {
        this.carouselDao = new CarouselDao();
    }

    //添加轮播图
    @Override
    public int addCarousel(Carousel carousel) {
        return carouselDao.addCarousel(carousel);
    }

    //分页查询所有轮播图
    @Override
    public LayuiAllInfoResult<Carousel> getLayuiCarouselResult(int page, int limit,String name) {
        LayuiAllInfoResult<Carousel> carouselResult = new LayuiAllInfoResult<>();
        //返回成功
        carouselResult.setCode(0);
        carouselResult.setMsg("");
        carouselResult.setData(carouselDao.carouselPage(page, limit,name));
        carouselResult.setCount(carouselDao.getCarouselCount(name));
        return carouselResult;

    }

    //根据id删除相关轮播图
    @Override
    public int deleteCarouselById(int id) {
        return carouselDao.deleteCarouselById(id);
    }

    //根据id查询相关轮播图信息
    @Override
    public Carousel selectCarouselById(int id) {
        return carouselDao.selectCarouselById(id);
    }

    //修改轮播图信息
    @Override
    public int updateCarousel(Carousel carousel) {
        return carouselDao.updateCarousel(carousel);
    }

    //查询所有轮播图
    @Override
    public List<Carousel> selectCarouselInfo(int limit) {
        return carouselDao.selectCarouselInfo(limit);
    }
}
