/**
 * Project Name:dt47_ssm_maven
 * File Name:FanShopServiceImpl.java
 * Package Name:cn.java.service.impl
 * Date:2017年12月28日下午2:45:49
 * Copyright (c) 2017, bluemobi All Rights Reserved.
 *
*/

package cn.java.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.java.entity.History;
import cn.java.entity.Menu;
import cn.java.entity.Shop;
import cn.java.mapper.HistoryMapper;
import cn.java.mapper.MenuMapper;
import cn.java.mapper.ShopMapper;
import cn.java.service.FanShopService;

/**
 * Description: <br/>
 * Date: 2017年12月28日 下午2:45:49 <br/>
 * 
 * @author fanShaoLong
 * @version
 * @see
 */
@Service
public class FanShopServiceImpl implements FanShopService {
    @Autowired // 店铺对象
    private ShopMapper sm;

    @Autowired // 菜谱对象
    private MenuMapper mm;

    @Autowired
    private HistoryMapper hm;

    /**
     * 首页轮播随机、点菜、餐馆 index.jsp
     * 
     * @see cn.java.service.impl.FanShopService#pictureCarousel()
     */
    @Override
    public void indexCarousel(HttpServletRequest request) {
        List<Shop> picturelList = sm.lunboShop();// 图片轮播
        List<Shop> canguanList = sm.indexShop();// 餐馆
        List<Menu> menuPicturelList = mm.selectMenuThree();// 点菜三张图
        request.getSession().removeAttribute("picturelList");
        request.getSession().removeAttribute("canguanList");
        request.getSession().removeAttribute("menuPicturelList");

        request.getSession().setAttribute("picturelList", picturelList);
        request.getSession().setAttribute("canguanList", canguanList);
        request.getSession().setAttribute("menuPicturelList", menuPicturelList);

    }

    /*
     * 菜品图片跳到detailsp.jsp菜品页面方法
     * 
     */
    @Override
    public Menu detailspMenu(Long id) {
        Menu menu = mm.selectByPrimaryKey(id);
        return menu;
    }

    /*
     * 有很多个商品浏览记录，也就是需要保存多个id的值，但是每一个Cookie只能保存一个键值对（Key-value），
     * 可以创建多个Cookie保存多个键值队，但是这样开销过大，为了降低开销我们采取拼串的方法利用一个Cookie保存键值对。
     * 下面贴出创建Cookie拼串的代码。
     */
    @Override
    public void historyShop(HttpServletRequest request, HttpServletResponse response, Long id) {
        Cookie[] cookieArray = request.getCookies();
        String shopcookie = "";// 保存店铺id的字符串

        String[] ids = new String[5];
        List<String> list = null;
        LinkedList<String> linkedList = null;
        List<Shop> historyShopList = null;
        if (cookieArray != null) {// 判断本地是否有cookie文件
            for (Cookie cookie : cookieArray) {// 遍历cookie集合
                // shopcookie是预先设计的Key值
                if ("shopcookie".equals(cookie.getName())) {// 如果我们需要的cookie存在
                    shopcookie = cookie.getValue();
                    String url = cookie.getPath();
                    System.out.println("url=" + url);
                    // 这里预先设置每个id之间利通“-”分割
                    ids = shopcookie.split("-");
                    // 保证List集合中没有重复id
                    // 并且最新的id永远放在链表的前面
                    // 这里常进行插入操作，所以用链表
                    list = Arrays.asList(ids);
                }
            }
        }
        if (list == null) {// 如果我们需要的cookie存在，则把list转换为链表,否则生成一个空链表
            linkedList = new LinkedList<String>();
        } else {
            linkedList = new LinkedList<String>(list);
        }
        if (shopcookie.contains(id.toString())) {// 如果储存的id有重复,去重复的旧记录
            linkedList.remove(id.toString());
        }
        linkedList.addFirst(id.toString());// 把id储存在链表第一位
        StringBuffer stringBuffer = new StringBuffer();
        // 从链表中恢复前num个字符串，
        for (int i = 0; i < linkedList.size() && i < 5; i++) {// 把链表转化为字符串
            stringBuffer.append(linkedList.get(i) + "-");
        }
        shopcookie = stringBuffer.toString();
        shopcookie = shopcookie.substring(0, shopcookie.length() - 1);// 去掉链表结尾的"-"符号

        Cookie ck = new Cookie("shopcookie", shopcookie);
        ck.setMaxAge(60 * 60 * 24);// 这个cookie寿命基本单位为秒，60 * 60 * 24为一天
        ck.setPath("/");
        // System.out.println("cookie域浏览历史店铺id=" + shopcookie);
        response.addCookie(ck);// 添加到cookie中

        // 遍历所有历史浏览店铺id
        /*
         * for (String string : linkedList) { System.out.println(string); }
         */
        historyShopList = new ArrayList<Shop>();

        request.getSession().removeAttribute("historyShopList");// 清空session域中的值
        for (int i = 0; i < linkedList.size() && i < 3; i++) {
            Long num = Long.parseLong(linkedList.get(i));
            if (num != null) {
                historyShopList.add(sm.selectByPrimaryKey(num));
            }
        }
        // 向session域添加店铺浏览记录
        request.getSession().setAttribute("historyShopList", historyShopList);
        for (Shop shop : historyShopList) {
            System.out.println(shop);
        }
    }

    /*
     * 
     * shop.jsp页面清空店铺浏览历史记录
     */
    @Override
    public void historyClean(HttpServletRequest request, HttpServletResponse response) {
        Cookie ck = new Cookie("shopcookie", null);
        ck.setMaxAge(0);// 这个cookie寿命基本单位为秒，60 * 60 * 24为一天
        ck.setPath("/");
        response.addCookie(ck);// 删除一个cookie只用在response中添加一个寿命为0的同名cookie
        request.getSession().removeAttribute("historyShopList");// 清空session域中的值
        System.out.println("clean");
        Cookie[] cookieArray = request.getCookies();
        if (cookieArray != null) {
            for (Cookie cookie : cookieArray) {
                String c = cookie.getValue();
                cookie.setMaxAge(0);
                cookie.setPath("/");
                response.addCookie(cookie);
                // System.out.println(c);
            }
        }
    }

    /*
     * 浏览收藏店铺信息
     */
    @Override
    public List<History> collSelect(Long browseId, Long index, Long size) {

        List<History> collList = hm.collSelect(browseId, index, size);

        return collList;
    }

    /*
     * 取消店铺收藏
     */
    @Override
    public int collDelete(Long browseId, Long sid) {
        if (browseId == null) {
            browseId = 0L;
        }
        return hm.collDelete(browseId, sid);
    }

    /*
     * 收藏店铺
     */
    @Override
    public int collAdd(Long browseId, Long sid) {
        int flag = hm.collSelectReady(browseId, sid);
        if (flag <= 0) {// 店铺未被收藏
            return hm.collAdd(browseId, sid);
        } else {
            return -1; // 店铺已收藏
        }
    }

}
