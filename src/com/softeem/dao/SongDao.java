package com.softeem.dao;

import com.softeem.pojo.Song;
import com.softeem.utils.DBUtils;

import java.util.List;

public class SongDao {
    //添加歌曲
    public int addSongInfo(Song song) {
        String sql = "INSERT INTO song(song_name,introduction,create_time,update_time,song_url,pic,lyric,singer_name,count,singer_id) VALUES(?,?,?,?,?,?,?,?,?,?)";
        return DBUtils.executeUpdate(sql, song.getSongName(), song.getIntroduction(), song.getCreateTime(), song.getUpdateTime(), song.getSongUrl(), song.getPic(), song.getLyric(), song.getSingerName(), song.getCount(), song.getSingerId());
    }

    //分页查询所有歌曲
    public List<Song> songInfoPage(int page, int limit, String name) {
        String sql = "SELECT * FROM song ";
        if (name != null && !"".equals(name)) {
            sql += "WHERE song_name LIKE " + "'%" + name + "%'";
        }

        sql += " LIMIT " + (limit * (page - 1)) + "," + limit;
        return DBUtils.executeQuery(Song.class, sql);
    }

    //查询歌曲总数
    public Long getSongInfoCount(String name) {
        String sql = "SELECT count(*) FROM song ";

        if (name != null && !"".equals(name)) {
            sql += "WHERE song_name LIKE " + "'%" + name + "%'";
        }
        return DBUtils.findTotalCount(sql);
    }

    //根据id删除歌曲信息
    public int deleteSongInfoById(int id) {
        String sql = "DELETE FROM song WHERE id = ?";
        return DBUtils.executeUpdate(sql, id);
    }

    //根据id查询歌曲信息
    public Song selectSongInfoById(int id) {
        String sql = "SELECT * FROM song WHERE id = ?";
        return DBUtils.executeQueryOne(Song.class, sql, id);
    }

    //修改歌曲
    public int updateSongInfo(Song song) {
        String sql = "UPDATE song SET song_name = ?,introduction = ?,create_time = ?,update_time = ?,song_url = ?,pic = ?,lyric = ?,singer_name = ?,count = ?,singer_id = ? WHERE id = ?";
        return DBUtils.executeUpdate(sql, song.getSongName(), song.getIntroduction(), song.getCreateTime(), song.getUpdateTime(), song.getSongUrl(), song.getPic(), song.getLyric(), song.getSingerName(), song.getCount(), song.getSingerId(), song.getId());
    }

    //查询所有歌曲信息
    public List<Song> getSongInfo() {
        String sql = "SELECT * FROM song ";
        return DBUtils.executeQuery(Song.class, sql);
    }
    /*//多表联查，根据歌曲表外键查询歌手表的singerName
    public String getSingerName(int singerId){
        String singerName = null;
        String sql = "SELECT singer_name FROM song s INNER JOIN singer si ON s.singer_id = si.id WHERE singer_id = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = DBUtils.getConnection().prepareStatement(sql);
            //设置参数
            ps.setInt(1,singerId);
            //执行查询语句
            ps.executeQuery();
            if(rs.next()){
                singerName = rs.getString("singer_name");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return singerName;
    }*/

    //根据歌手id分页查询
    public List<Song> selectSongInfoPageBySingerId(int page,int limit,int singerId){
        String sql = "SELECT * FROM song WHERE singer_id = ?";
        sql += " LIMIT " + (limit * (page - 1)) + "," + limit;
        return DBUtils.executeQuery(Song.class,sql,singerId);
    }

    //根据歌手id查询歌曲总数
    public long getSongInfoCountBySingerId(int singerId) {
        String sql = "SELECT count(*) FROM song WHERE singer_id = ?";
        return DBUtils.findTotalCount(sql,singerId);
    }
}
