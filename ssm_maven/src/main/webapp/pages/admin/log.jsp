<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() +request.getContextPath()+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath %>">
	<script type="text/javascript" src="<%=basePath %>resources/js/jquery-1.8.2.min.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>日志记录</title>
</head>
<body>
	<textarea id='memo' style="min-height: 550px;min-width: 1120px;max-height: 550px; max-width: 1120px;" >
        ${log }
    </textarea>  
	<script type="text/javascript">
		 var obj = document.getElementById("memo");
		 obj.scrollTop = obj.scrollHeight;
	</script>
</body>
</html>