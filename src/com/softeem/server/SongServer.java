package com.softeem.server;

import com.softeem.model.LayuiAllInfoResult;
import com.softeem.pojo.Song;

import java.util.List;

public interface SongServer {
    //添加歌曲
    public abstract int addSongInfo(Song song);
    //分页查询所有歌曲
    public abstract LayuiAllInfoResult<Song> getLayuiSongInfoResult(int page, int limit,String name);
    //根据id查询歌曲的url
    /*public abstract String getSongUrlById(int id);*/
    //根据id删除歌曲信息
    public abstract int deleteSongInfoById(int id);
    //根据id查询歌曲信息
    public abstract Song selectSongInfoById(int id);
    //修改歌曲
    public abstract int updateSongInfo(Song song);
    //查询歌曲总数
    public abstract Long getSongInfoCount(String name);
    //查询所有歌曲信息
    public abstract List<Song> getSongInfo();
    //根据歌手id分页查询
    public LayuiAllInfoResult<Song> selectSongInfoPageBySingerId(int page,int limit,int singerId);
}
