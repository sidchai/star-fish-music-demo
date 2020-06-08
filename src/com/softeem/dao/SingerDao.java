package com.softeem.dao;

import com.softeem.pojo.Singer;
import com.softeem.utils.DBUtils;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class SingerDao {
    //根据类型名查询id
    public int getClassify(String classify) {
        int id = 0;
        String sql = "SELECT id FROM classify WHERE name = ?";
        PreparedStatement ps = null;
        ResultSet resultSet = null;
        try {
            //获取句柄
            ps = DBUtils.getConnection().prepareStatement(sql);
            //设置参数
            ps.setString(1, classify);
            //执行查询
            resultSet = ps.executeQuery();
            if (resultSet.next()) {
                id = resultSet.getInt("id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return id;
    }

    //添加歌手
    public int addSinger(Singer singer) {
        String sql = "INSERT INTO singer(singer_name,pic,debut_time,region,rank,introduction,classify_id) VALUES(?,?,?,?,?,?,?)";
        return DBUtils.executeUpdate(sql, singer.getSingerName(), singer.getPic(), singer.getDebutTime(), singer.getRegion(), singer.getRank(), singer.getIntroduction(), singer.getClassifyId());
    }

    //分页查询所有歌手
    public List<Singer> singerInfoPage(int page, int limit,String name) {
        String sql = "SELECT * FROM singer ";
        if(name != null && !"".equals(name)){
            sql += "WHERE singer_name LIKE " + "'%" + name + "%'";
        }
        sql += " LIMIT " + (limit * (page - 1)) + "," + limit;
        return DBUtils.executeQuery(Singer.class, sql);
    }

    //查询歌手总数
    public Long getSingerInfoCount(String name) {
        String sql = "SELECT count(*) FROM singer ";
        if(name != null && !"".equals(name)){
            sql += "WHERE singer_name LIKE " + "'%" + name + "%'";
        }
        return DBUtils.findTotalCount(sql);
    }

    //根据歌手名查询id
    public int getIdBySingerName(String singerName) {
        int id = 0;
        String sql = "SELECT id FROM singer WHERE singer_name = ?";
        PreparedStatement ps = null;
        ResultSet resultSet = null;
        try {
            //获取句柄
            ps = DBUtils.getConnection().prepareStatement(sql);
            //设置参数
            ps.setString(1, singerName);
            //执行查询
            resultSet = ps.executeQuery();
            if (resultSet.next()) {
                id = resultSet.getInt("id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return id;
    }

    //查询歌手是否存在
    public Singer verifySingerName(String singerName) {
        String sql = "SELECT * FROM singer WHERE singer_name = ?";
        return DBUtils.executeQueryOne(Singer.class, sql, singerName);
    }

    //根据id删除歌手信息
    public int deleteSingerInfoById(int id) {
        String sql = "DELETE FROM singer WHERE id = ?";
        return DBUtils.executeUpdate(sql, id);
    }

    //根据id查询歌手信息
    public Singer selectSingerInfoById(int id) {
        String sql = "SELECT * FROM singer WHERE id = ?";
        return DBUtils.executeQueryOne(Singer.class, sql, id);
    }

    public Singer selectSingerInfoByName(String singerName) {
        String sql = "SELECT * FROM singer WHERE singer_name = ?";
        return DBUtils.executeQueryOne(Singer.class, sql, singerName);
    }

    //根据id查询类型名
    public String getClassifyById(int id) {
        String classify = null;
        String sql = "SELECT name FROM classify WHERE id = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = DBUtils.getConnection().prepareStatement(sql);
            //设置参数
            ps.setInt(1, id);
            //执行查询
            rs = ps.executeQuery();
            if (rs.next()) {
                classify = rs.getString("name");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return classify;
    }

    //修改歌手信息
    public int updateSingerInfo(Singer singer) {
        String sql = "UPDATE singer SET singer_name = ?,pic = ?,debut_time = ?,region = ?,rank = ?,introduction = ?,classify_id = ? WHERE id = ?";
        return DBUtils.executeUpdate(sql, singer.getSingerName(), singer.getPic(), singer.getDebutTime(), singer.getRegion(), singer.getRank(), singer.getIntroduction(), singer.getClassifyId(),singer.getId());
    }

    //查询所有歌手信息
    public List<Singer> selectSingerInfo(int rank) {
        String sql = "SELECT * FROM singer ";
        if(rank > 0){
            sql += "WHERE rank < " + rank;
        }
        sql += " ORDER BY rank ASC";
        return DBUtils.executeQuery(Singer.class,sql);
    }

    //查询所有歌手信息
    public List<Singer> getSingerInfoByClassify(int cId,int page,int limit) {
        String sql = "SELECT * FROM singer ";
        if(cId > 0){
            sql += "WHERE classify_id = " + cId;
        }
        sql += " ORDER BY rank ASC";
        sql += " LIMIT " + (limit * (page - 1)) + "," + limit;
        return DBUtils.executeQuery(Singer.class,sql);
    }

    public long getSingerInfoCountByClassify(int cId) {
        String sql = "SELECT count(*) FROM singer WHERE classify_id = ?";
        return DBUtils.findTotalCount(sql,cId);
    }
}
