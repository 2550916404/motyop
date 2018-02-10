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
<title>订餐页面</title>
<link href="<%=basePath %>resources/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath %>resources/js/public.js"></script>
<script type="text/javascript" src="<%=basePath %>resources/js/jquery.js"></script>
<script type="text/javascript" src="<%=basePath %>resources/js/jqpublic.js"></script>
<script type="text/javascript" src="<%=basePath %>resources/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="<%=basePath %>resources/js/jquery.page.js" charset="utf-8"></script>
<style type="text/css">
*{ margin:0; padding:0; list-style:none;}
a{ text-decoration:none;}
a:hover{ text-decoration:none;}
.TurnPage{padding: 15px 20px;text-align: left;color: #ccc;text-align:center;}
.TurnPage a{display: inline-block;color: #666;display: inline-block;height: 25px;	line-height: 25px;	padding: 0 10px;border: 1px solid #ddd;	margin: 0 2px;border-radius: 4px;vertical-align: middle;}
.TurnPage a:hover{text-decoration: none;border: 1px solid #666220;}
.TurnPage span.current{display: inline-block;height: 25px;line-height: 25px;padding: 0 10px;margin: 0 2px;color: #fff;background-color: #F76220; border: 1px solid #428bca;border-radius: 4px;vertical-align: middle;}
.TurnPage span.disabled{	display: inline-block;height: 25px;line-height: 25px;padding: 0 10px;margin: 0 2px;	color: #bfbfbf;background: #f2f2f2;border: 1px solid #bfbfbf;border-radius: 4px;vertical-align: middle;}
</style>
</head>
<body>
<header>
 <section class="Topmenubg">
  <div class="Topnav">
   <div class="LeftNav">
    <a href="pages/front/register.jsp">注册</a>/<c:choose><c:when test="${sessionScope.username!=null}">欢迎您,${sessionScope.username}</c:when><c:otherwise><a href="pages/front/login2.jsp">登录</a></c:otherwise></c:choose><a href="#">QQ客服</a><a href="#">微信客服</a><a href="#">手机客户端</a>
   </div>
   <div class="RightNav">
    <a href="pages/front/user_center.jsp">用户中心</a> <a href="<%=basePath %>serbeyOrdering.shtml"  title="我的订单">我的订单</a> <a href="<%=basePath %>showCart.shtml">购物车</a> <a href="collSelect.shtml"   title="我的收藏">我的收藏</a> <a href="pages/front/merchant.jsp">商家入驻</a>
   </div>
  </div>
 </section>
 <div class="Logo_search">
  <div class="Logo">
   <a href="pages/front/index.jsp"><img src="<%=basePath %>resources/images/logo.jpg"></a>
   <i></i>
   <span>北京市 [ <a href="#">朝阳区</a> ]</span>
  </div>
  <div class="Search"> 
   <form method="get" id="main_a_serach" onsubmit="return check_search(this)">
   <div class="Search_nav" id="selectsearch">
    <!-- <a href="javascript:;" onClick="selectsearch(this,'restaurant_name')" class="choose">餐厅</a> -->
    <a href="javascript:void(0);" onClick="selectsearch(this,'food_name')" class="choose">食物名</a>
   </div>
   <div class="Search_area"> 
   <input type="search" id="fkeyword" name="keyword" placeholder="请输入您所需查找的食物名称..." class="searchbox" />
   <input type="button" id="searchfood" class="searchbutton" value="搜 索" />
   </div>
   </form>
   <p class="hotkeywords">
   <c:forEach items="${Cainame }" var="cn">
   <a href="javascript:void(0)" onclick="selectCai('${cn.cai_name }')">${cn.cai_name }</a>
   </c:forEach>
   </p>
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
</header>
<!--Start content-->
<section class="Psection">
 <section class="fslist_navtree">
  <ul class="select">
		<li class="select-list">
			<dl id="select1">
				<dt>分类：</dt>
				<dd class="select-all selected"><a href="javascript:void(0);">全部</a></dd>
				<c:forEach items="${Caixi }" var="cx">
				<dd><a href="javascript:void(0);" id="type" onclick="selectCaixi('${cx.cai_xi }')">${cx.cai_xi }</a></dd>
				</c:forEach>
			</dl>
		</li>
		<li class="select-list">
			<dl id="select2">
				<dt>位置：</dt>
				<dd class="select-all selected"><a href="javascript:void(0);">全部</a></dd>
				<c:forEach items="${Caiadds }" var="ca">
				<dd><a href="javascript:void(0);" id="diqu" onclick="selectDiqu('${ca.diqu }')">${ca.diqu }</a></dd>
				</c:forEach>
			</dl>
		</li>
		<li class="select-list">
			<dl id="select3">
				<dt>餐点：</dt>
				<dd class="select-all selected"><a href="javascript:">全部</a></dd>
				<c:forEach items="${Caitype }" var="ct">
				<dd><a href="javascript:void(0);" id="candain" onclick="selectType('${ct.cai_type }')">${ct.cai_type }</a></dd>
				</c:forEach>
			</dl>
		</li>
        <!-- <li class="select-list">
			<dl id="select4">
				<dt>价位区间：</dt>
				<dd class="select-all selected"><a href="javascript:">全部</a></dd>
				<dd><a href="javascript:" id="price">20元以下</a></dd>
                <dd><a href="javascript:">20-40元</a></dd>
                <dd><a href="javascript:">40-60元</a></dd>
                <dd><a href="javascript:">60-80元</a></dd>
                <dd><a href="javascript:">80-100元</a></dd>
			</dl>
		</li> -->
		<!-- <li class="select-result">
			<dl>
			 <dd class="select-no">已选择：</dd>
			</dl>
		</li> -->
	</ul>
 </section>
<section class="Fslmenu">
 <a href="#" title="默认排序">
  <span>
  <span>默认排序</span>
  <span></span>
  </span>
 </a>
 <a href="javascript:void(0);" title="评价" id="paixuBygrade">
  <span>
  <span>评价</span>
  <span class="s-up"></span>
  </span>
 </a>
 <a href="javascript:void(0);" title="销量">
  <span>
  <span>销量</span>
  <span class="s-up"></span>
  </span>
 </a>
 <a href="javascript:void(0);" title="价格排序" id="paixuByprice">
  <span>
  <span>价格</span>
  <span class="s-down"></span>
  </span>
 </a>
 <!-- <a href="javascript:void(0);" title="发布时间排序">
  <span>
  <span>发布时间</span>
  <span class="s-up"></span>
  </span>
 </a> -->
</section>
<section class="Fsl">
 <ul id="content">
 
 <c:forEach items="${Menulist }" var="ml">
	 <li>
	   <a href="detailspMenu.shtml?id=${ml.id }" ><img src="<%=basePath %>resources/images2/${ml.cai_imagepath }"></a>
	   <hgroup>
	   <h3>${ml.cai_name }</h3>
	   <h4></h4>
	   </hgroup>
	   <p>菜系：${ml.cai_xi }</p>
	   <p>地址：${ml.shop_address }</p>
	   <p>人均：${ml.price }元</p>
	   <p>
	    <span class="Score-l">
	    <c:forEach  begin="1" end="${ml.grade}"  step="1" >
	    <img src="<%=basePath %>resources/images/star-on.png">
		</c:forEach>
		<c:forEach  begin="${ml.grade}" end="4"  step="1" >
			<img src="<%=basePath %>resources/images/star-off.png">
	    </c:forEach>
	    <span class="Score-v">${ml.grade }</span>
	    </span>
	    <a href="detailspMenu.shtml?id=${ml.id }" class="Fontfff"><span class="DSBUTTON">点外卖</span></a>
	   </p>
	  </li>
 </c:forEach>
 
 </ul>
 <aside>
  <div class="title">热门商家</div>
  <div class="C-list">
   <a href="javascript:void(0);"><img src="<%=basePath %>resources/images/remen1.png" style="width: 284px;height: 200px;"></a>
   <p><a href="javascript:void(0);"  >[大雁塔]NoodleSong</a></p>
   <p>
   <span>人均：20~50元</span>
   <span style=" float:right">
    <img src="<%=basePath %>resources/images/star-on.png">
    <img src="<%=basePath %>resources/images/star-on.png">
    <img src="<%=basePath %>resources/images/star-on.png">
    <img src="<%=basePath %>resources/images/star-on.png">
    <img src="<%=basePath %>resources/images/star-off.png">
    <span class="ALscore">4.8</span>
   </span>
   </p>
  </div>
  <div class="C-list">
   <a href="javascript:void(0);"><img src="<%=basePath %>resources/images/remen2.jpg" style="width: 284px;height: 200px;"></a>
   <p><a href="javascript:void(0);"  >[大雁塔]度小月</a></p>
   <p>
   <span>人均：20~50元</span>
   <span style=" float:right">
    <img src="<%=basePath %>resources/images/star-on.png">
    <img src="<%=basePath %>resources/images/star-on.png">
    <img src="<%=basePath %>resources/images/star-on.png">
    <img src="<%=basePath %>resources/images/star-on.png">
    <img src="<%=basePath %>resources/images/star-off.png">
    <span class="ALscore">4.8</span>
   </span>
   </p>
  </div>
 </aside>
 <!-- 分页 -->
 <div class="TurnPage"></div>
 
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
     <li><a href="pages/front/article_read.jsp" title="标题">支付方式</a></li>
     <li><a href="pages/front/article_read.jsp" title="标题">配送方式</a></li>
     <li><a href="pages/front/article_read.jsp" title="标题">配送效率</a></li>
     <li><a href="pages/front/article_read.jsp" title="标题">服务费用</a></li>
    </ul>
    </div>
    <div>
    <span><i class="i2"></i>关于我们</span>
    <ul>
     <li><a href="pages/front/article_read.jsp" title="标题">招贤纳士</a></li>
     <li><a href="pages/front/article_read.jsp" title="标题">网站介绍</a></li>
     <li><a href="pages/front/article_read.jsp" title="标题">配送效率</a></li>
     <li><a href="pages/front/article_read.jsp" title="标题">商家加盟</a></li>
    </ul>
    </div>
    <div>
    <span><i class="i3"></i>帮助中心</span>
    <ul>
     <li><a href="pages/front/article_read.jsp" title="标题">服务内容</a></li>
     <li><a href="pages/front/article_read.jsp" title="标题">服务介绍</a></li>
     <li><a href="pages/front/article_read.jsp" title="标题">常见问题</a></li>
     <li><a href="pages/front/article_read.jsp" title="标题">网站地图</a></li>
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

//****************根据食物名列表查询**************
function selectCai(name) {
	//var food=$("#food").html();
	//alert(name);
	$.ajax({
        type: "post",
        url: "<%=basePath%>selectFood.shtml",
        data:{
        	food: name
             },
        dataType: "json",
        success:function(result){
		window.location.href="<%=basePath %>pages/front/search_p.jsp";
              }
       })
};

//****************根据食物分类查询******************
function selectType(type) {
	//var type=$("#type").html();
	//alert(type);
	$.ajax({
        type: "post",
        url: "<%=basePath%>selectFoodByType.shtml",
        data:{
        	type: type
             },
        dataType: "json",
        success:function(result){
		//局部刷新
		  $("#content").children().remove();
		  for(var i =0 ;i<=result.length;i++){
			  $("#content").append("<li>"+
			          "<a href='"+"detailspMenu.shtml?id="+result[i].id+"'>"+
			          "<img src='resources/images2/"+
			          result[i].cai_imagepath+"'></a>"+
			          "<hgroup>"+
					  "<h3>"+result[i].cai_name+"</h3>"+
					  "<h4></h4>"+
					  "</hgroup>"+
					  "<p>菜系："+result[i].cai_xi +"</p>"+
					  "<p>地址："+result[i].shop_address +"</p>"+
					  "<p>人均："+result[i].price +"元</p>"+
					  "<p>"+
					  "<span class='Score-l'>评价："+
					  "<span class='Score-v'>"+result[i].grade+" </span>"+ 
					  "</span>"+
					  "<a href='detailspMenu.shtml?id="+result[i].id+ "' class='Fontfff'><span class='DSBUTTON'>点外卖</span></a>"+
					  "</p>"+
					  "</li>");
		  }
              }
       })
};

//****************根据位置查询******************
function selectDiqu(diqu) {
	$.ajax({
        type: "post",
        url: "<%=basePath%>selectFoodByDiqu.shtml",
        data:{
        	diqu: diqu
             },
        dataType: "json",
        success:function(result){
		//局部刷新
		  $("#content").children().remove();
		  for(var i =0 ;i<=result.length;i++){
			  $("#content").append("<li>"+
			          "<a href='"+"detailspMenu.shtml?id="+result[i].id+"'>"+
			          "<img src='resources/images2/"+
			          result[i].cai_imagepath+"'></a>"+
			          "<hgroup>"+
					  "<h3>"+result[i].cai_name+"</h3>"+
					  "<h4></h4>"+
					  "</hgroup>"+
					  "<p>菜系："+result[i].cai_xi +"</p>"+
					  "<p>地址："+result[i].shop_address +"</p>"+
					  "<p>人均："+result[i].price +"元</p>"+
					  "<p>"+
					  "<span class='Score-l'>评价："+
					  "<span class='Score-v'>"+result[i].grade+" </span>"+ 
					  "</span>"+
					  "<a href='detailspMenu.shtml?id="+result[i].id+ "' class='Fontfff'><span class='DSBUTTON'>点外卖</span></a>"+
					  "</p>"+
					  "</li>");
		  }
              }
       })
};

//****************根据餐点查询******************
function selectCaixi(caixi) {
	$.ajax({
        type: "post",
        url: "<%=basePath%>selectFoodByCaixi.shtml",
        data:{
        	caixi: caixi
             },
        dataType: "json",
        success:function(result){
		//局部刷新
		  $("#content").children().remove();
		  for(var i =0 ;i<=result.length;i++){
			  $("#content").append("<li>"+
			          "<a href='"+"detailspMenu.shtml?id="+result[i].id+"'>"+
			          "<img src='resources/images2/"+
			          result[i].cai_imagepath+"'></a>"+
			          "<hgroup>"+
					  "<h3>"+result[i].cai_name+"</h3>"+
					  "<h4></h4>"+
					  "</hgroup>"+
					  "<p>菜系："+result[i].cai_xi +"</p>"+
					  "<p>地址："+result[i].shop_address +"</p>"+
					  "<p>人均："+result[i].price +"元</p>"+
					  "<p>"+
					  "<span class='Score-l'>评价："+
					  "<span class='Score-v'>"+result[i].grade+" </span>"+ 
					  "</span>"+
					  "<a href='detailspMenu.shtml?id="+result[i].id+ "' class='Fontfff'><span class='DSBUTTON'>点外卖</span></a>"+
					  "</p>"+
					  "</li>");
		  }
              }
       })
};

//****************按价格排序******************
$("#paixuByprice").click(function() {
	$.ajax({
        type: "post",
        url: "<%=basePath%>paixuByprice.shtml",
        dataType: "json",
        success:function(result){
		//局部刷新
		  $("#content").children().remove();
		  for(var i =0 ;i<=result.length;i++){
			  $("#content").append("<li>"+
			          "<a href='"+"detailspMenu.shtml?id="+result[i].id+"'>"+
			          "<img src='resources/images2/"+
			          result[i].cai_imagepath+"'></a>"+
			          "<hgroup>"+
					  "<h3>"+result[i].cai_name+"</h3>"+
					  "<h4></h4>"+
					  "</hgroup>"+
					  "<p>菜系："+result[i].cai_xi +"</p>"+
					  "<p>地址："+result[i].shop_address +"</p>"+
					  "<p>人均："+result[i].price +"元</p>"+
					  "<p>"+
					  "<span class='Score-l'>评价："+
					  "<span class='Score-v'>"+result[i].grade+" </span>"+ 
					  "</span>"+
					  "<a href='detailspMenu.shtml?id="+result[i].id+ "' class='Fontfff'><span class='DSBUTTON'>点外卖</span></a>"+
					  "</p>"+
					  "</li>");
		  }
              }
       })
});
//****************按评分排序******************
$("#paixuBygrade").click(function() {
	$.ajax({
        type: "post",
        url: "<%=basePath%>paixuBygrade.shtml",
        dataType: "json",
        success:function(result){
		//局部刷新
		  $("#content").children().remove();
		  for(var i =0 ;i<=result.length;i++){
			  $("#content").append("<li>"+
			          "<a href='"+"detailspMenu.shtml?id="+result[i].id+"'>"+
			          "<img src='resources/images2/"+
			          result[i].cai_imagepath+"'></a>"+
			          "<hgroup>"+
					  "<h3>"+result[i].cai_name+"</h3>"+
					  "<h4></h4>"+
					  "</hgroup>"+
					  "<p>菜系："+result[i].cai_xi +"</p>"+
					  "<p>地址："+result[i].shop_address +"</p>"+
					  "<p>人均："+result[i].price +"元</p>"+
					  "<p>"+
					  "<span class='Score-l'>评价："+
					  "<span class='Score-v'>"+result[i].grade+" </span>"+ 
					  "</span>"+
					  "<a href='detailspMenu.shtml?id="+result[i].id+ "' class='Fontfff'><span class='DSBUTTON'>点外卖</span></a>"+
					  "</p>"+
					  "</li>");
		  }
              }
       })
});

/***************分页的js******************/
var  num=${sessionScope.pages};
var  max=${sessionScope.max};
 $(".TurnPage").createPage({
     pageCount:max,
     current:num,  
     backFn:function(page){
     	//ajax将数据带到后台  
     	// alert(page); 
     	 $.ajax({
		 url:"<%=basePath %>/selectMenu2.shtml",
		 type:"post",
		 dataType:"json",
		 data:{"page":page},
	     success:function(result){
	    		 $("#content").children().remove();
	   		  for(var i =0 ;i<=result.length;i++){
	   			  $("#content").append("<li>"+
	   			          "<a href='"+"detailspMenu.shtml?id="+result[i].id+"'>"+
	   			          "<img src='resources/images2/"+
	   			          result[i].cai_imagepath+"'></a>"+
	   			          "<hgroup>"+
	   					  "<h3>"+result[i].cai_name+"</h3>"+
	   					  "<h4></h4>"+
	   					  "</hgroup>"+
	   					  "<p>菜系："+result[i].cai_xi +"</p>"+
	   					  "<p>地址："+result[i].shop_address +"</p>"+
	   					  "<p>人均："+result[i].price +"元</p>"+
	   					  "<p>"+
	   					  "<span class='Score-l'>评价："+
	   					  "<span class='Score-v'>"+result[i].grade+" </span>"+ 
	   					  "</span>"+
	   					  "<a href='detailspMenu.shtml?id="+result[i].id+ "' class='Fontfff'><span class='DSBUTTON'>点外卖</span></a>"+
	   					  "</p>"+
	   					  "</li>");
	    	 }
	   }
	   })
     }
 });

</script>

</body>
</html>
