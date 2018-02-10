package cn.java.entity;

import java.io.Serializable;

//用户信息表
public class Ruser implements Serializable {
    /**
     * 序列化
     */
    private static final long serialVersionUID = -7385024120671991479L;

    private Long id;// 主键

    private Long uPhone;// 与user表相关联的手机号

    private String icon;// 头像

    private String loginTime;// 登录时间

    private String uEmail;// 用户邮箱与user表关联

    private String nick;// 昵称

    private Long yuLiu;// 预留字段

    private String yuLiu1;// 预留字段1

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getuPhone() {
        return uPhone;
    }

    public void setuPhone(Long uPhone) {
        this.uPhone = uPhone;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getLoginTime() {
        return loginTime;
    }

    public void setLoginTime(String loginTime) {
        this.loginTime = loginTime;
    }

    public String getuEmail() {
        return uEmail;
    }

    public void setuEmail(String uEmail) {
        this.uEmail = uEmail;
    }

    public String getNick() {
        return nick;
    }

    public void setNick(String nick) {
        this.nick = nick;
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