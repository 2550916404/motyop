$(document).ready(function() {
	function changeshujai() {
		// 获取上方导航栏对象
		var $menu = $(".click1");
		// 获取需要显示的图片详情
		var $dis = $(".login");
		alert("ji");
		$dis.eq(0).show();
		$menu.eq(0).css({
			"color" : "red",
			"text-decoration" : "underline"
		});
		// 点击事件方法
	$menu.click(function() {
			i = $menu.index($(this));
			$dis.eq(i).show();
			$dis.eq(i).siblings().hide();
			$menu.eq(i).css({
				"color" : "red",
				"text-decoration" : "underline"
			});
			$menu.eq(i).siblings().css({
				"color" : "black",
				"text-decoration" : "none"
			});
		});
	}
	changeshujai();
});
$(document).ready(function() {
	function initialize() {
		$("#username2").focus(function() {
			$(".flag").html("");
		});
		$("#username1").focus(function() {
			$(".flag").html("");
		});
		$(".click1").click(function() {
			$(".flag").html("");
		});
	}
	initialize();
});

$(document).ready(function() {
	// 绑定失去焦点事件
	$("#username2").blur(checkUser);
	$("#password2").blur(checkPass);
	$("#password3").blur(checkRePass);
	$("#phonenumber").blur(checkNum);
	$("#email").blur(checkEmail);
	// 提交表单,调用验证函数
	$("#reg").submit(function() {
		var flag = true;
		if (!checkUser()) {
			flag = false;
		}
		if (!checkPass()) {
			flag = false;
		}
		if (!checkRePass()) {
			flag = false;
		}
		if (!checkNum()) {
			flag = false;
		}
		if (!checkEmail()) {
			flag = false;
		}
		return flag;
	});
});
// 验证用户名
function checkUser() {
	var user = $("#username2").val();
	var pattern = /^\w{3,12}$/;
	var $divUser = $(".name2");
	$divUser.html("");
	if (user == "") {
		$divUser.html("用户名不能为空");
		return false;
	}
	if (pattern.test(user) == false) {
		$divUser.html("用户名只能为3-12位数字字母下划线");
		return false;
	}
	$divUser.html("");
	return true;
}

// 验证输入密码
function checkPass() {
	var pwd = $("#password2").val();
	var $divpass = $(".pass2");
	var pattern = /^\d{6,12}$/;
	$divpass.html("");
	if (pwd == "") {
		$divpass.html("密码不能为空");
		return false;
	}
	if (pattern.test(pwd) == false) {
		$divpass.html("密码必须为6-12位数字");
		return false;
	}
	$divpass.html("");
	return true;
}

// 验证重复密码
function checkRePass() {
	var pwd = $("#password2").val(); // 输入密码
	var repwd = $("#password3").val(); // 再次输入密码
	var $pwd = $(".regpass1");
	$pwd.html("");
	if (pwd != repwd) {
		$pwd.html("两次输入的密码不一致");
		return false;
	}
	$pwd.html("");
	return true;
}

// 手机号码验证

function checkNum() {
	var number = $("#phonenumber").val();
	var pattern = /^1[3|4|5|8][0-9]\d{4,8}$/;
	var $num = $(".regnum");
	$num.html("");
	if (number == "") {
		$num.html("手机号码不能为空");
		return false;
	}
	if (pattern.test(number) == false) {
		$num.html("请输入有效的手机号码！");
		return false;
	}
	$num.html("");
	return true;
}

// 邮箱验证

function checkEmail() {
	var mail = $("#email").val();
	var pattern = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
	var $email = $(".regmail");
	$email.html("");
	if (mail == "") {
		$email.html("邮箱不能为空");
		return false;
	}
	if (pattern.test(mail) == false) {
		$email.html("请输入有效的邮箱！");
		return false;
	}
	$email.html("");
	return true;
}

/* 登陆界面验证 */
$(document).ready(function() {
	// 绑定失去焦点事件
	$("#username1").blur(checkUser1);
	$("#password1").blur(checkPass1);
	// 提交表单,调用验证函数
	$("#login").submit(function() {
		var flag = true;
		if (!checkUser1()) {
			flag = false;
		}
		if (!checkPass1()) {
			flag = false;
		}
		return flag;
	});
});
// 验证用户名
function checkUser1() {
	var user = $("#username1").val();
	var pattern = /^\w{3,12}$/;
	var $divUser = $(".name1");
	$divUser.html("");
	if (user == "") {
		$divUser.html("用户名不能为空");
		return false;
	}
	if (pattern.test(user) == false) {
		$divUser.html("用户名只能为3-12位数字字母下划线");
		return false;
	}
	$divUser.html("");
	return true;
}

// 验证输入密码
function checkPass1() {
	var pwd = $("#password1").val();
	var $divpass = $(".pass1");
	var pattern = /^\d{6,12}$/;
	$divpass.html("");
	if (pwd == "") {
		$divpass.html("密码不能为空");
		return false;
	}
	if (pattern.test(pwd) == false) {
		$divpass.html("密码必须为6-12位数字");
		return false;
	}
	$divpass.html("");
	return true;
}