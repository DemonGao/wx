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
		<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
		<meta charset="utf-8" />
		<title>Kindle书城-书库</title>

		<link rel="stylesheet" href="<%=basePath%>book/static/css/weui.css" />
		<!-- font样式 -->
		<link rel="stylesheet" href="<%=basePath%>book/static/font/iconfont.css" />
		<!-- 公共样式 -->
		<link rel="stylesheet" href="<%=basePath%>book/static/css/common_style.css" />
		<!-- booktype独特样式 -->
		<link rel="stylesheet" href="<%=basePath%>book/static/css/booktype.css" />
	</head>

	<body>
		<div class="container" id="container">
			<div class="home">
				<div class="hd">
					<!--<h1 class="page_title">Kindle书城</h1>-->
					<nav class="home_nav">
						<ul class="clearfix">
							<li>
								<a href="<%=basePath%>book/index.jsp"><i class="iconfont icon-ziliaoku"></i><span>书库</span></a>
							</li>
							<li>
								<a href="javascript:;"><i class="iconfont icon-paixingbang"></i><span>书库分类</span></a>
							</li>
							<li>
								<a href="<%=basePath%>book/page/bookranking.jsp"><i class="iconfont icon-iconfenlei"></i><span>书库排行</span></a>
							</li>
							<li>
								<a href="<%=basePath%>book/page/userinfo.jsp"><i class="iconfont icon-huiyuan"></i><span>书库会员</span></a>
							</li>
						</ul>
					</nav>
				</div>
				<div class="bd">
					<div class="weui_panel weui_panel_access">
						<div class="weui_panel_hd panel_htitle" id="book_type_name"><a href="javascript:;" onclick="booktype_back()">书库分类</a></div>
						<div class="weui_panel_bd">
						        <div class="weui_panel">
							        <!-- <div class="weui_panel_hd">小图文组合列表</div> -->
							        <div class="weui_panel_bd"  id="booktype">
							        </div>
							        <div class="weui_panel_bd"  id="booklist">
							        </div>
							        <a class="weui_panel_ft" id="lookmore" href="javascript:void(0);">查看更多</a>
							    </div>
						</div>
						<!-- <a class="weui_panel_ft" id="lookmore" href="javascript:void(0);">查看更多</a>  -->
					</div>
				</div>
			</div>
		</div>

		<script type="text/javascript" src="<%=basePath%>book/static/js/zepto.min.js"></script>
		<script type="text/javascript" src="<%=basePath%>book/static/js/ViewCommand.js"></script>
		<script type="text/javascript" src="<%=basePath%>book/static/js/booktype.js"></script>
	</body>

</html>