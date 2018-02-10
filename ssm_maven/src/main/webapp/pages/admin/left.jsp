<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
					+ request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="<%=basePath%>/resources/css/style1.css" rel="stylesheet"
	type="text/css" />
<script language="JavaScript" src="<%=basePath%>/resources/js/jquery.js"></script>

 
 
 
 
 
 
 <script type="text/javascript">
$(function(){	
	//导航切换
	$(".menuson li").click(function(){
		$(".menuson li.active").removeClass("active")
		$(this).addClass("active");
	});
	
	$('.title').click(function(){
		var $ul = $(this).next('ul');
		$('dd').find('ul').slideUp();
		if($ul.is(':visible')){
			$(this).next('ul').slideUp();
		}else{
			$(this).next('ul').slideDown();
		}
	});
})	
</script>


</head>

<body style="background:#f0f9fd;">
	<!-- <div class="lefttop"><span></span>通讯录</div> -->
    
    <dl class="leftmenu">
        
    <dd>
    <div class="title">
    &nbsp;&nbsp;<span><img src="<%=basePath%>/resources/images1/caipinleftico02.png" /></span>用户管理
    </div>
    	<ul class="menuson">
        <li><cite></cite><a href="<%=basePath%>selectAll.shtml" target="rightFrame">用户信息</a><i></i></li>
      <li><cite></cite><a href="<%=basePath%>selectAllMessage.shtml" target="rightFrame">留言管理</a><i></i></li>
       
        </ul>    
    </dd>
        
    
    <dd>
    <div class="title">
    &nbsp;&nbsp;<span><img src="<%=basePath%>/resources/images1/caipinleftico01.png" /></span>网站管理</div>
    
   <ul class="menuson">
       
         <li><cite></cite><a href="<%=basePath%>/zcp/findHistory.shtml" target="rightFrame">浏览历史</a><i></i></li>
     <%--  <li><cite></cite><a href="<%=basePath%>selectAll.shtml" target="rightFrame">常用资料</a><i></i></li> --%>
        <li><cite></cite><a href="<%=basePath%>/zcp/findOrdering.shtml" target="rightFrame">订单详情</a><i></i></li>
        <li><cite></cite><a href="<%=basePath%>/zcp/findMenu.shtml" target="rightFrame">查看菜单</a><i></i></li>
        <li><cite></cite><a href="<%=basePath%>/zcp/findShop.shtml" target="rightFrame">商家详情</a><i></i></li>
        </ul>    
    </dd> 
    
    
    <dd><div class="title">&nbsp;&nbsp;<span><img src="<%=basePath%>/resources/images1/caipinleftico04.png" /></span>编辑器</div>
    <ul class="menuson">
       
    </ul>
    </dd>  
    
    
    <dd><div class="title">&nbsp;&nbsp;<span><img src="<%=basePath%>/resources/images1/caipinleftico03.png" /></span>后台管理</div>
    <ul class="menuson">
        <li><cite></cite><a href="<%=basePath%>looktext.shtml" target="rightFrame">日志查看</a><i></i></li>
        <li><cite></cite><a href="#">常用资料</a><i></i></li>
        <li><cite></cite><a href="#">信息列表</a><i></i></li>
        <li><cite></cite><a href="#">其他</a><i></i></li>
    </ul>
    
    </dd>   
    
    </dl>
</body>
 
 
	

</html>
