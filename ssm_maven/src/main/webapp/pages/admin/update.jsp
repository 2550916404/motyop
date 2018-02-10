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
		<form action="<%=basePath%>update.shtml?id=${book.id}" method="post">
			<ul class="forminfo">
				<li><label>图书名称</label><input name="title" type="text" class="dfinput" value="${book.title }" /><span id="warnTitle">*</span></li>
				
				
				<li><label>图书分类</label>
				<select name="categoryId" style="height:25px;width:100px;border: 1px solid #a7b5bc;">
				<c:choose>
					<c:when test="${book.categoryId==1 }">
						<option value="1" selected="selected">IT技术</option>
						<option value="2">电子科学</option>
					</c:when>
					<c:when test="${book.categoryId==2 }">
						<option value="1">IT技术</option>
						<option value="2" selected="selected">电子科学</option>
					</c:when>
					<c:otherwise>
						<option value="1">IT技术</option>
						<option value="2">电子科学</option>
					</c:otherwise>
				</c:choose>
				</select>
				</li>
				
				
				<li><label>摘要</label>
				<textarea name="summary" rows="4" cols="55" value="" style="border: 1px solid #a7b5bc;">${book.summary }</textarea></li>
				<li><label>上传人</label><input name="uploaduser" type="text" class="dfinput" value="${book.uploaduser }" /></li>
				<!--注意：此处的name值不能与实体类的属性名相同  -->
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
