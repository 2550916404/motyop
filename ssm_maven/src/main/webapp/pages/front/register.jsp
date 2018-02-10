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
<title>注册</title>
<link href="<%=basePath %>resources/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath %>resources/js/public.js"></script>
<script type="text/javascript" src="<%=basePath %>resources/js/jquery.js"></script>
<script type="text/javascript" src="<%=basePath %>resources/js/jqpublic.js"></script>
</head>
<body>
<!-- **********引入头部*********** -->
<%@ include file="top.jsp" %>
<!--Start content-->
<section class="Psection MT20">
 <form action="<%=basePath %>regist.shtml" method="post">
  <table class="Register">
  <tr>
  <td width="40%" align="right" class="FontW">用户名：</td>
  <td><input type="text" name="username" required  pattern="[A-Za-z0-9_-]{3,12}" placeholder="请输入3-12位英文数字及下划线">
  <span id="erro" style="color: red;font-size: 12px">&nbsp;&nbsp;</span></td>
  </tr>
  <tr>
  <td width="40%" align="right" class="FontW">密码：</td>
  <td><input type="password" name="password" required pattern="^[a-zA-Z0-9]{6,16}$" placeholder="请输入6-16位英文数字"></td>
  </tr>
  <tr>
  <td width="40%" align="right" class="FontW">再次确认：</td>
  <td><input type="password" name="password2" required pattern="^[a-zA-Z0-9]{6,16}$">
  <span id="erro1" style="color: red;font-size: 12px">&nbsp;&nbsp;</span></td>
  </tr>
  <tr>
  <td width="40%" align="right" class="FontW">电子邮件：</td>
  <td><input type="email" name="email" required pattern="^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$" placeholder="请输入正确的邮箱格式"></td>
  </tr>
  <tr>
  <td width="40%" align="right" class="FontW">手机号码：</td>
  <td><input type="text" name="iphone" required pattern="^1(3|4|5|7|8)\d{9}$" placeholder="请输入正确的手机号码">
  <span id="erro2" style="color: red;font-size: 12px">&nbsp;&nbsp;</span></td>
  </tr>
  <tr>
  <td width="40%" align="right" class="FontW"><button id="hq" style="font-size: 12px;">获取验证码</button></td>
  <td><input type="text" name="yzm" required pattern="^\d{6}$" placeholder="请输入6位手机验证吗">
  <span id="erro3" style="color: red;font-size: 12px;">&nbsp;&nbsp;</span></td>
  </tr>
  <tr>
  <td width="40%" align="right"></td>
  <td><input type="submit" name="" class="Submit_b" value="注 册">( 已经是会员，<a href="<%=basePath %>pages/front/login2.jsp" class="BlueA">请登录</a> )</td>
  </tr>
  </table>
 </form>
</section>
<script type="text/javascript">
//验证用户名是否已注册
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
				 $("#erro").text("")
				}else{
					$("#erro").text("该用户名已被注册！");
					$("input[name=username]").focus();
				}
			}
	});
}); 
//验证两次密码是否相同
$("input[name=password2]").blur(function(){
	var pwd1= $("input[name=password]").val();
	var pwd2= $("input[name=password2]").val();
	//alert(pwd1);
	if(pwd1!=pwd2){
		$("#erro1").text("两次输入密码不同！");
		$("input[name=password2]").focus();
	}else{
		$("#erro1").text("");
	}
}); 
//验证手机号码是否被注册
 $("input[name=iphone]").blur(function(){
			$.ajax({
				url:"<%=basePath%>/exisPhone.shtml",
				type:"post",
				data:{//data中封装的数据会被提交给CheckUserServlet
					phone:$("input[name=iphone]").val()
				},
				dataType:"json",
				success:function(flag){
					//var flag = result.flag;
					 if(flag<1){
							$("#erro2").text("")
							$("#hq").removeAttribute("disabled");
						}else{
							$("#erro2").text("该号码已被绑定！");
							$("input[name=iphone]").focus();
							$("#hq").css("disabled", true);
						}
					}
			});
		});
//ajax获取验证码
$("#hq").ready(function(){
	 $("#hq").click(function(){
		var phone=$("input[name=iphone]").val();
		if(phone==""){
			 $("#erro2").text("请输入手机号码！");
			$("input[name=iphone]").focus();
			$("input[name=iphone]").css("border-color","red");
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
								phone:$("input[name=iphone]").val(),
								//password:$("input[name=password]").val()
							},
							dataType:"json",
							success:function(flag){
								//var flag = result.flag;
								$("input[name=yzm]").blur(function(){
									var yzm=$("input[name=yzm]").val();
									if(yzm!=flag){
										$("#erro3").text("验证码错误！");
									}else{
										$("#erro3").text("");
									}
							}); 
								}
						})
				// }
			 }
		 }) 
	 });
</script>
<!--End content-->
<div class="F-link">
  <span>友情链接：</span>
  
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
</body>
</html>
