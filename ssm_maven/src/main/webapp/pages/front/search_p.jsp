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
<title>搜索食物页面</title>
<link href="<%=basePath %>resources/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath %>resources/js/public.js"></script>
<script type="text/javascript" src="<%=basePath %>resources/js/jquery.js"></script>
<script type="text/javascript" src="<%=basePath %>resources/js/jqpublic.js"></script>
</head>
<body>
<header>
 <section class="Topmenubg">
  <div class="Topnav">
   <div class="LeftNav">
    <a href="pages/front/register.jsp">注册</a>/<c:choose><c:when test="${sessionScope.username!=null}">欢迎您,${sessionScope.username}</c:when><c:otherwise><a href="pages/front/login2.jsp">登录</a></c:otherwise></c:choose><a href="#">QQ客服</a><a href="#">微信客服</a><a href="#">手机客户端</a>
   </div>
   <div class="RightNav">
    <a href="pages/front/user_center.jsp">用户中心</a> <a href="<%=basePath %>serbeyOrdering.shtml"   title="我的订单">我的订单</a> <a href="<%=basePath %>showCart.shtml">购物车（0）</a> <a href="collSelect.shtml"   title="我的收藏">我的收藏</a> <a href="pages/front/merchant.jsp">商家入驻</a>
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
   <form method="post" id="main_a_serach" onsubmit="return check_search(this)">
   <div class="Search_nav" id="selectsearch">
    <!-- <a href="javascript:;" onClick="selectsearch(this,'restaurant_name')" class="choose">餐厅</a> -->
    <a href="javascript:;" onClick="selectsearch(this,'food_name')" id="food" class="choose">食物名</a>
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
   <li><a href="pages/front/index.jsp">首页</a></li>
   <li><a href="pages/front/list.jsp">订餐</a></li>
   <li><a href="pages/front/category.jsp">积分商城</a></li>
   <li><a href="pages/front/article_read.jsp">关于我们</a></li>
  </ul>
 </nav>
</header>
<!--Start content-->
<section class="Psection MT20">
 <article class="Searchlist Overflow">
  <section class="Fslmenu slt" style="margin-bottom:5px">
   <a href="#" title="默认排序">
   <span>
   <span>默认排序</span>
   </span>
   </a>
   <a href="#" title="评价">
   <span>
   <span>评价</span>
   <span class="s-up"></span>
   </span>
   </a>
   <a href="#" title="销量">
   <span>
   <span>销量</span>
   <span class="s-up"></span>
   </span>
   </a>
   <a href="#" title="价格排序">
   <span>
   <span>价格</span>
   <span class="s-down"></span>
   </span>
   </a>
  </section>
  <ul class="Overflow">
  
  <c:forEach items="${Food }" var="f">
	  <li>
	    <a href="detailspMenu.shtml?id=${f.id }" ><img src="<%=basePath %>resources/images2/${f.cai_imagepath }"></a>
	    <p class="P-price FontW Font16"><span>￥${f.old_price }</span></p>
	    <p class="P-title"><a href="pages/front/detailsp.jsp">${f.cai_name }</a></p>
	    <p class="P-shop Overflow"><span class="sa"><a href="pages/front/shop.jsp">${f.shop_name }</a></span><span class="sp">北京·${f.diqu }</span></p>
	  </li>
  </c:forEach>
  
  </ul>
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
 </article>
 <aside class="Sraside">
  <div class="bestproduct">
  <span class="Bpt Block FontW Font14">热销商品推荐</span>
  <ul>
   <li>
    <a href="pages/front/detailsp.jsp" title="酸辣土豆丝"  ><img src="<%=basePath %>resources/images/02.jpg"></a>
    <p>
     <span class="Block FontW Font16 CorRed">￥59.00</span>
     <span class="Block Overflow"><a href="pages/front/detailsp.jsp" title="酸辣土豆丝"  >酸辣土豆丝</a></span>
     <span class="Block Overflow">累计销量：<i>255</i>笔</span>
    </p>
   </li>
  </ul>
  </div>
  <!--广告位或其他推荐版块-->
  <img src="<%=basePath %>resources/images/ggw.jpg">
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

</script>
</body>
</html>
