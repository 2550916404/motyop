<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() +request.getContextPath()+"/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath %>">
<meta charset="utf-8" />
<title>用户中心</title>
<link href="<%=basePath %>resources/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath %>resources/js/public.js"></script>
<script type="text/javascript" src="<%=basePath %>resources/js/jquery.js"></script>
<script type="text/javascript" src="<%=basePath %>resources/js/jqpublic.js"></script>

</head>
<body>
<!-- **********引入头部*********** -->
<%@ include file="top.jsp" %>

<!--Start content-->
<section class="Psection MT20">
<nav class="U-nav Font14 FontW">
  <ul>
   <li><i></i><a href="<%=basePath %>yanzheng.shtml">用户中心首页</a></li>
   <li><i></i><a href="<%=basePath %>pages/front/user_orderlist.jsp">我的订单</a></li>
   <li><i></i><a href="<%=basePath %>pages/front/user_address.jsp">收货地址</a></li>
   <li><i></i><a href="<%=basePath %>pages/front/user_message.jsp">我的留言</a></li>
   <li><i></i><a href="<%=basePath %>pages/front/user_coupon.jsp">我的优惠券</a></li>
   <li><i></i><a href="collSelect.shtml">我的收藏</a></li>
   <li><i></i><a href="<%=basePath %>pages/front/user_account.jsp">账户管理</a></li>
   <li><i></i><a href="#">安全退出</a></li>
  </ul>
 </nav>
 <article class="U-article Overflow">
  <!--user Coupon-->
  <section class="M-coupon Overflow">
   <span class="coupontitle Block Font14 FontW Lineheight35">我的优惠券</span>
   <ul>
    <a href="<%=basePath %>pages/front/shop.jsp" class="Fontfff"  >
    <li>
     <p class="U-price FontW"><i>￥</i>20<span class="Font14 FontW">全店通用</span></p>
     <p>发行店铺：好味来快餐店</p>
     <p>使用条件：满299元即可使用</p>
     <p>有效期：2014-09-21至2014-09-30</p>
    </li>
    </a>
   </ul>
  </section>
 </article>
</section>
<!--End content-->
<div class="F-link"></div>
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
     <li><a href="<%=basePath %>pages/front/article_read.jsp"   title="标题">支付方式</a></li>
     <li><a href="<%=basePath %>pages/front/article_read.jsp"   title="标题">配送方式</a></li>
     <li><a href="<%=basePath %>pages/front/article_read.jsp"   title="标题">配送效率</a></li>
     <li><a href="<%=basePath %>pages/front/article_read.jsp"   title="标题">服务费用</a></li>
    </ul>
    </div>
    <div>
    <span><i class="i2"></i>关于我们</span>
    <ul>
     <li><a href="<%=basePath %>pages/front/article_read.jsp"   title="标题">招贤纳士</a></li>
     <li><a href="<%=basePath %>pages/front/article_read.jsp"   title="标题">网站介绍</a></li>
     <li><a href="<%=basePath %>pages/front/article_read.jsp"   title="标题">配送效率</a></li>
     <li><a href="<%=basePath %>pages/front/article_read.jsp"   title="标题">商家加盟</a></li>
    </ul>
    </div>
    <div>
    <span><i class="i3"></i>帮助中心</span>
    <ul>
     <li><a href="<%=basePath %>pages/front/article_read.jsp"   title="标题">服务内容</a></li>
     <li><a href="<%=basePath %>pages/front/article_read.jsp"   title="标题">服务介绍</a></li>
     <li><a href="<%=basePath %>pages/front/article_read.jsp"   title="标题">常见问题</a></li>
     <li><a href="<%=basePath %>pages/front/article_read.jsp"   title="标题">网站地图</a></li>
    </ul>
    </div>
  </section>
 </section>
<div class="copyright">© 版权所有 2016 DeathGhost 技术支持：<a href="http://www.deathghost.cn" title="DeathGhost">DeathGhost</a></div>
</footer>
</body>
</html>
