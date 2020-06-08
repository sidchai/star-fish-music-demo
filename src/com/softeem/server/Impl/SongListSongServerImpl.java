package com.softeem.server.Impl;

import com.softeem.dao.SongListSongDao;
import com.softeem.model.LayuiAllInfoResult;
import com.softeem.pojo.Song;
import com.softeem.server.SongListSongServer;

public class SongListSongServerImpl implements SongListSongServer {
    private SongListSongDao songListSongDao;

    public SongListSongServerImpl() {
        this.songListSongDao = new SongListSongDao();
    }

    @Override
    public int addSongListSong(int songId, int songListId) {
        return songListSongDao.addSongListSong(songId,songListId);
    }

    //查询信息
    @Override
    public LayuiAllInfoResult<Song> getSongListSongInfo(int page, int limit, String name,int songListId) {
        LayuiAllInfoResult<Song> songInfoResult = new LayuiAllInfoResult<>();
        //返回成功
        songInfoResult.setCode(0);
        songInfoResult.setMsg("");
        songInfoResult.setData(songListSongDao.getSongListSongInfo(page,limit,name,songListId));
        songInfoResult.setCount(songListSongDao.getSongListSongCount(name,songListId));
        return songInfoResult;
    }

    //删除信息
    @Override
    public int deleteSongListSongInfo(int id) {
        return songListSongDao.deleteSongListSongInfo(id);
    }
}
