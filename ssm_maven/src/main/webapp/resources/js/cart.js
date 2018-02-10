var TTCart = {
	load : function(){ // 加载购物车数据
		
	},
	itemNumChange : function(){
		
		$(".increment").click(function(){//＋
			var _thisInput = $(this).siblings("input");
			_thisInput.val(eval(_thisInput.val()) + 1);
			$.post(TTCart.getRootPath()+"/cartAdd.shtml?num=1&id="+_thisInput.attr("itemId"),function(data){
				TTCart.refreshTotalPrice();
			});
		});
		$(".decrement").click(function(){//-
			var _thisInput = $(this).siblings("input");
			if(eval(_thisInput.val()) == 1){
				return ;
			}
			_thisInput.val(eval(_thisInput.val()) - 1);
			$.post(TTCart.getRootPath()+"/cartAdd.shtml?num=-1&id="+_thisInput.attr("itemId"),function(data){
				TTCart.refreshTotalPrice();
			});
		});
		$(".quantity-form .quantity-text").rnumber(1);//限制只能输入数字
		$(".quantity-form .quantity-text").change(function(){
			var _thisInput = $(this);
			$.post("/service/cart/update/num/"+_thisInput.attr("itemId")+"/"+_thisInput.val(),function(data){
				TTCart.refreshTotalPrice();
			});
		});
	},
	refreshTotalPrice : function(){ //重新计算总价
		var total = 0;
		$(".quantity-form .quantity-text").each(function(i,e){
			var _this = $(e);
			total += (eval(_this.attr("itemPrice"))  * eval(_this.val())) ;
		});
		$(".totalSkuPrice").html(new Number(total).toFixed(2)).priceFormat({ //价格格式化插件
			 prefix: '￥',
			 thousandsSeparator: ',',
			 centsLimit: 2
		});
	},
	getRootPath : function (){  
	    //获取当前网址，如： http://localhost:8083/proj/meun.jsp  
	    var curWwwPath = window.document.location.href;  
	    //获取主机地址之后的目录，如： proj/meun.jsp  
	    var pathName = window.document.location.pathname;  
	    var pos = curWwwPath.indexOf(pathName);  
	    //获取主机地址，如： http://localhost:8083  
	    var localhostPath = curWwwPath.substring(0, pos);  
	    //获取带"/"的项目名，如：/proj  
	    var projectName = pathName.substring(0, pathName.substr(1).indexOf('/')+1);  
	    return(localhostPath + projectName);  
	} 
};

	


$(function(){
	TTCart.load();
	TTCart.itemNumChange();
	TTCart.getRootPath();
});