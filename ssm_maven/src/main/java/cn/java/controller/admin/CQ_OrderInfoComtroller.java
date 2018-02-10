package cn.java.controller.admin;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alipay.api.AlipayApiException;

import cn.java.service.CaiQiService;

/**
 * Description: <br/>
 * Date: 2017年12月27日 上午10:56:36 <br/>
 * 
 * @author caiqi
 * @version
 * @see
 */
@Controller
public class CQ_OrderInfoComtroller {
    @Autowired
    private CaiQiService oing;

    /**
     * 
     * Description:支付宝请求 方法<br/>
     *
     * @author caiqi
     * @param req
     * @param mod
     * @param rep
     * @param goodId
     * @throws AlipayApiException
     * @throws IOException
     */
    @RequestMapping("viewOrder")
    public void viewOrder(ModelMap alipaymap, HttpServletRequest req, Model mod, HttpServletResponse rep1)
            throws AlipayApiException, Exception {
        oing.Alipay(alipaymap, req, mod, rep1);
    }

    /**
     * 
     * Description:支付成功同步通知的方法 <br/>
     *
     * @author caiqi
     * @param request
     * @param response
     * @return
     * @throws AlipayApiException
     * @throws UnsupportedEncodingException
     */
    @RequestMapping("return_url.shtml")
    public String returnUrl(HttpServletRequest request, HttpServletResponse response)
            throws AlipayApiException, Exception {
        return oing.returnUrl(request, response);
    }

    /**
     * 
     * Description:支付成功异步回调接口 <br/>
     *
     * @author caiqi
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("returnUrlhl.shtml")
    @ResponseBody
    public String returnUrlhl(HttpServletRequest request, HttpServletResponse response) throws Exception {
        return oing.returnUrlhl(request, response);
    }

    /**
     * 
     * Description:用户中心付款请求 <br/>
     *
     * @author caiqi
     * @param idCart
     * @param alipaymap
     * @param req
     * @param mod
     * @param rep1
     * @throws Exception
     */
    @RequestMapping("Aliapliy")
    public void Ali(String idCart, ModelMap alipaymap, HttpServletRequest req, Model mod, HttpServletResponse rep1)
            throws Exception {
        oing.Ali(idCart, alipaymap, req, mod, rep1);
    }
}
