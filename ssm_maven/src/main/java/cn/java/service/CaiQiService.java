/**
 * Project Name:dt47_ssm_maven
 * File Name:CaiQiService.java
 * Package Name:cn.java.service.impl
 * Date:2017年12月28日下午7:31:52
 * Copyright (c) 2017, bluemobi All Rights Reserved.
 *
*/
/**
 * Project Name:dt47_ssm_maven
 * File Name:CaiQiService.java
 * Package Name:cn.java.service.impl
 * Date:2017年12月28日下午7:31:52
 * Copyright (c) 2017, bluemobi All Rights Reserved.
 *
 */

package cn.java.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;

import com.alipay.api.AlipayApiException;

/**
 * Description: <br/>
 * Date: 2017年12月28日 下午7:31:52 <br/>
 * 
 * @author caiqi
 * @version
 * @see
 */
public interface CaiQiService {
    /**
     * 
     * Description:支付宝请求方法<br/>
     *
     * @author caiqi
     * @param req
     * @param mod
     * @param rep
     * @throws Exception
     */
    void Alipay(ModelMap alipaymap, HttpServletRequest req, Model mod, HttpServletResponse rep) throws Exception;

    /**
     * Description:支付宝同步通知方法 <br/>
     *
     * @author caiqi
     * @param request
     * @param response
     * @return
     * @throws AlipayApiException
     * @throws Exception
     */
    String returnUrl(HttpServletRequest request, HttpServletResponse response) throws AlipayApiException, Exception;

    /**
     * Description:支付宝异步通知方法 <br/>
     *
     * @author caiqi
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    String returnUrlhl(HttpServletRequest request, HttpServletResponse response) throws Exception;

    /**
     * 
     * Description:个人中心付款的方法 <br/>
     *
     * @author caiqi
     * @param idCart
     * @param alipaymap
     * @param req
     * @param mod
     * @param rep1
     * @throws Exception
     */
    void Ali(String idCart, ModelMap alipaymap, HttpServletRequest req, Model mod, HttpServletResponse rep1)
            throws Exception;
}
