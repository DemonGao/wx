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
		<title>边学边实践</title>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">

		<meta name="description" content="Write an awesome description for your new site here. You can edit this line in _config.yml. It will appear in your document head meta (for Google search results) and in your feed.xml site description.
">
		<link rel="stylesheet" href="static/font/iconfont.css" />
		<link rel="stylesheet" href="static/JqueryWeUI/lib/weui.min.css">
		<link rel="stylesheet" href="static/JqueryWeUI/css/jquery-weui.css">

		<link rel="stylesheet" href="static/css/style.css" />
		<link rel="stylesheet" href="static/css/index.css" />
	</head>

	<body ontouchstart>

		<div class="weui_tab">
			<div class="weui_navbar">
				<div class="weui_search_bar" id="search_bar">
					<form class="weui_search_outer">
						<div class="weui_search_inner">
							<i class="weui_icon_search"></i>
							<input type="search" class="weui_search_input" id="search_input" placeholder="搜索" required/>
							<a href="javascript:" class="weui_icon_clear" id="search_clear"></a>
						</div>
						<label for="search_input" class="weui_search_text" id="search_text">
          			<i class="weui_icon_search"></i>
          			<span>搜索</span>
        		</label>
					</form>
					<a href="javascript:" class="weui_search_cancel" id="search_cancel">取消</a>
				</div>
			</div>
			<div class="weui_tab_bd">
				<div class="swiper-container carousel">
					<!-- Additional required wrapper -->
					<div class="swiper-wrapper">
						<!-- Slides -->
						<div class="swiper-slide"><img src="static/img/swiper-1.jpg" /></div>
						<div class="swiper-slide"><img src="static/img/swiper-2.jpg" /></div>
						<div class="swiper-slide"><img src="static/img/swiper-3.jpg" /></div>
						<div class="swiper-slide"><img src="static/img/swiper-4.jpg" /></div>
					</div>
					<!-- If we need pagination -->
					<div class="swiper-pagination"></div>
				</div>
				<div class="weui-row weui-no-gutter navtype">
					<!--<div class="weui-col-33" style="border: 1px solid red;">33</div>
			<div class="weui-col-33" style="border: 1px solid red;">33</div>
			<div class="weui-col-33" style="border: 1px solid red;">33</div>-->
					<a href="page/practical.jsp" class="weui-col-33 navtype_list">
						<div class="navtype_list_img blue">
							<img src="static/img/shixi.png" />
						</div>	
						<p class="navtype_list_title">实习</p>
					</a>
					<a href="page/probationary.jsp" class="weui-col-33 navtype_list">
						<div class="navtype_list_img depgreen">
							<img src="static/img/jianzhi.png" />
						</div>
						<p class="navtype_list_title">见习</p>
					</a>
					<a href="page/fulltime.jsp" class="weui-col-33 navtype_list">
						<div class="navtype_list_img green">
							<img src="static/img/quanzhi.png" />
						</div>
						<p class="navtype_list_title">就业</p>
					</a>
					<!-- 
					<a href="page/companylist.jsp" class="weui-col-25 navtype_list">
						<div class="navtype_list_img depblue">
							<img src="static/img/gongsi.png" />
						</div>
						<p class="navtype_list_title">公司</p>
					</a>
					 -->
					<!--<div class="weui-col-25" style="border: 1px solid red;">33</div>
					<div class="weui-col-25" style="border: 1px solid red;">33</div>
					<div class="weui-col-25" style="border: 1px solid red;">33</div>
					<div class="weui-col-25" style="border: 1px solid red;">33</div>-->
				</div>
				<div class="weui-row weui-no-gutter box plate">
					<a href="#" class="weui-col-40 plate_l">
					</a>
					<div class="weui-col-60 plate_r">
						<a href="page/practical.jsp" class="weui-col-100 plate_r_t" style="overflow:hidden">
							<div class="plate_r_t_l">
								<p class="color-green margin-l-15 margin-t-10 font-18">网申职位</p>
								<p class="color-default06 margin-l-15">学生绿色通道</p>
							</div>
							<div class="plate_r_t_r">
								<img src="static/img/plate_r_t.png" style="height:100%"/>
							</div>
						</a>
						<div class="weui-row weui-no-gutter plate_r_b">
							<a href="page/practical.jsp" class="weui-col-50 plate_r_b_l">
								<p class="color-orange margin-l-15 margin-t-10 font-18">热招职位</p>
								<p class="color-default06 margin-l-15">钱多事少</p>
								
							</a>
							<a href="page/practical.jsp" class="weui-col-50 plate_r_b_r">
								<p class="color-blue margin-l-15 margin-t-10 font-18">Hr急招</p>
								<p class="color-default06 margin-l-15">火速入职</p>
							</a>
						</div>
					</div>
				</div>
				<!-- 
				<div class="box textbox">
					<div class="box_title clearfix">
						<h2 class="box_t_h2">宣讲会</h2><span class="box_t_m">更多精彩</span>
					</div>
					<div class="box_content">
						<p>
							<a>新城控股集团2017校园招聘武汉站发...</a>
						</p>
					</div>
					<div class="box_footer">
						<p>2016年10月11日 22:04:12 <span class="bm">报名中</span></p>
					</div>
				</div>
				 -->
			</div>
			<div class="weui_tabbar">
				<a href="<%=basePath %>bxbsj/index.jsp" class="weui_tabbar_item weui_bar_item_on">
					<div class="weui_tabbar_icon" style="text-align:center">
						<i class="iconfont icon-shouye-shouye" style="font-size:22px;"></i>
					</div>
					<p class="weui_tabbar_label">首页</p>
				</a>
				<a href="<%=basePath %>bxbsj/page/message.jsp" class="weui_tabbar_item">
					<div class="weui_tabbar_icon" style="text-align:center">
						<i class="iconfont icon-xiaoxi" style="font-size:22px;"></i>
					</div>
					<p class="weui_tabbar_label">消息</p>
				</a>
				<a href="<%=basePath %>bxbsj/page/me.jsp" class="weui_tabbar_item">
					<div class="weui_tabbar_icon" style="text-align:center">
						<i class="iconfont icon-my" style="font-size:22px;"></i>
					</div>
					<p class="weui_tabbar_label">我</p>
				</a>
			</div>
		</div>
		<script src="static/JqueryWeUI/lib/jquery-2.1.4.js"></script>
		<script src="static/JqueryWeUI/lib/fastclick.js"></script>
		<%
			if(otoken!=null){
				%>
					<script type="text/javascript">
					localStorage.setItem("openid", '<%=otoken.getOpenid()%>');
					</script>
				<%
			}
		%>
		<script src="static/JqueryWeUI/js/jquery-weui.js"></script>
		<script src="static/JqueryWeUI/js/swiper.js"></script>
		
		<script>
			$(".swiper-container").swiper({
				loop: true,
				autoplay: 3000
			});
		</script>

	</body>

</html>