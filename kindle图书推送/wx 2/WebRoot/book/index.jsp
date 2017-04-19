<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.wx.util.AccessTokenUtil" %>
<%@ page import="com.wx.util.WeixinUtil" %>
<%@ page import="com.wx.po.OAccessToken" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	OAccessToken otoken=null;
	if(request.getParameter("code")!=null){
		otoken=WeixinUtil.getOAccessToken(request.getParameter("code").toString()); 
	}
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
		<!-- 主页书城css样式 -->
		<link rel="stylesheet" href="<%=basePath%>book/static/css/index.css" />
	</head>

	<body>
		<div class="container" id="container">
			<div class="home">
				<div class="hd">
					<!--<h1 class="page_title">Kindle书城</h1>-->
					<nav class="home_nav">
						<ul class="clearfix">
							<li>
								<a href="javascript:;"><i class="iconfont icon-ziliaoku"></i><span>书库</span></a>
							</li>
							<li>
								<a href="<%=basePath%>book/page/booktype.jsp"><i class="iconfont icon-paixingbang"></i><span>书库分类</span></a>
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
					<!--<a href="javascript:;" class="weui_btn weui_btn_primary">点击展现searchBar</a>-->
					<div class="weui_search_bar" id="search_bar">
						<form class="weui_search_outer" action="javascript:;"  method="post" id="serchform" >
							<div class="weui_search_inner">
								<i class="weui_icon_search"></i> <input type="search" name="book_name" class="weui_search_input" id="search_input" placeholder="图书搜索"  />
								<a href="javascript:" class="weui_icon_clear" id="search_clear"></a>
							</div>
							<label for="search_input" class="weui_search_text" id="search_text"> <i class="weui_icon_search"></i> <span>图书搜索</span>
						</label>
						</form>
						<a href="javascript:" class="weui_search_cancel" id="search_cancel">取消</a>
					</div>
					<div class="weui_cells weui_cells_access search_show" id="search_show">
						<!-- 
						<div class="weui_cell">
							<div class="weui_cell_bd weui_cell_primary">
								<p>实时搜索文本</p>
							</div>
						</div>
						 -->
					</div>
					<div class="weui_panel weui_panel_access">
						<div class="weui_panel_hd panel_htitle">最近更新</div>
						<div class="weui_panel_bd" id="booklist">
							<!-- 
							<a href="www.baidu.com" class="weui_media_box weui_media_appmsg">
						   		<div class="weui_media_hd">
						   			<img class="weui_media_appmsg_thumb" src="{#book_img#}" alt="">
						   		</div>
						   		<div class="weui_media_bd">
						   			<h4 class="weui_media_title">{#book_name#}</h4>  		
						   			<p class="weui_media_desc">{#book_info#}</p>
						   		</div>
						   	</a>
						   	 -->
						</div>
						<a class="weui_panel_ft" id="lookmore" href="javascript:void(0);">查看更多</a>
					</div>
				</div>
			</div>
		</div>

		<script type="text/javascript" src="<%=basePath%>book/static/js/zepto.min.js"></script>
		<script type="text/javascript" src="<%=basePath%>book/static/js/ViewCommand.js"></script>
		<script type="text/javascript" src="<%=basePath%>book/static/js/index.js"></script>
		<%
			if(otoken!=null){
				%>
					<script type="text/javascript">
						sessionStorage.setItem("openid", '<%=otoken.getOpenid()%>');
					</script>
				<%
			}
		%>
	</body>

</html>