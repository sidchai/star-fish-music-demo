package com.softeem.server.Impl;

import com.softeem.dao.SongListDao;
import com.softeem.model.LayuiAllInfoResult;
import com.softeem.pojo.SongList;
import com.softeem.server.SongListServer;

import java.util.List;

public class SongListServerImpl implements SongListServer {
    private SongListDao songListDao;

    public SongListServerImpl() {
        this.songListDao = new SongListDao();
    }

    //添加歌单
    @Override
    public int addSongListInfo(SongList songList) {
        return songListDao.addSongListInfo(songList);
    }

    ////分页查询所有歌单
    @Override
    public LayuiAllInfoResult<SongList> getLayuiSongListInfoResult(int page, int limit,String name) {
        LayuiAllInfoResult<SongList> songListInfoResult = new LayuiAllInfoResult<>();
        //返回成功
        songListInfoResult.setCode(0);
        songListInfoResult.setMsg("");
        songListInfoResult.setData(songListDao.songListInfoPage(page,limit,name));
        songListInfoResult.setCount(songListDao.getSongListInfoCount(name));
        return songListInfoResult;
    }
    //根据id查询相关歌单信息
    @Override
    public SongList selectSongListInfoById(int id) {
        return songListDao.selectSongListInfoById(id);
    }

    //修改歌单信息
    @Override
    public int updateSongListInfo(SongList songList) {
        return songListDao.updateSongListInfo(songList);
    }

    //根据id删除歌单信息
    @Override
    public int deleteSongListInfoById(int id) {
        return songListDao.deleteSongListInfoById(id);
    }

    //查询歌单总数
    @Override
    public Long getSongListInfoCount(String name) {
        return songListDao.getSongListInfoCount(name);
    }

    //查询所有歌单信息
    @Override
    public List<SongList> selectSongListInfo(int page,int limit,String style) {
        return songListDao.selectSongListInfo(page,limit,style);
    }

    @Override
    public List<SongList> selectSongListInfoHome() {
        return songListDao.selectSongListInfoHome();
    }

    @Override
    public List<SongList> groupByStyle() {
        return songListDao.groupBySongList();
    }

    //根据类别查询总数
    @Override
    public long getSongListInfoCountByStyle(String style) {
        return songListDao.getSongListInfoCountByStyle(style);
    }

}
