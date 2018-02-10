/**
 * Project Name:dt47_ssm_maven
 * File Name:CaiQiServiceimpl.java
 * Package Name:cn.java.service.impl
 * Date:2017年12月28日下午7:18:14
 * Copyright (c) 2017, bluemobi All Rights Reserved.
 *
*/
/**
 * Project Name:dt47_ssm_maven
 * File Name:CaiQiServiceimpl.java
 * Package Name:cn.java.service.impl
 * Date:2017年12月28日下午7:18:14
 * Copyright (c) 2017, bluemobi All Rights Reserved.
 *
 */

package cn.java.service.impl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.alipay.config.AlipayConfig;

import cn.java.entity.CartItem;
import cn.java.entity.Consignee;
import cn.java.entity.Details;
import cn.java.entity.Ordering;
import cn.java.mapper.ConsigneeMapper;
import cn.java.mapper.DetailsMapper;
import cn.java.mapper.OrderingMapper;
import cn.java.service.CaiQiService;
import cn.java.utils.all.CookieUtils;
import cn.java.utils.all.JsonUtils;

/**
 * Description: <br/>
 * Date: 2017年12月28日 下午7:18:14 <br/>
 * 
 * @author caiqi
 * @version
 * @see
 */
@Service
public class CaiQiServiceimpl implements CaiQiService {
    // 日志工具
    final static Logger log = LoggerFactory.getLogger(AlipayConfig.class);

    // 订单
    @Autowired
    private OrderingMapper om;

    // 收货人
    @Autowired
    private ConsigneeMapper coms;

    // 订单详情
    @Autowired
    private DetailsMapper datails;

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
    @Transactional(readOnly = false)
    public void Ali(String idCart, ModelMap alipaymap, HttpServletRequest req, Model mod, HttpServletResponse rep1)
            throws Exception {
        Ordering ordering = om.selectByPrimaryKey(Long.valueOf(idCart));
        System.out.println(idCart);
        // 获得初始化的AlipayClient
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id,
                AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key,
                AlipayConfig.sign_type);

        // 设置请求参数
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setReturnUrl(AlipayConfig.return_url);
        alipayRequest.setNotifyUrl(AlipayConfig.notify_url);
        // 商户订单号，商户网站订单系统中唯一订单号，必填
        String out_trade_no = idCart;
        // 付款金额，必填
        String total_amount = ordering.getAmount();
        // 订单名称，必填
        String subject = "外买订单";
        // 商品描述，可空
        String body = "很好吃的东西";
        // 拼接参数
        alipayRequest.setBizContent("{\"out_trade_no\":\"" + out_trade_no + "\"," + "\"total_amount\":\"" + total_amount
                + "\"," + "\"subject\":\"" + subject + "\"," + "\"body\":\"" + body + "\","
                + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");

        // 请求
        String result = alipayClient.pageExecute(alipayRequest).getBody();
        alipaymap.put("result", result);
        rep1.setContentType("text/html;charset=" + AlipayConfig.charset);
        rep1.getWriter().write(result);// 直接将完整的表单html输出到页面
        rep1.getWriter().flush();
        rep1.getWriter().close();
    }

    /**
     * 支付宝请求方法
     * 
     * @throws Exception
     * 
     * @see cn.java.service.impl.CaiQiService#Alipay()
     */
    @Override
    @Transactional(readOnly = false)
    public void Alipay(ModelMap alipaymap, HttpServletRequest req, Model mod, HttpServletResponse rep1)
            throws Exception {
        // 创建订单对象
        Ordering ordering = new Ordering();
        // 获取页面传过来的id 通过id去查询地址
        String id = req.getParameter("nid");
        // 获取页面传过来的电话号码
        String ipone = req.getParameter("ipone");
        System.out.println(ipone);
        Integer nid = Integer.parseInt(id.toString());
        // 通过id查询地址 返回实体类
        Consignee consignee = coms.selectByPrimaryKey(nid);
        // 获取会员id 设置到订单对象中
        ordering.setVidId(consignee.getVipid());
        // 获取下单时间
        // 获取一个Date对象
        java.util.Date date = new java.util.Date();
        // 将日期时间转换为数据库中的timestamp类型 设置到订单对象中
        Timestamp timeStamp = new Timestamp(date.getTime());
        ordering.setOrderTime(timeStamp);
        // 获取收件人姓名 设置到订单对象中
        ordering.setAddresseeName(consignee.getConsigneeName());
        // 获取收件人地址 设置到订单对象中
        ordering.setAddres(consignee.getStreetAddress());
        // 获取订单总金额 设置到订单对象中
        String prine1 = req.getParameter("prine1");
        ordering.setAmount(prine1);
        // 定义订单状态 设置到订单对象中 1 表示未付款
        ordering.setState(1);
        // 获取订单编号 设置到订单对象中
        String idtime = req.getParameter("idtime");
        ordering.setOrderId(idtime);
        // 设置电话号码，使用预留字段
        ordering.setYuLiu(Long.valueOf(ipone));
        // 查询cookie中的信息
        List<CartItem> listcart = getcartitemlist(req);
        // 把购物车实体类的内容，设置到订单详情表中
        for (CartItem cartItem : listcart) {
            // 创建一个订单详情表对象
            Details details = new Details();
            // 设置订单详情表 订单编号
            details.setOid(Long.valueOf(idtime));
            // 设置订单详情表id
            details.setCid(cartItem.getId());
            // 设置订单详情表菜品名称
            details.setCaiName(cartItem.getTitle());
            // 设置订单详情表菜品数量
            details.setCaiNum(Long.valueOf(cartItem.getNum()));
            // 设置订单详情表菜品价格
            details.setCaiPrice(cartItem.getPrice());
            // 设置订单详情表店铺名称
            details.setShopname(cartItem.getShopname());
            // 调用dao成方法添加数据到数据库中的订单详情表
            datails.insertSelective(details);
        }
        // 调用dao层的方法添加数据到数据库中的订单表
        om.insertSelective(ordering);
        // 获得初始化的AlipayClient
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id,
                AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key,
                AlipayConfig.sign_type);
        // 设置请求参数
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setReturnUrl(AlipayConfig.return_url);
        alipayRequest.setNotifyUrl(AlipayConfig.notify_url);
        // 商户订单号，商户网站订单系统中唯一订单号，必填
        String out_trade_no = idtime;
        // 付款金额，必填
        String total_amount = prine1;
        // 订单名称，必填
        String subject = "外买订单";
        // 商品描述，可空
        String body = "很好吃的东西";
        // 拼接参数
        alipayRequest.setBizContent("{\"out_trade_no\":\"" + out_trade_no + "\"," + "\"total_amount\":\"" + total_amount
                + "\"," + "\"subject\":\"" + subject + "\"," + "\"body\":\"" + body + "\","
                + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");

        // 请求
        String result = alipayClient.pageExecute(alipayRequest).getBody();
        alipaymap.put("result", result);
        rep1.setContentType("text/html;charset=" + AlipayConfig.charset);
        rep1.getWriter().write(result);// 直接将完整的表单html输出到页面
        rep1.getWriter().flush();
        rep1.getWriter().close();
    }

    /**
     * 
     * Description:同步通知的方法 <br/>
     *
     * @author caiqi
     * @param request
     * @param response
     * @return
     * @throws AlipayApiException
     * @throws Exception
     */
    @Override
    public String returnUrl(HttpServletRequest request, HttpServletResponse response)
            throws AlipayApiException, Exception {
        // 获取支付宝POST过来反馈信息

        Map<String, String> params = new HashMap<String, String>();
        Map requestParams = request.getParameterMap();
        for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
            }
            // 乱码解决，这段代码在出现乱码时使用。
            // valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
            params.put(name, valueStr);
        }
        // 切记alipaypublickey是支付宝的公钥，请去open.alipay.com对应应用下查看。
        // boolean AlipaySignature.rsaCheckV1(Map<String, String> params, String
        // publicKey, String charset, String sign_type)
        boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset,
                AlipayConfig.sign_type);// 调用SDK验证签名
        if (signVerified) {
            // 商户订单号
            String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"), "UTF-8");

            // 支付宝交易号
            String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"), "UTF-8");

            // 付款金额
            String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"), "UTF-8");
            Ordering ordering = om.selectByPrimaryKey(Long.valueOf(out_trade_no));
            request.setAttribute("addres", ordering.getAddres());
            // 支付宝接口返回的值放到requst域中
            request.setAttribute("out_trade_no", out_trade_no);
            request.setAttribute("trade_no", trade_no);
            request.setAttribute("total_amount", total_amount);
            // 日志信息
            log.info("********************** 支付成功(支付宝同步通知) **********************");
            log.info("* 订单号: {}", out_trade_no);
            log.info("* 支付宝交易号: {}", trade_no);
            log.info("* 实付金额: {}", total_amount);
            log.info("***************************************************************");
            /* log.info("订单处理：系统订单号" + out_trade_no + "支付宝交易号：" + trade_no); */
            // 系统处理根据支付宝回调更改订单状态或者其他关联表的数据
        } else {// 验证失败
            log.info("支付, 验签失败...");
        }
        return "front/pay_success.jsp";
    }

    /**
     * 
     * Description:支付宝异步通知方法 <br/>
     *
     * @author caiqi
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @Override
    public String returnUrlhl(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // 获取支付宝POST过来反馈信息
        Map<String, String> params = new HashMap<String, String>();
        Map requestParams = request.getParameterMap();
        for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
            }
            // 乱码解决，这段代码在出现乱码时使用。
            // valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
            params.put(name, valueStr);
        }
        // 切记alipaypublickey是支付宝的公钥，请去open.alipay.com对应应用下查看。
        // boolean AlipaySignature.rsaCheckV1(Map<String, String> params, String
        // publicKey, String charset, String sign_type)
        boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset,
                AlipayConfig.sign_type);
        if (signVerified) {
            // 商户订单号
            String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"), "UTF-8");
            // 支付宝交易号
            String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"), "UTF-8");
            // 交易状态
            String trade_status = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"), "UTF-8");
            // 付款金额
            String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"), "UTF-8");
            // 支付宝接口返回的值放到requst域中
            request.setAttribute("out_trade_no", out_trade_no);
            request.setAttribute("trade_no", trade_no);
            request.setAttribute("total_amount", total_amount);
            log.info(out_trade_no);
            log.info(trade_no);
            log.info(total_amount);
            /**
             * 判断是否交易成功 交易成功修改数据库信息记录
             */
            if (trade_status.equals("TRADE_SUCCESS")) {
                Ordering ordering = new Ordering();
                // 设置dao层数据修改判断id
                ordering.setId(Long.valueOf(out_trade_no));
                // 修改订单表中的状态
                ordering.setState(2);
                // 设置支付宝流水号 退款，等一系列操作需要这个流水号
                ordering.setAlpay(trade_no);
                // 调用dao层动态修改的方法
                log.info("开始调用dao层方法");
                int falg = om.cqupdateByPrimaryKeySelective(ordering);
                log.info("开始调用dao层方法结束");
                if (falg >= 1) {
                    log.info("开始短信通知");
                    /**
                     * 短信通知
                     */

                    // 用商城订单号来取电话号码
                    Ordering ordering2 = om.selectByPrimaryKey(Long.valueOf(out_trade_no));
                    // 发送短信
                    notice(ordering2.getAddresseeName(), String.valueOf(ordering2.getYuLiu()), ordering2.getAmount(),
                            ordering2.getOrderId());
                    log.info("短信已发送");
                    log.info("支付成功");
                    // 日志信息
                    log.info("********************** 支付成功(支付宝异步通知) **********************");
                    log.info("* 订单号: {}", out_trade_no);
                    log.info("* 支付宝交易号: {}", trade_no);
                    log.info("* 实付金额: {}", total_amount);
                    log.info("***************************************************************");
                } else {
                    // 这里返回空，是因为支付宝异步回调的时候必须给支付回应success
                    // ，不然支付宝会21个小时内发送八次请求到你的服务器
                    log.info("支付失败");
                    return "";
                }

            }
        }
        return "success";
    }

    /**
     * 
     * Description:从cookie中取商品列表 <br/>
     *
     * @author caiqi
     * @return
     */
    private List<CartItem> getcartitemlist(HttpServletRequest request) {
        // 从cookie中取商品列表
        String cartjson = CookieUtils.getCookieValue(request, "CART", true);
        if (cartjson == null) {
            return new ArrayList<>();
        }
        // 把json转换成商品列表

        try {
            List<CartItem> list = JsonUtils.jsonToList(cartjson, CartItem.class);
            return list;
        } catch (Exception e) {
            e.printStackTrace();

        }

        return new ArrayList<>();
    }

    /**
     * 
     * Description:短信通知 <br/>
     *
     * @author caiqi
     * @param ipone
     * @param prie
     * @param out_trade_no
     * @throws Exception
     */

    private void notice(String name, String ipone, String prie, String out_trade_no) throws Exception {

        CloseableHttpClient httpClient = HttpClients.createDefault();
        // 请求接口地址
        HttpPost HttpPost = new HttpPost("https://way.jd.com/chuangxin/dxjk");
        // 实例化参数对象
        List<NameValuePair> nvps = new ArrayList<NameValuePair>();
        // 添加开发密钥
        nvps.add((new BasicNameValuePair("appkey", "80e0743d76a36175cb71d6ef15e3adf1")));
        // 添加电话号码
        nvps.add((new BasicNameValuePair("mobile", ipone)));// 电话号码
        // 添加短信内容
        nvps.add((new BasicNameValuePair("content",
                "【滴滴订餐系统】您好" + name + "(帅哥/美女)，您已成功订购商品价格：" + prie + "元，订单号：" + out_trade_no + "，我们会尽快安排发货，祝您购物愉快！")));// 短信内容
        // 构建请求
        HttpPost.setEntity(new UrlEncodedFormEntity(nvps, "utf-8"));
        // 获取返回
        CloseableHttpResponse response = httpClient.execute(HttpPost);
        HttpEntity entity = response.getEntity(); // 获取返回实体
        System.out.println(EntityUtils.toString(entity, "utf-8")); // 获取网页内容
        response.close(); // response关闭
        httpClient.close(); // httpClient关闭
    }
}
