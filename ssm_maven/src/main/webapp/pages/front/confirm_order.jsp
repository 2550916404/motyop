<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() +request.getContextPath()+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>确认订单</title>
<link href="<%=basePath %>resources/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath %>resources/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="<%=basePath %>resources/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="<%=basePath %>resources/js/public.js"></script>
</head>
<body>
<!-- **********引入头部*********** -->
<%@ include file="top.jsp" %>
<!--Start content-->
<section class="Psection MT20" id="Cflow">
<!--如果用户未添加收货地址，则显示如下-->
 <div class="confirm_addr_f">
  <span class="flow_title">收货地址：</span>
  <!--如果未添加地址，则显示此表单-->
  <form class="add_address" action="#" style="display:none;">
   <p><i>收件人姓名：</i><input type="text" name="" required></p>
   <p>
   <i>选择所在地：</i> 
   <select name="">
    <option>陕西省</option>
   </select>
   <select name="">
    <option>西安市</option>
   </select>
   <select name="">
    <option>莲湖区</option>
   </select>
   </p>
   <p><i>街道地址：</i><input type="text" required size="50"></p>
   <p><i>邮政编码：</i><input type="text" required size="10" pattern="[0-9]{6}"></p>
   <p><i>手机号码：</i><input type="text" name="" required pattern="[0-9]{11}"></p>
   <p><i></i><input name="" type="submit" value="确定"></p>
  </form>
  <!--已保存的地址列表-->
  <form action="#">
   <ul class="address">
   <c:forEach items="${list }" var="Consignee" varStatus="indexs">
	    <li id="style${indexs.current }"><input type="radio" value="${Consignee.id }" id="${indexs.current }" name="rdColor" onclick="changeColor(${indexs.current })" class="${Consignee.phone }"/><label for="${indexs.current }"> ${Consignee.streetAddress }（${Consignee.consigneeName }收）<span class="fontcolor">${Consignee.phone }</span></label></li>
    </c:forEach>
   </ul>
   </form>
   <!--add new address-->
   <form action="#">
   <div id="light" class="O-L-content">
    <ul>
     <li><span><label for="">选择所在地：</label></span><p><em>*</em><select name=""><option>陕西省</option></select> <select name=""><option>西安市</option></select> <select name=""><option>雁塔区</option></select></p></li>
     <li><span><label for="">邮政编码：</label></span><p><em>*</em><input name="" type="text"  class="Y_N"  pattern="[0-9]{6}" required></p></li>
     <li><span><label for="">街道地址：</label></span><p><em>*</em><textarea name="" cols="80" rows="5"></textarea></p></li>
     <li><span><label for="">收件人姓名：</label></span><p><em>*</em><input name="" type="text"></p></li>
     <li><span><label for="">手机号码：</label></span><p><em>*</em><input name="" type="text" pattern="[0-9]{11}" required></p></li>
     <div class="button-a"><input type="button" value="确 定" class="C-button" /><a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'"><span><input name="" type="button" value="取 消"  class="Cancel-b"/></a></div>
    <div class="close-botton"><a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'"></a></div>
   </div> 
   <div id="fade" class="overlay"></div>
    </ul>
    
   <!--End add new address-->
   </form>
 </div>
<!--配送方式及支付，则显示如下-->
<!--check order or add other information-->
 <div class="pay_delivery">
  <span class="flow_title">在线支付方式：</span>
   <form action="#">
    <ul>
    <li><input type="radio" name="pay" id="alipay" value="alipay" /><label for="alipay"><i class="alipay"></i></label></li>
    </ul>
   </form>
  </div>
  <div class="inforlist">
   <span class="flow_title">商品清单</span>
   <table>
    <th>名称</th>
    <th>数量</th>
    <th>价格</th>
    <th>小计</th>
    <c:forEach items="${cartItems }" var="cart">
	    <tr>
	     <td>${cart.title }</td>
	     <td>${cart.num }</td>
	     <td>￥${cart.price }</td>
	     <td><fmt:formatNumber value="${cart.num*cart.price}" type="currency" pattern="￥.00"/></td>
	    </tr>
    </c:forEach>
   </table>
    <div class="Sum_infor">
    <p class="p1">配送费用：￥0.00+商品费用：￥${prine }</p>
    <p class="p2">合计：￥<span id="prine">${prine }</span></p>
    <input type="submit" value="提交订单"  class="p3button">
    </div>
   </div>
 </div>
</section>
<script>
$(document).ready(function(){
 var submitorder =$.noConflict();
 submitorder(".p3button").click(function(){
	 var val=$('input:radio[name="rdColor"]:checked').val();
	 if(val==null){
            alert("请选择地址");
            return false;
        }
        else{
        	var pay=$('input:radio[name="pay"]:checked').val();
        	if (pay==null) {
				alert("请选择支付方式")
				return false;
			}else{
	            submitorder("#Cflow").hide();
	       	 	submitorder("#Aflow").show();
			}
            
        }
	 });
}); 
</script>
<section class="Psection MT20 Textcenter" style="display:none;" id="Aflow">

	  <!-- 订单提交成功后则显示如下 -->
	  <p class="Font14 Lineheight35 FontW">恭喜你！订单提交成功！</p>
	  <p class="Font14 Lineheight35 FontW">您的订单编号为：<span id="idtime" class="CorRed">${timestamp }</span></p>
	  <p class="Font14 Lineheight35 FontW">共计金额：￥<span id="prine1" class="CorRed">${prine }</span></p>
	  <p><button type="button" class="Lineheight35"><a class="alipay" href="javascript:void(0)" target="_blank" >支付宝立即支付</a></button><button type="button" class="Lineheight35"><a href="pages/front/user_center.jsp">进入用户中心</button></p>
	  <form action="<%=basePath %>viewOrder.shtml" target= "_blank" id="alipayfrom">
	  		<input type="hidden" name="idtime" value="55"/> <br />
	  		<input type="hidden" name="prine1" value="55"/> <br />
	  		<input type="hidden" name="nid" value="55"/> <br />
	  		<input type="hidden" name="ipone" value="55"/> <br />
	  </form>
</section>
<script type="text/javascript">
$("a[class='alipay']").click(function(){  
		//获取id
		var nid = $("input[type='radio']:checked").val();
		//获取电话号码
		var ipone = $("input[type='radio']:checked").attr("class");
		//获取价格
		var prine = $("#prine").html();
		//获取时间戳
		var timestamp = $("#idtime").html();
		 //去掉价格中的逗号
		 var pre= prine.replace(/,/,'');
		 //设置隐藏域的值
		 //设置时间戳
		 $("input[name='idtime']").val(timestamp);
		 //设置价格
		 $("input[name='prine1']").val(pre);
		 //设置电话号码
		 $("input[name='ipone']").val(ipone);
		 //设置id，后台根据id查询收货人
		 $("input[name='nid']").val(nid);
			$("#alipayfrom").submit(); 
	    });
</script>
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
     <li><a href="article_read.html" target="_blank" title="标题">支付方式</a></li>
     <li><a href="article_read.html" target="_blank" title="标题">配送方式</a></li>
     <li><a href="article_read.html" target="_blank" title="标题">配送效率</a></li>
     <li><a href="article_read.html" target="_blank" title="标题">服务费用</a></li>
    </ul>
    </div>
    <div>
    <span><i class="i2"></i>关于我们</span>
    <ul>
     <li><a href="article_read.html" target="_blank" title="标题">招贤纳士</a></li>
     <li><a href="article_read.html" target="_blank" title="标题">网站介绍</a></li>
     <li><a href="article_read.html" target="_blank" title="标题">配送效率</a></li>
     <li><a href="article_read.html" target="_blank" title="标题">商家加盟</a></li>
    </ul>
    </div>
    <div>
    <span><i class="i3"></i>帮助中心</span>
    <ul>
     <li><a href="article_read.html" target="_blank" title="标题">服务内容</a></li>
     <li><a href="article_read.html" target="_blank" title="标题">服务介绍</a></li>
     <li><a href="article_read.html" target="_blank" title="标题">常见问题</a></li>
     <li><a href="article_read.html" target="_blank" title="标题">网站地图</a></li>
    </ul>
    </div>
  </section>
 </section>
<div class="copyright">© 版权所有 2016 DeathGhost 技术支持：<a href="http://www.deathghost.cn" title="DeathGhost">DeathGhost</a></div>
</footer>
</body>
</html>
