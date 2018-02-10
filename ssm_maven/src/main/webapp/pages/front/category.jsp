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
<title>积分商城</title>
<link href="<%=basePath %>resources/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath %>resources/js/public.js"></script>
<script type="text/javascript" src="<%=basePath %>resources/js/jquery.js"></script>
<script type="text/javascript" src="<%=basePath %>resources/js/jqpublic.js"></script>
<script type="text/javascript" src="<%=basePath %>resources/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="<%=basePath %>resources/js/jquery.page.js" charset="utf-8"></script>
<style type="text/css">
*{ margin:0; padding:0; list-style:none;}
a{ text-decoration:none;}
a:hover{ text-decoration:none;}
.TurnPage{padding: 15px 20px;text-align: left;color: #ccc;text-align:center;}
.TurnPage a{display: inline-block;color: #666;display: inline-block;height: 25px;	line-height: 25px;	padding: 0 10px;border: 1px solid #ddd;	margin: 0 2px;border-radius: 4px;vertical-align: middle;}
.TurnPage a:hover{text-decoration: none;border: 1px solid #666220;}
.TurnPage span.current{display: inline-block;height: 25px;line-height: 25px;padding: 0 10px;margin: 0 2px;color: #fff;background-color: #F76220; border: 1px solid #428bca;border-radius: 4px;vertical-align: middle;}
.TurnPage span.disabled{	display: inline-block;height: 25px;line-height: 25px;padding: 0 10px;margin: 0 2px;	color: #bfbfbf;background: #f2f2f2;border: 1px solid #bfbfbf;border-radius: 4px;vertical-align: middle;}
</style>
</head>
<body>
<!-- **********引入头部*********** -->
<%@ include file="top.jsp" %>
<!--Start content-->
<section class="Psection">
 <section class="fslist_navtree">
 </section>
 <section class="CateL Overflow">
  <ul id="content">
  
  <c:forEach items="${Menulists }" var="ml">
   <li> 
   <a href="detailspMenu.shtml?id=${ml.id }">
   <img src="<%=basePath %>resources/images2/${ml.cai_imagepath }">
   <p class="Overflow">${ml.cai_name }</p>
   <p class="Overflow">赠送：<span class="CorRed Font16">2</span>积分<i></i></p>
   <p class="Overflow">${ml.shop_name }</p>
   <p class="Overflow">地址：${ml.shop_address }</p>
   </a>
   </li>
  </c:forEach>
   
  </ul>
  <div class="TurnPage"></div>
 </section>
 <aside class="CateR">
 <!--广告位或推荐位-->
  <div>
   <a href="javascript:void(0);"  ><img src="<%=basePath %>resources/images/ad.jpg"></a>
  </div>
  <div class="Hot_shop">
   <span class="Hshoptile Font14 FontW Block">热门商家</span>
   <ul>
    <li>
     <a href="javascript:void(0);"><img src="<%=basePath %>resources/images/remen1.png"></a>
     <p class="Font14 FontW Overflow Lineheight35"><a href="javascript:void(0);" >NoodleSong连锁店</a></p>
     <p class="Lineheight35 Overflow"><span>地址：北京市顺义区土门新市场斜对面...</span></p>
    </li>
    <li>
     <a href="javascript:void(0);"><img src="<%=basePath %>resources/images/remen2.jpg"></a>
     <p class="Font14 FontW Overflow Lineheight35"><a href="javascript:void(0);" >度小月连锁店</a></p>
     <p class="Lineheight35 Overflow"><span>地址：北京市顺义区土门新市场斜对面...</span></p>
    </li>
    <li>
     <a href="javascript:void(0);"><img src="<%=basePath %>resources/images/remen3.png"></a>
     <p class="Font14 FontW Overflow Lineheight35"><a href="javascript:void(0);" >好味来连锁店</a></p>
     <p class="Lineheight35 Overflow"><span>地址：北京市顺义区土门新市场斜对面...</span></p>
    </li>
    <li>
     <a href="javascript:void(0);"><img src="<%=basePath %>resources/images/remen4.jpg"></a>
     <p class="Font14 FontW Overflow Lineheight35"><a href="javascript:void(0);" >第六层奶茶坊</a></p>
     <p class="Lineheight35 Overflow"><span>地址：北京市顺义区土门新市场斜对面...</span></p>
    </li>
   </ul>
  </div>
 </aside>
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
     <li><a href="javascript:void(0);"   title="标题">支付方式</a></li>
     <li><a href="javascript:void(0);"   title="标题">配送方式</a></li>
     <li><a href="javascript:void(0);"   title="标题">配送效率</a></li>
     <li><a href="javascript:void(0);"   title="标题">服务费用</a></li>
    </ul>
    </div>
    <div>
    <span><i class="i2"></i>关于我们</span>
    <ul>
     <li><a href="javascript:void(0);"   title="标题">招贤纳士</a></li>
     <li><a href="javascript:void(0);"   title="标题">网站介绍</a></li>
     <li><a href="javascript:void(0);"   title="标题">配送效率</a></li>
     <li><a href="javascript:void(0);"   title="标题">商家加盟</a></li>
    </ul>
    </div>
    <div>
    <span><i class="i3"></i>帮助中心</span>
    <ul>
     <li><a href="javascript:void(0);"   title="标题">服务内容</a></li>
     <li><a href="javascript:void(0);"   title="标题">服务介绍</a></li>
     <li><a href="javascript:void(0);"   title="标题">常见问题</a></li>
     <li><a href="javascript:void(0);"   title="标题">网站地图</a></li>
    </ul>
    </div>
  </section>
 </section>
<div class="copyright">© 版权所有 2016 DeathGhost 技术支持：<a href="http://www.deathghost.cn" title="DeathGhost">DeathGhost</a></div>
</footer>
<script type="text/javascript">
/***************分页的js******************/
var  num=${sessionScope.page};
var  max=${sessionScope.maxs};
 $(".TurnPage").createPage({
     pageCount:max,
     current:num,  
     backFn:function(page){
     	//ajax将数据带到后台  
     	// alert(page); 
     	 $.ajax({
		 url:"<%=basePath %>/selectMenu4.shtml",
		 type:"post",
		 dataType:"json",
		 data:{"page":page},
	     success:function(result){
	    		 $("#content").children().remove();
	   		  for(var i =0 ;i<=result.length;i++){
	   			  $("#content").append("<li>"+
	   			          "<a href='"+"detailspMenu.shtml?id="+result[i].id+"'>"+
	   			          "<img src='resources/images2/"+result[i].cai_imagepath+"'>"+
	   					  "<p class='Overflow'>"+result[i].cai_name+"</p>"+
	   					  "<p class='Overflow'>赠送：<span class='CorRed Font16'>2</span>积分<i></i></p>"+
	   					  "<p class='Overflow'>"+result[i].shop_name +"</p>"+
	   					  "<p class='Overflow'>地址："+result[i].shop_address +"</p>"+
	   					  "</a>"+
	   					  "</li>");
	    	 }
	      }
	   })
     }
 });
</script>
</body>
</html>
