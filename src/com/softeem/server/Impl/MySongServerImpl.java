package com.softeem.server.Impl;

import com.softeem.dao.MySongDao;
import com.softeem.dao.SongDao;
import com.softeem.model.LayuiAllInfoResult;
import com.softeem.pojo.MySong;
import com.softeem.pojo.Song;
import com.softeem.server.MySongServer;

import java.util.ArrayList;
import java.util.List;

public class MySongServerImpl implements MySongServer {
    private MySongDao mySongDao;
    private SongDao songDao;

    public MySongServerImpl() {
        this.mySongDao = new MySongDao();
        this.songDao = new SongDao();
    }

    //根据用户id查询相关信息
    @Override
    public LayuiAllInfoResult<Song> getMySongByUserId(int userId,int page, int limit) {
        List<MySong> mySongByUserId = mySongDao.getMySongByUserId(userId, page, limit);
        LayuiAllInfoResult<Song> mySongInfo = new LayuiAllInfoResult<>();
        List<Song> songs = new ArrayList<>();
        for (MySong mySong : mySongByUserId) {
            Song song = songDao.selectSongInfoById(mySong.getSongId());
            songs.add(song);
        }
        mySongInfo.setCode(0);
        mySongInfo.setMsg("");
        mySongInfo.setData(songs);
        mySongInfo.setCount(mySongDao.getMySongCount(userId));
        return mySongInfo;
    }

    //添加我的音乐
    @Override
    public int addMySongInfo(int userId, int songId) {
        return mySongDao.addMySongInfo(userId,songId);
    }

    //判断歌曲是否已收藏
    @Override
    public boolean verifySongCollect(int songId) {
        return mySongDao.verifySongCollect(songId) != null;
    }
}
