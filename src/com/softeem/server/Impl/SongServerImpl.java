package com.softeem.server.Impl;

import com.softeem.dao.SongDao;
import com.softeem.model.LayuiAllInfoResult;
import com.softeem.pojo.Song;
import com.softeem.server.SongServer;

import java.util.List;

public class SongServerImpl implements SongServer {
    private SongDao songDao;

    public SongServerImpl() {
        this.songDao = new SongDao();
    }

    @Override
    public int addSongInfo(Song song) {
        return songDao.addSongInfo(song);
    }

    //分页查询所有歌曲
    @Override
    public LayuiAllInfoResult<Song> getLayuiSongInfoResult(int page, int limit,String name) {
        LayuiAllInfoResult<Song> songInfoResult = new LayuiAllInfoResult<>();
        //返回成功
        songInfoResult.setCode(0);
        songInfoResult.setMsg("");
        songInfoResult.setData(songDao.songInfoPage(page,limit,name));
        songInfoResult.setCount(songDao.getSongInfoCount(name));
        return songInfoResult;
    }

    //根据id删除歌曲信息
    @Override
    public int deleteSongInfoById(int id) {
        return songDao.deleteSongInfoById(id);
    }

    //根据id查询歌曲信息
    @Override
    public Song selectSongInfoById(int id) {
        return songDao.selectSongInfoById(id);
    }

    //修改歌曲
    @Override
    public int updateSongInfo(Song song) {
        return songDao.updateSongInfo(song);
    }

    //查询歌曲总数
    @Override
    public Long getSongInfoCount(String name) {
        return songDao.getSongInfoCount(name);
    }

    //查询所有歌曲信息
    @Override
    public List<Song> getSongInfo() {
        return songDao.getSongInfo();
    }

    //根据歌手id分页查询
    public LayuiAllInfoResult<Song> selectSongInfoPageBySingerId(int page,int limit,int singerId){
        LayuiAllInfoResult<Song> artistSongInfo = new LayuiAllInfoResult<>();
        artistSongInfo.setCode(0);
        artistSongInfo.setMsg("");
        artistSongInfo.setData(songDao.selectSongInfoPageBySingerId(page, limit, singerId));
        artistSongInfo.setCount(songDao.getSongInfoCountBySingerId(singerId));
        return artistSongInfo;
    }
}
