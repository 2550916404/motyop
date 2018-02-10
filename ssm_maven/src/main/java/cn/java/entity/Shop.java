package cn.java.entity;

import java.io.Serializable;
import java.util.Date;

public class Shop implements Serializable {
    /**
     * serialVersionUID:(用一句话描述这个变量表示什么).
     */
    private static final long serialVersionUID = -8185380391277981283L;

    private Long id;

    private String shopName;

    private String shopAddress;

    private String shopPhone;

    private Integer grade;

    private String specialties;

    private String parkingSpace;

    private String openingHours;

    private String activity;

    private String wifi;

    private String shopImagepath;

    private Date huifuTime;

    private Long price;

    private String diqu;

    private Long yuLiu;

    private String yuLiu1;

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

    public String getShopAddress() {
        return shopAddress;
    }

    public void setShopAddress(String shopAddress) {
        this.shopAddress = shopAddress;
    }

    public String getShopPhone() {
        return shopPhone;
    }

    public void setShopPhone(String shopPhone) {
        this.shopPhone = shopPhone;
    }

    public Integer getGrade() {
        return grade;
    }

    public void setGrade(Integer grade) {
        this.grade = grade;
    }

    public String getSpecialties() {
        return specialties;
    }

    public void setSpecialties(String specialties) {
        this.specialties = specialties;
    }

    public String getParkingSpace() {
        return parkingSpace;
    }

    public void setParkingSpace(String parkingSpace) {
        this.parkingSpace = parkingSpace;
    }

    public String getOpeningHours() {
        return openingHours;
    }

    public void setOpeningHours(String openingHours) {
        this.openingHours = openingHours;
    }

    public String getActivity() {
        return activity;
    }

    public void setActivity(String activity) {
        this.activity = activity;
    }

    public String getWifi() {
        return wifi;
    }

    public void setWifi(String wifi) {
        this.wifi = wifi;
    }

    public String getShopImagepath() {
        return shopImagepath;
    }

    public void setShopImagepath(String shopImagepath) {
        this.shopImagepath = shopImagepath;
    }

    public Date getHuifuTime() {
        return huifuTime;
    }

    public void setHuifuTime(Date huifuTime) {
        this.huifuTime = huifuTime;
    }

    public Long getPrice() {
        return price;
    }

    public void setPrice(Long price) {
        this.price = price;
    }

    public String getDiqu() {
        return diqu;
    }

    public void setDiqu(String diqu) {
        this.diqu = diqu;
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
        return "Shop [id=" + id + ", shopName=" + shopName + ", shopAddress=" + shopAddress + ", shopPhone=" + shopPhone
                + ", grade=" + grade + ", specialties=" + specialties + ", parkingSpace=" + parkingSpace
                + ", openingHours=" + openingHours + ", activity=" + activity + ", wifi=" + wifi + ", shopImagepath="
                + shopImagepath + ", huifuTime=" + huifuTime + ", price=" + price + ", diqu=" + diqu + ", yuLiu="
                + yuLiu + ", yuLiu1=" + yuLiu1 + "]";
    }

}