package com.softeem.server;

import com.softeem.model.LayuiAllInfoResult;
import com.softeem.pojo.Singer;

import java.util.List;

public interface SingerServer {
    //根据类型名查询id
    public abstract int getClassify(String classify);
    //添加歌手
    public abstract int addSinger(Singer singer);
    //分页查询所有歌手
    public abstract LayuiAllInfoResult<Singer> getLayuiSingerInfoResult(int page, int limit,String name);
    //根据歌手名查询id
    public abstract int getIdBySingerName(String singerName);
    //查询歌手是否存在
    public abstract boolean verifySingerName(String singerName);
    //根据id删除歌手信息
    public abstract int deleteSingerInfoById(int id);
    //根据id查询歌手信息
    public abstract Singer selectSingerInfoById(int id);
    //根据歌手名查询歌手信息
    public abstract Singer selectSingerInfoByName(String singerName);
    //根据id查询类型名
    public String getClassifyById(int id);
    //修改歌手信息
    public abstract int updateSingerInfo(Singer singer);
    //查询歌手总数
    public abstract Long getSingerInfoCount(String name);
    //查询所有歌手信息
    public abstract List<Singer> selectSingerInfo(int rank);
    //查询所有歌手信息
    public abstract List<Singer> getSingerInfoByClassify(int cId,int page,int limit);
    public abstract long getSingerInfoCountByClassify(int cId);
}
