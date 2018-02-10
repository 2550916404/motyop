/**
 * Project Name:maven_ssm1
 * File Name:AdminService.java
 * Package Name:cn.java.service.impl
 * Date:2017年12月12日下午5:23:23
 * Copyright (c) 2017, bluemobi All Rights Reserved.
 *
*/

package cn.java.service;

import java.util.List;

import cn.java.entity.Shop;

public interface AdminZService {
    // 根据Id值查找店铺
    Shop findShop(Long id);

    // 查询总条数
    int selectCount(String title1, Long type1);

    /*
     * // 查询总条数 int selectCount1(String title1, Long type1, Long id1);
     */

    // 查询总条数
    int selectCount2(String title1, Long type1);

    // 查询总条数
    int selectCount3(String title1, Long type1);

    // 删除浏览历史
    boolean deleteHistory(Long id);

    // 删除菜单
    boolean deleteMenu(Long id);

    // 删除商家
    boolean deleteShop(Long id);

    // 修改商家
    boolean upDate(Shop shop);

    // 浏览历史分页查询
    List<Object> selectActive(String title1, Long type1, Integer pageSize, Integer pageNo);

    // 菜单分页查询
    List<Object> selectActive1(String title1, Long type1, Long id, Integer pageSize, Integer pageNo);

    // 订单分页查询
    List<Object> selectActive2(String title1, Long type1, Integer pageSize, Integer pageNo);

    // 商家分页查询
    List<Object> selectActive3(String title1, Long type1, Integer pageSize, Integer pageNo);
}
