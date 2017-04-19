<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>

	<head>
		<title>消息</title>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">

		<meta name="description" content="Write an awesome description for your new site here. You can edit this line in _config.yml. It will appear in your document head meta (for Google search results) and in your feed.xml site description.
">
		<link rel="stylesheet" href="../static/font/iconfont.css" />
		<link rel="stylesheet" href="../static/JqueryWeUI/lib/weui.min.css">
		<link rel="stylesheet" href="../static/JqueryWeUI/css/jquery-weui.css">

		<link rel="stylesheet" href="../static/css/style.css" />
		<link rel="stylesheet" href="../static/css/message.css" />
	</head>

	<body ontouchstart>
		<div class="weui_tab">
			<div class="weui_tab_bd">
				<div class="box nospacebox nopadding nomargin">
					<div class="weui-row weui-no-gutter box plate nomargin">
						<a href="joboffer.jsp" class="weui-col-33">
							<div>
								<i class="iconfont icon-contact color-blue"></i>
								<p class="color-default">职位邀约</p>
							</div>
						</a>
						<a href="jobfeedback.jsp" class="weui-col-33">
							<div>
								<i class="iconfont icon-dingwei color-blue"></i>
								<p class="color-default">投递反馈</p>
							</div>
						</a>
						<a href="resume_likejob.jsp" class="weui-col-33">
							<div>
								<i class="iconfont icon-ganxingqu color-blue"></i>
								<p class="color-default">对我感兴趣</p>
							</div>
						</a>
					</div>
				</div>
				<div class="box">
					<img src="../static/img/pic_06.png" style="width:100%" />
					<!-- 
					<div class="weui_panel weui_panel_access" style="margin-top: 0;" id="content">
						<div class="weui_panel_bd border-t-default">
							<a href="javascript:;" class="weui_media_box weui_media_appmsg padding10">
								<div class="weui_media_hd radius">
									<img class="weui_media_appmsg_thumb" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAHgAAAB4CAMAAAAOusbgAAAAeFBMVEUAwAD///+U5ZTc9twOww7G8MYwzDCH4YcfyR9x23Hw+/DY9dhm2WZG0kbT9NP0/PTL8sux7LFe115T1VM+zz7i+OIXxhes6qxr2mvA8MCe6J6M4oz6/frr+us5zjn2/fa67rqB4IF13XWn6ad83nxa1loqyirn+eccHxx4AAAC/klEQVRo3u2W2ZKiQBBF8wpCNSCyLwri7v//4bRIFVXoTBBB+DAReV5sG6lTXDITiGEYhmEYhmEYhmEYhmEY5v9i5fsZGRx9PyGDne8f6K9cfd+mKXe1yNG/0CcqYE86AkBMBh66f20deBc7wA/1WFiTwvSEpBMA2JJOBsSLxe/4QEEaJRrASP8EVF8Q74GbmevKg0saa0B8QbwBdjRyADYxIhqxAZ++IKYtciPXLQVG+imw+oo4Bu56rjEJ4GYsvPmKOAB+xlz7L5aevqUXuePWVhvWJ4eWiwUQ67mK51qPj4dFDMlRLBZTqF3SDvmr4BwtkECu5gHWPkmDfQh02WLxXuvbvC8ku8F57GsI5e0CmUwLz1kq3kD17R1In5816rGvQ5VMk5FEtIiWislTffuDpl/k/PzscdQsv8r9qWq4LRWX6tQYtTxvI3XyrwdyQxChXioOngH3dLgOFjk0all56XRi/wDFQrGQU3Os5t0wJu1GNtNKHdPqYaGYQuRDfbfDf26AGLYSyGS3ZAK4S8XuoAlxGSdYMKwqZKM9XJMtyqXi7HX/CiAZS6d8bSVUz5J36mEMFDTlAFQzxOT1dzLRljjB6+++ejFqka+mXIe6F59mw22OuOw1F4T6lg/9VjL1rLDoI9Xzl1MSYDNHnPQnt3D1EE7PrXjye/3pVpr1Z45hMUdcACc5NVQI0bOdS1WA0wuz73e7/5TNqBPhQXPEFGJNV2zNqWI7QKBd2Gn6AiBko02zuAOXeWIXjV0jNqdKegaE/kJQ6Bfs4aju04lMLkA2T5wBSYPKDGF3RKhFYEa6A1L1LG2yacmsaZ6YPOSAMKNsO+N5dNTfkc5Aqe26uxHpx7ZirvgCwJpWq/lmX1hA7LyabQ34tt5RiJKXSwQ+0KU0V5xg+hZrd4Bn1n4EID+WkQdgLfRNtvil9SPfwy+WQ7PFBWQz6dGWZBLkeJFXZGCfLUjCgGgqXo5TuSu3cugdcTv/HjqnBTEMwzAMwzAMwzAMwzAMw/zf/AFbXiOA6frlMAAAAABJRU5ErkJggg==" alt="">
								</div>
								<div class="weui_media_bd padding">
									<h4 class="weui_media_title margin-b-10">大街小秘密<span class="float_r color-default08 font-14">20:35</span></h4>
									<p class="weui_media_desc"><span class="color-default08">北京职业梦科技有限公司</span></p>
								</div>
							</a>
						</div>
					</div>
					 -->
				</div>
			</div>
			<div class="weui_tabbar">
				<a href="<%=basePath %>bxbsj/index.jsp" class="weui_tabbar_item">
					<div class="weui_tabbar_icon" style="text-align:center">
						<i class="iconfont icon-shouye-shouye" style="font-size:22px;"></i>
					</div>
					<p class="weui_tabbar_label">首页</p>
				</a>
				<a href="<%=basePath %>bxbsj/page/message.jsp" class="weui_tabbar_item weui_bar_item_on">
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
		<!--展示模板===============================-->
		<script id="ViewTpl" type="text/x-dot-template">
			<div class="weui_panel_bd border-t-default">
				<a href="recruitment.html" class="weui_media_box weui_media_appmsg padding10">
					<div class="weui_media_hd radius">
						<img class="weui_media_appmsg_thumb" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAHgAAAB4CAMAAAAOusbgAAAAeFBMVEUAwAD///+U5ZTc9twOww7G8MYwzDCH4YcfyR9x23Hw+/DY9dhm2WZG0kbT9NP0/PTL8sux7LFe115T1VM+zz7i+OIXxhes6qxr2mvA8MCe6J6M4oz6/frr+us5zjn2/fa67rqB4IF13XWn6ad83nxa1loqyirn+eccHxx4AAAC/klEQVRo3u2W2ZKiQBBF8wpCNSCyLwri7v//4bRIFVXoTBBB+DAReV5sG6lTXDITiGEYhmEYhmEYhmEYhmEY5v9i5fsZGRx9PyGDne8f6K9cfd+mKXe1yNG/0CcqYE86AkBMBh66f20deBc7wA/1WFiTwvSEpBMA2JJOBsSLxe/4QEEaJRrASP8EVF8Q74GbmevKg0saa0B8QbwBdjRyADYxIhqxAZ++IKYtciPXLQVG+imw+oo4Bu56rjEJ4GYsvPmKOAB+xlz7L5aevqUXuePWVhvWJ4eWiwUQ67mK51qPj4dFDMlRLBZTqF3SDvmr4BwtkECu5gHWPkmDfQh02WLxXuvbvC8ku8F57GsI5e0CmUwLz1kq3kD17R1In5816rGvQ5VMk5FEtIiWislTffuDpl/k/PzscdQsv8r9qWq4LRWX6tQYtTxvI3XyrwdyQxChXioOngH3dLgOFjk0all56XRi/wDFQrGQU3Os5t0wJu1GNtNKHdPqYaGYQuRDfbfDf26AGLYSyGS3ZAK4S8XuoAlxGSdYMKwqZKM9XJMtyqXi7HX/CiAZS6d8bSVUz5J36mEMFDTlAFQzxOT1dzLRljjB6+++ejFqka+mXIe6F59mw22OuOw1F4T6lg/9VjL1rLDoI9Xzl1MSYDNHnPQnt3D1EE7PrXjye/3pVpr1Z45hMUdcACc5NVQI0bOdS1WA0wuz73e7/5TNqBPhQXPEFGJNV2zNqWI7QKBd2Gn6AiBko02zuAOXeWIXjV0jNqdKegaE/kJQ6Bfs4aju04lMLkA2T5wBSYPKDGF3RKhFYEa6A1L1LG2yacmsaZ6YPOSAMKNsO+N5dNTfkc5Aqe26uxHpx7ZirvgCwJpWq/lmX1hA7LyabQ34tt5RiJKXSwQ+0KU0V5xg+hZrd4Bn1n4EID+WkQdgLfRNtvil9SPfwy+WQ7PFBWQz6dGWZBLkeJFXZGCfLUjCgGgqXo5TuSu3cugdcTv/HjqnBTEMwzAMwzAMwzAMwzAMw/zf/AFbXiOA6frlMAAAAABJRU5ErkJggg==" alt="">
					</div>
					<div class="weui_media_bd padding">
						<h4 class="weui_media_title margin-b-10">大街小秘密<span class="float_r color-default08 font-14">20:35</span></h4>
						<p class="weui_media_desc"><span class="color-default08">北京职业梦科技有限公司</span></p>
					</div>
				</a>
			</div>
		</script>
		<script src="../static/JqueryWeUI/lib/jquery-2.1.4.js"></script>
		<script src="../static/JqueryWeUI/lib/fastclick.js"></script>
		<script>
			$(function() {
				FastClick.attach(document.body);
			});
		</script>
		<script src="../static/JqueryWeUI/js/jquery-weui.js"></script>
		<script src="../static/js/doT.min.js"></script>
		<script type="text/javascript" src="../static/js/GscUtil.js"></script>
		<script>
			$.ajax({
				type: "post", // 或者 "get"
				url: "http://maquanjun.tunnel.2bdata.com/Weixin/servlet/company",
				dataType: "jsonp",
				jsonp: "callback",
				data: {
					yeshu: 0,
					tiaoshu: 6
				},
				success: function(data) {
					if(data.result){
						for(var i =0 ;i<data.list.length;i++){
							var interText = doT.template($("#ViewTpl").text());
							$("#content").append(interText(data.list[i]));
						}
					}
					
				}
			});
		</script>
	</body>

</html>