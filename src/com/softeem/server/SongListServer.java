package com.softeem.server;

import com.softeem.model.LayuiAllInfoResult;
import com.softeem.pojo.SongList;

import java.util.List;

public interface SongListServer {
    //添加歌单
    public abstract int addSongListInfo(SongList songList);
    //分页查询所有歌单
    public abstract LayuiAllInfoResult<SongList> getLayuiSongListInfoResult(int page, int limit,String name);
    //根据id查询相关歌单信息
    public abstract SongList selectSongListInfoById(int id);
    //修改歌单信息
    public abstract int updateSongListInfo(SongList songList);
    //根据id删除歌单信息
    public abstract int deleteSongListInfoById(int id);
    //查询歌单总数
    public abstract Long getSongListInfoCount(String name);
    //查询所有歌单信息
    public abstract List<SongList> selectSongListInfo(int page,int limit,String style);
    public abstract List<SongList> selectSongListInfoHome();
    public abstract List<SongList> groupByStyle();
    //根据类别查询总数
    public abstract long getSongListInfoCountByStyle(String style);
}
