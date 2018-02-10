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
<title>店铺信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<style type="text/css">
	#allmap {width: 438px;height: 314px;font-family:"微软雅黑";}
</style>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=CP6MUWxQhz7PBsadhEbndEXcox1Xi9UQ"></script>
<link rel="stylesheet" href="<%=basePath %>resources/css/dialog.css">
<link href="<%=basePath %>resources/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath %>resources/js/public.js"></script>
<script type="text/javascript" src="<%=basePath %>resources/js/jquery.js"></script>
<script type="text/javascript" src="<%=basePath %>resources/js/jqpublic.js"></script>
<%-- <script type="text/javascript" src="<%=basePath %>resources/js/cart.js"></script> --%>
<script type="text/javascript" src="<%=basePath %>resources/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=basePath %>resources/js/jquery.min.js"></script><!-- 弹窗所需js及样式 -->
<script type="text/javascript" src="<%=basePath %>resources/js/dialog.js"></script>
<%-- <link rel="stylesheet" href="<%=basePath %>resources/css/global.css"> --%>
<style type="text/css">/* 弹窗样式 */
.div-testDialog{
	width: 500px;
	height: auto;
	margin: 50px auto;
}

.div-testDialog button{
	margin:  10px;
}
</style>
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
	var mt = 0;
window.onload = function () {
 var Topcart = document.getElementById("Topcart");
   var mt = Topcart.offsetTop;
    window.onscroll = function () {
     var t = document.documentElement.scrollTop || document.body.scrollTop;
      if (t > mt) {
      Topcart.style.position = "fixed";
        Topcart.style.margin = "";
         Topcart.style.top = "200px";
		 Topcart.style.right = "191px";
		 Topcart.style.boxShadow ="0px 0px 20px 5px #cccccc";
		 Topcart.style.top="0";
		 Topcart.style.border="1px #636363 solid";
         }
         else { 
         Topcart.style.position = "static";
		 Topcart.style.boxShadow ="none";
		 Topcart.style.border="";
          }
          }
        }
</script>

</head>
<body>
<%@ include file="top.jsp" %>

<!--Start content-->
<section class="Shop-index">
 <article>
  <div class="shopinfor">
   <div class="title">
    <img src="<%=basePath %>resources/images2/${Shop.shopImagepath}" class="shop-ico">
    <span>${Shop.shopName }</span>
    <span>
    <c:forEach  begin="1" end="${Shop.grade}"  step="1" >
	    <img src="<%=basePath %>resources/images/star-on.png">
	</c:forEach>
	<c:forEach  begin="${Shop.grade}" end="4"  step="1" >
		<img src="<%=basePath %>resources/images/star-off.png">
    </c:forEach>
     <%-- <img src="<%=basePath %>resources/images/star-on.png">
     <img src="<%=basePath %>resources/images/star-on.png">
     <img src="<%=basePath %>resources/images/star-on.png">
     <img src="<%=basePath %>resources/images/star-on.png">
     <img src="<%=basePath %>resources/images/star-off.png"> --%>
    </span>
    <span>${Shop.grade }</span>
   </div>
   <div class="imginfor">
    <div class="shopimg">
     <img src="<%=basePath %>resources/images2/${Shop.shopImagepath}" id="showimg">
      <ul class="smallpic">
       <li><img src="<%=basePath %>resources/images2/${Shop.shopImagepath}" onmouseover="show(this)" onmouseout="hide()"></li>
      </ul>
    </div>
    <div class="shoptext">
     <p><span>地址：</span>${Shop.shopAddress }</p>
     <p><span>电话：</span>${Shop.shopPhone }</p>
     <p><span>特色菜品：</span>${Shop.specialties }</p>
     <p><span>优惠活动：</span>${Shop.activity }</p>
     <p><span>停车位：</span>${Shop.parkingSpace }</p>
     <p><span>营业时间：</span>${Shop.openingHours }</p>
     <p><span>WIFI：</span>${Shop.wifi }</p>
     <p><span>价格：</span>${Shop.price }元</p>
     <input type="hidden" id="Vurl" value="<%=basePath %>selectShop.shtml?id=${Shop.id }"><!-- 网页地址 -->
     <input type="hidden" id="Vtitle" value="${Shop.shopName }"><!-- 标题 -->
     <input type="hidden" id="Vsummary" value="${Shopdetail.shopDesc }"><!-- 正文内容 -->
     <input type="hidden" id="Vpic" value="<%=basePath %>resources/images2/${Shop.shopImagepath}"><!-- 图片路径 -->
     
     <div class="Button">
      <a href="getMenuByshop.shtml?id=${Shop.id }"><span class="DCbutton">查看菜谱点菜</span></a>
     </div>
     <div class="otherinfor">
     <a id="collection" href="javascript:void(0)" class="icoa">
     <img src="<%=basePath %>resources/images/collect.png">收藏店铺&nbsp;&nbsp;&nbsp;<!-- （<span id="count">1293</span>） -->
     <input type="hidden" value="${Shop.id }">
     </a>
     <script type="text/javascript">
     	var $sid=$("#collection input[type=hidden]").val();//隐藏表单域中的店铺id
     	var $count=$("#count").text();//收藏总数
     	$("#collection").click(function(){
     		$.ajax({
    			url:"<%=basePath%>/collAdd.shtml",
    					type : "post",
    					data : {
    						sid:$sid
    					},
    					dataType : "json",
    					success : function(result) {
    						var flag=result;
    						if (flag>0) {//收藏成功
    							/* alert("收藏成功!"); */
    							$('body').dailog({type:'danger',title:'提示：',discription:'收藏成功!'});
							} else if(flag==0) {//收藏失败
								/* alert("收藏失败"); */
								$('body').dailog({type:'danger',title:'提示：',discription:'收藏失败!'});
							} else if(flag==-1){//已收藏，请不要重复收藏
								/* alert("已收藏，请不要重复操作"); */
								$('body').dailog({type:'danger',title:'提示：',discription:'已收藏，请不要重复操作!'});
							} else{//用户未登录或有未知错误
								/* alert("您未登录或有未知错误!"); */
								$('body').dailog({type:'danger',title:'提示：',discription:'您还未登录!'});
							}
    					}
    			});
     	});
     
     </script>
     
     <div class="bshare-custom"><a title="分享" class="bshare-more bshare-more-icon more-style-addthis">分享</a></div>
	 <script type="text/javascript" charset="utf-8" src="resources/js/fenxiang1.js"></script><script type="text/javascript" charset="utf-8" src="resources/js/fenxiang2.js"></script>
     </div>
   </div>
  </div>
  <div class="shopcontent">
  <div class="title2 cf">
    <ul class="title-list fr cf ">
      <li class="on">菜谱</li>
      <li>累计评论</li>
      <li>商家详情</li>
      <li>店铺留言</li>
      <p><b></b></p>
    </ul>
  </div>
  <div class="menutab-wrap">
   <a name="ydwm">
    <!--case1-->
    <div class="menutab show">
     <ul class="products">
     <c:forEach items="${Menus }" var="m">
	     <li>
			 <a href="detailspMenu.shtml?id=${m.id }">
	         <img src="<%=basePath %>resources/images2/${m.caiImagepath }" class="foodsimgsize">
	         </a>
	          <a href="#" class="item">
			 <div>
			  <p>${m.caiName }</p>
			  <p class="AButton">加入购物车:￥${m.oldPrice }</p>
			 </div>
			 </a>
			</li>
     </c:forEach>
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
	 </ul>
    </div>
    </a>
    <!--case2-->
    <div class="menutab">
     <div class="shopcomment">
      <div class="Spname">
       <a href="#"   title="酸辣土豆丝">酸辣土豆丝</a>
      </div>
      <div class="C-content">
       <q>还不错，速度挺快。。。</q>
       <i>2014年09月17日 19:36 </i>
      </div>
      <div class="username">
                       张三
      </div>
     </div>
    </div>
    <!--case4-->
    <div class="menutab">
     <div class="shopdetails">
     <div class="shopmaparea" id="allmap">
      <%-- <img src="<%=basePath %>resources/images2/waipojiaditu.jpg"> --%><!--此处占位图调用动态地图后将其删除即可-->
     </div>
     <div class="shopdetailsT">
      <p><span>店铺：</span>${Shopdetail.shopName }</p>
      <p><span>地址：</span>${Shopdetail.address }</p>
      <p><span>电话：</span>${Shopdetail.phone }</p>
      <p><span>乘车路线：</span>${Shopdetail.route }</p>
      <p><span>店铺介绍：</span>${Shopdetail.shopDesc }</p>
     </div>
    </div>
    </div>
    <!--case5-->
    <div class="menutab">
    <c:forEach items="${Messages}" var="ms">
       <span class="Answer"><i>${ms.name }</i>：${ms.supplement }！</span>
    </c:forEach>
       <span class="Answer"><i>管理员回复</i>：这里是测试回答！</span>

     <form class="A-Message" action="<%=basePath %>addMessage.shtml" method="post"> 
      <p><i>姓名：</i><input name="name" type="text" required></p>
      <p><i>手机：</i><input name="phone" type="text" pattern="^1[3578][0-9]{9}$" ></p>
      <p><i>邮件：</i><input type="email" name="email" /></p>
      <p><i>问题补充：</i><textarea name="supplement" cols="" rows="" required placeholder="详细说明您的问题..."></textarea></p>
      <p><input type="submit" class="Abutt"/></p>
     </form>
    </div>
  </div>
</div>
 </article>
 <aside>
  <!-- <div class="cart" id="Topcart">
	<span class="Ctitle Block FontW Font14"><a href="pages/front/cart.jsp" >我的购物车</a></span>
	<table id="cartcontent" fitColumns="true">
	<thead>
	<tr>
	<th width="33%" align="center" field="name">商品</th>
	<th width="33%" align="center" field="quantity">数量</th>
	<th width="33%" align="center" field="price">价格</th>
	</tr>
	</thead>
	</table>
	<p class="Ptc"><span class="Cbutton"><a href="pages/front/cart.jsp" target="进入购物车">进入购物车</a></span><span class="total">共计金额: ￥0</span></p>
  </div> -->
  
  <%-- <div class="Nearshop">
   <span class="Nstitle">附近其他店铺</span>
   <ul>
    <li>
     <img src="<%=basePath %>resources/images/cc.jpg">
     <p>
     <span class="shopname" title="动态调用完整标题"><a href="pages/front/detailsp.jsp"   title="肯德基">肯德基</a></span>
     <span class="Discolor">距离：1.2KM</span>
     <span title="完整地址title">地址：西安市雁塔区2000号...</span>
     </p>
    </li>
   </ul>
  </div> --%>
  
  <div class="History">
   <span class="Htitle">浏览历史</span>
   <ul class="box">
   <c:forEach items="${sessionScope.historyShopList }" var="history">
    <li>
    <a href="selectShop.shtml?id=${history.id }" title="${history.shopName }"><img src="<%=basePath %>resources/images2/${history.shopImagepath }"></a>
    <p>
     <span class="shopname" title="${history.shopName }"><a href="selectShop.shtml?id=${history.id }" title="${history.shopName }">${history.shopName }</a></span>
     <span>${history.shopAddress }</span>
    </p>
    </li>
    </c:forEach>
    <span>[ <a href="javascript:void(0)" class="cleanCookie">清空历史记录</a> ]</span>
   </ul>
  </div>
  <script type="text/javascript">
  $(".cleanCookie").click(function(){
	  $.ajax({
			url : "<%=basePath%>/historyClean.shtml",
			type : "post",
			data : {
				ok : "ok"
			},
			dataType : "json",
			success : function(result) {
				
			}
		});
	$(".box").html("<span>[ <a href='javascript:void(0)' class='cleanCookie'>清空历史记录</a> ]</span>");
  });
  
  </script>
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

<script type="text/javascript">
//****************根据食物名查询******************
$("#searchfood").click(function() {
	var food=$("#fkeyword").val();
	alert(food);
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

//百度地图API功能
var map = new BMap.Map("allmap");
var point = new BMap.Point(116.331398,39.897445);
map.centerAndZoom(point,12);
map.enableScrollWheelZoom(true);//开启鼠标滚轮缩放
//覆盖区域图层测试
//map.addTileLayer(new BMap.PanoramaCoverageLayer());
var stCtrl = new BMap.PanoramaControl(); //构造全景控件
stCtrl.setOffset(new BMap.Size(20, 20));
//map.addControl(stCtrl);//添加全景控件
// 创建地址解析器实例
var myGeo = new BMap.Geocoder();
// 将地址解析结果显示在地图上,并调整地图视野
myGeo.getPoint("${Shopdetail.address }", function(point){
	if (point) {
		map.centerAndZoom(point, 16);
		map.addOverlay(new BMap.Marker(point));
	}else{
		alert("您选择地址没有解析到结果!");
	}
}, "北京市");

</script>

</body>
</html>
