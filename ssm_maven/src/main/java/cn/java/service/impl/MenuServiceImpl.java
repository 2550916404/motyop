/**
 * Project Name:dt47_ssm_maven
 * File Name:MenuServiceImpl.java
 * Package Name:cn.java.service.impl
 * Date:2017年12月28日下午4:12:55
 * Copyright (c) 2017, bluemobi All Rights Reserved.
 *
*/

package cn.java.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.java.entity.Menu;
import cn.java.mapper.MenuMapper;
import cn.java.service.MenuService;

/**
 * Description: 菜单业务层<br/>
 * Date: 2017年12月28日 下午4:12:55 <br/>
 * 
 * @author yuChaoya
 * @version
 * @see
 */
@Service
public class MenuServiceImpl implements MenuService {
	@Autowired
	private MenuMapper mm;

	@Override
	public List<Menu> selectMenuByshop(Long id) {// 根据店铺查询菜单
		return mm.selectMenuByshop(id);

	}

	@Override
	public List<Map<String, Object>> selectAllMenu() {// 查询所有菜品
		return mm.selectAllMenu();
	}

	@Override
	public List<Map<String, Object>> selectFood(String food) {// 根据食物名查询菜品
		return mm.selectFood(food);
	}

	@Override
	public List<Map<String, Object>> selectFoodByType(String type) {// 按餐点查询食物
		return mm.selectFoodByType(type);
	}

	@Override
	public List<Map<String, Object>> getMenuByshop(Long id) {// 根据店铺id查询菜单信息
		return mm.getMenuByshop(id);
	}

	@Override
	public List<Map<String, Object>> selectFoodByDiqu(String diqu) {// 按地区查询食物
		return mm.selectFoodByDiqu(diqu);
	}

	@Override
	public List<Map<String, Object>> selectFoodByCaixi(String caixi) {// 按菜系查询食物
		return mm.selectFoodByCaixi(caixi);
	}

	@Override
	public List<Map<String, Object>> paixuByprice() {// 所有菜品按价格排序
		return mm.paixuByprice();
	}

	@Override
	public List<Map<String, Object>> paixuBygrade() {// 所有菜品按评分排序
		return mm.paixuBygrade();
	}

	@Override
	public List<Map<String, Object>> selectAllMenu1(int page, int rows) {
		int index = (page - 1) * rows;
		return mm.selectAllMenu1(index, rows);
	}

	@Override
	public Long selectAllNum() {
		Map<String, Object> map = mm.selectAllNum();
		Long max = (Long) map.get("max");
		return max;
	}

	@Override
	public List<Map<String, Object>> selectCaixi() {// 查询菜系
		return mm.selectCaixi();
	}

	@Override
	public List<Map<String, Object>> selectCainame() {// 查询菜名
		return mm.selectCainame();
	}

	@Override
	public List<Map<String, Object>> selectAddress() {// 查询位置
		return mm.selectAddress();
	}

	@Override
	public List<Map<String, Object>> selectCaitype() {// 查询餐点
		return mm.selectCaitype();
	}
}
