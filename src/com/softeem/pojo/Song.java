package com.softeem.pojo;

import java.util.Date;

public class Song {
    private Integer id;
    private String songName;
    private String singerName;
    private String introduction;
    private Date createTime;
    private Date updateTime;
    private String songUrl;
    private String pic;
    private String lyric;
    private Integer count;
    private Integer singerId;

    public Song() {
    }

    public Song(Integer id, String songName, String singerName, String introduction, Date createTime, Date updateTime, String songUrl, String pic, String lyric, Integer count, Integer singerId) {
        this.id = id;
        this.songName = songName;
        this.singerName = singerName;
        this.introduction = introduction;
        this.createTime = createTime;
        this.updateTime = updateTime;
        this.songUrl = songUrl;
        this.pic = pic;
        this.lyric = lyric;
        this.count = count;
        this.singerId = singerId;
    }

    public Integer getId() {
        return id;
    }

    public String getSingerName() {
        return singerName;
    }

    public void setSingerName(String singerName) {
        this.singerName = singerName;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSongName() {
        return songName;
    }

    public void setSongName(String songName) {
        this.songName = songName;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getSongUrl() {
        return songUrl;
    }

    public void setSongUrl(String songUrl) {
        this.songUrl = songUrl;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public String getLyric() {
        return lyric;
    }

    public void setLyric(String lyric) {
        this.lyric = lyric;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Integer getSingerId() {
        return singerId;
    }

    public void setSingerId(Integer singerId) {
        this.singerId = singerId;
    }

    @Override
    public String toString() {
        return "Song{" +
                "id=" + id +
                ", songName='" + songName + '\'' +
                ", singerName='" + singerName + '\'' +
                ", introduction='" + introduction + '\'' +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                ", songUrl='" + songUrl + '\'' +
                ", pic='" + pic + '\'' +
                ", lyric='" + lyric + '\'' +
                ", count=" + count +
                ", singerId=" + singerId +
                '}';
    }
}
