package com.softeem.server;

import com.softeem.model.LayuiAllInfoResult;
import com.softeem.pojo.Song;

public interface MySongServer {
    //根据用户id查询相关信息
    public abstract LayuiAllInfoResult<Song> getMySongByUserId(int userId, int page, int limit);
    //添加我的音乐
    public abstract int addMySongInfo(int userId,int songId);
    //判断歌曲是否已收藏
    public abstract boolean verifySongCollect(int songId);
}
