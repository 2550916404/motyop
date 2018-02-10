package cn.java.entity;

import java.io.Serializable;

//菜谱
public class Menu implements Serializable {

    /**
     * serialVersionUID:(用一句话描述这个变量表示什么).
     */
    private static final long serialVersionUID = 767813531962567532L;

    private Long id;// 主键

    private String caiName;// 菜名

    private String caiImagepath;// 菜品图片路径

    private String caiType;// 早中晚餐类型

    private String caiDesc;// 菜品说明

    private Float oldPrice;// 原价格

    private Float discount;// 优惠折扣

    private Long sid;// 菜谱所属店铺ID

    private Integer caiEstimate;// 菜品评价

    private Long salenum;// 销量

    private String adds;// 地址

    private String caiXi;// 菜系

    private Long yuLiu;// 预留字段

    private String yuLiu1;// 预留字段1

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCaiName() {
        return caiName;
    }

    public void setCaiName(String caiName) {
        this.caiName = caiName;
    }

    public String getCaiImagepath() {
        return caiImagepath;
    }

    public void setCaiImagepath(String caiImagepath) {
        this.caiImagepath = caiImagepath;
    }

    public String getCaiType() {
        return caiType;
    }

    public void setCaiType(String caiType) {
        this.caiType = caiType;
    }

    public String getCaiDesc() {
        return caiDesc;
    }

    public void setCaiDesc(String caiDesc) {
        this.caiDesc = caiDesc;
    }

    public Float getOldPrice() {
        return oldPrice;
    }

    public void setOldPrice(Float oldPrice) {
        this.oldPrice = oldPrice;
    }

    public Float getDiscount() {
        return discount;
    }

    public void setDiscount(Float discount) {
        this.discount = discount;
    }

    public Long getSid() {
        return sid;
    }

    public void setSid(Long sid) {
        this.sid = sid;
    }

    public Integer getCaiEstimate() {
        return caiEstimate;
    }

    public void setCaiEstimate(Integer caiEstimate) {
        this.caiEstimate = caiEstimate;
    }

    public Long getSalenum() {
        return salenum;
    }

    public void setSalenum(Long salenum) {
        this.salenum = salenum;
    }

    public String getAdds() {
        return adds;
    }

    public void setAdds(String adds) {
        this.adds = adds;
    }

    public String getCaiXi() {
        return caiXi;
    }

    public void setCaiXi(String caiXi) {
        this.caiXi = caiXi;
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