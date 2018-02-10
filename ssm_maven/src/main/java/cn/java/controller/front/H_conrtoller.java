package cn.java.controller.front;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.java.entity.Consignee;
import cn.java.entity.Ordering;
import cn.java.service.H_Service;

@Controller
public class H_conrtoller {

	@Autowired
	private H_Service hse;

	// 查询我的订单
	@RequestMapping("serbeyOrdering")
	public String insertSelective1(Model model, HttpServletRequest request) {
		Object sid = request.getSession().getAttribute("Sid");
		Long Sid = Long.parseLong(sid.toString());
		if (yz(request)) {
			List<Ordering> listord = hse.insertSelective1(Sid);
			model.addAttribute("listord", listord);
			return "front/user_orderlist.jsp";
		}
		return "front/login2.jsp";

	}

	// 查询我的收货地址
	@RequestMapping("serbeyConsignee")
	public String selectByPrimaryKey1(Model model, HttpServletRequest request) {
		Object sid = request.getSession().getAttribute("Sid");
		Long Sid = Long.parseLong(sid.toString());
		List<Consignee> listcon = hse.selectByPrimaryKey1(Sid);
		model.addAttribute("listcon", listcon);
		return "front/user_address.jsp";

	}

	// 取消我的订单
	@ResponseBody
	@RequestMapping(value = "deleteByalpay", method = RequestMethod.POST)
	public int deleteByalpay(String orderId) {
		return hse.deleteByPrimaryKey1(orderId.toString());

	}

	// 添加收货地址
	@RequestMapping("insertByCon")
	// String s_province, String s_city, String s_county 分别是省份三级联动
	public String insertSelective(Consignee record, String s_province, String s_city, String s_county,
			HttpServletRequest request) {
		String streetAddress = record.getStreetAddress();
		Object sid = request.getSession().getAttribute("Sid");
		Long Sid = Long.parseLong(sid.toString());
		record.setVipid(Sid);
		record.setStreetAddress(s_province + s_city + s_county + streetAddress);
		hse.insertSelective(record);
		return "redirect:../serbeyConsignee.shtml";

	}

	// 删除收货地址
	@ResponseBody
	@RequestMapping(value = "deleteBycon", method = RequestMethod.POST)
	public int deleteBycon(Integer id) {
		return hse.deleteByPrimaryKey(id);

	}

	// 修改收货人地址
	@RequestMapping(value = "updateBycon")
	public String updateBycon(Consignee record) {
		String xg = hse.updateBycon(record);
		System.out.println(xg);
		if (xg.equals("1")) {
			return "redirect:serbeyConsignee.shtml";
		}
		return "redirect:serbeyConsignee.shtml";

	}

	// 判断用户是否登录
	@RequestMapping("yanzheng")
	public String yanzheng(Model model, HttpServletRequest request) {
		boolean flag = yz(request);
		if (flag) {
			model.addAttribute("dd", hse.showStat());
			return "front/user_center.jsp";

		}
		return "front/login2.jsp";
	}

	// 获取Sid私有
	private boolean yz(HttpServletRequest request) {
		Object sid = request.getSession().getAttribute("Sid");
		if (sid == null) {
			return false;
		}
		return true;
	}

	/*
	 * @RequestMapping("aaa") public String showState(Model model) {
	 * model.addAttribute("dd", hse.showStat()); return "front/user_center.jsp";
	 * 
	 * }
	 */
}
