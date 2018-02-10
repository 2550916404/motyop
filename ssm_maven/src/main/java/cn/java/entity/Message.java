package cn.java.entity;

import java.util.Date;

public class Message {
    private Long id;

    private String name;

    private String phone;

    private String email;

    private String supplement;

    private Long sid;

    private Date liuyanTime;

    private Long yuLiu;

    private String yuLiu1;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public String getSupplement() {
        return supplement;
    }

    public void setSupplement(String supplement) {
        this.supplement = supplement;
    }

    public Long getSid() {
        return sid;
    }

    public void setSid(Long sid) {
        this.sid = sid;
    }

    public Date getLiuyanTime() {
        return liuyanTime;
    }

    public void setLiuyanTime(Date liuyanTime) {
        this.liuyanTime = liuyanTime;
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

    @Override
    public String toString() {
        return "Message [id=" + id + ", name=" + name + ", phone=" + phone + ", email=" + email + ", supplement="
                + supplement + ", sid=" + sid + ", liuyanTime=" + liuyanTime + ", yuLiu=" + yuLiu + ", yuLiu1=" + yuLiu1
                + "]";
    }

}