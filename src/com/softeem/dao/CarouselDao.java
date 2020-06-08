package com.softeem.dao;

import com.softeem.pojo.Carousel;
import com.softeem.utils.DBUtils;

import java.util.List;

public class CarouselDao {

    //添加轮播图
    public int addCarousel(Carousel carousel){
        String sql = "INSERT INTO carousel(title,pic,sort) VALUES(?,?,?)";
        return DBUtils.executeUpdate(sql,carousel.getTitle(),carousel.getPic(),carousel.getSort());
    }

    //分页查询所有轮播图
    public List<Carousel> carouselPage(int page, int limit,String name) {
        String sql = "SELECT * FROM carousel ";
        if(name != null && !"".equals(name)){
            sql += "WHERE title LIKE " + "'%" + name + "%'";
        }
        sql += " LIMIT " + (limit * (page - 1)) + "," + limit;
        return DBUtils.executeQuery(Carousel.class, sql);
    }

    //查询轮播图总数
    public Long getCarouselCount(String name) {
        String sql = "SELECT count(*) FROM carousel ";
        if(name != null && !"".equals(name)){
            sql += "WHERE title LIKE " + "'%" + name + "%'";
        }
        return DBUtils.findTotalCount(sql);
    }

    //根据id删除相关轮播图
    public int deleteCarouselById(int id) {
        String sql = "DELETE FROM carousel WHERE id = ?";
        return DBUtils.executeUpdate(sql,id);
    }

    //根据id查询相关轮播图信息
    public Carousel selectCarouselById(int id) {
        String sql = "SELECT * FROM carousel WHERE id = ?";
        return DBUtils.executeQueryOne(Carousel.class,sql,id);
    }

    //修改轮播图信息
    public int updateCarousel(Carousel carousel) {
        String sql = "UPDATE carousel SET title = ?,pic = ?,sort = ? WHERE id = ?";
        return DBUtils.executeUpdate(sql,carousel.getTitle(),carousel.getPic(),carousel.getSort(),carousel.getId());
    }

    //查询所有轮播图信息
    public List<Carousel> selectCarouselInfo(int limit){
        String sql = "SELECT * FROM carousel ORDER BY sort ASC LIMIT ?";
        return DBUtils.executeQuery(Carousel.class,sql,limit);
    }
}
