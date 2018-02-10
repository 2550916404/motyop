package cn.java.entity;

import java.io.Serializable;

//购物车表
public class ShopPingCart implements Serializable {
    /**
     * 序列化
     */
    private static final long serialVersionUID = -7448201719342017941L;

    private Long id;// id编号

    private Long shopId;// 店铺id

    private Long dishesId;// 菜品id

    private Float dishesOriginal;// 菜品原价

    private Integer dishesPcs;// 菜品数量

    private Integer discount;// 店铺折扣

    private Long yuLiu;// 预留字段

    private String yuLiu1;// 预留字段1

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getShopId() {
        return shopId;
    }

    public void setShopId(Long shopId) {
        this.shopId = shopId;
    }

    public Long getDishesId() {
        return dishesId;
    }

    public void setDishesId(Long dishesId) {
        this.dishesId = dishesId;
    }

    public Float getDishesOriginal() {
        return dishesOriginal;
    }

    public void setDishesOriginal(Float dishesOriginal) {
        this.dishesOriginal = dishesOriginal;
    }

    public Integer getDishesPcs() {
        return dishesPcs;
    }

    public void setDishesPcs(Integer dishesPcs) {
        this.dishesPcs = dishesPcs;
    }

    public Integer getDiscount() {
        return discount;
    }

    public void setDiscount(Integer discount) {
        this.discount = discount;
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