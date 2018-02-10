package cn.java.entity;

import java.io.Serializable;

//地区表
public class Area_Table implements Serializable {
    /**
     * 序列化
     */
    private static final long serialVersionUID = -3505669427406423955L;

    private Long id;// 主键id

    private String city;// 市名称

    private Long pid;// 关联id

    private Long ppid;// 关联收货人

    private Long yuLiu;// 预留字段

    private String yuLiu1;// 预留字段1

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public Long getPid() {
        return pid;
    }

    public void setPid(Long pid) {
        this.pid = pid;
    }

    public Long getPpid() {
        return ppid;
    }

    public void setPpid(Long ppid) {
        this.ppid = ppid;
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