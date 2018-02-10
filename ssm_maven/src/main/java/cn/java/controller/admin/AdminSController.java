/**
 * Project Name:dt47_ssm_maven
 * File Name:AdminSController.java
 * Package Name:cn.java.controller.admin
 * Date:2017年12月28日下午3:38:11
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

import cn.java.service.AdminSService;

/**
 * Description: <br/>
 * Date: 2017年12月28日 下午3:38:11 <br/>
 * 
 * @author shaoJie
 * @version
 * @see
 */
@Controller
public class AdminSController {
    @Autowired
    private AdminSService ass;

    @RequestMapping("selectAll")
    public String selectAll(String title1, Long type1, @RequestParam(defaultValue = "10") Integer pageSize,
            @RequestParam(defaultValue = "1") Integer pageNo, Model model, HttpServletRequest request)
            throws Exception {
        System.out.println(title1);
        List<Object> resultMap = ass.selectActiveAdmin(title1, type1, pageSize, pageNo);
        // 存储表格数据

        model.addAttribute("paperList", resultMap.get(0));
        model.addAttribute("numMap", resultMap.get(1));
        return "admin/right.jsp";

    }

    // 分页及条件查询
    @RequestMapping("selectActive")
    public String selectActive(String title1, Long type1, @RequestParam(defaultValue = "10") Integer pageSize,
            @RequestParam(defaultValue = "1") Integer pageNo, Model model) throws Exception {
        System.out.println(title1);
        List<Object> resultMap = ass.selectActiveAdmin(title1, type1, pageSize, pageNo);
        // 存储表格数据
        model.addAttribute("paperList", resultMap.get(0));
        model.addAttribute("numMap", resultMap.get(1));
        return "admin/right.jsp";
    }

    /*
     * 删除用户
     * 
     */

    @RequestMapping("deleteUserAdmin")
    @ResponseBody
    public String deleteUserAdmin(long id, HttpSession session) {
        int r = ass.deleteUserAdmin(id);
        session.setAttribute("flag", r);
        return "selectActive.shtml";
    }
    //

    @RequestMapping("deleteUserAdminMessage")
    @ResponseBody
    public String deleteUserAdminMessage(long id, HttpSession session) {
        int r = ass.deleteUserAdmin(id);
        session.setAttribute("flag", r);
        return "selectActive.shtml";
    }

    @RequestMapping("selectShowUserAdmin")
    public String selectShowUserAdmin(long id, Model model) {

        return "admin/xiaoFeiShow.jsp";

    }

    // superLogin超级管理员登陆

    @RequestMapping("superLogin")
    public String superLogin(String admin_user, String admin_password, HttpSession session) {

        // boolean flag = false;

        if (ass.superLogin(admin_user, admin_password)) {

            session.setAttribute("admin_user", admin_user);

            return "admin/main.jsp";

        }

        return "admin/login.jsp";

    }

    // 验证密码
    @RequestMapping("yanZhengPassword")
    @ResponseBody
    public boolean yanZhengPassword(String password, HttpSession session) {
        boolean d = false;
        System.out.println("username" + password);
        Object ob = session.getAttribute("admin_user");

        String admin_user = ob.toString();
        if (ass.superLogin(admin_user, password)) {
            d = true;
        }

        return d;

    }

    // updatePaswordAdmin修改超级管理员密码
    @RequestMapping("updatePaswordAdmin")

    public String updatePaswordAdmin(HttpSession session, String password1, String password2) {

        // System.out.println(password1 + "password1" + password2 +
        // "password2");
        Object ob = session.getAttribute("admin_user");
        String admin_user = ob.toString();
        // System.out.println(admin_user + "admin_user");

        if (password1.equals(password2)) {
            String admin_passwoed = password2;
            ass.updateAdminUser(admin_passwoed, admin_user);
        }

        session.invalidate();
        return "admin/xiuGaiPassword.jsp";
    }

    // 退出登录
    @RequestMapping("toLogin")
    public String execute(HttpSession session) {
        session.invalidate();
        return "admin/login.jsp";
    }

    @RequestMapping("selectAllMessage")
    public String selectAllMessage(String title1, Long type1, @RequestParam(defaultValue = "10") Integer pageSize,

            @RequestParam(defaultValue = "1") Integer pageNo, Model model, HttpServletRequest request)
            throws Exception {
        System.out.println(title1);
        List<Object> resultMap = ass.selectActiveAdminMessage(title1, type1, pageSize, pageNo); // 存储表格数据
        System.out.println("selectAllMessage");
        model.addAttribute("paperListMessage", resultMap.get(0));
        System.out.println(resultMap.get(0));
        model.addAttribute("numMap", resultMap.get(1));
        return "admin/adminMessage.jsp";

    }

    // 分页及条件查询
    @RequestMapping("selectActiveMessage")
    public String selectActiveMessage(String title1, Long type1, @RequestParam(defaultValue = "10") Integer pageSize,
            @RequestParam(defaultValue = "1") Integer pageNo, Model model) throws Exception {
        System.out.println(title1);
        List<Object> resultMap = ass.selectActiveAdminMessage(title1, type1, pageSize, pageNo);
        // 存储表格数据
        System.out.println("进入selectActiveMessage");
        model.addAttribute("paperList", resultMap.get(0));
        model.addAttribute("numMap", resultMap.get(1));
        return "admin/adminMessage.jsp";
    }

}
