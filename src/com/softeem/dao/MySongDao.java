package com.softeem.dao;

import com.softeem.pojo.MySong;
import com.softeem.utils.DBUtils;

import java.util.List;

public class MySongDao {
    //根据用户id分页查询相关信息
    public List<MySong> getMySongByUserId(int userId,int page, int limit) {
        String sql = "SELECT * FROM my_song WHERE user_id = ? ";
        sql += " LIMIT " + (limit * (page - 1)) + "," + limit;
        return DBUtils.executeQuery(MySong.class,sql,userId);
    }

    public long getMySongCount(int userId){
        String sql = "SELECT count(*) FROM my_song WHERE user_id = ?";
        return DBUtils.findTotalCount(sql,userId);
    }

    //添加我的音乐
    public int addMySongInfo(int userId, int songId) {
        String sql = "INSERT INTO my_song(user_id,song_id) VALUES(?,?)";
        return DBUtils.executeUpdate(sql,userId,songId);
    }

    //判断歌曲是否已收藏
    public MySong verifySongCollect(int songId) {
        String sql = "SELECT * FROM my_song WHERE song_id = ?";
        return DBUtils.executeQueryOne(MySong.class,sql,songId);
    }
}
