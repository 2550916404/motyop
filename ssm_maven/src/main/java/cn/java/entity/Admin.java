package cn.java.entity;

import java.io.Serializable;

//管理员表
public class Admin implements Serializable {
    /**
     * 序列化
     */
    private static final long serialVersionUID = 4843667646972925194L;

    private Long id;// 主键id

    private String adminUser;// 管理员用户名

    private String adminPasswoed;// 管理员密码

    private Long yuLiu;// 预留字段

    private String yuLiu1;// 预留字段1

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getAdminUser() {
        return adminUser;
    }

    public void setAdminUser(String adminUser) {
        this.adminUser = adminUser;
    }

    public String getAdminPasswoed() {
        return adminPasswoed;
    }

    public void setAdminPasswoed(String adminPasswoed) {
        this.adminPasswoed = adminPasswoed;
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