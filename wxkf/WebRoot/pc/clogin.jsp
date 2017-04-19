<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>企业登录</title>
<link type="text/css" rel="stylesheet" href="<%=basePath%>pc/commonstatic/css/cssreset.css" />
<link type="text/css" rel="stylesheet" href="<%=basePath%>pc/commonstatic/css/Gscstyle.css" />
<link type="text/css" rel="stylesheet" href="<%=basePath%>pc/static/css/clogin.css" />

</head>
<body>
	<div class="loginbox">
		<form id="loginForm" action="<%=basePath %>pc/querys" method="post">
			<div class="form-list">
				<label for="username">用户名：</label> <input type="text" id="username"
					name="company.company_username" />
			</div>
			<div class="form-list">
				<label for="password">密<span class="em1"></span>码：
				</label> <input type="password" id="password"
					name="company.company_password" />
					<%
					if(session.getAttribute("ERR")!=null){
					%><%=session.getAttribute("ERR")%><%
					}
					 %>
			</div>
			<input id="but1" type="submit" value="登录" />
		</form>
	</div>
	<script type="text/javascript" src="<%=basePath%>pc/commonstatic/js/jquery-1.11.1.js"></script>
	<!--<script type="text/javascript" src="<%=basePath%>pc/commonstatic/js/jquery.validate.min.js"></script>-->
	<script>
 

		$(function() {
			$("#loginForm").validate({
				debug : true,
				rules : {
					"company.company_username" : {
						required : true
					}
				},
				messages : {
					"company.company_username" : {
						required : "用户名不能为空!"
					}
				}
			})

		})
	</script>

</body>
</html>
