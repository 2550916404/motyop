/**
 * Project Name:maven_ssm1
 * File Name:AdminController.java
 * Package Name:cn.java.controller.admin
 * Date:2017年12月12日下午5:24:05
 * Copyright (c) 2017, bluemobi All Rights Reserved.
 *
*/

package cn.java.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartRequest;

import cn.java.entity.Shop;
import cn.java.service.AdminZService;
import cn.java.utils.all.FilesUpload;

@Controller
@RequestMapping("zcp")
public class AdminZController {
    @Autowired
    private AdminZService as;

    private FilesUpload fu;
    // 浏览历史记录
    @RequestMapping("findHistory")
    public String selectAll(String title1, Long type1, @RequestParam(defaultValue = "10") Integer pageSize,
            @RequestParam(defaultValue = "1") Integer pageNo, Model model, HttpServletRequest request)
            throws Exception {
        List<Object> resultMap = as.selectActive(title1, type1, pageSize, pageNo);
        // 存储表格数据
        model.addAttribute("paperList", resultMap.get(0));
        model.addAttribute("numMap", resultMap.get(1));
        return "admin/showz.jsp";
    }

    // 分页及条件查询
    @RequestMapping("selectActive")
    public String selectActive(String title1, Long type1, @RequestParam(defaultValue = "10") Integer pageSize,
            @RequestParam(defaultValue = "1") Integer pageNo, Model model) throws Exception {
        List<Object> resultMap = as.selectActive(title1, type1, pageSize, pageNo);
        // 存储表格数据
        model.addAttribute("paperList", resultMap.get(0));
        model.addAttribute("numMap", resultMap.get(1));
        return "admin/showz.jsp";
    }

    // 删除浏览历史
    @RequestMapping("deleteHistory")
    @ResponseBody
    public boolean deleteHistory(Long id, HttpSession session) {
        return as.deleteHistory(id);
    }

    // 查看订单
    @RequestMapping("findOrdering")
    public String selectAll1(String title1, Long type1, Long id, @RequestParam(defaultValue = "10") Integer pageSize,
            @RequestParam(defaultValue = "1") Integer pageNo, Model model, HttpServletRequest request)
            throws Exception {
        List<Object> resultMap = as.selectActive1(title1, type1, id, pageSize, pageNo);
        // 存储表格数据
        model.addAttribute("ordering", resultMap.get(0));
        model.addAttribute("numMap", resultMap.get(1));
        return "admin/showordering.jsp";
    }

    // 分页及条件查询
    @RequestMapping("selectActive1")
    public String selectActive1(String title1, Long type1, Long id, @RequestParam(defaultValue = "10") Integer pageSize,
            @RequestParam(defaultValue = "1") Integer pageNo, Model model) throws Exception {
        List<Object> resultMap = as.selectActive1(title1, type1, id, pageSize, pageNo);
        // 存储表格数据
        model.addAttribute("ordering", resultMap.get(0));
        model.addAttribute("numMap", resultMap.get(1));
        return "admin/showordering.jsp";
    }

    @RequestMapping("findMenu")
    public String selectAll2(String title1, Long type1, @RequestParam(defaultValue = "10") Integer pageSize,
            @RequestParam(defaultValue = "1") Integer pageNo, Model model, HttpServletRequest request)
            throws Exception {
        List<Object> resultMap = as.selectActive2(title1, type1, pageSize, pageNo);
        // 存储表格数据
        model.addAttribute("menu", resultMap.get(0));
        model.addAttribute("numMap", resultMap.get(1));
        return "admin/showmenu.jsp";
    }

    // 分页及条件查询
    @RequestMapping("selectActive2")
    public String selectActive2(String title1, Long type1, @RequestParam(defaultValue = "10") Integer pageSize,
            @RequestParam(defaultValue = "1") Integer pageNo, Model model) throws Exception {
        List<Object> resultMap = as.selectActive2(title1, type1, pageSize, pageNo);
        // 存储表格数据
        model.addAttribute("menu", resultMap.get(0));
        model.addAttribute("numMap", resultMap.get(1));
        return "admin/showmenu.jsp";
    }

    // 删除商家
    @RequestMapping("deleteShop")
    @ResponseBody
    public boolean deleteShop(Long id) {
        return as.deleteShop(id);
    }

    // 查看商家信息
    @RequestMapping("findShop")
    public String selectAll3(String title1, Long type1, @RequestParam(defaultValue = "10") Integer pageSize,
            @RequestParam(defaultValue = "1") Integer pageNo, Model model, HttpServletRequest request)
            throws Exception {
        List<Object> resultMap = as.selectActive3(title1, type1, pageSize, pageNo);
        // 存储表格数据
        model.addAttribute("shop", resultMap.get(0));
        model.addAttribute("numMap", resultMap.get(1));
        return "admin/showshop.jsp";
    }

    // 分页及条件查询
    @RequestMapping("selectActive3")
    public String selectActive3(String title1, Long type1, @RequestParam(defaultValue = "10") Integer pageSize,
            @RequestParam(defaultValue = "1") Integer pageNo, Model model) throws Exception {
        List<Object> resultMap = as.selectActive3(title1, type1, pageSize, pageNo);
        // 存储表格数据
        model.addAttribute("shop", resultMap.get(0));
        model.addAttribute("numMap", resultMap.get(1));
        return "admin/showshop.jsp";
    }

    // 删除菜单
    @RequestMapping("deleteMenu")
    @ResponseBody
    public boolean deleteMenu(Long id) {
        return as.deleteMenu(id);
    }

    // 根据Id查询商家信息
    @RequestMapping("updateshop")
    public String updateshop(Long id, Model model) throws Exception {
        Shop shop = as.findShop(id);
        model.addAttribute("shop", shop);
        
        return "admin/findshop.jsp";
    }

    // 查询店铺信息
    @RequestMapping("insertActive")
    public String upDateById(Shop shop, MultipartRequest multipleRequest, HttpServletRequest request) throws Exception {
        String s=fu.uploadFiles(multipleRequest, request);
        System.out.println("路径:"+s);
        shop.setShopImagepath(s);
        boolean f = as.upDate(shop);
        // 根据结果跳转
        if (f) {
            return "redirect:/zcp/findShop.shtml";
        } else {
            return "admin/findshop.jsp";
        }
    }
}
