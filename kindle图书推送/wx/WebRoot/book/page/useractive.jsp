<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.wx.util.AccessTokenUtil" %>
<%@ page import="com.wx.util.WeixinUtil" %>
<%@ page import="com.wx.po.OAccessToken" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=0">
<meta charset="utf-8" />
<title>Kindle书城-用户激活</title>

<link rel="stylesheet" type="text/css"
	href="<%=basePath%>book/static/JqueryWeUI/lib/weui.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>book/static/JqueryWeUI/css/jquery-weui.css" />

</head>

<body>
	<header>
	<h3>用户激活</h3>
	</header>
	<div class="container" id="container">
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
			<div class="weui_cell">
				<div class="weui_cell_hd">
					<label class="weui_label">激活码</label>
				</div>
				<div class="weui_cell_bd weui_cell_primary">
					<input id="activecode" class="weui_input" type="text" placeholder="请输入激活码">
				</div>
			</div>
		</div>
		<div class="weui_btn_area">
			<a class="weui_btn weui_btn_primary" href="javascript:" id="activebtn">立即激活</a>
		</div>
	</div>
</body>

<script src="<%=basePath%>book/static/JqueryWeUI/lib/jquery-2.1.4.js"></script>
<script src="<%=basePath%>book/static/JqueryWeUI/lib/fastclick.js"></script>
<script src="<%=basePath%>book/static/JqueryWeUI/js/jquery-weui.js"></script>
<script src="<%=basePath%>book/static/js/useractive.js" type="text/javascript"></script>
</html>
