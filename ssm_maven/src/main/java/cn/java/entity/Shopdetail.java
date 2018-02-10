package cn.java.entity;

import java.io.Serializable;

//显示商家的详细信息
public class Shopdetail implements Serializable {
    /**
     * 序列化
     */
    private static final long serialVersionUID = 4677480762881465247L;

    private Long id;// 主键

    private String shopName;// 店铺名

    private String address;// 地址

    private String phone;// 电话

    private String route;// 乘车路线

    private String shopDesc;// 店铺介绍

    private Long sid;// 店铺编号

    private Long yuLiu;// 预留字段

    private String yuLiu1;// 预留字段1

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getShopName() {
        return shopName;
    }

    public void setShopName(String shopName) {
        this.shopName = shopName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getRoute() {
        return route;
    }

    public void setRoute(String route) {
        this.route = route;
    }

    public String getShopDesc() {
        return shopDesc;
    }

    public void setShopDesc(String shopDesc) {
        this.shopDesc = shopDesc;
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
}