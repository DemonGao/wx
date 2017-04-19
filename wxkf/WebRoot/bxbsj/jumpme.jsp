<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.wx.util.AccessTokenUtil" %>
<%@ page import="com.wx.util.WeixinUtil" %>
<%@ page import="com.wx.po.OAccessToken" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
OAccessToken otoken=null;
if(request.getParameter("code")!=null){
	otoken=WeixinUtil.getOAccessToken(request.getParameter("code").toString()); 
}
%>
<!DOCTYPE html>
<html>
	<head>
		<title></title>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
		<meta name="description" content="Write an awesome description for your new site here. You can edit this line in _config.yml. It will appear in your document head meta (for Google search results) and in your feed.xml site description.
">
		<link rel="stylesheet" href="static/JqueryWeUI/lib/weui.min.css">
		<link rel="stylesheet" href="static/JqueryWeUI/css/jquery-weui.css">
	</head>

	<body>
		<%
			if(otoken!=null){
				%>
					<script type="text/javascript">
					localStorage.setItem("openid", '<%=otoken.getOpenid()%>');
					</script>
				<%
			}
		%>
		<script src="static/JqueryWeUI/lib/jquery-2.1.4.js"></script>
		<script src="static/JqueryWeUI/lib/fastclick.js"></script>
		<script>
			$(function() {
				FastClick.attach(document.body);
				
			});
		</script>
		<script src="static/JqueryWeUI/js/jquery-weui.js"></script>
		<script>
				$.showLoading();
				$.ajax({
					url:'/wxkf/api/Identity_query',
					data:{
						openid:localStorage.getItem("openid")
					},
					success:function(data){
						if(!data.result){
							window.location.href="/wxkf/bxbsj/cpage/cme.jsp";
						}else{
							window.location.href="/wxkf/bxbsj/page/me.jsp";
						}
					}
				})
		</script>

	</body>

</html>