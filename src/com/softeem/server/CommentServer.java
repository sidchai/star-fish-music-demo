package com.softeem.server;

import com.softeem.model.LayuiAllInfoResult;
import com.softeem.pojo.Comment;

import java.util.List;

public interface CommentServer {
    //分页查询信息
    public abstract LayuiAllInfoResult<Comment> getCommentInfo(int page,int limit,int songId);
    //根据id删除评论信息
    public abstract int deleteCommentInfo(int id);
    //根据用户id和歌曲查询歌曲评论信息
    public abstract List<Comment> getCommentInfoBySongId(int songId);
    //添加评论信息
    public abstract int addUserCommentInfo(Comment comment);
}
