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
</head>
<style type="text/css">
	li span{
	 display:inline-block;
	 color:red;
	 font-size: 13px;
	 margin-left:20px;
	}

</style>
<body>

	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="#">密码管理</a></li>
			<li><a href="#">修改密码</a></li>
		</ul>
	</div>

	<div class="formbody">

		<div class="formtitle">
			<span>修改密码</span>
			
			
		</div>
		<form action="<%=basePath%>updatePaswordAdmin.shtml" method="post"   id="xiugaiadmin">
			<ul class="forminfo">
				<li><label>管理员</label><input name="admin_user" type="text" class="dfinput" value=" ${admin_user} " /><span id="warnTitle"></span></li>
				
				<li><label>请输入原密码</label><input name="password" type="password" class="dfinput" id="yanZhengPassword" onclick="yanZhengPassword(${admin_user})"} " /><span id="warnTitle1"></span></li>
			<li><label>请输入新密码</label><input name="password1" type="password" class="dfinput" id="yanZhengPassword" "} " placeholder="请输入6——18位字母或数字"/><span id="warnTitle"></span></li>
			<li><label>请再次输入密码</label><input name="password2" type="password" class="dfinput" id="yanZhengPassword" "} " placeholder="请再次输入密码确认"/><span id="warnTitle11"></span></li>
				</select>
				</li>
				
				
				
				
				<li><label>&nbsp;</label><input type="submit" class="btn"
					value="确认保存" id="buttonSub" /> <input type="button" class="btn"
					id="fanhui" value="取消" /></li>
			</ul>
		</form>
	</div>
</body>

<script type="text/javascript">

<%-- function yanZhengPassword(username){
	var pd = document.getElementById("#yanZhengPassword");
	
	$.blur({
		
		ajax({
			type:"post",
			url:'<%=basePath%>yanZhengPassword.shtml',
			data:{"pd" :pd  ,"username" :username }
			success:function(flag){
				if(flag){}
				elese{
					
					
				}
				
				
			}
			
			
			
		})
		
		
		
		
		
	}) --%>
	
	
	
	
	
	
	
	
	
	
	
	  //再次输入的密码验证
	   $('input[name="password2"]').blur(function(){
	    	var pwd = $('input[name="password1"]').val(); // 输入密码
	    	var repwd = $('input[name="password2"]').val(); // 再次输入密码
	    	//var $pwd = $("#warnPwd1");
	    	//alert(pwd);
	    	//alert(repwd);
	    	//$pwd.html("");
	    	if (pwd!=repwd) {
	    		$("#warnTitle11").text("两次输入的密码不同！");
	    	}else{	
	    		$("#warnTitle11").html("<font color='green'>密码正确</font>");
	    	}
	    
	    	
	    });
	
	
		/* function checkEmail(){
			var memail=$("input[name=memail]").val();
			var patternEmail=/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
			if(memail==null||memail==""){
				$("#warnEmail").html("*邮箱不能为空！");
				return false;
			}
			if(!patternEmail.test(memail)){
				$("#warnEmail").html("*请输入正确的邮箱！");
				return false;
			}
			$("#warnEmail").html("");
			return true;
		} */
	
	
	
	
	
	
	
	
	
	
	$(function(){
		//给username派发一个失去焦点事件 发送ajax请求
		$("input[name='password']").blur(function(){
			//获取输入的值
			var $value=$(this).val();
			//alert($value);
			
			$.get("<%=basePath%>yanZhengPassword.shtml","password="+$value,function(d){
				//alert(d);
				if(d){
					$("#warnTitle1").html("<font color='green'>密码正确</font>");
				}else{
					$("#warnTitle1").html("<font color='red'>密码错误</font>");
				}
			});
		});
	})
	
	
	
	
	





	<%-- $(document).ready(function(){
		$("#fanhui").click(function(){
			window.location.href='<%=basePath%>/selectAll.shtml';
		});
	});
	$(document).ready(function() {
		$("input[name=title]").blur(checkTitle);
		$("#buttonSub").click(function() {
			var flag = true;
			if (!checkTitle()) {
				flag = false;
			}
			return flag;
		});
	});

	function checkTitle() {
		var title = $("input[name=newPassword]").val().trim();
		if (title == null || title == "") {
			$("#warnTitle11").html("*题目不能为空！");
			return false;
		}
		$("#warnTitle11").html("");
		return true;
	} --%>
</script>
</html>
