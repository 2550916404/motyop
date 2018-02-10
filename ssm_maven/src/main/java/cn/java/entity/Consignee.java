package cn.java.entity;

public class Consignee {
    private Integer id;// 主键id

    private String consigneeName;// 收货人姓名

    private String streetAddress;// 街道地址

    private String phone;// 手机号

    private Long vipid;// 会员id

    private Long yuLiu;// 预留字段1

    private String yuLiu1;// 预留字段2

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getConsigneeName() {
        return consigneeName;
    }

    public void setConsigneeName(String consigneeName) {
        this.consigneeName = consigneeName;
    }

    public String getStreetAddress() {
        return streetAddress;
    }

    public void setStreetAddress(String streetAddress) {
        this.streetAddress = streetAddress;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Long getVipid() {
        return vipid;
    }

    public void setVipid(Long vipid) {
        this.vipid = vipid;
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
        return "Consignee [id=" + id + ", consigneeName=" + consigneeName + ", streetAddress=" + streetAddress
                + ", phone=" + phone + ", vipid=" + vipid + ", yuLiu=" + yuLiu + ", yuLiu1=" + yuLiu1 + "]";
    }

}