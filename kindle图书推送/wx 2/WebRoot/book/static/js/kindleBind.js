$(function() {
	FastClick.attach(document.body);
	$.ajax({
		type : "GET",
		url : "/wx/getEmailServlet",
		dataType : 'json',
		data : {
			openid : $('#openid').val()
		},
		success : function(data) {
			if (data.result) {
				if (data.email != "") {
					$('#tabbox1 h4').html("您已经绑定过邮箱" + data.email);
					$('#step1').html("确认修改");
					$('#tabbox2email').html("17853593651@163.com");
					$('#tabbox3email').html("17853593651@163.com");
				}
			}
		}

	});
	if (sessionStorage.getItem("ymxback")) {
		$("#tabul li").eq(2).find("span").addClass("active");
		$("#tabul li").eq(2).siblings().removeClass("active").find("span")
				.removeClass("active");
		$(".tabbox").eq(2).addClass("active").siblings().removeClass("active");
	}
});

/* 每页按钮 */
$("#tabul li").on(
		"click",
		function() {
			var index = $(this).index();
			$(this).find("span").addClass("active");
			$(this).siblings().removeClass("active").find("span").removeClass(
					"active");

			$(".tabbox").eq(index).addClass("active").siblings().removeClass(
					"active");
		});
$("#step1").on(
		"click",
		function() {
			if ($('#email').val() == "") {
				$.toast("邮箱不能为空", "cancel");
				return;
			}
			$.ajax({
				type : "get",
				url : "/wx/addEmailServlet",
				dataType : 'json',
				data : {
					type : "kindleBind",
					openid : $('#openid').val(),
					email : $('#email').val() + $('#emailselect').val()
				},
				success : function(data) {
					console.log(data);
					if (data.result) {
						$("#tabul li").eq(1).find("span").addClass("active");
						$("#tabul li").eq(1).siblings().removeClass("active")
								.find("span").removeClass("active");
						$(".tabbox").eq(1).addClass("active").siblings()
								.removeClass("active");
						$('#tabbox2h4').html('Kindle书城推已为您生成专属推送邮箱');
						//$('#tabbox1 h4').html("您已经绑定过邮箱" + data.email);
						$('#tabbox2email').html("17853593651@163.com");
						$('#tabbox3email').html("17853593651@163.com");
						$('#tabbox2span').html('请前往亚马逊网站，将该邮箱添加到信任列表');
					} else {
						$('#tabbox2h4').html('您还没有绑定Kindle书城推送邮箱,请会退到第一步');
						// $('#tabbox2email').html(data.email);
						// $('#tabbox2span').html('请前往亚马逊网站，将该邮箱添加到信任列表');

					}
				}
			})
		});

$("#step2").on(
		"click",
		function() {
			sessionStorage.setItem("ymxback", true);
			$("#tabul li").eq(2).find("span").addClass("active");
			$("#tabul li").eq(2).siblings().removeClass("active").find("span")
					.removeClass("active");
			$(".tabbox").eq(2).addClass("active").siblings().removeClass(
					"active");
});
$("#step3").on(
		"click",
		function() {
			timer(10);
			$.ajax({
				type : "GET",
				url : "/wx/sendEmailServlet",
				dataType : 'json',
				data : {
					openid : $('#openid').val()
				},
				success : function(data) {
					$.hideLoading();
					if (data.result) {
						$.toast("发送成功", function() {
							console.log('close');
						});
					}else{
						$.toast("发送失败", "cancel", function(toast) {
							console.log(toast);
						});
					}
				}

			});
});
	//防止多次发送
	function timer(time) {
		var btn = $("#step3");
		btn.attr("disabled", true); //按钮禁止点击
		btn.css({"background-color":"#ccc","color":"#000"});
		btn.html(time <= 0 ? "再此发送测试邮箱到kindle设备" : ("" + (time) + "秒后可发送"));
		var hander = setInterval(function() {
			if (time <= 0) {
				clearInterval(hander); //清除倒计时
				btn.html("再此发送测试邮箱到kindle设备");
				btn.css({"background-color":"#04be02","color":"#fff"});
				btn.attr("disabled", false);
				return false;
			} else {
				btn.html("" + (time--) + "秒后可发送");
			}
		}, 1000);
	}