/**
 * Project Name:maven_ssm1
 * File Name:AdminServiceImpl.java
 * Package Name:cn.java.service.impl
 * Date:2017年12月12日下午5:12:04
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

import cn.java.entity.Shop;
import cn.java.mapper.HistoryMapper;
import cn.java.mapper.MenuMapper;
import cn.java.mapper.OrderingMapper;
import cn.java.mapper.ShopMapper;
import cn.java.service.AdminZService;

@Service
public class AdminZServiceImpl implements AdminZService {
    // 浏览历史
    @Autowired
    private HistoryMapper bm;

    // 订单
    @Autowired
    private OrderingMapper om;

    @Autowired
    private MenuMapper mm;

    @Autowired
    private ShopMapper sm;

    // 动态查询
    public List<Object> selectActive(String title1, Long type1, Integer pageSize, Integer pageNo) {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        if ("".equals(title1)) {
            title1 = null;
        }
        paramMap.put("browse_id", title1);
        // 获取查询需要的参数
        paramMap.put("categoryId", type1);
        paramMap.put("pageSize", pageSize);
        int index = (pageNo - 1) * pageSize;
        paramMap.put("index", index);
        // 执行动态查询

        System.out.println("参数" + paramMap);
        List<Map<String, Object>> paperList = bm.selectActiveAdmin(paramMap);
        // 获取总数
        int count = this.selectCount(title1, type1);
        // 存储数据量、每页显示条数、当前页数及查询条件的集合
        Map<String, Object> numMap = new HashMap<String, Object>();
        numMap.put("count", count);
        numMap.put("pageSize", pageSize);
        numMap.put("pageNo", pageNo);
        Integer num = count % pageSize == 0 ? count / pageSize : count / pageSize + 1;
        System.out.println("数据总数:" + count + "\t每页显示=" + pageSize + "\t分页总数:" + num + "\t当前为第" + pageNo + "页");
        numMap.put("num", num);
        numMap.put("browse_id", title1);
        System.out.println("查询条件为,标题:" + title1);
        // 存储最终需要的数据
        List<Object> returnMap = new ArrayList<Object>();
        returnMap.add(paperList);
        returnMap.add(numMap);
        return returnMap;
    }

    // 查询总数
    public int selectCount(String title1, Long type1) {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        if ("".equals(title1)) {
            paramMap.put("browse_id", null);
        } else {
            paramMap.put("browse_id", title1);
        }
        paramMap.put("type", type1);
        int count = bm.selectCountAdmin(paramMap);
        return count;
    }

    // 删除浏览历史
    public boolean deleteHistory(Long id) {
        int i = bm.deleteByPrimaryKey(id);
        if (i >= 1) {
            return true;
        } else {
            return false;
        }

    }

    // 查询订单表
    public List<Object> selectActive1(String title1, Long type1, Long id1, Integer pageSize, Integer pageNo) {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        if ("".equals(title1)) {
            title1 = null;
        }
        paramMap.put("addressee_name", title1);

        // 获取查询需要的参数
        paramMap.put("categoryId", type1);
        paramMap.put("vid_id", id1);
        paramMap.put("pageSize", pageSize);
        int index = (pageNo - 1) * pageSize;
        paramMap.put("index", index);
        // 执行动态查询

        System.out.println("参数" + paramMap);
        List<Map<String, Object>> paperList = om.selectActiveAdmin(paramMap);
        // 获取总数
        int count = this.selectCount1(title1, type1, id1);
        // 存储数据量、每页显示条数、当前页数及查询条件的集合
        Map<String, Object> numMap = new HashMap<String, Object>();
        numMap.put("count", count);
        numMap.put("pageSize", pageSize);
        numMap.put("pageNo", pageNo);
        Integer num = count % pageSize == 0 ? count / pageSize : count / pageSize + 1;
        System.out.println("数据总数:" + count + "\t每页显示=" + pageSize + "\t分页总数:" + num + "\t当前为第" + pageNo + "页");
        numMap.put("num", num);
        numMap.put("addressee_name", title1);
        System.out.println("查询条件为,标题:" + title1 + id1);
        // 存储最终需要的数据
        List<Object> returnMap = new ArrayList<Object>();
        returnMap.add(paperList);
        returnMap.add(numMap);
        return returnMap;
    }

    // 查询总数
    public int selectCount1(String title1, Long type1, Long id1) {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        if ("".equals(title1)) {
            paramMap.put("addressee_name", null);
        } else {
            paramMap.put("addressee_name", title1);
        }
        paramMap.put("type", type1);
        paramMap.put("vid_id", id1);
        int count = om.selectCountAdmin(paramMap);
        ;
        return count;

    }

    // 删除浏览历史
    public boolean deleteMenu(Long id) {
        int i = mm.deleteMenu(id);
        if (i >= 1) {
            return true;
        } else {
            return false;
        }

    }

    // 查询订单表
    public List<Object> selectActive2(String title1, Long type1, Integer pageSize, Integer pageNo) {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        if ("".equals(title1)) {
            title1 = null;
        }
        paramMap.put("browse_id", title1);
        // 获取查询需要的参数
        paramMap.put("categoryId", type1);
        paramMap.put("pageSize", pageSize);
        int index = (pageNo - 1) * pageSize;
        paramMap.put("index", index);
        // 执行动态查询

        System.out.println("参数" + paramMap);
        List<Map<String, Object>> paperList = mm.selectActiveAdmin(paramMap);
        // 获取总数
        int count = this.selectCount2(title1, type1);
        // 存储数据量、每页显示条数、当前页数及查询条件的集合
        Map<String, Object> numMap = new HashMap<String, Object>();
        numMap.put("count", count);
        numMap.put("pageSize", pageSize);
        numMap.put("pageNo", pageNo);
        Integer num = count % pageSize == 0 ? count / pageSize : count / pageSize + 1;
        System.out.println("数据总数:" + count + "\t每页显示=" + pageSize + "\t分页总数:" + num + "\t当前为第" + pageNo + "页");
        numMap.put("num", num);
        numMap.put("browse_id", title1);
        System.out.println("查询条件为,标题:" + title1);
        // 存储最终需要的数据
        List<Object> returnMap = new ArrayList<Object>();
        returnMap.add(paperList);
        returnMap.add(numMap);
        return returnMap;
    }

    // 查询总数
    public int selectCount2(String title1, Long type1) {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        if ("".equals(title1)) {
            paramMap.put("browse_id", null);
        } else {
            paramMap.put("browse_id", title1);
        }
        paramMap.put("type", type1);
        int count = mm.selectCountAdmin(paramMap);
        return count;
    }

    public boolean deleteShop(Long id) {
        int i = sm.deleteShop(id);
        if (i >= 1) {
            return true;
        } else {
            return false;
        }

    }

    // 查询商家表
    public List<Object> selectActive3(String title1, Long type1, Integer pageSize, Integer pageNo) {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        if ("".equals(title1)) {
            title1 = null;
        }
        paramMap.put("shop_name", title1);
        // 获取查询需要的参数
        paramMap.put("categoryId", type1);
        paramMap.put("pageSize", pageSize);
        int index = (pageNo - 1) * pageSize;
        paramMap.put("index", index);
        // 执行动态查询

        System.out.println("参数" + paramMap);
        List<Map<String, Object>> paperList = sm.selectActiveAdmin(paramMap);
        // 获取总数
        int count = this.selectCount3(title1, type1);
        // 存储数据量、每页显示条数、当前页数及查询条件的集合
        Map<String, Object> numMap = new HashMap<String, Object>();
        numMap.put("count", count);
        numMap.put("pageSize", pageSize);
        numMap.put("pageNo", pageNo);
        Integer num = count % pageSize == 0 ? count / pageSize : count / pageSize + 1;
        System.out.println("数据总数:" + count + "\t每页显示=" + pageSize + "\t分页总数:" + num + "\t当前为第" + pageNo + "页");
        numMap.put("num", num);
        numMap.put("shop_name", title1);
        System.out.println("查询条件为,标题:" + title1);
        // 存储最终需要的数据
        List<Object> returnMap = new ArrayList<Object>();
        returnMap.add(paperList);
        returnMap.add(numMap);
        return returnMap;
    }

    // 查询总数
    public int selectCount3(String title1, Long type1) {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        if ("".equals(title1)) {
            paramMap.put("shop_name", null);
        } else {
            paramMap.put("shop_name", title1);
        }
        paramMap.put("type", type1);
        int count = sm.selectCountAdmin(paramMap);
        return count;
    }

    // 根据Id查询结果
    public Shop findShop(Long id) {
        return sm.selectByPrimaryKey(id);
    }

    // 修改商家
    public boolean upDate(Shop shop) {
        int i = sm.updateByPrimaryKeySelective(shop);
        if (i >= 1) {
            return true;
        } else {
            return false;
        }

    }

}
