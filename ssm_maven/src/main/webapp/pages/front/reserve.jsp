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
<title>提前订餐</title>
<link href="<%=basePath %>resources/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath %>resources/js/public.js"></script>
<script type="text/javascript" src="<%=basePath %>resources/js/jquery.js"></script>
<script type="text/javascript" src="<%=basePath %>resources/js/jqpublic.js"></script>
<script type="text/javascript" src="<%=basePath %>resources/js/cart.js"></script>
</head>
<body>
<!-- **********引入头部*********** -->
<%@ include file="top.jsp" %>
<!--Start content-->
<section class="Psection MT20">
 <div class="Reserve Overflow">
 <form action="#">
  <table>
  <th>菜品</th>
  <th>数量</th>
  <th>单价</th>
  <th>小计</th>
  <tr>
   <td><a href="pages/front/detailsp.jsp" title="酸辣土豆丝"  >酸辣土豆丝</a></td>
   <td><b>1</b></td>
   <td>￥5.90</td>
   <td><b>￥5.90</b></td>
  </tr>
  <tr>
   <td><a href="pages/front/detailsp.jsp" title="鱼香肉丝"  >鱼香肉丝</a></td>
   <td><b>2</b></td>
   <td>￥6.00</td>
   <td><b>￥12.00</b></td>
  </tr>
   <tr>
     <td colspan="4">
      <table>
       <tr>
        <td bgcolor="#f8f8f8" class="FontW">餐桌数：</td>
        <td bgcolor="#f8f8f8"><input type="number" name="" class="Number" required></td>
        <td bgcolor="#f8f8f8" class="FontW">就餐人数：</td>
        <td bgcolor="#f8f8f8"><input type="number" name="" class="Number" required></td>
       </tr>
       <tr>
       <td bgcolor="#f8f8f8" class="FontW">就餐时间：</td>
       <td bgcolor="#f8f8f8"><input type="datetime-local" class="Datetime" required>~<input type="datetime-local" class="Datetime" required></td>
       <td bgcolor="#f8f8f8" class="FontW">备注信息：</td>
       <td bgcolor="#f8f8f8"><input type="text" name="" class="input_mark" placeholder="添加备注信息..."></td>
      </tr>
      </table>
     </td>
     </tr>
   <tr>
    <td colspan="4" class="FontW CorRed Font14">共计费用：￥17.90</td>
    </tr>
   <tr>
     <td colspan="4"><input type="submit" name="" value="确认提交订单" class="Submit"></td>
   </tr>
  </table>
  </form>
 </div>
</section>
<!--提交成功之后，将显示如下信息-->
<section class="Psection MT20 Textcenter"  >
  <!-- 订单提交成功后则显示如下 -->
  <p class="Font14 Lineheight35 FontW">恭喜你！订单提交成功！</p>
  <p class="Font14 Lineheight35 FontW">您的订单编号为：<span class="CorRed">201409205134</span></p>
  <p class="Font14 Lineheight35 FontW">请在2014-09-24 11:30 ~ 2014-09-24 14:30进店[ <a href="pages/front/shop.jsp"  >好味来快餐店</a> ]就餐</p>
  <p class="Font14 Lineheight35 FontW">地址：陕西省西安市雁塔区丈八北路</p>
  <p class="Font14 Lineheight35 FontW">共计金额：<span class="CorRed">￥17.90</span></p>
  <p><button type="button" class="Submit"><a href="pages/front/user_center.jsp">进入用户中心</button></p>
</section>
<!--End content-->
<div class="F-link">
  <span>友情链接：</span>
  <a href="http://www.deathghost.cn"   title="DeathGhost">DeathGhost</a>
  <a href="http://www.17sucai.com/pins/15966.jsp"   title="免费后台管理模板">绿色清爽版通用型后台管理模板免费下载</a>
  <a href="http://www.17sucai.com/pins/17567.jsp"   title="果蔬菜类模板源码">HTML5果蔬菜类模板源码</a>
  <a href="http://www.17sucai.com/pins/14931.jsp"   title="黑色的cms商城网站后台管理模板">黑色的cms商城网站后台管理模板</a>
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
     <li><a href="pages/front/article_read.jsp"   title="标题">支付方式</a></li>
     <li><a href="pages/front/article_read.jsp"   title="标题">配送方式</a></li>
     <li><a href="pages/front/article_read.jsp"   title="标题">配送效率</a></li>
     <li><a href="pages/front/article_read.jsp"   title="标题">服务费用</a></li>
    </ul>
    </div>
    <div>
    <span><i class="i2"></i>关于我们</span>
    <ul>
     <li><a href="pages/front/article_read.jsp"   title="标题">招贤纳士</a></li>
     <li><a href="pages/front/article_read.jsp"   title="标题">网站介绍</a></li>
     <li><a href="pages/front/article_read.jsp"   title="标题">配送效率</a></li>
     <li><a href="pages/front/article_read.jsp"   title="标题">商家加盟</a></li>
    </ul>
    </div>
    <div>
    <span><i class="i3"></i>帮助中心</span>
    <ul>
     <li><a href="pages/front/article_read.jsp"   title="标题">服务内容</a></li>
     <li><a href="pages/front/article_read.jsp"   title="标题">服务介绍</a></li>
     <li><a href="pages/front/article_read.jsp"   title="标题">常见问题</a></li>
     <li><a href="pages/front/article_read.jsp"   title="标题">网站地图</a></li>
    </ul>
    </div>
  </section>
 </section>
<div class="copyright">© 版权所有 2016 DeathGhost 技术支持：<a href="http://www.deathghost.cn" title="DeathGhost">DeathGhost</a></div>
</footer>
</body>
</html>
