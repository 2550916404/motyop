package cn.java.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.java.entity.Consignee;
import cn.java.entity.Ordering;
import cn.java.mapper.ConsigneeMapper;
import cn.java.mapper.OrderingMapper;
import cn.java.service.H_Service;

@Service
public class H_Serviceimpl implements H_Service {

	@Autowired
	private OrderingMapper ord; // 我的订单

	@Autowired
	private ConsigneeMapper cons; // 我的收货地址

	// 查询我的订单
	@Override
	public List<Ordering> insertSelective1(Long vidId) {

		return ord.insertSelective1(vidId);

	}

	// 查询我的地址
	@Override
	public List<Consignee> selectByPrimaryKey1(Long vipid) {

		return cons.selectByPrimaryKey1(vipid);

	}

	// 删除订单
	@Override
	public int deleteByPrimaryKey1(String orderId) {

		return ord.deleteByPrimaryKey1(orderId);
	}

	// 添加收货地址
	@Override
	public String insertSelective(Consignee record) {

		if (cons.insertSelective(record) > 0) {
			return "/front/user_address.jsp";
		}
		return "/front/user_address.jsp";
	}

	// 删除收货人地址
	@Override
	public int deleteByPrimaryKey(Integer id) {

		return cons.deleteByPrimaryKey(id);

	}

	// 修改收货地址
	@Override
	public String updateBycon(Consignee record) {
		int updateByPrimaryKeySelective = cons.updateByPrimaryKeySelective(record);
		String msg = "0";
		if (updateByPrimaryKeySelective > 0) {
			msg = "1";
		}
		return msg;

	}

	// 查询待付款
	@Override
	public Map showStat() {
		long dfk = ord.showinde1();
		long fk = ord.showinde2();
		long wsf = ord.showinde3();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("dfk", dfk);
		map.put("fk", fk);
		map.put("wsf", wsf);
		return map;
	}

}
