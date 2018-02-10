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
<title>滴滴网上订餐</title>
<link href="<%=basePath %>resources/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath %>resources/js/public.js"></script>
<script type="text/javascript" src="<%=basePath %>resources/js/jquery.js"></script>
<script type="text/javascript" src="<%=basePath %>resources/js/jqpublic.js"></script>
<script type="text/javascript" src="<%=basePath %>resources/js/cookiehistory.js"></script> <!-- 引用浏览历史获取商店id -->
</head>

<body>
<%@ include file="top.jsp" %>

<!--Start content-->
<section class="Cfn">
 <aside class="C-left">
  <div class="S-time">服务时间：周一~周六<time>09:00</time>-<time>23:00</time></div>
  <div class="C-time">
   <img src="<%=basePath %>resources/images/dc.jpg"/>
  </div>
  <a href="selectMenu1.shtml"><img src="<%=basePath %>resources/images/by_button.png"></a>
  <a href="selectMenu1.shtml"><img src="<%=basePath %>resources/images/dc_button.png"></a>
 </aside>
 <!-- 封面轮播 -->
 <div class="F-middle">
 <ul class="rslides f426x240">
       <c:forEach items="${picturelList }" var="shop">
         <li><a href="<%=basePath %>/selectShop.shtml?id=${shop.id}" class="toshop cookieHistory">
         <img src="<%=basePath %>resources/images2/${shop.shopImagepath}" style="width: 600px;height: 485px"/>
         <input type="hidden" value="${shop.id}">
         </a></li>
       </c:forEach> 
        <%-- <li><a href="javascript:"><img src="<%=basePath %>resources/images/01.jpg"/></a></li>
        <li><a href="javascript:"><img src="<%=basePath %>resources/images/02.jpg" /></a></li>
        <li><a href="javascript:"><img src="<%=basePath %>resources/images/03.jpg"/></a></li> --%>
 </ul>
 </div>
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

 	$(".cookieHistory").click(function() {
		var $history = $(".cookieHistory input[type=hidden]").val();
		$.ajax({
			url : "<%=basePath%>/getCookieHistory.shtml",
			type : "post",
			data : {
				id : $history
			},
			dataType : "json",
			success : function(result) {
			}
		});
	});
 	
 	function myrefresh() 
 	{ 
 	window.location.reload();
 	} 
 	setTimeout('myrefresh()',1200000); //指定1200秒(20分钟)刷新一次 
 </script>

 
 <aside class="N-right">
  <div class="N-title">公司新闻 <i>COMPANY NEWS</i></div>
  <ul class="Newslist">
   <li><i></i><a href="pages/front/article_read.jsp" title="这里调用新闻标题...">欢迎访问DeathGhost博客站...</a></li>
   <li><i></i><a href="pages/front/article_read.jsp" title="这里调用新闻标题...">H5WEB前端开发 移动WEB模板设计...</a></li>
  </ul>
  <ul class="Orderlist" id="UpRoll">
   <li>
   <p>订单编号：2014090912973</p>
   <p>收件人：王先生</p>
   <p>订单状态：<i class="State01">已发货</i></p>
   </li>
   <li>
   <p>订单编号：2014090912978</p>
   <p>收件人：张小姐</p>
   <p>订单状态：<i class="State02">已签收</i><i class="State03">已点评</i></p>
   </li>
   <li>
   <p>订单编号：2014090912988</p>
   <p>收件人：龚先生</p>
   <p>订单状态：<i class="State02">已签收</i><i class="State03">已点评</i></p>
   </li>
  </ul>
  <script>
   var UpRoll = document.getElementById('UpRoll');
   var lis = UpRoll.getElementsByTagName('li');
   var ml = 0;
   var timer1 = setInterval(function(){
    var liHeight = lis[0].offsetHeight;
    var timer2 = setInterval(function(){
     UpRoll.scrollTop = (++ml);
     if(ml ==1){
        clearInterval(timer2);
        UpRoll.scrollTop = 0;
        ml = 0;
        lis[0].parentNode.appendChild(lis[0]);
    }
    },10); 
    },5000);
  </script>
 </aside>
</section>
<section class="Sfainfor">
 <article class="Sflist">
  <div id="Indexouter">
   <ul id="Indextab">
    <li class="current">点菜</li>
    <li>餐馆</li>
    <!-- <p class="class_B">
    <a href="#">中餐</a>
    <a href="#">西餐</a>
    <a href="#">甜点</a>
    <a href="#">日韩料理</a>
    <span><a href="#"  >more ></a></span>
    </p> -->
   </ul>
  <div id="Indexcontent">
   <ul style="display:block;">
    <li>
    <!--  <p class="seekarea">
     <a href="#">碑林区</a>
     <a href="#">新城区</a>
     <a href="#">未央区</a>
     <a href="#">雁塔区</a>
     <a href="#">莲湖区</a>
     <a href="#">高新区</a>
     <a href="#">灞桥区</a>
     <a href="#">高陵区</a>
     <a href="#">阎良区</a>
     <a href="#">临潼区</a>
     </p> -->
     <div class="SCcontent">
     <!-- 菜品 -->
     <c:forEach items="${menuPicturelList }" var="menu">
     <a href="detailspMenu.shtml?id=${menu.id }"   title="${menu.caiName}">
      <figure>
       <img src="<%=basePath %>resources/images2/${menu.caiImagepath}">
       <figcaption>
       <span class="title">${menu.caiName}</span>
       <span class="price"><i>￥</i>${menu.oldPrice}</span>
       </figcaption>
      </figure>
      </a>
       </c:forEach>
     </div>
 <%--    <div class="bestshop">
      <a href="pages/front/shop.jsp" title="店铺名称">
       <a href="pages/front/shop.jsp"   title="店铺名称">
      <figure>
       <img src="<%=basePath %>resources/images/wpjnewlogo.jpg">
      </figure>
      </a>
      <a href="pages/front/shop.jsp" title="店铺名称">
      <figure>
       <img src="<%=basePath %>resources/images/weijia.jpg">
      </figure>
      </a>
      <a href="pages/front/shop.jsp" title="店铺名称">
      <figure>
       <img src="<%=basePath %>resources/images/wpjnewlogo.jpg">
      </figure>
      </a>
      <a href="pages/front/shop.jsp"   title="店铺名称">
      <figure>
       <img src="<%=basePath %>resources/images/weijia.jpg">
      </figure>
      </a>
      <a href="pages/front/shop.jsp"   title="店铺名称">
      <figure>
       <img src="<%=basePath %>resources/images/wpjnewlogo.jpg">
      </figure>
      </a>
     </div> --%>
    </li>
   </ul>
   <ul>
  <li>
     <!-- <p class="seekarea">
     <a href="#">碑林区</a>
     <a href="#">新城区</a>
     <a href="#">未央区</a>
     <a href="#">雁塔区</a>
     <a href="#">莲湖区</a>
     <a href="#">高新区</a>
     <a href="#">灞桥区</a>
     <a href="#">高陵区</a>
     <a href="#">阎良区</a>
     <a href="#">临潼区</a>
     <a href="#">长安区</a>
     <a href="#">周至县</a>
     <a href="#">蓝田县 </a>
     </p> -->
     <div class="DCcontent">
     <!-- 餐馆 -->
      <c:forEach items="${canguanList }" var="canguan">
       <a href="selectShop.shtml?id=${canguan.id }"   title="TITLE:${canguan.shopName}" class="cookieHistory">
       <input type="hidden" value="${canguan.id}">
       <figure>
       <img src="<%=basePath %>resources/images2/${canguan.shopImagepath}">
       <figcaption>
       <span class="title">${canguan.shopName}</span>
       <span class="price">预定折扣：<i>8.9折</i></span>
       </figcaption>
       <p class="p1"><q>${canguan.activity}&nbsp;${canguan.wifi}</q></p>
       <p class="p2">
       店铺评分：
         <c:forEach  begin="1" end="${canguan.grade}"  step="1" >
	       <img src="<%=basePath %>resources/images/star-on.png">
		 </c:forEach>
		 <c:forEach  begin="${canguan.grade}" end="4"  step="1" >
		   <img src="<%=basePath %>resources/images/star-off.png">
		 </c:forEach> 
       </p>
       <p class="p3">店铺地址：${canguan.shopAddress}</p>
       </figure>
      </a>
     </c:forEach>
     
       </div>
  </li>
  </ul>
 </div>
 </div>
 </article>
 <aside class="A-infor">
  <img src="<%=basePath %>resources/images/2014911.jpg">
  <div class="usercomment">
   <span>用户菜品点评</span>
   <ul>
    <li>
     <img src="<%=basePath %>resources/images/01.jpg">
     用户“DeathGhost”对[ 老李川菜馆 ]“酸辣土豆丝”评说：味道挺不错，送餐速度挺快...
    </li>
    <li>
     <img src="<%=basePath %>resources/images/02.jpg">
     用户“DeathGhost”对[ 魏家凉皮 ]“酸辣土豆丝”评说：味道挺不错，送餐速度挺快...
    </li>
   </ul>
  </div>
 </aside>
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
     <li><a href="pages/front/article_read.jsp"   title="标题">支付方式</a></li>
     <li><a href="pages/front/article_read.jspl"   title="标题">配送方式</a></li>
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

<script type="text/javascript">
//****************根据食物名查询******************
$("#searchfood").click(function() {
	var food=$("#fkeyword").val();
	$.ajax({
        type: "post",
        url: "<%=basePath%>selectFood.shtml",
        data:{
        	food: food
             },
        dataType: "json",
        success:function(result){
		//刷新页面
		window.location.href="<%=basePath %>pages/front/search_p.jsp";
              }
       })
});
//****************根据食物名列表查询******************
$("#food").click(function() {
	var food=$("#food").html();
	alert(food);
	$.ajax({
        type: "post",
        url: "<%=basePath%>selectFood.shtml",
        data:{
        	food: food
             },
        dataType: "json",
        success:function(result){
		window.location.href="<%=basePath %>pages/front/search_p.jsp";
              }
       })
});

</script>
</body>
</html>
