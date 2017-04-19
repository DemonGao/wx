<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.wx.util.AccessTokenUtil"%>
<%@ page import="com.wx.util.WeixinUtil"%>
<%@ page import="com.wx.po.OAccessToken"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	
	OAccessToken otoken = WeixinUtil.getOAccessToken(request.getParameter("code").toString());
%>
<!DOCTYPE html>
<html>

<head>
<title>企业入口-登陆</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no">

<meta name="description"
	content="Write an awesome description for your new site here. You can edit this line in _config.yml. It will appear in your document head meta (for Google search results) and in your feed.xml site description.
">
<link rel="stylesheet" href="../static/font/iconfont.css" />
<link rel="stylesheet" href="../static/JqueryWeUI/lib/weui.min.css">
<link rel="stylesheet" href="../static/JqueryWeUI/css/jquery-weui.css">

<link rel="stylesheet" href="../static/css/style.css" />
<style>
.weui_label {
	width: 22px;
}

html {
	font-size: 10px;
}
header{
	margin:30px 0;
	height:100px;
}
header img{
	display:block;
	width:100px;
	height:100px;
	margin:0 auto;
}

#vue_from{
	margin:0 20px;
	border-radius:10px;
}
#vue_from>div{
	border-radius:5px;
}
#vue_from a.loginorreg{
	display:inline-block;
	font-size:14px;
	color:#666;
	float:left;
}
#vue_from a.loginorreg:last-child {
	float:right;
}
</style>
</head>

<body>
	<header>
		<img alt="边学边实践Logo" src="<%=basePath%>bxbsj/static/img/logo.jpg">
	</header>
	<div id="vue_from" >
		<div class="weui_cells weui_cells_form nomargin">
			<div class="weui_cell">
				<div class="weui_cell_hd margin-r-15">
					<label class="weui_label"><i class="iconfont icon-yonghuming font-22"></i></label>
				</div>
				<div class="weui_cell_bd weui_cell_primary">
					<input class="weui_input" type="text" placeholder="请输入登录账号"
						v-model="username">
				</div>
			</div>
			<div class="weui_cell">
				<div class="weui_cell_hd margin-r-15">
					<label class="weui_label"><i class="iconfont icon-mima font-22"></i></label>
				</div>
				<div class="weui_cell_bd weui_cell_primary">
					<input class="weui_input" type="password" id="password"
						placeholder="请输入密码" v-model="password">
				</div>
			</div>
			
		</div>
		<a href="javascript:;" class="weui_btn weui_btn_primary margin-t-15" v-on:click="submit">登录</a>
		<p class="clearfix margin-t-15">
			<!-- <a class="loginorreg" href="#">忘记密码</a> -->
			<a class="loginorreg" href="reCompany_reg.jsp">我要注册</a>
		</p>
		
	</div>
	
	<script src="../static/JqueryWeUI/lib/jquery-2.1.4.js"></script>
	<script src="../static/JqueryWeUI/lib/fastclick.js"></script>
	<script>
		$(function() {
			FastClick.attach(document.body);
		});
	</script>
	<%
		if(otoken!=null){
			%>
				<script type="text/javascript">
				localStorage.setItem("openid", '<%=otoken.getOpenid()%>');
				</script>
			<%
		}
	%>
	<script src="../static/JqueryWeUI/js/jquery-weui.js"></script>
	<script type="text/javascript" src="../static/js/vue.js"></script>
	<script>
		var vue_from = new Vue({
			el : '#vue_from',
			data : {
				username : '',
				password : '',
				openid:'<%=otoken.getOpenid()%>'
			},
			methods : {
				submit : function() {
					if(this.username==""){
						$.toast("用户名不能为空!", "text");
						return ;
					}
					if(this.password==""){
						$.toast("密码不能为空!", "text");
						return ;
					}
					$.showLoading();
					$.ajax({
						url:"/wxkf/api/Company_login",
						type:"POST",
						data:{
							"company.company_username" : this.username,
							"company.company_password" : this.password,
							"company.openid" : this.openid
						},
						success:function(data){
							$.hideLoading();
							if (data.result) {
								 setTimeout(function(){
									 window.location.href="/wxkf/bxbsj/company_index.jsp";
								 }, 250);
							} else {
								$.alert(data.error_msg);
							}
						}
					})
				}
			}
		})
	</script>
</body>

</html>