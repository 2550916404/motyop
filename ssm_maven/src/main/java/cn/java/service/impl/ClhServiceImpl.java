/**
 * Project Name:dt47_ssm_maven
 * File Name:ClhServiceImpl.java
 * Package Name:cn.java.service.impl
 * Date:2017年12月28日下午2:51:34
 * Copyright (c) 2017, bluemobi All Rights Reserved.
 *
*/

package cn.java.service.impl;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.java.entity.Ruser;
import cn.java.entity.User;
import cn.java.mapper.RuserMapper;
import cn.java.mapper.UserMapper;
import cn.java.service.ClhService;
import cn.java.utils.all.md5;

/**
 * Description: <br/>
 * Date: 2017年12月28日 下午2:51:34 <br/>
 * 
 * @author CLH
 * @version
 * @see
 */
@Service
public class ClhServiceImpl implements ClhService {
    @Autowired
    private UserMapper um;

    @Autowired
    private RuserMapper rs;

    @Autowired
    HttpServletRequest request;

    // 验证用户名是否存在
    public int selectName(String username) {
        Map<String, Object> map = um.selectName(username);
        Object flag = map.get("num");
        int num = Integer.parseInt(flag.toString());
        return num;

    }

    // 验证手机号码是否存在
    public int selectphone(Long iphone) {

        Map<String, Object> map = um.selectphone(iphone);
        Object flag = map.get("num");
        int num = Integer.parseInt(flag.toString());
        return num;

    }

    // 账号存在时将用户信息传入session域
    public void selectphoneId(Long iphone) {

        Map<String, Object> map = um.selectphone(iphone);
        Object object2 = map.get("id");
        Object object3 = map.get("email");
        Object object4 = map.get("iphone");
        Object object5 = map.get("username");
        Long long1 = Long.parseLong(object2.toString());
        String s1 = object3.toString();
        String s2 = object4.toString();
        String s3 = object5.toString();
        System.out.println(map.get("id"));
        request.getSession().setAttribute("Sid", long1);
        request.getSession().setAttribute("email", s1);
        request.getSession().setAttribute("iphone", s2);
        request.getSession().setAttribute("username", s3);

    }

    // 账号密码登陆
    public boolean zhlogin(String username, String password) throws Exception {
        boolean flag = false;
        Object object = null;
        String patternname = "[A-Za-z0-9_-]{3,12}";
        String patternpwd = "^[a-zA-Z0-9]{6,16}$";
        boolean flag1 = username.matches(patternname);
        boolean flag2 = password.matches(patternpwd);
        if (flag1 && flag2) {
            System.out.println(username);
            System.out.println(md5.md5Encry(password));
            Map<String, Object> map = um.zhlogin(username, md5.md5Encry(password));
            Object obj = map.get("num");
            int num = Integer.parseInt(obj.toString());
            System.out.println(num);
            if (num > 0) {
                flag = true;
                Object object2 = map.get("id");
                Object object3 = map.get("email");
                Object object4 = map.get("iphone");
                Object object5 = map.get("username");
                Long long1 = Long.parseLong(object2.toString());
                String s1 = object3.toString();
                String s2 = object4.toString();
                String s3 = object5.toString();
                System.out.println(map.get("id"));
                request.getSession().setAttribute("Sid", long1);
                request.getSession().setAttribute("email", s1);
                request.getSession().setAttribute("iphone", s2);
                request.getSession().setAttribute("username", s3);

            }
        }
        return flag;

    }

    // 注册
    public boolean insertSelective(User record) throws Exception {
        boolean flag = false;
        String patternName = "[A-Za-z0-9_-]{3,12}";
        String patternPwd = "^[a-zA-Z0-9]{6,16}$";
        String patternEmail = "^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\\.[a-zA-Z0-9_-]+)+$";
        String patternPhone = "^1(3|4|5|7|8)\\d{9}$";
        boolean flag1 = record.getUsername().matches(patternName);
        boolean flag2 = record.getPassword().matches(patternPwd);
        boolean flag3 = record.getEmail().matches(patternEmail);
        boolean flag4 = record.getIphone().toString().matches(patternPhone);
        if (flag1 && flag2 && flag3 && flag4) {
            record.setPassword(md5.md5Encry(record.getPassword()));
            um.insertSelective(record);
            flag = true;
        }
        return flag;
    }

    // 注册时将部分字段添加进r_user表
    public int insertregiste(Ruser record) {
        return rs.insertregiste(record);

    }

    // 更新登录时间
    public int updatetime(Ruser record) {

        return rs.updatetime(record);

    }

    // 修改头像及昵称

    public int updatenick(Ruser record) {
        return rs.updatenick(record);

    }

    // 遍历ruser表中的记录，并传入session

    public void selecticon(Long id) {
        Map<String, Object> map = rs.selecticon(id);
        Object object1 = map.get("icon");
        Object object2 = map.get("nick");
        System.out.println(object1.toString());
        System.out.println(object2.toString());
        request.getSession().setAttribute("icon", object1.toString());
        request.getSession().setAttribute("nick", object2.toString());

    }

    // 修改邮箱
    public int updateemail(User user, Ruser ruser, String email) {
        int flag1 = 0;
        int flag2 = 0;
        int avg = 0;
        // 判断邮箱是否符合规范
        String patternEmail = "^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\\.[a-zA-Z0-9_-]+)+$";
        boolean flag = email.matches(patternEmail);
        if (flag) {
            // 修改user表中的邮箱
            Object id = request.getSession().getAttribute("Sid");
            user.setEmail(email);
            user.setId(Long.parseLong(id.toString()));
            flag1 = um.updateemail(user);
            // 修改ruser表中的邮箱
            ruser.setuEmail(email);
            ruser.setId(Long.parseLong(id.toString()));
            flag2 = rs.updateemail(ruser);
            avg = flag1 + flag2;
            System.out.println(avg);
        }
        return avg;

    }

    // 修改手机号码
    public int updatephone(User user, Ruser ruser, String phone) {
        int flag1 = 0;
        int flag2 = 0;
        int avg = 0;
        // 判断手机号码是否符合规范
        String patternPhone = "^1(3|4|5|7|8)\\d{9}$";
        boolean flag = phone.matches(patternPhone);
        if (flag) {
            // 修改user表中的手机号
            Object id = request.getSession().getAttribute("Sid");
            user.setId(Long.parseLong(id.toString()));
            user.setIphone(Long.parseLong(phone));
            flag1 = um.updatephone(user);
            // 修改ruser表中的手机号
            ruser.setId(Long.parseLong(id.toString()));
            ruser.setuPhone(Long.parseLong(phone));
            flag2 = rs.updatephone(ruser);
            avg = flag1 + flag2;
            System.out.println(flag1);
            System.out.println(flag2);
            System.out.println(avg);
        }
        return avg;

    }

    // 修改密码
    public int updatepwd(User user, String pwd) throws Exception {
        int flag1 = 0;
        // 判断密码是否符合规范
        String patternpwd = "^[a-zA-Z0-9]{6,16}$";
        boolean flag = pwd.matches(patternpwd);
        if (flag) {
            // 修改user表中的密码
            Object id = request.getSession().getAttribute("Sid");
            user.setPassword(md5.md5Encry(pwd));
            user.setId(Long.parseLong(id.toString()));
            flag1 = um.updatepwd(user);
            System.out.println(flag1);
        }
        return flag1;

    }

}
