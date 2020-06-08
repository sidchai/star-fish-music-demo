package com.softeem.server;

import com.softeem.model.LayuiAllInfoResult;
import com.softeem.pojo.Song;

public interface SongListSongServer {
    //添加
    public abstract int addSongListSong(int songId,int songListId);
    //分页查询信息
    public abstract LayuiAllInfoResult<Song> getSongListSongInfo(int page, int limit,String name,int songListId);
    //删除信息
    public abstract int deleteSongListSongInfo(int id);
}
