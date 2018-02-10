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
<title>商家入驻</title>
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
 <form action="<%=basePath %>addShop.shtml" method="post">
  <table class="Register">
  <tr>
  <td width="40%" align="right" class="FontW">店铺名：</td>
  <td><input type="text" name="shopName" required></td>
  </tr>
  <tr>
  <td width="40%" align="right" class="FontW">地址：</td>
  <td><input type="text" name="shopAddress" required></td>
  </tr>
  <tr>
  <td width="40%" align="right" class="FontW">电话：</td>
  <td><input type="text" name="shopPhone" required></td>
  </tr>
  <tr>
  <td width="40%" align="right" class="FontW">特色菜品：</td>
  <td><input type="text" name="specialties" required></td>
  </tr>
  <tr>
  <td width="40%" align="right" class="FontW">停车位：</td>
  <td><input type="text" name="parkingSpace" required ></td>
  </tr>
  <tr>
  <td width="40%" align="right" class="FontW">营业时间：</td>
  <td><input type="text" name="openingHours" required ></td>
  </tr>
  <tr>
  <td width="40%" align="right" class="FontW">WIFI：</td>
  <td><input type="text" name="wifi" ></td>
  </tr>
  <tr>
  <td width="40%" align="right" class="FontW">店铺图片：</td>
  <td><input type="file" name="shopImagepath" ></td>
  </tr>
  <tr>
  <td width="40%" align="right"></td>
  <td><input type="submit" name="" class="Submit_b" value="提交"><input type="reset" name="" class="Submit_b" value="清空"></td>
  </tr>
  </table>
 </form>
</section>
<!--End content-->
<div class="F-link">
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
     <li><a href="pages/front/article_read.jsp" target="_blank" title="标题">支付方式</a></li>
     <li><a href="pages/front/article_read.jsp" target="_blank" title="标题">配送方式</a></li>
     <li><a href="pages/front/article_read.jsp" target="_blank" title="标题">配送效率</a></li>
     <li><a href="pages/front/article_read.jsp" target="_blank" title="标题">服务费用</a></li>
    </ul>
    </div>
    <div>
    <span><i class="i2"></i>关于我们</span>
    <ul>
     <li><a href="pages/front/article_read.jsp" target="_blank" title="标题">招贤纳士</a></li>
     <li><a href="pages/front/article_read.jsp" target="_blank" title="标题">网站介绍</a></li>
     <li><a href="pages/front/article_read.jsp" target="_blank" title="标题">配送效率</a></li>
     <li><a href="pages/front/article_read.jsp" target="_blank" title="标题">商家加盟</a></li>
    </ul>
    </div>
    <div>
    <span><i class="i3"></i>帮助中心</span>
    <ul>
     <li><a href="pages/front/article_read.jsp" target="_blank" title="标题">服务内容</a></li>
     <li><a href="pages/front/article_read.jsp" target="_blank" title="标题">服务介绍</a></li>
     <li><a href="pages/front/article_read.jsp" target="_blank" title="标题">常见问题</a></li>
     <li><a href="pages/front/article_read.jsp" target="_blank" title="标题">网站地图</a></li>
    </ul>
    </div>
  </section>
 </section>
<div class="copyright">© 版权所有 2016 DeathGhost 技术支持：<a href="http://www.deathghost.cn" title="DeathGhost">DeathGhost</a></div>
</footer>
</body>
</html>
