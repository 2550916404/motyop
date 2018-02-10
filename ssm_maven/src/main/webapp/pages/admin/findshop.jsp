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
			<li><a href="#">图书管理</a></li>
			<li><a href="#">修改图书信息</a></li>
		</ul>
	</div>

	<div class="formbody">

		<div class="formtitle">
			<span>修改图书</span>
		</div>
		<form action="<%=basePath%>/zcp/insertActive.shtml" method="post"  enctype="multipart/form-data">
			<ul class="forminfo">
				<li  style="display:none"><label>商家id</label><input name="id" type="text" class="dfinput" value="${shop.id }" /><span id="warnTitle"></span></li>
				<li  ><label>店铺名</label><input name="shopName" type="text" class="dfinput" value="${shop.shopName}" /><span id="warnTitle"></span></li>
				<li  ><label>店铺地址</label><input name="shopAddress" type="text" class="dfinput" value="${shop.shopAddress}" /><span id="warnTitle"></span></li>
				<li  ><label>商家电话</label><input name="shopPhone" type="text" class="dfinput" value="${shop.shopPhone}" /><span id="warnTitle"></span></li>
				<li  ><label>评分</label><input name="grade" type="text" class="dfinput" value="${shop.grade}" /><span id="warnTitle"></span></li>
				<li  ><label>特色菜品</label><input name="specialties" type="text" class="dfinput" value="${shop.specialties}" /><span id="warnTitle"></span></li>
				<li  ><label>停车位</label><input name="parkingSpace" type="text" class="dfinput" value="${shop.parkingSpace}" /><span id="warnTitle"></span></li>
				<li  ><label>营业时间</label><input name="openingHours" type="datetime" class="dfinput" value="${shop.openingHours}" /><span id="warnTitle"></span></li>
				<li  ><label>优惠活动</label><input name="activity" type="text" class="dfinput" value="${shop.activity}" /><span id="warnTitle"></span></li>
				<li  ><label>免费WIFI</label><input name="wifi" type="text" class="dfinput" value="${shop.wifi}" /><span id="warnTitle"></span></li>
				<li  ><label>图片路径</label><img src="<%=basePath%>/resources/images2/${shop.shopImagepath}" width="50" height=50" >
				<input type="file" name="bigHeadImage" value="上传"/>
				<span id="warnTitle"></span></li>
				<li  ><label>价格</label><input name="price" type="" class="dfinput" value="${shop.price}" /><span id="warnTitle"></span></li>
				<li  ><label>地区</label><input name="diqu" type="" class="dfinput" value="${shop.diqu }" /><span id="warnTitle"></span></li>
				
				<li><label>&nbsp;</label><input type="submit" class="btn"
					value="确认保存" id="buttonSub" /> <input type="button" class="btn"
					id="fanhui" value="返回" /></li>
			</ul>
		</form>
	</div>
</body>

<script type="text/javascript">
	$(document).ready(function(){
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
		var title = $("input[name=title]").val().trim();
		if (title == null || title == "") {
			$("#warnTitle").html("*题目不能为空！");
			return false;
		}
		$("#warnTitle").html("");
		return true;
	}
</script>
</html>

