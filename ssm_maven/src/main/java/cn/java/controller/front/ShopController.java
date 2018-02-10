/**
 * Project Name:dt47_ssm_maven
 * File Name:ShopController.java
 * Package Name:cn.java.controller.front
 * Date:2017年12月27日下午2:48:52
 * Copyright (c) 2017, bluemobi All Rights Reserved.
 *
*/

package cn.java.controller.front;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.java.entity.Menu;
import cn.java.entity.Message;
import cn.java.entity.Shop;
import cn.java.entity.Shopdetail;
import cn.java.service.FanShopService;
import cn.java.service.MenuService;
import cn.java.service.MessageService;
import cn.java.service.ShopService;

/**
 * Description: 商家信息控制层 <br/>
 * Date: 2017年12月27日 下午2:48:52 <br/>
 * 
 * @author yuChaoya
 * @version
 * @see
 */
@Controller
public class ShopController {
    @Autowired
    private ShopService ss;// 店铺

    @Autowired
    private MessageService ms;// 留言

    @Autowired
    private MenuService mm;// 菜单

    @Autowired
    private FanShopService fss;// 店铺浏览历史业务层 范绍龙

    @RequestMapping("addShop")
    public String addShop(Shop shop) {// 添加店铺信息
        boolean flag = ss.addShop(shop);
        if (flag) {
            return "front/index.jsp";
        } else {
            return "front/merchant.jsp";
        }
    }

    @RequestMapping("selectShop")
    public String selectShop(Long id, Model model, HttpServletRequest request, HttpServletResponse response) {// 查询店铺信息
        Shop shop = ss.selectShop(id);
        model.addAttribute("Shop", shop);
        Shopdetail shopdetail = ss.selectShopdetail(id);
        model.addAttribute("Shopdetail", shopdetail);
        List<Message> messages = ms.selectByshop(id);
        model.addAttribute("Messages", messages);
        List<Menu> menus = mm.selectMenuByshop(id);
        model.addAttribute("Menus", menus);
        fss.historyShop(request, response, id);// 用cookie域存储浏览店铺记录 范绍龙
        return "front/shop.jsp";
    }

    @RequestMapping("addMessage")
    public String addMessage(Message message, HttpServletRequest request) {// 添加留言
        Object sid = request.getSession().getAttribute("Sid");
        Long Sid = Long.parseLong(sid.toString());
        // System.out.println(Sid);
        message.setLiuyanTime(new Date());
        message.setSid(Sid);
        int flag = ms.addMessage(message);
        if (flag > 0) {
            return "front/index.jsp";
        }
        return "front/shop.jsp";
    }

    @RequestMapping("selectAllMenu")
    public String selectAllMenu(Model model) {// 查询所有食物
        List<Map<String, Object>> listMenu = mm.selectAllMenu();
        model.addAttribute("Menulist", listMenu);
        return "front/list.jsp";
    }

    @RequestMapping("selectMenus")
    public String selectMenus(Model model) {// 查询积分商城所有食物
        List<Map<String, Object>> listMenu = mm.selectAllMenu();
        model.addAttribute("Menulists", listMenu);
        return "front/category.jsp";
    }

    @RequestMapping("selectFood")
    @ResponseBody
    public List<Map<String, Object>> selectFood(HttpSession session, String food) {// 按食物名查询食物
        List<Map<String, Object>> list = mm.selectFood(food);
        session.setAttribute("Food", list);
        List<Map<String, Object>> listname = selectCainame();
        session.setAttribute("Cainame", listname);
        return list;
    }

    @RequestMapping("selectFoodByType")
    @ResponseBody
    public List<Map<String, Object>> selectFoodByType(HttpSession session, String type) {// 按餐点查询食物
        List<Map<String, Object>> list = mm.selectFoodByType(type);
        session.setAttribute("Menulist", list);
        return list;
    }

    @RequestMapping("selectFoodByDiqu")
    @ResponseBody
    public List<Map<String, Object>> selectFoodByDiqu(HttpSession session, String diqu) {// 按位置查询食物
        List<Map<String, Object>> list = mm.selectFoodByDiqu(diqu);
        session.setAttribute("Menulist", list);
        return list;
    }

    @RequestMapping("selectFoodByCaixi")
    @ResponseBody
    public List<Map<String, Object>> selectFoodByCaixi(HttpSession session, String caixi) {// 按菜系查询食物
        List<Map<String, Object>> list = mm.selectFoodByCaixi(caixi);
        session.setAttribute("Menulist", list);
        return list;
    }

    @RequestMapping("getMenuByshop")
    public String getMenuByshop(Long id, Model model) {// 根据店铺id查询食物
        List<Map<String, Object>> menus = mm.getMenuByshop(id);
        model.addAttribute("Food", menus);
        return "front/search_p.jsp";
    }

    @RequestMapping("paixuByprice")
    @ResponseBody
    public List<Map<String, Object>> paixuByprice(Model model) {// 按价格排序
        List<Map<String, Object>> listMenu = mm.paixuByprice();
        model.addAttribute("Menulist", listMenu);
        return listMenu;
    }

    @RequestMapping("paixuBygrade")
    @ResponseBody
    public List<Map<String, Object>> paixuBygrade(Model model) {// 按评分排序
        List<Map<String, Object>> listMenu = mm.paixuBygrade();
        model.addAttribute("Menulist", listMenu);
        return listMenu;
    }

    /*************************** 第1次进来分页查询的方法 ****************************/
    @RequestMapping("selectMenu1")
    public String selectMenu1(HttpSession session, Model model) {
        String page = "1";// 第一次进来默认显示第一页
        int pages = Integer.parseInt(page);// 将string转换为int
        int rows = 4;// 固定每页4条数据
        /*** 查询分页页数 ***/
        Long maxs = mm.selectAllNum();
        Long max = maxs / 4 + 1;// 输出页码
        // System.out.println(max);
        List<Map<String, Object>> list = mm.selectCaixi();// 查询的所有菜系
        model.addAttribute("Caixi", list);
        List<Map<String, Object>> list1 = mm.selectAddress();// 查询位置
        model.addAttribute("Caiadds", list1);
        List<Map<String, Object>> list2 = mm.selectCaitype();// 查询餐点
        model.addAttribute("Caitype", list2);
        List<Map<String, Object>> listname = selectCainame();
        model.addAttribute("Cainame", listname);
        List<Map<String, Object>> listMap = mm.selectAllMenu1(pages, rows);// 请求获取分页数据
        session.setAttribute("pages", pages);// 将角标储存在session里面
        session.setAttribute("max", max);// 存储总条数
        session.setAttribute("Menulist", listMap);// 储存获取的分页数据
        return "front/list.jsp";// 跳转到select页面
    };

    /*************************** 第2次进来分页查询的方法 ****************************/
    @RequestMapping("selectMenu2")
    @ResponseBody
    public List<Map<String, Object>> selectMenu2(String page, HttpSession session) {
        int rows = 4;// 固定每页4条数据
        int pages = Integer.parseInt(page);// 将string转换为int
        /*** 查询分页页数 ***/
        Long maxs = mm.selectAllNum();
        Long max = maxs / 4 + 1;// 输出页码
        // System.out.println(max);
        List<Map<String, Object>> listMap = mm.selectAllMenu1(pages, rows);// 请求获取分页数据
        session.setAttribute("pages", pages);// 将角标储存在session里面
        session.setAttribute("Menulist", listMap);// 储存获取的分页数据
        return listMap;// 给ajax一个响应
    };

    // 积分商城分页1
    @RequestMapping("selectMenu3")
    public String selectMenu3(HttpSession session) {
        String page = "1";// 第一次进来默认显示第一页
        int pages = Integer.parseInt(page);// 将string转换为int
        int rows = 6;// 固定每页6条数据
        /*** 查询分页页数 ***/
        Long maxs = mm.selectAllNum();
        Long max = maxs / 6 + 1;// 输出页码
        // System.out.println(max);
        List<Map<String, Object>> listMap = mm.selectAllMenu1(pages, rows);// 请求获取分页数据
        session.setAttribute("page", pages);// 将角标储存在session里面
        session.setAttribute("maxs", max);// 存储总条数
        session.setAttribute("Menulists", listMap);// 储存获取的分页数据
        return "front/category.jsp";// 跳转到查询页面
    };

    // 积分商城分页2
    @RequestMapping("selectMenu4")
    @ResponseBody
    public List<Map<String, Object>> selectMenu4(String page, HttpSession session) {
        int rows = 6;// 固定每页6条数据
        int pages = Integer.parseInt(page);// 将string转换为int
        /*** 查询分页页数 ***/
        Long maxs = mm.selectAllNum();
        Long max = maxs / 6 + 1;// 输出页码
        // System.out.println(max);
        List<Map<String, Object>> listMap = mm.selectAllMenu1(pages, rows);// 请求获取分页数据
        session.setAttribute("page", pages);// 将角标储存在session里面
        session.setAttribute("Menulists", listMap);// 储存获取的分页数据
        return listMap;// 给ajax一个响应
    };

    public List<Map<String, Object>> selectCainame() {// 查询菜名
        return mm.selectCainame();
    }

}
