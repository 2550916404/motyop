/**
 * Project Name:dt47_ssm_maven
 * File Name:CQ_Cookie.java
 * Package Name:cn.java.controller.admin
 * Date:2017年12月30日下午4:33:59
 * Copyright (c) 2017, bluemobi All Rights Reserved.
 *
*/
/**
 * Project Name:dt47_ssm_maven
 * File Name:CQ_Cookie.java
 * Package Name:cn.java.controller.admin
 * Date:2017年12月30日下午4:33:59
 * Copyright (c) 2017, bluemobi All Rights Reserved.
 *
 */

package cn.java.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.java.entity.CartItem;
import cn.java.service.CQ_CookieService;

/**
 * Description: 购物车商品<br/>
 * Date: 2017年12月30日 下午4:33:59 <br/>
 * 
 * @author caiqi
 * @version
 * @see
 */
@Controller
public class CQ_CookieController {
    @Autowired
    private CQ_CookieService cq_CookieService;

    /**
     * 
     * Description:添加商品到购物车 <br/>
     *
     * @author caiqi
     * @param id
     * @param num
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "cartAdd")
    public String cartAdd(long id, @RequestParam(defaultValue = "1") Integer num, HttpServletRequest request,
            HttpServletResponse response) {
        int flag = cq_CookieService.addCartItem(id, num, request, response);
        if (flag >= 1) {
            return "redirect:Success.shtml";
        }
        return "redirect:Success.shtml";
    }

    /**
     * 
     * Description:防止重复提交 <br/>
     *
     * @author caiqi
     * @return
     */
    @RequestMapping(value = "/Success")
    public String showSuccess() {
        return "front/cartSuccess.jsp";
    }

    /**
     * 
     * Description: 显示购物车列表<br/>
     *
     * @author caiqi
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("showCart")
    public String showCart(HttpServletRequest request, Model model) {
        List<CartItem> list = cq_CookieService.getcar(request);
        model.addAttribute("cartlist", list);
        return "front/cart.jsp";
    }

    /**
     * 
     * Description:删除购物车 <br/>
     *
     * @author caiqi
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("delecart")
    public String delecart(HttpServletRequest request, HttpServletResponse response) {
        String sid = request.getParameter("id");
        long id = Long.parseLong(sid);
        int flag = cq_CookieService.deleCartItem(id, request, response);
        if (flag >= 1) {
            return "redirect:showCart.shtml";
        }
        return "redirect:showCart.shtml";
    }

    /**
     * 
     * Description: 结算的方法<br/>
     *
     * @author caiqi
     * @return
     */
    @RequestMapping("Account")
    public String Account(String prine, Model model, HttpServletRequest request, HttpServletResponse response) {
        boolean flag = cq_CookieService.Account(prine, model, request, response);
        if (flag) {
            return "/front/confirm_order.jsp";
        }
        return "redirect:pages/front/login2.jsp";
    }

    /**
     * 
     * Description: 日志功能<br/>
     *
     * @author caiqi
     * @param model
     * @return
     */
    @RequestMapping("looktext")
    public String lookText(Model model) {
        String log = cq_CookieService.lookText();
        model.addAttribute("log", log);
        return "admin/log.jsp";

    }
}
