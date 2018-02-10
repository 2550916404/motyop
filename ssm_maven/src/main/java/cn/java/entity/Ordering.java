package cn.java.entity;

import java.util.Date;

public class Ordering {
    private Long id;

    private Long vidId;

    private Date orderTime;

    private String addresseeName;

    private String addres;

    private String amount;

    private Integer state;

    private String orderDesc;

    private String orderId;

    private String alpay;

    private Long yuLiu;

    private String yuLiu1;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getVidId() {
        return vidId;
    }

    public void setVidId(Long vidId) {
        this.vidId = vidId;
    }

    public Date getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Date orderTime) {
        this.orderTime = orderTime;
    }

    public String getAddresseeName() {
        return addresseeName;
    }

    public void setAddresseeName(String addresseeName) {
        this.addresseeName = addresseeName;
    }

    public String getAddres() {
        return addres;
    }

    public void setAddres(String addres) {
        this.addres = addres;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getOrderDesc() {
        return orderDesc;
    }

    public void setOrderDesc(String orderDesc) {
        this.orderDesc = orderDesc;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getAlpay() {
        return alpay;
    }

    public void setAlpay(String alpay) {
        this.alpay = alpay;
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