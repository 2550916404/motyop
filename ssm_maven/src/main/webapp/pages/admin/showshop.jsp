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
<title>网站后台管理系统HTML模板--模板之家 www.cssmoban.com</title>
<link href="<%=basePath%>/resources/css/style1.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript"
	src="<%=basePath%>/resources/js/jquery.js"></script>

<script type="text/javascript">
$(document).ready(function() {
		$("#addPaper").click(function() {
		window.location.href="<%=basePath%>/pages/admin/form.jsp";
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

</script>
<style type="text/css">
	/* td{width:100px;overflow:hidden;white-space:nowrap;word-break:keep-all;}
	th{width:100px;overflow:hidden;white-space:nowrap;word-break:keep-all;}  */
	.tablelist {  
    table-layout: fixed;  
    width: 98% border:0px;  
    margin:2px;  
}  

	.tablelist tr td {  
    text-overflow: ellipsis; /* for IE */  
    -moz-text-overflow: ellipsis; /* for Firefox,mozilla */  
    overflow:hidden;  
    white-space: nowrap;  
    /* 	border: 1px solid; */  
    text-align: left  
}  
	
	.tablelist tr th {  
    text-overflow: inherit; /* for IE */  
    -moz-text-overflow: ellipsis; /* for Firefox,mozilla */  
    overflow: inherit;  
    white-space: nowrap;  
    /* 	border: 1px solid; */  
    text-align: left  
}   
}  
</style>
</head>


<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="javascript:void(0)">店铺管理</a></li>
		</ul>
		
		
	</div>

	<div class="rightinfo">

		<div class="tools">

			<ul class="toolbar">
			
			
			<li style="padding-left:5px;">
				<label>店铺名：</label><input type="text" name="title1" value="${numMap.shop_name }" style="height:25px;border: 1px solid #a7b5bc;">
			
			</li>
			<li style="padding-left:5px;display:none">
				<label>类型：</label>
				<select name="type1" style="height:25px;width:70px;border: 1px solid #a7b5bc;">
				<c:choose>
					<c:when test="${numMap.type==1 }">
						<option value="">全部</option>
						<option value="1" selected="selected">IT技术</option>
						<option value="2">电子科学</option>
					</c:when>
					<c:when test="${numMap.type==2 }">
						<option value="">全部</option>
						<option value="1">IT技术</option>
						<option value="2" selected="selected">电子科学</option>
					</c:when>
					<c:otherwise>
						<option value="">全部</option>
						<option value="1">IT技术</option>
						<option value="2">电子科学</option>
					</c:otherwise>
				</c:choose>
				</select>
				
			</li>
				<li id="selectActive"><span><img src="<%=basePath%>/resources/images1/search.png" width="25px" height="25px"/></span>查询</li>
				<li id="addPaper"  style="display:none"><span><img src="<%=basePath%>/resources/images1/t01.png" /></span>添加</li>
			</ul>


			<ul class="toolbar1">
				<%-- <li><span><img
						src="<%=basePath%>/resources/images1/t05.png" /></span>设置</li> --%>
			</ul>

		</div>

		<table class="tablelist">
		<thead>
			<tr>
				<th>商家id<i class="sort"></i></th>
				<th>店铺名</th>
				<th>店铺地址</th>
				<th>商家电话</th>
				<th>评分</th>
				<th>特色菜品</th>
				<th>停车位</th>
				<th>营业时间</th>
				<th>优惠活动</th>
				<th>免费WIFI</th>
				<th>图片路径</th>
				<th>回复留言时间</th>
				<th>价格</th>
				<th>地区</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${shop}" var="shop">
				<tr>
					<td title="${shop.id}">${shop.id}</td>
					<td title="${shop.shop_name}">${shop.shop_name}</td>
					<td title="${shop.shop_address}">${shop.shop_address}</td>
					<td title="${shop.shop_phone}">${shop.shop_phone}</td>
					<td title="${shop.grade}">${shop.grade}</td>
					<td title="${shop.specialties}">${shop.specialties}</td>
					<td title="${shop.parking_space}">${shop.parking_space}</td>
					<td title="${shop.opening_hours}">${shop.opening_hours}</td>
					<td title="${shop.activity}">${shop.activity}</td>
					<td title="${shop.wifi}">${shop.wifi}</td>
					<td ><img src="<%=basePath%>/resources/images2/${shop.shop_imagepath}" width="50" height=30" ></td>
					<td title="${shop.huifu_time}">${shop.huifu_time}</td>
					<td title="${shop.price}">${shop.price}</td>
					<td title="${shop.diqu}">${shop.diqu} </td> 
					<td>
						<a href="<%=basePath %>/zcp/updateshop.shtml?id=${shop.id}" class="tablelink">修改</a>
			        	<a href="javascript:void(0)" id="delete" onclick="delete_order(${shop.id})">删除</a>
					</td>	
				</tr>
			</c:forEach>
	</table>
		<div class="pagin">
		
			<div class="message">
			每页显示
			<select id="sPageSize" name="pageSize" style="height:20px;width:70px;border: 1px solid #a7b5bc;">
				<c:choose>
					<c:when test="${numMap.pageSize==5 }">
						<option value="5" selected="selected">5</option>
						<option value="10">10</option>
						<option value="20">20</option>
					</c:when>
					<c:when test="${numMap.pageSize==10 }">
						<option value="5">5</option>
						<option value="10" selected="selected">10</option>
						<option value="20">20</option>
					</c:when>
					<c:when test="${numMap.pageSize==20 }">
						<option value="5">5</option>
						<option value="10">10</option>
						<option value="20" selected="selected">20</option>
					</c:when>
				</c:choose>
			</select>
				共<i class="blue">${numMap.count }</i>条记录，当前显示第&nbsp;<i class="blue">${numMap.pageNo }&nbsp;</i>页
			</div>	
			<ul class="paginList" id="fenye">
				<li class="paginItem"><a href="#"><span class="pagepre"></span></a></li>
			</ul>
		</div>
<!--  <span style="color:red;font-size:20px;" id="deleteSuccess">发</span> -->
		<!-- 查询及分页 -->
		<script type="text/javascript">
		//动态获取总页数并添加样式
		var num=${numMap.num};
		 for(var i=1;i<=num;i++){
			$("#fenye").append("<li class='paginItem pageNo'><a href='#' class='num'>"+i+"</a></li>");
		}
		 $("#fenye").append("<li class='paginItem'><a href='#'><span class='pagenxt'></span></a></li>");
		/* 查询的点击事件 */
			$("#selectActive").click(function(){
				var sTitle=$("input[name=title1]").val().trim();
				var sType=$("select[name=type1]").val().trim();
				window.location.href="<%=basePath%>/zcp/selectActive3.shtml?title1="+sTitle+"&type1="+sType+"";
			});
			/*改变每页显示条数的事件 */
			$("#sPageSize").change(function(){
				var sTitle1=$("input[name=title1]").val().trim();
				var sType1=$("select[name=type1]").val().trim();
				var pageSize1=$("select[name=pageSize]").val().trim();
				 window.location.href="<%=basePath%>/zcp/selectActive3.shtml?title1="+sTitle1+"&type1="+sType1+"&pageSize="+pageSize1+"";
			});
            /* 获取存储的当前页数 */
			var pageNo=${numMap.pageNo};
			var $pageno = $(".pageNo");
			var arrayNo = {};
			//遍历取出分页中的html值
			$pageno.each(function(index,dom){
				arrayNo[index]=	$(dom).children().html();
				if(arrayNo[index]==pageNo){
					$(this).attr("class","paginItem current pageNo");
				}
			});
			//分页点击事件
			$pageno.click(function(){
			var pageNoClick=$(this).children().html();
				if(pageNo!=pageNoClick){
					var sTitle1=$("input[name=title1]").val().trim();
					var sType1=$("select[name=type1]").val().trim();
					var pageSize1=$("select[name=pageSize]").val().trim();
					window.location.href="<%=basePath%>/zcp/selectActive3.shtml?title1="+sTitle1+"&type1="+sType1+"&pageSize="+pageSize1+"&pageNo="+pageNoClick+"";
				}
			});
		</script>
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
	<script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
		 function delete_order(id){    
		     confirm_ = confirm('是否删除？');
		     if(confirm_){
		        $.ajax({
		        type:"POST",
		        url:'<%=basePath %>/zcp/deleteShop.shtml',
						data:{"id":id},
						success:function(msg){
							/*  window.location.reload();  */
							if(msg){
								window.location.reload(true);
								} 
							 else{
								 alert("删除失败!");
							 }
				        }
				});
		      }
		  }; 

	</script>
	
</body>
</html>