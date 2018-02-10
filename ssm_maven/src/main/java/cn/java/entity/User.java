package cn.java.entity;

import java.io.Serializable;

//注册登录表
public class User implements Serializable {
    /**
     * 序列化
     */
    private static final long serialVersionUID = -7595948011707912039L;

    private Long id;// 主键id

    private String username;// 用户名

    private String password;// 密码

    private String email;// 邮箱

    private Long iphone;// 手机号码

    private Long yuLiu;// 预留字段

    private String yuLiu1;// 预留字段1

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Long getIphone() {
        return iphone;
    }

    public void setIphone(Long iphone) {
        this.iphone = iphone;
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