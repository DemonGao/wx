<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	
%>
<!DOCTYPE html>
<html>

<head>
<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=0">
<meta charset="utf-8" />
<title>Kindle书城-书库</title>

<link rel="stylesheet" href="<%=basePath%>book/static/css/weui.css" />
<!-- font样式 -->
<link rel="stylesheet" href="<%=basePath%>book/static/font/iconfont.css" />
<!-- 公共样式 -->
<link rel="stylesheet"
	href="<%=basePath%>book/static/css/common_style.css" />

<!-- userinfo 样式 -->
<link rel="stylesheet" href="<%=basePath%>book/static/css/userinfo.css" />
</head>

<body>
	<div class="container" id="container">
		<div class="home userinfo">
			<div class="hd">
			<nav class="home_nav">
				<ul class="clearfix">
					<li>
						<a href="<%=basePath%>book/index.jsp"><i class="iconfont icon-ziliaoku"></i><span>书库</span></a>
					</li>
					<li>
						<a href="<%=basePath%>book/page/booktype.jsp"><i class="iconfont icon-paixingbang"></i><span>书库分类</span></a>
					</li>
					<li>
						<a href="<%=basePath%>book/page/bookranking.jsp"><i class="iconfont icon-iconfenlei"></i><span>书库排行</span></a>
					</li>
					<li>
						<a href="javascript:;"><i class="iconfont icon-huiyuan"></i><span>书库会员</span></a>
					</li>
				</ul>
			</nav>
			</div>
			<div class="bd menulist">
				<div class="weui_cells weui_cells_access">
					<div class="weui_panel_hd panel_htitle">书库会员</div>
					<div class="info" id="userinfo"></div>
					<a id="kindlebind" class="weui_cell" href="<%=basePath%>book/page/kindleBind.jsp?openid=">
						<div class="weui_cell_hd">
							<i class="iconfont icon-bangdingyouxiang"></i>
						</div>
						<div class="weui_cell_bd weui_cell_primary">
							<p>邮箱绑定/修改</p>
						</div>
					</a>
					<a id="useractive" class="weui_cell" href="<%=basePath%>book/page/useractive.jsp?openid=">
						<div class="weui_cell_hd">
							<i class="iconfont icon-jihuozhanghu"></i>
							<!-- 
							<img
								src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAC4AAAAuCAMAAABgZ9sFAAAAVFBMVEXx8fHMzMzr6+vn5+fv7+/t7e3d3d2+vr7W1tbHx8eysrKdnZ3p6enk5OTR0dG7u7u3t7ejo6PY2Njh4eHf39/T09PExMSvr6+goKCqqqqnp6e4uLgcLY/OAAAAnklEQVRIx+3RSRLDIAxE0QYhAbGZPNu5/z0zrXHiqiz5W72FqhqtVuuXAl3iOV7iPV/iSsAqZa9BS7YOmMXnNNX4TWGxRMn3R6SxRNgy0bzXOW8EBO8SAClsPdB3psqlvG+Lw7ONXg/pTld52BjgSSkA3PV2OOemjIDcZQWgVvONw60q7sIpR38EnHPSMDQ4MjDjLPozhAkGrVbr/z0ANjAF4AcbXmYAAAAASUVORK5CYII="
								alt="" style="width:20px;margin-right:5px;display:block">
							 -->	
						</div>
						<div class="weui_cell_bd weui_cell_primary">
							<p>用户激活/续费</p>
						</div>
					</a>
				</div>
			</div>
		</div>
		<div id="test"></div>
	</div>
	
	<script type="text/javascript" src="<%=basePath%>book/static/js/zepto.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>book/static/js/ViewCommand.js"></script>
	<script type="text/javascript" src="<%=basePath%>book/static/js/userinfo.js"></script>
		
		<script>
			//alert(sessionStorage.getItem("openid"));
		</script>
</body>

</html>