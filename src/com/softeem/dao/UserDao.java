package com.softeem.dao;

import com.softeem.pojo.User;
import com.softeem.utils.DBUtils;
import com.softeem.utils.MD5Util;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class UserDao {
    //根据手机号查询
    public User getUserByPhone(String phone) {
        String sql = "SELECT * FROM user WHERE phone = ?";
        return DBUtils.executeQueryOne(User.class, sql, phone);
    }

    //根据用户名查询
    public User getUserByUsername(String username) {
        String sql = "SELECT * FROM user WHERE username = ?";
        return DBUtils.executeQueryOne(User.class, sql, username);
    }

    //注册
    public int register(User user) {
        String sql = "INSERT INTO user(username,password,sex,phone,email,birthday,signature,region,pic,last_time,this_time,is_admin) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
        return DBUtils.executeUpdate(sql, user.getUsername(), MD5Util.encrypt(user.getPassword()), user.getSex(), user.getPhone(), user.getEmail(), user.getBirthday(), user.getSignature(), user.getRegion(), user.getPic(), user.getLastTime(), user.getThisTime(), user.getIsAdmin());
    }

    //修改登录状态
    public int setUserById(User user) {
        String sql = "UPDATE user SET username = ?, password = ?,sex = ?,phone = ?,email = ?,birthday = ?,signature = ?,region = ?,pic = ?,last_time = ?,this_time = ?,is_admin = ? WHERE id = ?";
        return DBUtils.executeUpdate(sql, user.getUsername(), user.getPassword(), user.getSex(), user.getPhone(), user.getEmail(), user.getBirthday(), user.getSignature(), user.getRegion(), user.getPic(), user.getLastTime(), user.getThisTime(), user.getIsAdmin(), user.getId());
    }

    //根据用户名查询用户权限
    public int getUserIsAdmin(String username) {
        int isAdmin = 0;
        String sql = "SELECT is_admin FROM user WHERE username = ?";
        PreparedStatement ps = null;
        ResultSet resultSet = null;
        try {
            ps = DBUtils.getConnection().prepareStatement(sql);
            //设置参数
            ps.setString(1,username);
            //执行查询
            resultSet = ps.executeQuery();
            if (resultSet.next()){
                isAdmin = resultSet.getInt("is_admin");
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
        return isAdmin;
    }

    //分页查询所有用户
    public List<User> userInfoPage(int page, int limit,String name){
        String sql = "SELECT * FROM user ";
        if(name != null && !"".equals(name)){
            sql += "WHERE username LIKE " + "'%" + name + "%'";
        }
        sql += " LIMIT " + (limit * (page - 1)) + "," + limit;
        return DBUtils.executeQuery(User.class,sql);
    }

    //查询用户总数
    public Long getUserInfoCount(String name){
        String sql = "SELECT count(*) FROM user ";
        if(name != null && !"".equals(name)){
            sql += "WHERE username LIKE " + "'%" + name + "%'";
        }
        return DBUtils.findTotalCount(sql);
    }

    //修改用户信息
    public int updateUserInfo(User user) {
        String sql = "UPDATE user SET username = ?, password = ?,sex = ?,phone = ?,email = ?,birthday = ?,signature = ?,region = ?,pic = ?,last_time = ?,this_time = ?,is_admin = ? WHERE id = ?";
        return DBUtils.executeUpdate(sql, user.getUsername(), MD5Util.encrypt(user.getPassword()), user.getSex(), user.getPhone(), user.getEmail(), user.getBirthday(), user.getSignature(), user.getRegion(), user.getPic(), user.getLastTime(), user.getThisTime(), user.getIsAdmin(), user.getId());
    }

    //根据id删除用户信息
    public int deleteUserInfoById(int id) {
        String sql = "DELETE FROM user WHERE id = ?";
        return DBUtils.executeUpdate(sql,id);
    }

    public User selectUserInfo(int id){
        String sql = "SELECT * FROM user WHERE id = ?";
        return DBUtils.executeQueryOne(User.class,sql,id);
    }

    public int setUserPic(User user) {
        String sql = "UPDATE user SET pic = ? WHERE id = ?";
        return DBUtils.executeUpdate(sql,user.getPic(),user.getId());
    }
}
