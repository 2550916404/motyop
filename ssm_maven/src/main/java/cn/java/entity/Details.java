package cn.java.entity;

public class Details {
    private Long id;

    private Long oid;

    private Long cid;

    private String caiName;

    private Long caiNum;

    private Long caiPrice;

    private String shopname;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getOid() {
        return oid;
    }

    public void setOid(Long oid) {
        this.oid = oid;
    }

    public Long getCid() {
        return cid;
    }

    public void setCid(Long cid) {
        this.cid = cid;
    }

    public String getCaiName() {
        return caiName;
    }

    public void setCaiName(String caiName) {
        this.caiName = caiName;
    }

    public Long getCaiNum() {
        return caiNum;
    }

    public void setCaiNum(Long caiNum) {
        this.caiNum = caiNum;
    }

    public Long getCaiPrice() {
        return caiPrice;
    }

    public void setCaiPrice(Long caiPrice) {
        this.caiPrice = caiPrice;
    }

    public String getShopname() {
        return shopname;
    }

    public void setShopname(String shopname) {
        this.shopname = shopname;
    }
}