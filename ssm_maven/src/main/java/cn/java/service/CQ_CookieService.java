/**
 * Project Name:dt47_ssm_maven
 * File Name:CQ_CookieService.java
 * Package Name:cn.java.service.impl
 * Date:2018年1月2日上午9:12:36
 * Copyright (c) 2018, bluemobi All Rights Reserved.
 *
*/
/**
 * Project Name:dt47_ssm_maven
 * File Name:CQ_CookieService.java
 * Package Name:cn.java.service.impl
 * Date:2018年1月2日上午9:12:36
 * Copyright (c) 2018, bluemobi All Rights Reserved.
 *
 */

package cn.java.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

import cn.java.entity.CartItem;

/**
 * Description: 购物车类 <br/>
 * Date: 2018年1月2日 上午9:12:36 <br/>
 * 
 * @author caiqi
 * @version
 * @see
 */
public interface CQ_CookieService {

    int addCartItem(long id, int num, HttpServletRequest request, HttpServletResponse response);

    List<CartItem> getcar(HttpServletRequest request);

    int deleCartItem(long id, HttpServletRequest request, HttpServletResponse response);

    boolean Account(String prine, Model model, HttpServletRequest request, HttpServletResponse response);

    /**
     * Description:读取日志信息 <br/>
     *
     * @author caiqi
     * @return
     */
    String lookText();
}
