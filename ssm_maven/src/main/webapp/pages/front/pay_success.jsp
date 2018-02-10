<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() +request.getContextPath()+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>支付成功</title>
<link href="<%=basePath %>resources/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath %>resources/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="<%=basePath %>resources/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="<%=basePath %>resources/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="<%=basePath %>resources/js/public.js"></script>
<script type="text/javascript" src="<%=basePath %>resources/js/jqpublic.js"></script>

<link rel="stylesheet" href="http://www.lz517.com/home/c/pay.css?171230"/>
<style type="text/css">
	.pay_show li span {
		padding: 0px 50px;
	}
</style>
</head>
<body>
<!-- **********引入头部*********** -->
<%@ include file="top.jsp" %>

<div class="payBoxBg">
 <div class="payBox">
 <div class="pay_alr2">
 <span class="pay_alr2s1"><img src="<%=basePath %>resources/images2/pay_ico7.jpg">&nbsp; 支付成功，您的订单已经成功提交</span><br>
 为了保障您的权益，餐品到柜后取货码会发至您的手机，请注意查收。<br>
 <!--若长时间未收到短信，请至 <a href="javascript:void(0)" class="pay_blue payOrder">订单查询</a> 获得取餐码。-->
 </div>
 <div class="pay_pr2">支付金额：<span class="pay_prnum"><span class="f14">￥</span>${total_amount }</span></div>
 <div class="pay_adr">配送至：${addres }</div>
 <div class="pay_bx1">
 <div class="pay_bx1L">
     <div class="pay_bx1t1">配送信息：1份订单 ( 共<span class="order_num">1</span>份 )</div>
  <div class="pay_ordr">
   <ul class="pay_show">
   		<li><span>订单: ${out_trade_no }</span><span>预计送达时间: 2015-08-25 12:30:00</span><span>￥${total_amount }</span></li>
   </ul>
  </div>
 </div>
 <div class="pay_bx1R">
  <ul>
   <li><img src="<%=basePath %>resources/images/Android_ico_d.gif" width="83" height="83"><br>扫一扫，手机订餐更方便</li>
  </ul>
 </div>
 <div class="clear"></div>
 </div>
 


<footer>
 <section class="Otherlink">
  <aside>
   <div class="ewm-left">
    <p>手机扫描二维码：</p>
    <img src="<%=basePath %>resources/images/Android_ico_d.gif">
    <img src="<%=basePath %>resources/images/iphone_ico_d.gif">
   </div>
   <div class="tips">
    <p>客服热线</p>
    <p><i>1830927**73</i></p>
    <p>配送时间</p>
    <p><time>09：00</time>~<time>22:00</time></p>
    <p>网站公告</p>
   </div>
  </aside>
  <section>
    <div>
    <span><i class="i1"></i>配送支付</span>
    <ul>
     <li><a href="article_read.html" target="_blank" title="标题">支付方式</a></li>
     <li><a href="article_read.html" target="_blank" title="标题">配送方式</a></li>
     <li><a href="article_read.html" target="_blank" title="标题">配送效率</a></li>
     <li><a href="article_read.html" target="_blank" title="标题">服务费用</a></li>
    </ul>
    </div>
    <div>
    <span><i class="i2"></i>关于我们</span>
    <ul>
     <li><a href="article_read.html" target="_blank" title="标题">招贤纳士</a></li>
     <li><a href="article_read.html" target="_blank" title="标题">网站介绍</a></li>
     <li><a href="article_read.html" target="_blank" title="标题">配送效率</a></li>
     <li><a href="article_read.html" target="_blank" title="标题">商家加盟</a></li>
    </ul>
    </div>
    <div>
    <span><i class="i3"></i>帮助中心</span>
    <ul>
     <li><a href="article_read.html" target="_blank" title="标题">服务内容</a></li>
     <li><a href="article_read.html" target="_blank" title="标题">服务介绍</a></li>
     <li><a href="article_read.html" target="_blank" title="标题">常见问题</a></li>
     <li><a href="article_read.html" target="_blank" title="标题">网站地图</a></li>
    </ul>
    </div>
  </section>
 </section>
<div class="copyright">© 版权所有 2016 DeathGhost 技术支持：<a href="http://www.deathghost.cn" title="DeathGhost">DeathGhost</a></div>
</footer>
</body>
</html>
