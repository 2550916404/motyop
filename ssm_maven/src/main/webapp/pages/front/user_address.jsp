<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
<script type="text/javascript" src="<%=basePath %>resources/js/area.js"></script>

<!--分页  -->
<link rel="stylesheet" type="text/css" href="<%=basePath %>resources/js/dataTable/jquery.dataTables.min.css">
<script type="text/javascript" src="<%=basePath %>resources/js/dataTable/jquery.js"></script>
<script type="text/javascript" src="<%=basePath %>resources/js/dataTable/jquery.dataTables.min.js"></script>
</head>
<body>
<!-- **********引入头部*********** -->
<%@ include file="top.jsp" %>
<!--Start content-->
<section class="Psection MT20">
<nav class="U-nav Font14 FontW">
  <ul>
   <li><i></i><a href="<%=basePath %>yanzheng.shtml">用户中心首页</a></li>
   <li><i></i><a href="pages/front/user_orderlist.jsp">我的订单</a></li>
   <li><i></i><a href="<%=basePath %>serbeyConsignee.shtml">收货地址</a></li>
   <li><i></i><a href="pages/front/user_message.jsp">我的留言</a></li>
   <li><i></i><a href="collSelect.shtml">我的收藏</a></li>
   <li><i></i><a href="pages/front/user_account.jsp">账户管理</a></li>
   <li><i></i><a href="<%=basePath %>exit.shtml">安全退出</a></li>
  </ul>
 </nav>
 <article class="U-article Overflow">
  <!--user Address-->
  <section class="Myaddress Overflow">
   <span class="MDtitle Font14 FontW Block Lineheight35">收货人信息</span>
   
   <!--add new address-->
   <form action="<%=basePath %>/insertByCon.shtml"	method="post" enctype="multipart/form-data">
	    <table style="margin-top:10px;">
	    <tr style="line-height: 50px;">
	     <td width="30%" class="Font14 FontW Lineheight35" align="right">选择所在地：</td>
     
 <!---------------------三级联动 ----------------------- -->
	     <td>
		     <select id="s_province" name="s_province"style="height: 30px"></select>  
		   	 <select id="s_city" name="s_city"style="height: 30px" ></select>  
		   	 <select id="s_county" name="s_county"style="height: 30px"></select>
		   	 <script class="resources library" src="area.js" type="text/javascript"></script>
		   	 <script type="text/javascript">_init_area();</script>
	     </td>
	     
	    </tr >
	    <tr>
	     <td width="30%" class="Font14 FontW Lineheight35" align="right">收件人姓名：</td>
	     <td><input type="text" name="consigneeName" required  class="input_name">
	     <span id="erro" style="color: red;font-size: 12px">&nbsp;&nbsp;</span>
	     </td>
	    </tr>
	    <tr style="line-height: 40px;">
	     <td width="30%" class="Font14 FontW Lineheight35" align="right">街道地址：</td>
	     <td><input type="text" name="streetAddress" required pattern="^[\u4E00-\u9FA5A]+$" class="input_addr"></td>
	    </tr>
	    <tr>
	     <td width="30%" class="Font14 FontW Lineheight35" align="right">手机号码：</td>
	     <td><input type="text" name="phone" required pattern="^1(3|4|5|7|8)\d{9}$" class="input_tel">
	     <span id="erro2" style="color: red;font-size: 12px">&nbsp;&nbsp;</span>
	     </td>
	    </tr>
	    <tr>
	     <td width="30%" class="Font14 FontW Lineheight35" align="right"></td>
	     <td class="Font14 Font Lineheight35"><input  type="submit" value="新增收货地址"  class="Submit";></td>
	    </tr>
	   </table>
   </form>
   
   
   
<!--------------显示收货人地址----------------->
   <table class="Myorder"style="margin-top:10px;height:50px;text-indent:3em;"class="tablelist" id="example" >
   	<thead>
  	 <tr>
	   	<th class="Font14 FontW">收件人姓名</th>
	    <th class="Font14 FontW">详细地址</th>
	    <th class="Font14 FontW">手机号</th>
	    <th class="Font14 FontW">操作</th>
     </tr>
    </thead>
     <tbody>
			<c:forEach items="${listcon }" var="dz">
				<tr>
					<td class="consigneeName">${dz.consigneeName }</td>
					<td class="streetAddress">${dz.streetAddress }</td>
					<td class="phone">${dz.phone }</td>
					<td	>	<!-- 定义一个函数 -->
					<a href="javascript:void(0);" class="updateAdress" onclick="popBox()">修改地址</a> |
					<input type="hidden" name="dzid" value="${dz.id }">
					<a href="javascript:void(0);" class="button" onclick="res(this)">删除</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
   </table>
   
 <!--  删除订单信息  -->
    <script type="text/javascript">
	    function res(elem){	//接收， 取别名
	    	//弹出是否删除的对话框
	    	var value=$(elem).parent().find("input[type=hidden]").val();
	    	if(confirm("确认删除吗？")){
	    		//确认的的话 发送ajax请求删除
	    		$.ajax({
	    			url:"<%=basePath %>deleteBycon.shtml",
	    			type:"post",
	    			async:false,
	    			data:{
	    				id:value
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
	    
	    
	   /*  $(function () {
			$("#s_province").live("change",function(){
				alert($("#s_province").val());
			});
			$("#s_city").live("change",function(){
				alert($("#s_city").val());
			});
			$("#s_county").live("change",function(){
				alert($("#s_county").val());
			}); 
		}) */
		
		
		
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
<!-- -------------修改的模态框---------------------- -->
	 <!--登录页面-->
		<div id="popLayer">
			<!--背景置灰层-->
		</div>
		<!-- 弹出的注册页面-->
		<div id="popBox">
			<div id="pop1" style="color: #FF4E09">修改地址</div>

			<div id="pop2" onclick="closeBox()"></div>

			<!-- <div id="pop3" class="popo" href="javascript:void(0)">删除</div> -->

			<div id="pop4" class="popo" href="javascript:void(0)">编辑</div>

         <!--  编辑账目   -->
		 <form id="pop5" class="pop56" method="post" action="<%=basePath%>updateBycon.shtml" enctype="multipart/form-data">
		 	 <input id="House" name="id" class="pop5_1 pop5_2" type="text" size="24"  style="display:none" />
		 	 <input id="HouseID" name="consigneeName" class="pop5_1 pop5_2" type="text" size="24"   placeholder="收货人姓名" />
		 	 <span id="" class="pop5_1 pop5_3"></span>
         	 <input id="SalesmanName" name="streetAddress" class="pop5_1 pop5_2" type="text" size="24"  placeholder="详细地址" />
		  	 <span id="" class="pop5_1 pop5_3"></span>
          	 <input id="HouseAddress" name="phone" class="pop5_1 pop5_2" type="text" size="24" placeholder="手机号码" />
		 	 <span id="" class="pop5_1 pop5_3"></span>
		 	 <a href="javascript:void(0);" id="queren" class="myfrom56">确认</a>
		  </form>
        </div>
       <!--登录页面结束-->
	   
	   
	   
<script type="text/javascript">
	/* 提交编辑表单 */
	 $("#queren").click(function(){
		$("#pop5").submit();
	}); 
	 
	$(".updateAdress").click(function(){
		var $key=$(this).text();
		
		if($key=="删除"){
			var $value=$(this).next("input").val();
			//选中租房信息
			  $.ajax({
					url:"<%=basePath%>/FslCollocationDeleteByIDServlet",
							type : "post",
							data : {
								value : $value
							},
							dataType : "json",
							success : function(result) {
								var flag=result.num;
									if(flag>=1){
										window.location.href="<%=basePath %>/FslCollocationQuery";
										alert("删除成功!");
									}else{
										alert("删除失败.");
									}
							}
						});
		}else{
			popBox();
			var $value=$(this).next("input").val();
			var $value1=$(this).parent().parent().children("td.consigneeName").html();
			var $value2=$(this).parent().parent().children("td.streetAddress").html();
			var $value3=$(this).parent().parent().children("td.phone").html();
			$("#HouseID").val($value1);
			$("#SalesmanName").val($value2);
			$("#HouseAddress").val($value3);
		     var value4=$(this).parent().find("input[type=hidden]").val(); 
			//alert(value4);
			$("#House").val(value4);
			
			
		};
		
	});
	
</script>
	
	
	
	
	
<script type="text/javascript">
	function popBox() {
		var popBox = document.getElementById('popBox');
		var popLayer = document.getElementById('popLayer');
		popLayer.style.width = document.body.scrollWidth + "px";
		popLayer.style.height = document.body.scrollHeight + "px";
		popLayer.style.display = "block";
		popBox.style.display = "block";
	} //end func popBox()
	function closeBox() {
		var popBox = document.getElementById('popBox');
		var popLayer = document.getElementById('popLayer');
		popLayer.style.display = "none";
		popBox.style.display = "none";
	} //end func closeBox()
	
	
	$(document).ready(function() {
		/*点击登录*/
		$("#pop3").click(function() {
			$("#pop3").css({
				"color": "rgb(240, 0, 130)",
				"border-bottom": "3px solid rgb(240, 0, 130)"
			});
			$("#pop4").css({
				"color": "black",
				"border-bottom": "3px solid white"
			});
			$("#pop6").show();
			$("#pop5").hide();
		});

		/*点击注册*/
		$("#pop4").click(function() {
			$("#pop4").css({
				"color": "rgb(240, 0, 130)",
				"border-bottom": "3px solid rgb(240, 0, 130)"
			});
			$("#pop3").css({
				"color": "black",
				"border-bottom": "3px solid white"
			});

			$("#pop5").show();
			$("#pop6").hide();
		});

	});

</script>
	
	
	
<style type="text/css">
#popBox {
	position: absolute;
	display: none;
	width: 437px;
	height: 400px /* 506px */;
	left: 35%;
	top: 10%;
	z-index: 11;
	background: white;
	border: 6px solid rgba(207,207,211,0.5);
}
/*背景置灰*/
#popLayer {
	width: 1000px;
	height: 600px;
	position: absolute;
	display: none;
	left: 0;
	top: 0;
	z-index: 10;
	background: rgb(174,174,174);
	-moz-opacity: 0.5;
	opacity: .50;
	filter: alpha(opacity=50);
	/* 只支持IE6、7、8、9 */
}

#pop1{
	width: 100px;
	height: 28px;
	line-height: 28px;
	font-weight: 500;
	text-align: center;
	float: left;
	clear: left;
	border-left: 3px solid #FF4E09;
	position: absolute;
	left: 10px;
	top: 10px;
}

#pop2{
	width: 20px;
	height: 20px;
	border: 1px solid white;
	position: absolute;
	left: 400px;
	top: 10px;
	float: right;
	clear: right;
	background: url(<%=basePath %>resources/images/关闭.png) no-repeat;cursor: pointer;
	background-size: 100%;
}

.popo{
	width: 100px;
	height: 30px;
	line-height: 30px;
	text-align: center;
	position: relative;
	float: left;
	top: 40px;
	left: 20px;
	
}

#pop4{
	color: #FF4E09;
	border-bottom: 3px solid #FF4E09;
}

.pop56{
	width: 380px;
	height: 330px;
	border-top: 1px solid #FF4E09;
	position: absolute;
	top: 72px;
	left: 28px;
	
}

#pop5{
	/*display: none;*/
}

#pop6{
	display: none;
}

.pop5_1{
	width: 280px;
	height: 30px;
	line-height: 30px;
	border-radius: 3px;
	display: block;
	margin-top: 2px;
	position: relative;
	top: 30px;
	left: 30px;
	text-indent: 10px;
}

.pop5_2{
	border: 1px solid rgba(170,170,170,1);
}

.pop5_3{
	font-size: 12px;
	color:rgb(240, 0, 130) ;
}

.myfrom56{
	display: block;
	width: 150px;
	height: 40px;
	line-height: 40px;
	margin-left: 60px;
	text-align: center;
	border: 1px solid rgb(240, 0, 130);
	border-radius:5px ;
	position: relative;
	top: 25px;
	left: 30px;
	background-color: #FF4E09;
}

.myfrom56:link{
	color: white;
}

.myfrom56:visited{
	color: white;
}

.myfrom56:hover{
	color: white;
}

.pop56_1{
	width: 300px;
	height: 20px;
	line-height: 20px;
	border: 1px solid white;
	font-size: 12px;
	position: relative;
	float: left;
	top: 70px;
	left: 30px;
}

.pop56_1 a:link{
	color:rgb(240, 0, 130) ;
}

.pop56_1 a:visited{
	color:rgb(240, 0, 130) ;
}

.pop56_1 a:hover{
	color:rgb(240, 0, 130) ;
}
	</style>
	
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
