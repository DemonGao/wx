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
		<!-- <script type="text/javascript" src="<%=basePath%>book/static/js/index.js"></script> -->
		
		<script type="text/javascript">
		
		$(function() {
			var currentPage=1;
			var serch_currentPage=1;
			var isserch=false;
			$('#container').on('focus', '#search_input', function() {
				var $weuiSearchBar = $('#search_bar');
				$weuiSearchBar.addClass('weui_search_focusing');
			}).on('blur', '#search_input', function() {
				var $weuiSearchBar = $('#search_bar');
				$weuiSearchBar.removeClass('weui_search_focusing');
				if ($(this).val()) {
					$('#search_text').hide();
				} else {
					$('#search_text').show();
				}
			}).on('input', '#search_input', function() {
				var $searchShow = $("#search_show");
				if ($(this).val()) {
					ajaxBook({serchTag:'name',book_name:$(this).val(),currentPage:1},'search_show','search_show');
					$searchShow.show();
				} else {
					$searchShow.hide().html('');
				}
			}).on('touchend', '#search_cancel', function() {
//				取消 事件绑定
				$("#search_show").hide().html('');
				$('#search_input').val('');
			}).on('touchend', '#search_clear', function() {
//				搜索栏× 按钮事件绑定
				$("#search_show").hide();
				$("#search_show").hide().html('');
				$('#search_input').val('');
			}).on('touchend','#lookmore',function(){
				if(isserch){
					serch_currentPage++;
					ajaxBook({serchTag:'name',book_name:$("#search_input").val(),currentPage:serch_currentPage},'booklist','booklist');
					return ;
				}
				currentPage++;
				ajaxBook({serchTag:'time',currentPage:currentPage},'booklist','booklist');
			}).on('click','#closeconfirm',function(){
				$("#moreconfirm").remove();
			}).on('search',"#search_input",function(){
				//点击键盘搜索时
				serch_currentPage = 1;
				$('#booklist').html("");
				ajaxBook({serchTag:'name',book_name:$("#search_input").val(),currentPage:serch_currentPage},'booklist','booklist');
				$("#search_show").hide();
				$("#search_show").hide().html('');
				isserch=true;
			});
			
		  // .container 设置了 overflow 属性, 导致 Android 手机下输入框获取焦点时, 输入法挡住输入框的 bug
		  // 相关 issue: https://github.com/weui/weui/issues/15
		  // 解决方法:
		  // 0. .container 去掉 overflow 属性, 但此 demo 下会引发别的问题
		  // 1. 参考 http://stackoverflow.com/questions/23757345/android-does-not-correctly-scroll-on-input-focus-if-not-body-element
		  //    Android 手机下, input 或 textarea 元素聚焦时, 主动滚一把
		  if (/Android/gi.test(navigator.userAgent)) {
		      window.addEventListener('resize', function () {
		          if (document.activeElement.tagName == 'INPUT' || document.activeElement.tagName == 'TEXTAREA') {
		              window.setTimeout(function () {
		                  document.activeElement.scrollIntoViewIfNeeded();
		              }, 0);
		          }
		      })
		  }
		  ajaxBook({serchTag:'time',currentPage:currentPage},'booklist','booklist');
		});
		/**
		 * 对ajax封装一下
		 * @param 参数一	data{}	
		 * @param 参数二	容器id		
		 * @param 参数三	模板名称
		 * @param 参数四	识别是否是实时搜索的ajax		
		 */
		function ajaxBook(){
			var data=arguments[0];
			var container=arguments[1];
			var tmp=arguments[2];
			
			$.ajax({
				type:"get",
				url:"/wx/getBookServlet",
				dataType:'json',
				data:data,
				success:function(data){
					console.log(data);
					if(data.result){
						ViewCommand({
							command: 'display',
							param:[container,data.books,tmp]
						})
					}
					if(!data.result&&tmp=="search_show"){
						$("#search_show").hide().html('');
					}
					if(!data.result&&tmp=="booklist"){
//						alert("没有更多数据了！");			
						$("#container").append(
							'<div class="weui_dialog_confirm" id="moreconfirm">'+
								'<div class="weui_mask"></div>'+
								'<div class="weui_dialog">'+
									'<div class="weui_dialog_hd"><strong class="weui_dialog_title">提示</strong></div>'+
									'<div class="weui_dialog_bd">亲~，已经没有内容可以加载了</div>'+
									'<div class="weui_dialog_ft">'+
										'<a href="#" class="weui_btn_dialog primary" id="closeconfirm">确定</a>'+
									'</div>'+
								'</div>'+
							'</div>'
						);
					}
				}
			});
		}
		</script>
		
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