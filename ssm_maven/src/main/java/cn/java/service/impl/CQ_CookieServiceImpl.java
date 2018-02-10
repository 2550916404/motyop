/**
 * Project Name:dt47_ssm_maven
 * File Name:CQ_CookieServiceImpl.java
 * Package Name:cn.java.service.impl
 * Date:2018年1月2日上午9:09:31
 * Copyright (c) 2018, bluemobi All Rights Reserved.
 *
*/
/**
 * Project Name:dt47_ssm_maven
 * File Name:CQ_CookieServiceImpl.java
 * Package Name:cn.java.service.impl
 * Date:2018年1月2日上午9:09:31
 * Copyright (c) 2018, bluemobi All Rights Reserved.
 *
 */

package cn.java.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import cn.java.entity.CartItem;
import cn.java.entity.Consignee;
import cn.java.entity.Menu;
import cn.java.entity.Shop;
import cn.java.mapper.ConsigneeMapper;
import cn.java.mapper.MenuMapper;
import cn.java.mapper.ShopMapper;
import cn.java.service.CQ_CookieService;
import cn.java.utils.all.CookieUtils;
import cn.java.utils.all.JsonUtils;
import cn.java.utils.all.Txt2String;

/**
 * Description: <br/>
 * Date: 2018年1月2日 上午9:09:31 <br/>
 * 
 * @author caiqi
 * @version
 * @see
 */
@Service
public class CQ_CookieServiceImpl implements CQ_CookieService {
    @Autowired
    private MenuMapper mm;

    @Autowired
    private ShopMapper shopm;

    @Autowired
    private ConsigneeMapper com;

    /**
     * 添加购物车的方法
     * 
     * @see cn.java.service.impl.CQ_CookieService#addCartItem(long, int)
     */
    @Override
    public int addCartItem(long id, int num, HttpServletRequest request, HttpServletResponse response) {
        // 取商品信息
        CartItem cartItem = null;
        // 取购物车商品列表
        List<CartItem> itemlist = getcartitemlist(request);
        // 判断购物车商品列表中，是否存在此商品
        for (CartItem cItem : itemlist) {
            // 如果此商品存在
            if (cItem.getId() == id) {
                // 增加商品数量
                cItem.setNum(cItem.getNum() + num);
                cartItem = cItem;
                break;
            }
        }
        if (cartItem == null) {
            cartItem = new CartItem();
            // 根据id查询商品信息
            Menu menu = mm.selectByPrimaryKey(id);
            // 获取关联id
            Long sid = menu.getSid();
            // 根据关联id查询店铺信息
            Shop shop = shopm.selectByPrimaryKey(sid);
            // 放到String变量中方便等会操作
            String shopname = shop.getShopName();
            // 把shopname设置到cartItem实体类中
            cartItem.setShopname(shopname);
            cartItem.setId(menu.getId());
            cartItem.setTitle(menu.getCaiName());
            cartItem.setNum(num);
            float Price = menu.getOldPrice();
            float Discount = menu.getDiscount();
            long prin = (long) (Price * Discount);
            cartItem.setPrice(prin);
            cartItem.setImage(menu.getCaiImagepath());
            // 添加购物车列表
            itemlist.add(cartItem);
        }
        try {
            // 把购物车列表写入cookie
            CookieUtils.setCookie(request, response, "CART", JsonUtils.objectToJson(itemlist), true);
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
        return 1;
    }

    /**
     * 
     * Description:从cookie中取商品列表 <br/>
     *
     * @author caiqi
     * @return
     */
    private List<CartItem> getcartitemlist(HttpServletRequest request) {
        // 从cookie中取商品列表
        String cartjson = CookieUtils.getCookieValue(request, "CART", true);
        if (cartjson == null) {
            return new ArrayList<>();
        }
        // 把json转换成商品列表

        try {
            List<CartItem> list = JsonUtils.jsonToList(cartjson, CartItem.class);
            return list;
        } catch (Exception e) {
            e.printStackTrace();

        }

        return new ArrayList<>();
    }

    /**
     * 显示购物车
     * 
     * @see cn.java.service.CQ_CookieService#getcar()
     */
    @Override
    public List<CartItem> getcar(HttpServletRequest request) {
        List<CartItem> list = getcartitemlist(request);
        return list;
    }

    /**
     * 删除购物车
     * 
     * @see cn.java.service.CQ_CookieService#deleCartItem(long,
     *      javax.servlet.http.HttpServletRequest,
     *      javax.servlet.http.HttpServletResponse)
     */
    @Override
    public int deleCartItem(long id, HttpServletRequest request, HttpServletResponse response) {
        // 从cookie中取出购物车商品列表
        List<CartItem> list = getcartitemlist(request);
        // 从列表中找到此商品
        for (CartItem cartItem : list) {
            if (cartItem.getId() == id) {
                list.remove(cartItem);
                break;
            }
        }
        try {
            // 把购物车重新写入cookie
            CookieUtils.setCookie(request, response, "CART", JsonUtils.objectToJson(list), true);
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
        return 1;
    }

    /**
     * 结算的方法
     * 
     * @see cn.java.service.CQ_CookieService#Account()
     */
    @Override
    public boolean Account(String prine, Model model, HttpServletRequest request, HttpServletResponse response) {
        Object sid = request.getSession().getAttribute("Sid");
        if (sid == null) {
            return false;
        } else {
            // 根据id获取对应用户的地址信息
            Integer id = Integer.parseInt(String.valueOf(sid));
            List<Consignee> list = com.selectByPrimaryKeyid(id);
            for (Consignee consignee : list) {
                System.out.println(consignee.toString());
            }
            // 获取cookie中的数据
            List<CartItem> cartItems = getcartitemlist(request);
            // 获取时间戳
            String timestamp = request.getParameter("timestamp");
            model.addAttribute("timestamp", timestamp);
            model.addAttribute("list", list);
            model.addAttribute("cartItems", cartItems);
            model.addAttribute("prine", prine);// 获取价格

            return true;
        }

    }

    /**
     * 
     * 读取日志信息
     * 
     * @see cn.java.service.CQ_CookieService#lookText()
     */
    @Override
    public String lookText() {
        File file = new File("C://alipay/log.log4j");
        return Txt2String.txt2String(file);
    }
}
