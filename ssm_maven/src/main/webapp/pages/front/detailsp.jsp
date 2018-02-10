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
<title>${detailspmenu.caiName}</title>
<meta name="keywords" content="DeathGhost,DeathGhost.cn,web前端设,移动WebApp开发" />
<meta name="description" content="DeathGhost.cn::H5 WEB前端设计开发!" />
<meta name="author" content="DeathGhost"/>
<link href="<%=basePath %>resources/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath %>resources/js/public.js"></script>
<script type="text/javascript" src="<%=basePath %>resources/js/jquery.js"></script>
<script type="text/javascript" src="<%=basePath %>resources/js/jqpublic.js"></script>
<!--
Author: DeathGhost
Author URI: http://www.deathghost.cn
-->
<script>
$(function(){		
	$('.title-list li').click(function(){
		var liindex = $('.title-list li').index(this);
		$(this).addClass('on').siblings().removeClass('on');
		$('.menutab-wrap div.menutab').eq(liindex).fadeIn(150).siblings('div.menutab').hide();
		var liWidth = $('.title-list li').width();
		$('.shopcontent .title-list p').stop(false,true).animate({'left' : liindex * liWidth + 'px'},300);
	});
	
	$('.menutab-wrap .menutab li').hover(function(){
		$(this).css("border-color","#ff6600");
		$(this).find('p > a').css('color','#ff6600');
	},function(){
		$(this).css("border-color","#fafafa");
		$(this).find('p > a').css('color','#666666');
	});
	});
</script>
</head>
<body>
<%@ include file="top.jsp" %>
<%-- <header>
 <section class="Topmenubg">
  <div class="Topnav">
   <div class="LeftNav">
    <a href="pages/front/register.jsp">注册</a>/<a href="pages/front/login.jsp">登录</a><a href="#">QQ客服</a><a href="#">微信客服</a><a href="#">手机客户端</a>
   </div>
   <div class="RightNav">
    <a href="pages/front/user_center.jsp">用户中心</a> <a href="<%=basePath %>serbeyOrdering.shtml"   title="我的订单">我的订单</a> <a href="<%=basePath %>showCart.shtml">购物车（0）</a> <a href="collSelect.shtml"   title="我的收藏">我的收藏</a> <a href="pages/front/merchant.jsp">商家入驻</a>
   </div>
  </div>
 </section>
 <div class="Logo_search">
  <div class="Logo">
   <a href="pages/front/index.jsp"><img src="<%=basePath %>resources/images/logo.jpg" title="DeathGhost" alt="模板"></a>
   <i></i>
   <span>西安市 [ <a href="#">莲湖区</a> ]</span>
  </div>
  <div class="Search"> 
   <form method="get" id="main_a_serach" onsubmit="return check_search(this)">
   <div class="Search_nav" id="selectsearch">
    <a href="javascript:;" onClick="selectsearch(this,'restaurant_name')" class="choose">餐厅</a>
    <a href="javascript:;" onClick="selectsearch(this,'food_name')">食物名</a>
   </div>
   <div class="Search_area"> 
   <input type="search" id="fkeyword" name="keyword" placeholder="请输入您所需查找的餐厅名称或食物名称..." class="searchbox" />
   <input type="submit" class="searchbutton" value="搜 索" />
   </div>
   </form>
   <p class="hotkeywords">
   <a href="#" title="${detailspmenu.caiName}">${detailspmenu.caiName}</a>
   <a href="#" title="这里是产品名称">螃蟹炒年糕</a>
   <a href="#" title="这里是产品名称">牛奶炖蛋</a>
   <a href="#" title="这里是产品名称">芝麻酱凉面</a>
   <a href="#" title="这里是产品名称">滑蛋虾仁</a>
   <a href="#" title="这里是产品名称">蒜汁茄子</a></p>
   </div>
   </div>
 <nav class="menu_bg">
 <ul class="menu">
      <li><a href="<%=basePath %>pages/front/index.jsp">首页</a></li>
   <li><a href="selectMenu1.shtml">订餐</a></li>
   <li><a href="selectMenu3.shtml">积分商城</a></li>
   <li><a href="<%=basePath %>pages/front/article_read.jsp">关于我们</a></li>
  </ul>
 </nav>
</header> --%>
<script type="text/javascript">
    //加载页面的时候生成随机推荐菜谱
 	$(document).ready(function(){
 		$.ajax({
			url:"<%=basePath%>/pictureCarousel.shtml",
					type : "post",
					data : {
						ok:"ok"
					},
					dataType : "json",
					success : function(result) {}
			});
 	});

 </script>
<!--Start content-->
<section class="slp">
 <section class="food-hd">
  <div class="foodpic">
   <img src="<%=basePath %>resources/images2/${detailspmenu.caiImagepath}" id="showimg">
    <ul class="smallpic">
     <li><img src="<%=basePath %>resources/images2/${detailspmenu.caiImagepath}" onmouseover="show(this)" onmouseout="hide()"></li>
    </ul>
  </div>
  <div class="foodtext">
   <div class="foodname_a">
    <h1>${detailspmenu.caiName}</h1>
    <p>${detailspmenu.adds}</p>
   </div>
   <div class="price_a">
    <p class="price01">促销：￥<span> <fmt:formatNumber value="${detailspmenu.oldPrice*detailspmenu.discount}" pattern="#.00"/></span></p>
    <p class="price02">价格：￥<s>${detailspmenu.oldPrice}</s></p>
   </div>
   <div class="Freight">
    <span>配送费用：</span>
    <span><i>未央区</i>至<i>莲湖区</i></span>
    <span>10.00</span>
   </div>
   <ul class="Tran_infor">
     <li>
      <p class="Numerical">3</p>
      <p>月销量</p>
     </li>
     <li class="line">
      <p class="Numerical">58</p>
      <p>累计评价</p>
     </li>
     <li>
      <p class="Numerical">59</p>
      <p>送幸福积分</p>
     </li>
   </ul>
   <!-- 购物车 -->
   <form action="<%=basePath %>cartAdd.shtml" method="post">
      <div class="BuyNo">
    <span>我要买：<input type="number" name="num" required autofocus min="1" value="1"/>份</span>
    <span>库存：3258</span>
    <div class="Buybutton">
    <input type="hidden" name="id" value="${detailspmenu.id}"> 
     <input name="" type="submit" value="加入购物车" class="BuyB">
     <a href="<%=basePath %>/selectShop.shtml?id=${detailspmenu.sid}"><span class="Backhome">进入店铺首页</span></a>
    </div>
   </div>
  </div>
  </form>
  <div class="viewhistory">
   <span class="VHtitle">看了又看</span>
   <ul class="Fsulist">
   <c:forEach items="${menuPicturelList }" var="menulist" begin="1" end="2">
    <li>
     <a href="detailspMenu.shtml?id=${menulist.id }" target="_blank" title="${menulist.caiName }"><img src="<%=basePath %>resources/images2/${menulist.caiImagepath }"></a>
     <p>${menulist.caiName }</p>
     <p>￥<fmt:formatNumber value="${menulist.oldPrice*menulist.discount}" pattern="#.00"/></p>
    </li>
    </c:forEach>
   <%--  <li>
     <a href="pages/front/detailsp.jsp" target="_blank" title="酱爆茄子"><img src="<%=basePath %>resources/images/02.jpg"></a>
     <p>酱爆茄子</p>
     <p>￥12.80</p>
    </li> 
    <li>
     <a href="pages/front/detailsp.jsp" target="_blank" title="酱爆茄子"><img src="<%=basePath %>resources/images/03.jpg"></a>
     <p>酱爆茄子</p>
     <p>￥12.80</p>
    </li>--%>
    
   </ul>
  </div>
 </section>
 <!--bottom content-->
 <section class="Bcontent">
  <article>
   <div class="shopcontent">
  <div class="title2 cf">
    <ul class="title-list fr cf ">
      <li class="on">详细说明</li>
      <li>评价详情（5）</li>
      <li>成交记录（5）</li>
      <p><b></b></p>
    </ul>
  </div>
  <div class="menutab-wrap">
    <!--case1-->
    <div class="menutab show">
      <div class="cont_padding">
       <%-- <img src="<%=basePath %>resources/images/tds.jpg">
       <p>测试信息，可删除！</p>
       <p>1. 将土豆洗净刮皮。</p>
       <p>2. 先将土豆切成整齐的大薄片这样是切出均匀的丝的要点。</p>
       <p>3. 将土豆片切成细丝。</p>
       <p>4. 用清水将切好的土豆丝泡去淀粉，（这样炒出的土豆丝清爽不粘）</p>
       <p>5. 将葱切末、辣椒剪成小段、蒜切末、红椒切丝、姜切末。</p> --%>
       <p>${detailspmenu.caiDesc }</p>
      </div>
    </div>
    <!--case2-->
    <div class="menutab">
     <div class="cont_padding">
      <table class="Dcomment">
       <th width="80%">评价内容</th>
       <th width="20%" style="text-align:right">评价人</th>
       <tr>
       <td>
        还不错，速度倒是挺速度倒是挺快速度倒是挺快速度倒是挺快速度倒是挺快速度倒是挺快速度倒是挺快速度倒是挺快速度倒是挺快速度倒是挺快速度倒是挺快速度倒是挺快快...
        <time>2016-05-31 22:30:39</time>
       </td>
       <td align="right">DEATHGHOST</td>
       </tr>
      </table>
      <div class="TurnPage">
         <a href="#">
          <span class="Prev"><i></i>首页</span>
         </a>
         <a href="#"><span class="PNumber">1</span></a>
         <a href="#"><span class="PNumber">2</span></a>
         <a href="#">
         <span class="Next">最后一页<i></i></span>
        </a>
       </div>
     </div>
    </div>
    <!--case4-->
    <div class="menutab">
     <div class="cont_padding">
     
      <table width="888">
       <th width="35%">买家</th>
       <th width="20%">价格</th>
       <th width="15%">数量</th>
       <th width="30%">成交时间</th>
       <tr height="40">
        <td>d***t</td>
        <td>￥59</td>
        <td>1</td>
        <td>2014-9-18 11:13:07</td>
       </tr>
      </table>
     
     </div>
       <div class="TurnPage">
         <a href="#">
          <span class="Prev"><i></i>首页</span>
         </a>
         <a href="#"><span class="PNumber">1</span></a>
         <a href="#"><span class="PNumber">2</span></a>
         <a href="#">
         <span class="Next">最后一页<i></i></span>
        </a>
       </div>
   </div>
  </article>
  <!--ad&other infor-->
  <aside>
   <!--广告位或推荐位-->
   <a href="#" title="广告位占位图片" target="_blank"><img src="<%=basePath %>resources/images/2014912.jpg"></a>
  </aside>
 </section>
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
     <li><a href="pages/front/article_read.jspl" target="_blank" title="标题">配送方式</a></li>
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
