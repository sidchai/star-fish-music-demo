package com.softeem.pojo;

import java.util.Date;

public class Singer {
    private Integer id;//歌手id
    private String singerName;//歌手名
    private String pic;//歌手头像pic
    private Date debutTime;//歌手出道时间
    private String region;//歌手所在地区
    private Integer rank;//歌手排名
    private String introduction;//歌手个人介绍
    private Integer classifyId;//歌手类别

    public Singer() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSingerName() {
        return singerName;
    }

    public void setSingerName(String singerName) {
        this.singerName = singerName;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public Date getDebutTime() {
        return debutTime;
    }

    public void setDebutTime(Date debutTime) {
        this.debutTime = debutTime;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public Integer getClassifyId() {
        return classifyId;
    }

    public void setClassifyId(Integer classifyId) {
        this.classifyId = classifyId;
    }

    public Integer getRank() {
        return rank;
    }

    public void setRank(Integer rank) {
        this.rank = rank;
    }

    @Override
    public String toString() {
        return "Singer{" +
                "id=" + id +
                ", singerName='" + singerName + '\'' +
                ", pic='" + pic + '\'' +
                ", debutTime=" + debutTime +
                ", region='" + region + '\'' +
                ", rank=" + rank +
                ", introduction='" + introduction + '\'' +
                ", classifyId=" + classifyId +
                '}';
    }
}
