<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() +request.getContextPath()+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath %>">
<meta charset="UTF-8">
<title>Sign Up Login</title>
<link rel="stylesheet" href="<%=basePath %>/resources/css/login.css">
</head>

<body>

<div class="cotn_principal">
  <div class="cont_centrar">
    <div class="cont_login">
	
      <div class="cont_info_log_sign_up">
        <div class="col_md_login">
          <div class="cont_ba_opcitiy">
            <h2>账号登录</h2>
            <p></p>
            <button class="btn_login" onClick="cambiar_login()">LOGIN</button>
          </div>
        </div>
        <div class="col_md_sign_up">
          <div class="cont_ba_opcitiy">
            <h2>短信登录</h2>
            <p></p>
            <button class="btn_sign_up" onClick="cambiar_sign_up()">PHONE</button>
          </div>
        </div>
      </div>
      <div class="cont_back_info">
        <div class="cont_img_back_grey"> <img src="<%=basePath %>/resources/images/po.jpg" alt="" /> </div>
      </div>
      <div class="cont_forms" >
        <div class="cont_img_back_"> <img src="<%=basePath %>/resources/images/po.jpg" alt="" /> </div>
        <div class="cont_form_login"> <a href="javascript:void(0)" onClick="ocultar_login_sign_up()" ><i class="material-icons">&#xE5C4;</i></a>
          <h2>账号登录</h2>
          <input type="text" placeholder="请输入用户名" name="username" id="username" pattern="[A-Za-z0-9_-]{3,12}" required="required" />
         <p> <span id="erro" style="color: red;font-size: 14px"></span></p>
          <input type="password" placeholder="请输入密码" name="password" id="password" pattern="^[a-zA-Z0-9]{6,16}$" required="required"/>
         <p> <span id="erro1" style="color: red;font-size: 14px"></span></p>
		  <!-- <a style="font-size:17px">商家账号<input type="checkbox" name="check" value="1" id="check"/></a> -->
          <button class="btn_login" onClick="cambiar_login()" id="zhdl">登录</button>
		  <br>
		   <br>
		    <br>
		  <p><a href="<%=basePath %>/pages/front/register.jsp" style="cursor: pointer;text-decoration: none;font-size: 12px;color: #666">没有账号？立即注册</a></p>
        </div>
        <div class="cont_form_sign_up"> <a href="javascript:void(0)" onClick="ocultar_login_sign_up()"><i class="material-icons">&#xE5C4;</i></a>
          <br/>
		  <br/>
		  <br/>
		  <h2>短信登录</h2>
          <input type="text" placeholder="请输入手机号码" name="phone" id="phone" pattern="^1(3|4|5|7|8)\d{9}$" required="required" />
		  <p> <span id="erro2" style="color: red;font-size: 14px"></span></p>
          <input type="text" placeholder="请输入短信验证码" name="yzm" id="yzm" pattern="^\d{6}$" required="required"/>
          <p> <span id="erro3" style="color: red;font-size: 14px"></span></p>
		  <button class="" name="hq" id="hq">获取验证码</button>
          <button class="btn_sign_up" onClick="cambiar_sign_up()" id="dxdl" >登录</button>
        </div>
      </div>
    </div>
  </div>
</div>
<!--获取当前系统时间  --> 
<% 
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
 
java.util.Date currentTime = new java.util.Date();//得到当前系统时间
 
String str_date1 = formatter.format(currentTime); //将日期时间格式化 
String str_date2 = currentTime.toString(); //将Date型日期时间转换成字符串形式 
%>
<script src="<%=basePath%>/resources/js/index.js"></script>
<script src="<%=basePath%>/resources/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript">
	 $("input[name=username]").blur(function(){
		$.ajax({
			url:"<%=basePath%>/exisUsername.shtml",
			type:"post",
			data:{//data中封装的数据会被提交给CheckUserServlet
				username:$("input[name=username]").val()
			},
			dataType:"json",
			success:function(flag){
				//var flag = result.flag;
				 if(flag<1){
						$("#erro").text("该用户名不存在,请重新输入！");
						$("input[name=username]").focus();
					}else{
						$("#erro").text("")
					}
				}
		});
	}); 
	 $("#zhdl").ready(function(){
	 $("#zhdl").click(function(){
		 
		var pwd=$("input[name=password]").val();
		
		var name=$("input[name=username]").val();
		if(name==""){
			 $("#erro").text("请输入用户名！");
			$("input[name=username]").focus();
			}else if(pwd==""){
				 //alert("ss")
				 //alert(pwd)
				 $("#zhdl").css("disabled","disabled"); 
				 $("#erro1").text("密码不能为空！");
				 $("input[name=password]").focus();
			 }else{
				 $("#erro").text("");
				 $("#erro1").text("");
				 //var check=$("input[type='checkbox']").is(':checked');
				// if(check){
					 $.ajax({
							url:"<%=basePath%>zhlogin.shtml",
							type:"post",
							data:{//data中封装的数据会被提交给CheckUserServlet
								username:$("input[name=username]").val(),
								password:$("input[name=password]").val()
							},
							dataType:"json",
							success:function(flag){
								//var flag = result.flag;
								if(flag){
									<%-- $.ajax({
										url:"<%=basePath%>/",
										type:"post",
										data:{//data中封装的数据会被提交给CheckUserServlet
											time:"<%=str_date1 %>"
										},
										dataType:"json",
										success:function(flag){
											}
									}); --%>
									window.location.href="<%=basePath%>/pages/front/index.jsp";
								}else{
									window.location.href="<%=basePath%>/pages/front/login2.jsp";
								}
								}
						})
				// }
			 }
		 }) 
	 });
	 </script>
	 <script type="text/javascript">
	 $("input[name=phone]").blur(function(){
			$.ajax({
				url:"<%=basePath%>/exisPhone.shtml",
				type:"post",
				data:{//data中封装的数据会被提交给CheckUserServlet
					phone:$("input[name=phone]").val()
				},
				dataType:"json",
				success:function(flag){
					//var flag = result.flag;
					 if(flag<1){
							$("#erro2").text("该号码不存在或未注册！");
							$("input[name=phone]").focus();
						}else{
							$("#erro2").text("")
						}
					}
			});
		}); 
	 $("#hq").ready(function(){
		 $("#hq").click(function(){
			var phone=$("input[name=phone]").val();
			if(phone==""){
				 $("#erro2").text("请输入手机号码！");
				$("input[name=phone]").focus();
				}else{
					 $("#erro2").text("");
					// $("#erro3").text("");
					 //var check=$("input[type='checkbox']").is(':checked');
					// if(check){
						$("input[name=yzm]").focus();
						 $.ajax({
								url:"<%=basePath%>dxyz.shtml",
								type:"post",
								data:{//data中封装的数据会被提交给CheckUserServlet
									phone:$("input[name=phone]").val(),
									//password:$("input[name=password]").val()
								},
								dataType:"json",
								success:function(flag){
									//var flag = result.flag;
									$("input[name=yzm]").blur(function(){
										var yzm=$("input[name=yzm]").val();
										if(yzm!=flag){
											$("#erro3").text("验证码错误！");
										}
								}); 
									}
							})
					// }
				 }
			 }) 
		 });
	 
	 $("#dxdl").ready(function(){
		 $("#dxdl").click(function(){
			 
			var phone=$("input[name=phone]").val();
			
			var yzm=$("input[name=yzm]").val();
			if(phone==""){
				 $("#erro2").text("请输入手机号码");
				$("input[name=phone]").focus();
				}else if(yzm==""){
					 //alert("ss")
					 //alert(pwd)
					// $("#dxdl").css("disabled","disabled"); 
					 $("#erro3").text("请输入验证码！");
					 $("input[name=yzm]").focus();
				 }else{
					 $("#erro2").text("");
					 $("#erro3").text("");
					 //var check=$("input[type='checkbox']").is(':checked');
					// if(check){
						$.ajax({
								url:"<%=basePath%>dxlogin.shtml",
								type:"post",
								data:{//data中封装的数据会被提交给CheckUserServlet
									phone:$("input[name=phone]").val(),
									yzm:$("input[name=yzm]").val(),
									//password:$("input[name=password]").val()
								},
								dataType:"json",
								success:function(flag){
									//var flag = result.flag;
									if(flag){
										window.location.href="<%=basePath%>/pages/front/index.jsp";
									}else{
										window.location.href="<%=basePath%>/pages/front/login2.jsp";
									}
									}
							})
					// }
				 }
			 }) 
		 });
	 $("input[name=yzm]").blur(function(){
			 var yzm=$("input[name=yzm]").val();
			 var exyzm=$.session.get("exyzm");
			 if(yzm==exyzm){
				 $("#erro3").text("");
			 }else{$("#erro3").text("验证码错误,请重试！");}
			 
		}); 
	 </script>
<div style="text-align:center;">

</div>
</body>
</html>
