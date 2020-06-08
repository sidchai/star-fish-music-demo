package com.softeem.pojo;

import java.util.Date;

/*
    用户信息表
 */
public class User {
    private Integer id;//用户id
    private String username;//用户名
    private String password;//用户密码
    private String sex;//用户性别
    private String phone;//用户手机号
    private String email;//用户邮箱
    private Date birthday;//用户生日
    private String signature;//用户个性签名
    private String region;//用户所在地区
    private String pic;//用户头像url
    private Date lastTime;//上次登录时间
    private Date thisTime;//本次登录时间
    private String isAdmin;//用户权限

    public User() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public Date getLastTime() {
        return lastTime;
    }

    public void setLastTime(Date lastTime) {
        this.lastTime = lastTime;
    }

    public Date getThisTime() {
        return thisTime;
    }

    public void setThisTime(Date thisTime) {
        this.thisTime = thisTime;
    }

    public String getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(String isAdmin) {
        this.isAdmin = isAdmin;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", sex='" + sex + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", birthday=" + birthday +
                ", signature='" + signature + '\'' +
                ", region='" + region + '\'' +
                ", pic='" + pic + '\'' +
                ", lastTime=" + lastTime +
                ", thisTime=" + thisTime +
                ", isAdmin='" + isAdmin + '\'' +
                '}';
    }
}
