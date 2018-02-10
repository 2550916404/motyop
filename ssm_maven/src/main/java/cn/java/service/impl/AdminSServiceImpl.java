/**
 * Project Name:dt47_ssm_maven
 * File Name:AdminSServiceImpl.java
 * Package Name:cn.java.service.impl
 * Date:2017年12月28日下午3:40:43
 * Copyright (c) 2017, bluemobi All Rights Reserved.
 *
*/

package cn.java.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.java.mapper.AdminMapper;
import cn.java.mapper.MessageMapper;
import cn.java.mapper.UserMapper;
import cn.java.service.AdminSService;

/**
 * Description: <br/>
 * Date: 2017年12月28日 下午3:40:43 <br/>
 * 
 * @author shaoJie
 * @version
 * @see
 */
@Service
public class AdminSServiceImpl implements AdminSService {
    @Autowired
    private UserMapper rm;

    @Autowired
    private AdminMapper am;

    @Autowired
    private MessageMapper mm;

    /**
     * 简单描述该方法的实现功能（可选）. maplog
     * 
     * @see cn.java.service.impl.AdminSService#test(long)
     */
    @Override

    // 动态查询
    public List<Object> selectActiveAdmin(String title1, Long type1, Integer pageSize, Integer pageNo) {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        if ("".equals(title1)) {
            title1 = null;
        }
        paramMap.put("username", title1);
        // 获取查询需要的参数
        paramMap.put("categoryId", type1);
        paramMap.put("pageSize", pageSize);
        int index = (pageNo - 1) * pageSize;
        paramMap.put("index", index);
        // 执行动态查询

        System.out.println("参数" + paramMap);
        List<Map<String, Object>> paperList = rm.selectActiveAdmin(paramMap);
        // 获取总数
        int count = this.selectCountAdmin(title1, type1);
        // 存储数据量、每页显示条数、当前页数及查询条件的集合
        Map<String, Object> numMap = new HashMap<String, Object>();
        numMap.put("count", count);
        numMap.put("pageSize", pageSize);
        numMap.put("pageNo", pageNo);
        Integer num = count % pageSize == 0 ? count / pageSize : count / pageSize + 1;
        System.out.println("数据总数:" + count + "\t每页显示=" + pageSize + "\t分页总数:" + num + "\t当前为第" + pageNo + "页");
        numMap.put("num", num);
        numMap.put("username", title1);
        numMap.put("type", type1);
        System.out.println("查询条件为,标题:" + title1 + "\t查询类型：" + type1);
        // 存储最终需要的数据

        List<Object> returnMap = new ArrayList<Object>();
        returnMap.add(paperList);
        returnMap.add(numMap);
        return returnMap;
    }

    // 查询总数
    public int selectCountAdmin(String title1, Long type1) {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        if ("".equals(title1)) {
            paramMap.put("username", null);
        } else {
            paramMap.put("username", title1);
        }
        paramMap.put("type", type1);
        int count = rm.selectCountAdmin(paramMap);
        return count;
    }

    // 删除用户
    @Override
    public int deleteUserAdmin(long id) {

        return rm.deleteByPrimaryKey(id);

    }

    @Override
    public int deleteUserAdminMessage(long id) {

        return mm.deleteByPrimaryKey(id);

    }

    // 管理员登陆
    public boolean superLogin(String admin_user, String admin_password) {

        boolean flag = false;

        Map logmap = am.superLogin(admin_user, admin_password);
        Object obj = logmap.get("num");

        if (Integer.parseInt(obj.toString()) > 0) {

            flag = true;

        }

        return flag;
    }

    // 验证String admin_passwoed

    public boolean superPassword(String admin_passwoed) {

        boolean flag = false;

        Integer it = am.superLoginYanZheng(admin_passwoed);

        if (it > 0) {

            flag = true;

        }

        return flag;

    }

    // updateAdminUser 修改管理员密码

    public boolean updateAdminUser(String admin_passwoed, String admin_user) {
        boolean flag = false;
        Integer it = am.updateAdminUser(admin_passwoed, admin_user);

        if (it > 0) {

            flag = true;

        }

        return flag;

    }

    // 查询用户留言

    @Override

    // 动态查询
    public List<Object> selectActiveAdminMessage(String title1, Long type1, Integer pageSize, Integer pageNo) {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        if ("".equals(title1)) {
            title1 = null;
        }
        paramMap.put("username", title1);
        // 获取查询需要的参数
        paramMap.put("categoryId", type1);
        paramMap.put("pageSize", pageSize);
        int index = (pageNo - 1) * pageSize;
        paramMap.put("index", index);
        // 执行动态查询

        System.out.println("参数" + paramMap);
        List<Map<String, Object>> paperList = mm.selectActiveAdminMessage(paramMap);
        // 获取总数
        int count = this.selectCountAdminMessage(title1, type1);
        // 存储数据量、每页显示条数、当前页数及查询条件的集合
        Map<String, Object> numMap = new HashMap<String, Object>();
        numMap.put("count", count);
        numMap.put("pageSize", pageSize);
        numMap.put("pageNo", pageNo);
        Integer num = count % pageSize == 0 ? count / pageSize : count / pageSize + 1;
        System.out.println("数据总数:" + count + "\t每页显示=" + pageSize + "\t分页总数:" + num + "\t当前为第" + pageNo + "页");
        numMap.put("num", num);
        numMap.put("username", title1);
        numMap.put("type", type1);
        System.out.println("查询条件为,标题:" + title1 + "\t查询类型：" + type1);
        // 存储最终需要的数据
        List<Object> returnMap = new ArrayList<Object>();
        returnMap.add(paperList);
        returnMap.add(numMap);
        return returnMap;
    }

    // 查询总数
    public int selectCountAdminMessage(String title1, Long type1) {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        if ("".equals(title1)) {
            paramMap.put("username", null);
        } else {
            paramMap.put("username", title1);
        }
        paramMap.put("type", type1);
        int count = mm.selectCountAdminMessage(paramMap);
        return count;
    }

}
