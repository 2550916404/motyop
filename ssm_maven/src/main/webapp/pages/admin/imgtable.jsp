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
<script type="text/javascript"
	src="<%=basePath%>/resources/js/jquery.js"></script>
<script language="javascript">
	$(function() {
		//导航切换
		$(".imglist li").click(function() {
			$(".imglist li.selected").removeClass("selected")
			$(this).addClass("selected");
		})
	})
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".click").click(function() {
			$(".tip").fadeIn(200);
		});

		$(".tiptop a").click(function() {
			$(".tip").fadeOut(200);
		});

		$(".sure").click(function() {
			$(".tip").fadeOut(100);
		});

		$(".cancel").click(function() {
			$(".tip").fadeOut(100);
		});

	});
</script>
</head>


<body>

	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="#">菜品管理</a></li>
			<li><a href="#">菜品列表</a></li>
		</ul>
	</div>

	<div class="rightinfo">

		<div class="tools">

			<ul class="toolbar">
				<li class="click"><span><img
						src="<%=basePath%>/resources/images1/t01.png" /></span>添加</li>
				<li class="click"><span><img
						src="<%=basePath%>/resources/images1/t02.png" /></span>修改</li>
				<li><span><img
						src="<%=basePath%>/resources/images1/t03.png" /></span>删除</li>
				<li><span><img
						src="<%=basePath%>/resources/images1/t04.png" /></span>统计</li>
			</ul>
			<ul class="toolbar1">
				<li><span><img
						src="<%=basePath%>/resources/images1/t05.png" /></span>设置</li>
			</ul>
		</div>


		<table class="imgtable">

			<thead>
				<tr>
					<th width="100px;">菜品图片</th>
					<th>菜品编号</th>
					<th>菜品名称</th>
					<th>口味</th>
					<th>价格</th>
					<th>描述</th>
					<th>操作</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${foodList}" var="food">
					<tr>
						<td class="imgtd" width="200px;"><img src="http://localhost:8888/${food.foodImg }" width="120px;" height="80px;"/></td>
						<td width="100px;">${food.id }</td>
						<td>${food.name }</td>
						<td>${food.taste }</td>
						<td>${food.price }</td>
						<td>${food.fDesc }</td>
						<td><a href="<%=basePath %>selectByPrimaryKey.shtml?id=${food.id}" class="tablelink">修改</a> 
						<a href="<%=basePath %>deleteByPrimaryKey.shtml?id=${food.id}" class="tablelink"> 删除</a></td>
					</tr>
				</c:forEach>
			</tbody>

		</table>


		<div class="pagin">
			<div class="message">
				共<i class="blue">1256</i>条记录，当前显示第&nbsp;<i class="blue">2&nbsp;</i>页
			</div>
			<ul class="paginList">
				<li class="paginItem"><a href="javascript:;"><span
						class="pagepre"></span></a></li>
				<li class="paginItem"><a href="javascript:;">1</a></li>
				<li class="paginItem current"><a href="javascript:;">2</a></li>
				<li class="paginItem"><a href="javascript:;">3</a></li>
				<li class="paginItem"><a href="javascript:;">4</a></li>
				<li class="paginItem"><a href="javascript:;">5</a></li>
				<li class="paginItem more"><a href="javascript:;">...</a></li>
				<li class="paginItem"><a href="javascript:;">10</a></li>
				<li class="paginItem"><a href="javascript:;"><span
						class="pagenxt"></span></a></li>
			</ul>
		</div>


		<div class="tip">
			<div class="tiptop">
				<span>提示信息</span><a></a>
			</div>

			<div class="tipinfo">
				<span><img src="<%=basePath%>/resources/images1/ticon.png" /></span>
				<div class="tipright">
					<p>是否确认对信息的修改 ？</p>
					<cite>如果是请点击确定按钮 ，否则请点取消。</cite>
				</div>
			</div>

			<div class="tipbtn">
				<input name="" type="button" class="sure" value="确定" />&nbsp; <input
					name="" type="button" class="cancel" value="取消" />
			</div>

		</div>




	</div>

	<div class="tip">
		<div class="tiptop">
			<span>提示信息</span><a></a>
		</div>

		<div class="tipinfo">
			<span><img src="<%=basePath%>/resources/images1/ticon.png" /></span>
			<div class="tipright">
				<p>是否确认对信息的修改 ？</p>
				<cite>如果是请点击确定按钮 ，否则请点取消。</cite>
			</div>
		</div>

		<div class="tipbtn">
			<input name="" type="button" class="sure" value="确定" />&nbsp; <input
				name="" type="button" class="cancel" value="取消" />
		</div>

	</div>

	<script type="text/javascript">
		$('.imgtable tbody tr:odd').addClass('odd');
	</script>
</body>
</html>
