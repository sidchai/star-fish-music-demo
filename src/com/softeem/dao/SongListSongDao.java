package com.softeem.dao;

import com.softeem.pojo.Song;
import com.softeem.utils.DBUtils;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class SongListSongDao {

    public int addSongListSong(int songId, int songListId) {
        String sql = "INSERT INTO song_list_song(song_id,song_list_id) VALUES(?,?)";
        return DBUtils.executeUpdate(sql,songId,songListId);
    }

    //分页查询信息
    public List<Song> getSongListSongInfo(int page, int limit, String name,int songListId) {
        List<Song> songs = new ArrayList<>();
        String sql = "SELECT * FROM song INNER JOIN song_list_song ON song_list_song.song_id = song.id INNER JOIN song_list ON song_list.id = ? AND song_list_song.song_list_id = song_list.id ";
        if(name != null && !"".equals(name)){
            sql += "WHERE song_name LIKE " + "'%" + name + "%'";
        }
        sql += " LIMIT " + (limit * (page - 1)) + "," + limit;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = DBUtils.getConnection().prepareStatement(sql);
            ps.setInt(1,songListId);
            rs = ps.executeQuery();
            while (rs.next()){
                int id = rs.getInt("id");
                String songName = rs.getString("song_name");
                String introduction = rs.getString("introduction");
                Date createTime = rs.getDate("create_time");
                Date updateTime = rs.getDate("update_time");
                String songUrl = rs.getString("song_url");
                String pic = rs.getString("pic");
                String lyric = rs.getString("lyric");
                String singerName = rs.getString("singer_name");
                int count = rs.getInt("count");
                int singerId = rs.getInt("singer_id");
                Song song = new Song(id,songName,singerName,introduction,createTime,updateTime,songUrl,pic,lyric,count,singerId);
                songs.add(song);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return songs;
    }

    //查询歌单歌曲总数
    public long getSongListSongCount(String name,int songListId) {
        long count = 0;
        String sql = "SELECT count(*) count FROM song INNER JOIN song_list_song ON song_list_song.song_id = song.id INNER JOIN song_list ON song_list.id = ? AND song_list_song.song_list_id = song_list.id ";
        if(name != null && !"".equals(name)){
            sql += "WHERE song_name LIKE " + "'%" + name + "%'";
        }
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = DBUtils.getConnection().prepareStatement(sql);
            //设置参数
            ps.setInt(1,songListId);
            //执行查询
            rs = ps.executeQuery();
            if(rs.next()){
                count = rs.getLong("count");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return count;
    }

    //删除信息
    public int deleteSongListSongInfo(int id) {
        String sql = "DELETE FROM song_list_song WHERE song_id = ?";
        return DBUtils.executeUpdate(sql,id);
    }
}
