<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.wx.util.AccessTokenUtil" %>
<%@ page import="com.wx.util.WeixinUtil" %>
<%@ page import="com.wx.po.OAccessToken" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>Kindle书城-邮箱绑定</title>

<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=0">
<meta charset="utf-8" />

<link rel="stylesheet" type="text/css"
	href="<%=basePath%>book/static/JqueryWeUI/lib/weui.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>book/static/JqueryWeUI/css/jquery-weui.css" />

<link rel="stylesheet" type="text/css"
	href="<%=basePath%>book/static/css/kindleBind.css" />
</head>

<body ontouchstart>
	
	<header class="demos-header">
		<ul class="tabul clearfix" id="tabul">
			<li><span class="active">1</span> <span class="tabline"></span></li>
			<li><span>2</span> <span class="tabline"></span></li>
			<li><span>3</span></li>
		</ul>
	</header>
	<div class="container">
		<div class="tabbox active" id="tabbox1">
			<h4>正在进行推送邮箱绑定</h4>
			<div class="weui_cells weui_cells_form">
			<%
				if(request.getParameter("openid")!=null){
					%>
					<input id="openid" type="hidden" value="<%=request.getParameter("openid")%>">
					<%
				}else{
					OAccessToken otoken=WeixinUtil.getOAccessToken(request.getParameter("code").toString());
					%>
					<input id="openid" type="hidden" value="<%=otoken.getOpenid()%>">
					<%
				}
			%>
				<div class="weui_cell weui_cell_select">
					<div class="weui_cell_hd">
						<label class="weui_label email_label">邮箱</label>
					</div>
					<div class="weui_cell_bd weui_cell_primary">
						<input id="email" class="weui_input email_input" type="email"
							placeholder="请输入推送邮箱">
					</div>
					<div class="weui_cell_bd weui_cell_primary email">
						<select id="emailselect" class="weui_select email_select" name="select1">
							<option selected="" value="@iduocan.com">@iduocan.com</option>
							<option value="@kindle.cn">@kindle.cn</option>
							<option value="@kindle.com">@kindle.com</option>
							<option value="@qq.com">@qq.com</option>
						</select>
					</div>
				</div>
			</div>
			<div class="btndiv">
				<a id="step1" href="javascript:;" class="weui_btn weui_btn_primary">确认绑定</a>
			</div>
		</div>
		<div class="tabbox tabbox2">
			<h4 id="tabbox2h4">Kindle书城推已为您生成专属推送邮箱</h4>
			<p id="tabbox2email"></p>
			<span id="tabbox2span">请前往亚马逊网站，将该邮箱添加到信任列表</span>
			<div class="btndiv">
				<a id="step2" href="https://www.amazon.cn/ap/signin?openid.return_to=https%3A%2F%2Fwww.amazon.cn%2Fmn%2Fdcw%2Fmyx.html&openid.identity=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.assoc_handle=cnamazon&openid.mode=checkid_setup&openid.claimed_id=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.ns=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0&accountStatusPolicy=P1#/home/settings/payment" class="weui_btn weui_btn_primary">知道怎么添加信任,直接前往亚马逊</a>
			</div>
			<!-- 
			<a style="width:80%;margin:20px auto 0;text-align:center;display:block;" href="javascript:;" onclick="step2div()">点我查看如何找到自己的kindle邮箱?</a>
			<div id="step2div">12312312</div>
			 -->
		</div>
		<div class="tabbox" >
			<h4>您已将推送邮箱添加到亚马逊信任列表了吗</h4>
			<p id="tabbox3email">1</p>
			<div class="btndiv">
				<button href="javascript:;" id="step3" class="weui_btn weui_btn_primary">添加完成，发送测试邮箱到kindle设备</button>
			</div>
		</div>
	</div>
</body>
<script src="<%=basePath%>book/static/JqueryWeUI/lib/jquery-2.1.4.js"></script>
<script src="<%=basePath%>book/static/JqueryWeUI/lib/fastclick.js"></script>
<script src="<%=basePath%>book/static/JqueryWeUI/js/jquery-weui.js"></script>
<script src="<%=basePath%>book/static/js/kindleBind.js"></script>
<script type="text/javascript">
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
			$("#step3").prop('disabled', true);
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
</script>

</html>
