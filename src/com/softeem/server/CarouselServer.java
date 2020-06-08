package com.softeem.server;

import com.softeem.model.LayuiAllInfoResult;
import com.softeem.pojo.Carousel;

import java.util.List;

public interface CarouselServer {
    //添加轮播图
    public abstract int addCarousel(Carousel carousel);
    //分页查询所有轮播图
    public abstract LayuiAllInfoResult<Carousel> getLayuiCarouselResult(int page, int limit,String name);
    //根据id删除相关轮播图
    public abstract int deleteCarouselById(int id);
    //根据id查询相关轮播图信息
    public abstract Carousel selectCarouselById(int id);
    //修改轮播图信息
    public abstract int updateCarousel(Carousel carousel);
    //查询所有轮播图
    public abstract List<Carousel> selectCarouselInfo(int limit);
}
