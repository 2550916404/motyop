<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() +request.getContextPath()+"/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath %>">
<meta charset="utf-8" />
<title>用户中心</title>
<link href="<%=basePath %>resources/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath %>resources/js/public.js"></script>
<script type="text/javascript" src="<%=basePath %>resources/js/jquery.js"></script>
<script type="text/javascript" src="<%=basePath %>resources/js/jqpublic.js"></script>

<!--分页  -->
<link rel="stylesheet" type="text/css" href="<%=basePath %>resources/js/dataTable/jquery.dataTables.min.css">
<script type="text/javascript" src="<%=basePath %>resources/js/dataTable/jquery.js"></script>
<script type="text/javascript" src="<%=basePath %>resources/js/dataTable/jquery.dataTables.min.js"></script>
<!--
Author: DeathGhost
Author URI: http://www.deathghost.cn
-->



</head>
<body>

<!-- **********引入头部*********** -->
<%@ include file="top.jsp" %>
<!--Start content-->
<section class="Psection MT20">
<nav class="U-nav Font14 FontW">
  <ul>
   <li><i></i><a href="<%=basePath %>yanzheng.shtml">用户中心首页</a></li>
   <li><i></i><a href="<%=basePath %>serbeyOrdering.shtml">我的订单</a></li>
   <li><i></i><a href="<%=basePath %>serbeyConsignee.shtml">收货地址</a></li>
   <li><i></i><a href="<%=basePath %>pages/front/user_message.jsp">我的留言</a></li>
   <li><i></i><a href="collSelect.shtml">我的收藏</a></li>
   <li><i></i><a href="<%=basePath %>pages/front/user_account.jsp">账户管理</a></li>
   <li><i></i><a href="<%=basePath %>exit.shtml">安全退出</a></li>
  </ul>
 </nav>
 <article class="U-article Overflow">
  <!--user order list-->
  <section>
    <table class="Myorder" class="tablelist" id="example">
    <thead>
   	 	<tr>
	     <th class="Font14 FontW">订单编号</th>
	     <th class="Font14 FontW">下单时间</th>
	     <th class="Font14 FontW">收件人</th>
	     <th class="Font14 FontW">订单总金额</th>
	     <th class="Font14 FontW">订单状态</th>
	     <th class="Font14 FontW">操作</th>
		</tr>
	</thead>	     
    <tbody>
			<c:forEach items="${listord }" var="cp">
				<tr>
					<td>${cp.orderId }</td>
					<td>
					<fmt:formatDate value="${cp.orderTime }" pattern="yyyy-MM-dd"/>
					</td>
					<td>${cp.addresseeName }</td>
					<td>${cp.amount }</td>
					<td>
						<c:choose>
		                   <c:when test="${cp.state==1}">
		                   		未付款
		                   </c:when>
		                    <c:when test="${cp.state==2}">
		                   		已付款,未发货
		                   </c:when>
		                    <c:when test="${cp.state==3}">
		                   		派送中
		                   </c:when>
		                    <c:when test="${cp.state==4}">
		                   		已收货
		                   </c:when>
		                    <c:when test="${cp.state==5}">
		                   		未评价
		                   </c:when>
		                   <c:otherwise>
		                   		已评价
		                   </c:otherwise>
						</c:choose>
					</td>
					<td >	
					<a href="javascript:void(0);"  class="button" onclick="res(this)">取消订单
					<input type="hidden" value="${cp.orderId }">
					</a>  <a href="<%=basePath %>Aliapliy.shtml?idCart=${cp.orderId}" target="_blank">
					<c:choose>
						<c:when test="${cp.state==2}">
		                   		
		                   </c:when>
		                 <c:when test="${cp.state==1}">
		                   		付款
		                 </c:when>
					</c:choose>
							
					</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
    </table>
    
<!--  删除订单信息  -->
    <script type="text/javascript">
	    function res(elem){	//接收， 取别名
	    	//弹出是否删除的对话框
	    	var value=$(elem).find("input[type=hidden]").val();
	    	if(confirm("确认取消【"+value+"】订单吗？")){
	    		//确认的的话 发送ajax请求删除
	    		$.ajax({
	    			url:"<%=basePath %>deleteByalpay.shtml",
	    			type:"post",
	    			async:false,
	    			data:{
	    				orderId:value
	    			},
	    			dataType:"json",
	    			success:function(result){
	    				if(result>0){
	    					//使用函数方法
	    					$(elem).parent().parent().remove();
	    					//回到本页
	    					//window.location.reload() 刷新当前页面
	    				}
	    			}
	    		});
	    	}
	    }
    </script>
    <!-- <div class="TurnPage">
         <a href="#">
          <span class="Prev"><i></i>首页</span>
         </a>
         <a href="#"><span class="PNumber">1</span></a>
         <a href="#"><span class="PNumber">2</span></a>
         <a href="#">
         <span class="Next">最后一页<i></i></span>
        </a>
     </div> -->
  </section>
 </article>
</section>
<!--End content-->
<div class="F-link">
 
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
     <li><a href="<%=basePath %>pages/front/article_read.jsp"   title="标题">支付方式</a></li>
     <li><a href="<%=basePath %>pages/front/article_read.jsp"   title="标题">配送方式</a></li>
     <li><a href="<%=basePath %>pages/front/article_read.jsp"   title="标题">配送效率</a></li>
     <li><a href="<%=basePath %>pages/front/article_read.jsp"   title="标题">服务费用</a></li>
    </ul>
    </div>
    <div>
    <span><i class="i2"></i>关于我们</span>
    <ul>
     <li><a href="<%=basePath %>pages/front/article_read.jsp"   title="标题">招贤纳士</a></li>
     <li><a href="<%=basePath %>pages/front/article_read.jsp"   title="标题">网站介绍</a></li>
     <li><a href="<%=basePath %>pages/front/article_read.jsp"   title="标题">配送效率</a></li>
     <li><a href="<%=basePath %>pages/front/article_read.jsp"   title="标题">商家加盟</a></li>
    </ul>
    </div>
    <div>
    <span><i class="i3"></i>帮助中心</span>
    <ul>
     <li><a href="<%=basePath %>pages/front/article_read.jsp"   title="标题">服务内容</a></li>
     <li><a href="<%=basePath %>pages/front/article_read.jsp"   title="标题">服务介绍</a></li>
     <li><a href="<%=basePath %>pages/front/article_read.jsp"   title="标题">常见问题</a></li>
     <li><a href="<%=basePath %>pages/front/article_read.jsp"   title="标题">网站地图</a></li>
    </ul>
    </div>
  </section>
 </section>
<div class="copyright">© 版权所有 2016 DeathGhost 技术支持：<a href="http://www.deathghost.cn" title="DeathGhost">DeathGhost</a></div>
</footer>

<!-- 分页部分 -->
<script type="text/javascript">
		$(document).ready(function(){
			$("#example").dataTable({
				 "bProcessing" : true, //DataTables载入数据时，是否显示‘进度’提示
				 "aLengthMenu" : [5, 10, 15], //更改显示记录数选项
				 "sPaginationType" : "full_numbers", //详细分页组，可以支持直接跳转到某页
				 "bAutoWidth" : true, //是否自适应宽度
				 //"bJQueryUI" : true,
				 "oLanguage": { //国际化配置  
		                "sProcessing" : "正在获取数据，请稍后...",    
		                "sLengthMenu" : "显示 _MENU_ 条",    
		                "sZeroRecords" : "没有您要搜索的内容",    
		                "sInfo" : "从 _START_ 到  _END_ 条记录 总记录数为 _TOTAL_ 条",    
		                "sInfoEmpty" : "记录数为0",    
		                "sInfoFiltered" : "(全部记录数 _MAX_ 条)",    
		                "sInfoPostFix" : "",    
		                "sSearch" : "搜索",    
		                "sUrl" : "",    
		                "oPaginate": {    
		                    "sFirst" : "第一页",    
		                    "sPrevious" : "上一页",    
		                    "sNext" : "下一页",    
		                    "sLast" : "最后一页"    
		                }  
		            },  
		    });
		});
	</script>


</body>
</html>
