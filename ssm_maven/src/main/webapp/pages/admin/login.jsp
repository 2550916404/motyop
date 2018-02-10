<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() +request.getContextPath()+"/";
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="<%=basePath%>/resources/css/style1.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="<%=basePath%>/resources/js/jquery.js"></script>
<script src="<%=basePath%>/resources/js/cloud.js" type="text/javascript"></script>

<script language="javascript">
	$(function(){
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
	$(window).resize(function(){  
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
    })  
});  
</script> 

</head>

<body style=" background-color:#1c77ac;  background-image:url(<%=basePath%>/resources/images1/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden; ">

    <div id="mainBody">
      <div id="cloud1" class="cloud"></div>
      <div id="cloud2" class="cloud"></div>
    </div>  


<div class="logintop">    
    <span>欢迎登录后台管理平台</span>    
    <ul>
  <!--   <li><a href="#">回首页</a></li>
    <li><a href="#">帮助</a></li>
    <li><a href="#">关于</a></li> -->
    </ul>    
    </div>
    
    <div class="loginbody">
    
    <span class="systemlogo"></span> 
       
    <div class="loginbox">
     <form action="<%=basePath %>superLogin.shtml" method="post">
  
     <ul>
    <li><input name="admin_user" type="text" class="loginuser" value="admin" onclick="JavaScript:this.value=''"/></li>
    <li><input name="admin_password" type="password" class="loginpwd" value="123" onclick="JavaScript:this.value=''"   placeholder="请输入6——18位字母或数字"/></li>
    <li><input name="button" type="submit" class="loginbtn" value="登录" onclick="JavaScript:this.value=''"/></li>
    </ul>

    </form>
    
    </div>
    
    </div>
    
    
    
    <div class="loginbm"></div>
</body>
</html>
