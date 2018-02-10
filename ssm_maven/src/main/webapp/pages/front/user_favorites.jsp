<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
   <li><i></i><a href="collSelect.shtml">我的收藏</a></li>
   <li><i></i><a href="<%=basePath %>pages/front/user_account.jsp">账户管理</a></li>
   <li><i></i><a href="<%=basePath %>exit.shtml">安全退出</a></li>
  </ul>
 </nav>
 <article class="U-article Overflow">
  <!--user Favorites-->
  <section class="ShopFav Overflow">
   <span class="ShopFavtitle Block Font14 FontW Lineheight35">我的收藏</span>
   <ul>
   <!-- 收藏店铺展示 -->
   <c:forEach items="${collectionLsit }" var="coll">
	    <li>
	     <input type="hidden" name="sid" value="${coll.sid}">
	     <a href="<%=basePath %>/selectShop.shtml?id=${coll.sid}"  >
	     <img src="<%=basePath %>resources/images2/${coll.shop.shopImagepath}">
	     <p style="font-size:15px;font-weight: 600;">${coll.shop.shopName}</p>
	     <p>收藏时间：<fmt:formatDate value="${coll.browseTime}" pattern="yyyy-MM-dd HH:mm:ss"/></p>
	     </a>
	     <center>
	     <input type="button" name="guanzhu" id="guanzhu" value="取&nbsp;消&nbsp;收&nbsp;藏">
	     </center>
	    </li>
   </c:forEach>
   </ul>
   <style rel="stylesheet" type="text/css">
   #guanzhu{
    margin: 0px;
	display: block;
	width: 210px;
	height: 25px;
	color:rgb(250,250,250);
	font-size:15px;
	font-weight: 500;
	line-height: 25px;
	text-align: center;
	border: 1px solid rgb(240, 0, 130);
	border-radius:4px ;
	position: relative;
	background-color: rgb(240, 0, 130);
  }
   </style>
   <script type="text/javascript">
   $("input[name=guanzhu]").click(function(){
	   var $guanzhu=$(this);
	   var $sid=$(this).parent().parent().children("input[name=sid]").val();
	   $.ajax({
			url:"<%=basePath%>/collDelete.shtml",
					type : "post",
					data : {
						sid:$sid
					},
					dataType : "json",
					success : function(result) {
						var flag=result;
						if(flag>0){
							$guanzhu.parent().parent().remove();//删除取消收藏的店铺
						}
					}
			});
	   
   });
   </script>
   
  </section>
 </article>
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
