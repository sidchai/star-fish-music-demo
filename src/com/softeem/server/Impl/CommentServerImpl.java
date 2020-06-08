package com.softeem.server.Impl;

import com.softeem.dao.CommentDao;
import com.softeem.dao.UserDao;
import com.softeem.model.LayuiAllInfoResult;
import com.softeem.pojo.Comment;
import com.softeem.pojo.User;
import com.softeem.server.CommentServer;

import java.util.List;

public class CommentServerImpl implements CommentServer {
    private CommentDao commentDao;
    private UserDao userDao;

    public CommentServerImpl() {
        this.commentDao = new CommentDao();
        this.userDao = new UserDao();
    }

    //分页查询信息
    @Override
    public LayuiAllInfoResult<Comment> getCommentInfo(int page, int limit,int songId) {
        LayuiAllInfoResult<Comment> comments = new LayuiAllInfoResult<>();
        comments.setCode(0);
        comments.setMsg("");
        List<Comment> commentInfo = commentDao.getCommentInfo(page, limit, songId);
        for (Comment comment : commentInfo) {
            User user = userDao.selectUserInfo(comment.getUserId());
            comment.setUsername(user.getUsername());
        }
        comments.setData(commentInfo);
        comments.setCount(commentDao.getCommentCount(songId));
        return comments;
    }

    //根据id删除评论信息
    @Override
    public int deleteCommentInfo(int id) {
        return commentDao.deleteCommentInfo(id);
    }

    //根据用户id和歌曲查询歌曲评论信息
    @Override
    public List<Comment> getCommentInfoBySongId(int songId) {
        List<Comment> commentInfoBySongId = commentDao.getCommentInfoBySongId(songId);
        for (Comment comment : commentInfoBySongId) {
            User user = userDao.selectUserInfo(comment.getUserId());
            comment.setUsername(user.getUsername());
            comment.setPic(user.getPic());
        }
        return commentInfoBySongId;
    }

    //添加评论信息
    @Override
    public int addUserCommentInfo(Comment comment) {
        return commentDao.addUserCommentInfo(comment);
    }

}
