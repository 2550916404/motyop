<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() +request.getContextPath()+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath %>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>错误处理页面</title>
</head>
<body>
	<center>
		<img src="<%=basePath %>/resources/images/preview.jpg" width="100%">
	</center>
</body>
</html>