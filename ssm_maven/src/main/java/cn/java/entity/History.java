package cn.java.entity;

import java.io.Serializable;
import java.util.Date;

//店铺收藏表collection
public class History implements Serializable {
    /**
     * serialVersionUID:(用一句话描述这个变量表示什么).
     */
    private static final long serialVersionUID = 4253415183359339681L;

    /**
     * 序列化
     */
    private Long id;// 主键

    private Long browseId;// 浏览人

    private Date browseTime;// 浏览时间

    private String browseShop;// 被浏览店铺

    private Long sid;// 被浏览店铺ID

    private Long yuLiu;// 预留字段

    private String yuLiu1;// 预留字段1

    private Shop shop;// 一对多用来储存店铺信息的列表

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getBrowseId() {
        return browseId;
    }

    public void setBrowseId(Long browseId) {
        this.browseId = browseId;
    }

    public Date getBrowseTime() {
        return browseTime;
    }

    public void setBrowseTime(Date browseTime) {
        this.browseTime = browseTime;
    }

    public String getBrowseShop() {
        return browseShop;
    }

    public void setBrowseShop(String browseShop) {
        this.browseShop = browseShop;
    }

    public Long getSid() {
        return sid;
    }

    public void setSid(Long sid) {
        this.sid = sid;
    }

    public Long getYuLiu() {
        return yuLiu;
    }

    public void setYuLiu(Long yuLiu) {
        this.yuLiu = yuLiu;
    }

    public String getYuLiu1() {
        return yuLiu1;
    }

    public void setYuLiu1(String yuLiu1) {
        this.yuLiu1 = yuLiu1;
    }

    public Shop getShop() {
        return shop;
    }

    public void setShop(Shop shop) {
        this.shop = shop;
    }

    @Override
    public String toString() {
        return "History [id=" + id + ", browseId=" + browseId + ", browseTime=" + browseTime + ", browseShop=" + browseShop + ", sid=" + sid + ", yuLiu="
                + yuLiu + ", yuLiu1=" + yuLiu1 + ", shop=" + shop + "]";
    }

}