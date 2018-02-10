/**
 * Project Name:dt47_ssm_maven
 * File Name:ClhController.java
 * Package Name:cn.java.controller.front
 * Date:2017年12月28日下午2:23:22
 * Copyright (c) 2017, bluemobi All Rights Reserved.
 *
*/

package cn.java.controller.front;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartRequest;

import cn.java.entity.Ruser;
import cn.java.entity.User;
import cn.java.service.ClhService;
import cn.java.service.FanShopService;
import cn.java.sms.sendsms;
import cn.java.utils.all.UpLoadUtil;

/**
 * Description: <br/>
 * Date: 2017年12月28日 下午2:23:22 <br/>
 * 
 * @author CLH
 * @version
 * @see
 */
@Controller
public class ClhController {
    @Autowired
    private ClhService cs;

    @Autowired
    private FanShopService fss;

    // 验证用户名是否存在
    @RequestMapping("exisUsername")
    @ResponseBody
    public int exisUsername(HttpServletRequest request) {
        // System.out.println("进入");
        String username = request.getParameter("username");
        int flag = cs.selectName(username);
        // System.out.println(flag);

        if (flag >= 1) {// 判断登录成功后清除并更新首页轮播及三张菜谱 范绍龙
            fss.indexCarousel(request);
        }

        return flag;
    }

    @RequestMapping("zhlogin")
    @ResponseBody
    public boolean zhlogin(HttpServletRequest request, String username, String password, Ruser ruser) throws Exception {
        username = request.getParameter("username");
        password = request.getParameter("password");
        System.out.println(password);
        boolean flag = cs.zhlogin(username, password);
        // 获取id并据其更新登录时间
        Object id = request.getSession().getAttribute("Sid");
        Date day = new Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        System.out.println(df.format(day));
        ruser.setLoginTime(df.format(day));
        ruser.setId(Long.parseLong(id.toString()));
        // 获取上次登录的时间
        request.getSession().setAttribute("time", df.format(day));
        int flag2 = cs.updatetime(ruser);
        System.out.println("time=" + flag2);
        System.out.println(flag);
        if (flag) { // 判断登录成功后清除并更新首页轮播及三张菜谱 范绍龙
            fss.indexCarousel(request);
            cs.selecticon(Long.parseLong(id.toString()));
        }
        return flag;
    }

    // 验证手机号码是否存在
    @RequestMapping("exisPhone")
    @ResponseBody
    public int exisPhone(HttpServletRequest request) {
        String phone = request.getParameter("phone");
        int flag = cs.selectphone(Long.parseLong(phone));
        return flag;

    }

    @RequestMapping("dxyz")
    @ResponseBody
    public int dxyz(HttpServletRequest request) {
        String phone = request.getParameter("phone");
        int flag = sendsms.mobile(phone);
        System.out.println(flag);
        request.getSession().setAttribute("exyzm", flag);
        return flag;

    }

    @RequestMapping("dxlogin")
    @ResponseBody
    public boolean dxlogin(HttpServletRequest request, Ruser ruser) {
        boolean flag = false;
        String phone = request.getParameter("phone");
        String yzm = request.getParameter("yzm");
        Object exyzm = request.getSession().getAttribute("exyzm");
        Object id = request.getSession().getAttribute("Sid");
        if (yzm.equals(exyzm.toString())) {
            cs.selectphoneId(Long.parseLong(phone));
            // 获取手机号码并据其更新登录时间
            Date day = new Date();
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            System.out.println(df.format(day));
            ruser.setLoginTime(df.format(day));
            ruser.setId(Long.parseLong(id.toString()));
            // 获取上次登录的时间
            request.getSession().setAttribute("time", df.format(day));
            int flag2 = cs.updatetime(ruser);
            System.out.println("time=" + flag2);
            cs.selecticon(Long.parseLong(id.toString()));
            flag = true;
        }
        return flag;
    }

    // 注册的方法
    @RequestMapping("regist")
    public String regist(User record, HttpServletRequest request, Ruser ruser) throws Exception {
        boolean flag = cs.insertSelective(record);
        if (flag) {
            // 添加记录至user表
            fss.indexCarousel(request);
            // 传参至session
            cs.selectphoneId(record.getIphone());
            // 添加记录至ruser表
            // 获取系统时间
            Date day = new Date();
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            System.out.println(df.format(day));
            Object id = request.getSession().getAttribute("Sid");
            Object phone = request.getSession().getAttribute("iphone");
            ruser.setLoginTime(df.format(day));
            ruser.setId(Long.parseLong(id.toString()));
            ruser.setuEmail(record.getEmail());
            ruser.setuPhone(Long.parseLong(phone.toString()));
            // 将phone传入session方便用户中心修改时使用
            // request.getSession().setAttribute("phone", record.getIphone());
            int flag2 = cs.insertregiste(ruser);
            request.getSession().setAttribute("time", df.format(day));
            System.out.println("insertregiste--" + flag2);
            return "front/index.jsp";
        } else {
            return "front/register.jsp";
        }

    }

    // 头像上传
    @RequestMapping("imgUpload")
    public String imgUpload(MultipartRequest multipartRequest, HttpServletRequest request, Ruser ruser)
            throws Exception {
        // 文件上传
        UpLoadUtil.fileuploads(multipartRequest, request);
        Object img = request.getSession().getAttribute("path");
        Object id = request.getSession().getAttribute("Sid");
        // 修改昵称及添加数据库记录
        String nick = request.getParameter("nick");
        ruser.setIcon(img.toString());
        ruser.setId(Long.parseLong(id.toString()));
        ruser.setNick(nick);
        int flag = cs.updatenick(ruser);
        request.getSession().setAttribute("icon", img.toString());
        request.getSession().setAttribute("nick", nick);
        System.out.println("daying" + img.toString());
        System.out.println(flag);
        return "/front/user_account.jsp";
    }

    // 修改邮箱
    @RequestMapping("newemail")
    public String updateemail(HttpServletRequest request, String email, User user, Ruser ruser) {
        email = request.getParameter("newemail");
        int flag = cs.updateemail(user, ruser, email);
        if (flag >= 2) {
            request.getSession().setAttribute("email", email);
            return "/front/user_account.jsp";
        }
        return "/front/user_account.jsp";
    }

    // 修改手机号码
    @RequestMapping("newphone")
    public String updatephone(HttpServletRequest request, String phone, User user, Ruser ruser) {
        phone = request.getParameter("newphone");
        int flag = cs.updatephone(user, ruser, phone);
        if (flag >= 2) {
            request.getSession().setAttribute("iphone", phone);
            return "/front/user_account.jsp";
        }
        return "/front/user_account.jsp";
    }

    // 修改密码
    @RequestMapping("newpwd")
    public String updatepwd(HttpServletRequest request, String pwd, User user) throws Exception {
        pwd = request.getParameter("newpwd");
        int flag = cs.updatepwd(user, pwd);
        if (flag > 0) {
            // request.getSession().setAttribute("iphone", phone);
            return "/front/user_account.jsp";
        }
        return null;
    }

    // 安全退出
    @RequestMapping("exit")
    public String exit(HttpServletRequest request) {
        request.getSession().setAttribute("username", null);
        request.getSession().setAttribute("iphone", null);
        request.getSession().setAttribute("email", null);
        request.getSession().setAttribute("icon", null);
        request.getSession().setAttribute("nick", null);
        request.getSession().setAttribute("time", null);
        return "/front/login2.jsp";

    }
}
