package com.softeem.dao;

import com.softeem.pojo.SongList;
import com.softeem.utils.DBUtils;

import java.util.List;

public class SongListDao {

    //添加歌单
    public int addSongListInfo(SongList songList) {
        String sql = "INSERT INTO song_list(title,pic,introduction,style,user_id) VALUES(?,?,?,?,?)";
        return DBUtils.executeUpdate(sql, songList.getTitle(), songList.getPic(), songList.getIntroduction(), songList.getStyle(), songList.getUserId());
    }

    //分页查询所有歌单
    public List<SongList> songListInfoPage(int page, int limit, String name) {
        String sql = "SELECT * FROM song_list ";
        if (name != null && !"".equals(name)) {
            sql += "WHERE title LIKE " + "'%" + name + "%'";
        }
        sql += " LIMIT " + (limit * (page - 1)) + "," + limit;
        return DBUtils.executeQuery(SongList.class, sql);
    }

    //查询歌单总数
    public Long getSongListInfoCount(String name) {
        String sql = "SELECT count(*) FROM song_list ";
        if (name != null && !"".equals(name)) {
            sql += "WHERE title LIKE " + "'%" + name + "%'";
        }
        return DBUtils.findTotalCount(sql);
    }

    //根据id查询相关歌单信息
    public SongList selectSongListInfoById(int id) {
        String sql = "SELECT * FROM song_list WHERE id = ?";
        return DBUtils.executeQueryOne(SongList.class, sql, id);
    }

    //修改歌单信息
    public int updateSongListInfo(SongList songList) {
        String sql = "UPDATE song_list SET title = ?,pic = ?,introduction = ?,style = ?,user_id = ? WHERE id = ?";
        return DBUtils.executeUpdate(sql, songList.getTitle(), songList.getPic(), songList.getIntroduction(), songList.getStyle(), songList.getUserId(), songList.getId());
    }

    //根据id删除歌单信息
    public int deleteSongListInfoById(int id) {
        String sql = "DELETE FROM song_list WHERE id = ?";
        return DBUtils.executeUpdate(sql, id);
    }

    //分组查询所有歌单信息
    public List<SongList> selectSongListInfo(int page, int limit, String style) {
        String sql = "SELECT * FROM song_list ";
        if (style != null && !"".equals(style)) {
            sql += "WHERE style = " + "'" + style + "'";
        }
        sql += " LIMIT " + (limit * (page - 1)) + "," + limit;
        return DBUtils.executeQuery(SongList.class, sql);
    }

    public List<SongList> selectSongListInfoHome() {
        String sql = "SELECT * FROM song_list limit 8";
        return DBUtils.executeQuery(SongList.class, sql);
    }

    public List<SongList> groupBySongList(){
        String sql = "SELECT * FROM song_list GROUP BY style";
        return DBUtils.executeQuery(SongList.class,sql);
    }

    //根据类别查询总数
    public long getSongListInfoCountByStyle(String style) {
        String sql = "SELECT count(*) FROM song_list WHERE style = ?";
        return DBUtils.findTotalCount(sql,style);
    }
}
