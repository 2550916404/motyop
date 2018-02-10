<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<header>
 <section class="Topmenubg">
  <div class="Topnav">
   <div class="LeftNav">
    <a href="pages/front/register.jsp">注册</a>/<c:choose><c:when test="${sessionScope.username!=null}">欢迎您,${sessionScope.username}</c:when><c:otherwise><a href="pages/front/login2.jsp">登录</a></c:otherwise></c:choose><a href="#">QQ客服</a><a href="#">微信客服</a><a href="#">手机客户端</a>
   </div>
   <div class="RightNav">
    <a href="<%=basePath %>yanzheng.shtml">用户中心</a> <a href="<%=basePath %>yanzheng.shtml"  title="我的订单">我的订单</a> <a href="<%=basePath %>showCart.shtml">购物车</a> <a href="<%=basePath %>collSelect.shtml"   title="我的收藏">我的收藏</a> <a href="pages/front/merchant.jsp">商家入驻</a>
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