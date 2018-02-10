/**
 * Project Name:dt47_ssm_maven
 * File Name:CartItem.java
 * Package Name:cn.java.entity
 * Date:2018年1月2日上午9:33:57
 * Copyright (c) 2018, bluemobi All Rights Reserved.
 *
*/
/**
 * Project Name:dt47_ssm_maven
 * File Name:CartItem.java
 * Package Name:cn.java.entity
 * Date:2018年1月2日上午9:33:57
 * Copyright (c) 2018, bluemobi All Rights Reserved.
 *
 */

package cn.java.entity;

/**
 * Description: 购物车实体类 <br/>
 * Date: 2018年1月2日 上午9:33:57 <br/>
 * 
 * @author caiqi
 * @version
 * @see
 */
public class CartItem {
    private Long id;// 菜品id

    private String title;// 菜品标题

    private Integer num;// 菜品数量

    private long price;// 菜品价格

    private String image;// 菜品图片

    private String shopname;// 店铺名称

    public String getShopname() {
        return shopname;
    }

    public void setShopname(String shopname) {
        this.shopname = shopname;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public long getPrice() {
        return price;
    }

    public void setPrice(long price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "CartItem [id=" + id + ", title=" + title + ", num=" + num + ", price=" + price + ", image=" + image
                + ", shopname=" + shopname + "]";
    }

}
