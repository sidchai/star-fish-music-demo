package com.softeem.dao;

import com.softeem.pojo.Comment;
import com.softeem.utils.DBUtils;

import java.util.List;

public class CommentDao {
    //分页查询信息
    public List<Comment> getCommentInfo(int page, int limit,int songId) {
        String sql = "SELECT * FROM `comment` WHERE song_id = ? ";
        sql += " LIMIT " + (limit * (page - 1)) + "," + limit;
        return DBUtils.executeQuery(Comment.class,sql,songId);
    }

    //查询总数
    public long getCommentCount(int songId){
        String sql = "SELECT count(*) count FROM `comment` c INNER JOIN `user` u ON c.user_id = u.id WHERE song_id = ? ";
        return DBUtils.findTotalCount(sql,songId);
    }

    //根据id删除评论信息
    public int deleteCommentInfo(int id) {
        String sql = "DELETE FROM comment WHERE id = ?";
        return DBUtils.executeUpdate(sql,id);
    }

    //根据用户id和歌曲查询歌曲评论信息
    public List<Comment> getCommentInfoBySongId(int songId) {
        String sql = "SELECT * FROM comment WHERE song_id = ?";
        return DBUtils.executeQuery(Comment.class,sql,songId);
    }

    //添加评论信息
    public int addUserCommentInfo(Comment comment) {
        String sql = "INSERT INTO comment(content,comment_time,up,user_id,song_id,song_list_id) VALUES(?,?,?,?,?,?)";
        return DBUtils.executeUpdate(sql,comment.getContent(),comment.getCommentTime(),comment.getUp(),comment.getUserId(),comment.getSongId(),comment.getSongListId());
    }
}
