/**
 * Project Name:dt47_ssm_maven
 * File Name:MenuService.java
 * Package Name:cn.java.service.impl
 * Date:2017年12月28日下午4:15:14
 * Copyright (c) 2017, bluemobi All Rights Reserved.
 *
*/

package cn.java.service;

import java.util.List;
import java.util.Map;

import cn.java.entity.Menu;

/**
 * Description: <br/>
 * Date: 2017年12月28日 下午4:15:14 <br/>
 * 
 * @author yuChaoya
 * @version
 * @see
 */
public interface MenuService {

    List<Menu> selectMenuByshop(Long id);

    List<Map<String, Object>> selectAllMenu();

    List<Map<String, Object>> getMenuByshop(Long id);

    List<Map<String, Object>> selectFood(String food);

    List<Map<String, Object>> selectFoodByType(String type);// 按餐点查询

    List<Map<String, Object>> paixuByprice();

    List<Map<String, Object>> paixuBygrade();

    List<Map<String, Object>> selectAllMenu1(int page, int rows);// 分页的方法

    Long selectAllNum();// 查询所有信息的条数

    List<Map<String, Object>> selectCaixi();// 查询菜系

    List<Map<String, Object>> selectAddress();// 查询位置

    List<Map<String, Object>> selectCaitype();// 查询餐点

    List<Map<String, Object>> selectCainame();// 查询菜名

    List<Map<String, Object>> selectFoodByDiqu(String diqu);// 按地区查询

    List<Map<String, Object>> selectFoodByCaixi(String caixi);// 按菜系查询

}
