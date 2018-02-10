<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() +request.getContextPath()+"/";
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="<%=basePath%>/resources/css/style1.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="<%=basePath%>/resources/js/jquery.js"></script>
<script type="text/javascript">
$(function(){	
	//顶部导航切换
	$(".nav li a").click(function(){
		$(".nav li a.selected").removeClass("selected")
		$(this).addClass("selected");
	})	
})	
</script>
</head>

<%-- <body style="background:url(<%=basePath%>/resources/images1/topbg.gif) repeat-x;">

    <div class="topleft">
    <a href="#"><img src="<%=basePath%>/resources/images1/logo.png" title="系统首页" /></a>
    </div>
        
    <div class="topright">    
    <ul>
    <li><span><img src="<%=basePath%>/resources/images1/help.png" title="帮助"  class="helpimg"/></span><a href="#">帮助</a></li>
    <li><a href="#">关于</a></li>
    <li><a href="#">退出</a></li>
    </ul>
     
    <div class="user">
   <!--  <span>admin</span>
    <i>消息</i>
    <b>0</b> -->
    </div>    
    
    </div>
</body> --%>

<body style="background:url(<%=basePath%>/resources/images1/topbg001.gif)  repeat-x    ;">

    <div class="topleft">
    <img src="<%=basePath%>/resources/images1/logo002.png" title="系统首页" /></a>
    </div>
        
    <ul class="nav">

  <%--   <li><a href="default.html" target="rightFrame" class="selected"><img src="<%=basePath%>/resources/images1/icon01.png" title="工作台" /><h2>工作台</h2></a></li>
=======
   <%--  <li><a href="default.html" target="rightFrame" class="selected"><img src="<%=basePath%>/resources/images1/icon01.png" title="工作台" /><h2>工作台</h2></a></li>
>>>>>>> .r111
    <li><a href="imgtable.html" target="rightFrame"><img src="<%=basePath%>/resources/images1/icon02.png" title="模型管理" /><h2>模型管理</h2></a></li>
    <li><a href="imglist.html"  target="rightFrame"><img src="<%=basePath%>/resources/images1/icon03.png" title="模块设计" /><h2>模块设计</h2></a></li>
    <li><a href="tools.html"  target="rightFrame"><img src="<%=basePath%>/resources/images1/icon04.png" title="常用工具" /><h2>常用工具</h2></a></li>
    <li><a href="computer.html" target="rightFrame"><img src="<%=basePath%>/resources/images1/icon05.png" title="文件管理" /><h2>文件管理</h2></a></li>
    <li><a href="tab.html"  target="rightFrame"><img src="<%=basePath%>/resources/images1/icon06.png" title="系统设置" /><h2>系统设置</h2></a></li> --%>
    </ul> 
            
    <div class="topright">    
    <ul>
   <%--  <li><span><img src="<%=basePath%>/resources/images1/help.png" title="帮助"  class="helpimg"/></span><a href="#">帮助</a></li> --%>
    <li><a href="<%=basePath%>/pages/admin/xiuGaiPassword.jsp"   target="rightFrame">修改密码</a></li>
    <li><a href="<%=basePath%>toLogin.shtml" target="_parent">退出</a></li>
    </ul>
     
    <div class="user">
    <span>    ${admin_user}        </span>
    <!-- <i>消息</i>
    <b>5</b> -->
    </div>    
    
    </div>
</body>





</html>
