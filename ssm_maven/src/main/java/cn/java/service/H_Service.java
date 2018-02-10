package cn.java.service;

import java.util.List;
import java.util.Map;

import cn.java.entity.Consignee;
import cn.java.entity.Ordering;

public interface H_Service {

	List<Ordering> insertSelective1(Long vidId); // 查询我的订单

	List<Consignee> selectByPrimaryKey1(Long vipid);// 查询我的地址

	int deleteByPrimaryKey1(String orderId);// 删除订单

	String insertSelective(Consignee record);// 添加收货地址

	int deleteByPrimaryKey(Integer id);// 删除收货地址

	String updateBycon(Consignee record);// 修改收货人地址

	Map showStat();

}