<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.wx.util.AccessTokenUtil"%>
<%@ page import="com.wx.util.WeixinUtil"%>
<%@ page import="com.wx.po.OAccessToken"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>

<head>
<title>企业入口-注册</title>
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
					<input class="weui_input" type="text" placeholder="请输入用户名"
						v-model="username">
				</div>
			</div>
			<div class="weui_cell">
				<div class="weui_cell_hd margin-r-15">
					<label class="weui_label"><i class="iconfont icon-mima font-22"></i></label>
				</div>
				<div class="weui_cell_bd weui_cell_primary">
					<input class="weui_input" type="password" placeholder="请输入密码" v-model="password">
				</div>
			</div>
			<div class="weui_cell">
				<div class="weui_cell_hd margin-r-15">
					<label class="weui_label"><i class="iconfont icon-querenmima font-20"></i></label>
				</div>
				<div class="weui_cell_bd weui_cell_primary">
					<input class="weui_input" type="password" placeholder="请输入确认密码" v-model="repassword">
				</div>
			</div>
			<div class="weui_cell">
				<div class="weui_cell_hd margin-r-15">
					<label class="weui_label"><i class="iconfont icon-youxiang font-22"></i></label>
				</div>
				<div class="weui_cell_bd weui_cell_primary">
					<input class="weui_input" type="email" placeholder="请输入邮箱" v-model="email">
				</div>
			</div>
		</div>
		<p class="clearfix margin-t-15 font-12">
			点击下面的”下一步“按钮，即表示你同意 <a href="#">《用户协议》</a> 与 <a href="#">《隐私政策》</a>
		</p>	
		<a href="javascript:;" class="weui_btn weui_btn_primary margin-t-15" v-on:click="submit">注册</a>
		
		
	</div>
	
	<script src="../static/JqueryWeUI/lib/jquery-2.1.4.js"></script>
	<script src="../static/JqueryWeUI/lib/fastclick.js"></script>
	<script>
		$(function() {
			FastClick.attach(document.body);
		});
	</script>
	<script src="../static/JqueryWeUI/js/jquery-weui.js"></script>
	<script type="text/javascript" src="../static/js/vue.js"></script>
	<script>
		var vue_from = new Vue({
			el : '#vue_from',
			data : {
				username : '',
				password : '',
				repassword:'',
				email:'',
				openid:localStorage.getItem("openid")
			},
			methods : {
				submit : function() {
					if(this.username==''){
						$.toast("用户名不能为空!", "text");
						return ;
					}
					if(!/^(\w){6,20}$/.test(this.username)){
						$.toast("用户名长度应在6~20位", "text");
						return ;
					}
					if(this.password==''){
						$.toast("密码不能为空!", "text");
						return ;
					}
					if(!/^(\w){6,20}$/.test(this.password)){
						$.toast("密码长度应在6~20位", "text");
						return ;
					}
					if(this.password!=this.repassword){
						$.toast("两次密码输入不一致!", "text");
						return ;
					}
					if(!/\w[-\w.+]*@([A-Za-z0-9][-A-Za-z0-9]+\.)+[A-Za-z]{2,14}/.test(this.email)){
						$.toast("邮箱格式不正确!", "text");
						return ;
					}
					$.ajax({
						url:"/wxkf/api/Company_reg",
						type:"POST",
						data:{
							"company.company_username" : this.username,
							"company.company_password" : this.password,
							"company.openid" : this.openid,
							"company.company_email":this.email,
						},
						success:function(data){
							if (data.result) {
								$.alert("注册成功!请先到PC端进行企业认证后,在进行微信微信企业绑定！", "提示");
							} else {
								alert(data.error_msg);
							}
						}
					})
				}
			}
		})
	</script>
</body>

</html>