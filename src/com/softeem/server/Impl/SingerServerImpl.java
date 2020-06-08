package com.softeem.server.Impl;

import com.softeem.dao.SingerDao;
import com.softeem.model.LayuiAllInfoResult;
import com.softeem.pojo.Singer;
import com.softeem.server.SingerServer;

import java.util.List;

public class SingerServerImpl implements SingerServer {
    private SingerDao singerDao;

    public SingerServerImpl() {
        this.singerDao = new SingerDao();
    }

    //根据类型名查询id
    @Override
    public int getClassify(String classify) {
        return singerDao.getClassify(classify);
    }

    //添加歌手
    @Override
    public int addSinger(Singer singer) {
        return singerDao.addSinger(singer);
    }

    //分页查询所有歌手
    @Override
    public LayuiAllInfoResult<Singer> getLayuiSingerInfoResult(int page, int limit,String name) {
        LayuiAllInfoResult<Singer> singerInfoResult = new LayuiAllInfoResult<>();
        //返回成功
        singerInfoResult.setCode(0);
        singerInfoResult.setMsg("");
        singerInfoResult.setData(singerDao.singerInfoPage(page,limit,name));
        singerInfoResult.setCount(singerDao.getSingerInfoCount(name));
        return singerInfoResult;
    }

    //根据歌手名查询id
    @Override
    public int getIdBySingerName(String singerName) {
        return singerDao.getIdBySingerName(singerName);
    }

    //查询歌手是否存在
    @Override
    public boolean verifySingerName(String singerName) {
        return singerDao.verifySingerName(singerName) != null;
    }

    //根据id删除歌手信息
    @Override
    public int deleteSingerInfoById(int id) {
        return singerDao.deleteSingerInfoById(id);
    }

    //根据id查询歌手信息
    @Override
    public Singer selectSingerInfoById(int id) {
        return singerDao.selectSingerInfoById(id);
    }

    @Override
    public Singer selectSingerInfoByName(String singerName) {
        return singerDao.selectSingerInfoByName(singerName);
    }

    //根据id查询类型名
    public String getClassifyById(int id) {
        return singerDao.getClassifyById(id);
    }

    //修改歌手信息
    @Override
    public int updateSingerInfo(Singer singer) {
        return singerDao.updateSingerInfo(singer);
    }

    //查询歌手总数
    @Override
    public Long getSingerInfoCount(String name) {
        return singerDao.getSingerInfoCount(name);
    }

    //查询所有歌手信息
    @Override
    public List<Singer> selectSingerInfo(int rank) {
        return singerDao.selectSingerInfo(rank);
    }

    //查询所有歌手信息
    public List<Singer> getSingerInfoByClassify(int cId,int page,int limit) {
        return singerDao.getSingerInfoByClassify(cId,page,limit);
    }

    @Override
    public long getSingerInfoCountByClassify(int cId) {
        return singerDao.getSingerInfoCountByClassify(cId);
    }

}
