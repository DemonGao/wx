<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>公司主页</title>
    <meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<meta name="description" content="Write an awesome description for your new site here. You can edit this line in _config.yml. It will appear in your document head meta (for Google search results) and in your feed.xml site description.">
	<link rel="stylesheet" href="../static/font/iconfont.css" />
	<link rel="stylesheet" href="../static/JqueryWeUI/lib/weui.min.css">
	<link rel="stylesheet" href="../static/JqueryWeUI/css/jquery-weui.css">
	<link rel="stylesheet" href="../static/css/style.css" />
	<link rel="stylesheet" href="../static/css/company.css" />
	<style>
			body{
				background-color: #efeff4;
			}
			.weui_navbar .weui_search_bar {
			    width: 100%;
			}
		</style>
  </head>
  <body>
	<div id="bxbsj">
		<div class="weui_panel weui_panel_access">
			<div class="weui_panel_bd">
				<a href="javascript:void(0);"
					class="weui_media_box weui_media_appmsg">
					<div class="weui_media_hd">
						<img class="weui_media_appmsg_thumb margin-l-15"
							src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAHgAAAB4CAMAAAAOusbgAAAAeFBMVEUAwAD///+U5ZTc9twOww7G8MYwzDCH4YcfyR9x23Hw+/DY9dhm2WZG0kbT9NP0/PTL8sux7LFe115T1VM+zz7i+OIXxhes6qxr2mvA8MCe6J6M4oz6/frr+us5zjn2/fa67rqB4IF13XWn6ad83nxa1loqyirn+eccHxx4AAAC/klEQVRo3u2W2ZKiQBBF8wpCNSCyLwri7v//4bRIFVXoTBBB+DAReV5sG6lTXDITiGEYhmEYhmEYhmEYhmEY5v9i5fsZGRx9PyGDne8f6K9cfd+mKXe1yNG/0CcqYE86AkBMBh66f20deBc7wA/1WFiTwvSEpBMA2JJOBsSLxe/4QEEaJRrASP8EVF8Q74GbmevKg0saa0B8QbwBdjRyADYxIhqxAZ++IKYtciPXLQVG+imw+oo4Bu56rjEJ4GYsvPmKOAB+xlz7L5aevqUXuePWVhvWJ4eWiwUQ67mK51qPj4dFDMlRLBZTqF3SDvmr4BwtkECu5gHWPkmDfQh02WLxXuvbvC8ku8F57GsI5e0CmUwLz1kq3kD17R1In5816rGvQ5VMk5FEtIiWislTffuDpl/k/PzscdQsv8r9qWq4LRWX6tQYtTxvI3XyrwdyQxChXioOngH3dLgOFjk0all56XRi/wDFQrGQU3Os5t0wJu1GNtNKHdPqYaGYQuRDfbfDf26AGLYSyGS3ZAK4S8XuoAlxGSdYMKwqZKM9XJMtyqXi7HX/CiAZS6d8bSVUz5J36mEMFDTlAFQzxOT1dzLRljjB6+++ejFqka+mXIe6F59mw22OuOw1F4T6lg/9VjL1rLDoI9Xzl1MSYDNHnPQnt3D1EE7PrXjye/3pVpr1Z45hMUdcACc5NVQI0bOdS1WA0wuz73e7/5TNqBPhQXPEFGJNV2zNqWI7QKBd2Gn6AiBko02zuAOXeWIXjV0jNqdKegaE/kJQ6Bfs4aju04lMLkA2T5wBSYPKDGF3RKhFYEa6A1L1LG2yacmsaZ6YPOSAMKNsO+N5dNTfkc5Aqe26uxHpx7ZirvgCwJpWq/lmX1hA7LyabQ34tt5RiJKXSwQ+0KU0V5xg+hZrd4Bn1n4EID+WkQdgLfRNtvil9SPfwy+WQ7PFBWQz6dGWZBLkeJFXZGCfLUjCgGgqXo5TuSu3cugdcTv/HjqnBTEMwzAMwzAMwzAMwzAMw/zf/AFbXiOA6frlMAAAAABJRU5ErkJggg=="
							alt="">
					</div>
					<div class="weui_media_bd">
						<h4 class="weui_media_title text-center">
							{{data.companyinfo_name}}<i v-if="data.companyinfo_status==1"
								class="iconfont icon-renzheng1 color-warning margin-l-5"></i>
						</h4>
						<p class="weui_media_desc text-center">{{data.companyinfo_style}} |
							{{data.companyinfo_city}} | {{data.companyinfo_size}}</p>
					</div> <span class="weui_cell_ft"><i
						class="iconfont icon-guanzhu" style="font-size: 2rem;"></i></span>
				</a>
			</div>
		</div>
		<div class="box nomargin noborder-t">
			<div class="gsc-tab">
				<div class="gsc-tab-item active">简介</div>
			    <!-- <div class="gsc-tab-item">职位</div> -->
			</div>
		</div>
		<div class="box nomargin noborder-t padding-l-15">
			<p class="color-default04 margin-t-5">
				规模<span class="color-default08 margin-l-5">{{data.companyinfo_size}}</span>
			</p>
			<p class="color-default04 margin-t-5">
				性质<span class="color-default08 margin-l-5">{{data.companyinfo_type}}</span>
			</p>
			<p class="color-default04 margin-t-5">
				网址<span class="color-default08 margin-l-5">{{data.companyinfo_url}}</span>
			</p>
			<p class="color-default04 margin-t-5">
				地址<span class="color-default08 margin-l-5">{{data.companyinfo_address}}</span>
			</p>
			<p class="color-default08 margin-t-15" v-html="data.companyinfo_about"></p>
		</div>
		
	</div>
	<script src="../static/JqueryWeUI/lib/jquery-2.1.4.js"></script>
		<script src="../static/JqueryWeUI/lib/fastclick.js"></script>
		<script>
			$(function() {
				FastClick.attach(document.body);
			});
		</script>
		<script src="../static/JqueryWeUI/js/jquery-weui.js"></script>
		<script type="text/javascript" src="../static/js/vue.js" ></script>
		<script>
			$.showLoading();
			
			$.ajax({
				url:"/wxkf/api/CompanyInfo_query",
				data:{
					"companyInfo.openid":'<%=request.getParameter("openid")%>'
					//"companyInfo.openid":'o6yKmw8QEd6vVrud2ZpBBMLG8z3Y'
				},
				success:function(data){
					console.log(data);
					var bxbsj  =new Vue({
						el: '#bxbsj',
						data: {
							data:data.list,
						},
						methods:{
							isoverdue:function(time,limit){
								var limittime =ParseInt(limit)*1000*60*60*24;
								console.log(limittime);
								if(new Date().getTime() - time>limittime){
									console.log("已过期");
								}
							},
							jobCollection:function(){
								$.showLoading();
								
								$.ajax({
									url:"/wxkf/api/JobCollection_add",
									data:{
										"jobclt.student.open_id":localStorage.getItem("openid"),
										"jobclt.job.job_id":<%=request.getParameter("job_id")%>,
									},
									success:function(data){
										if(data.result){
											$.toptip("收藏成功!", 'success');
										}else{
											 $.toptip(data.error_msg, 'error');
										}
										$.hideLoading();
									}
								});
							},
							jobPost:function(){
								$.showLoading();
								$.ajax({
									url:"/wxkf/api/JobPost_add",
									data:{
										"jobPost.student.open_id":localStorage.getItem("openid"),
										"jobPost.job.job_id":<%=request.getParameter("job_id")%>,
									},
									success:function(data){
										if(data.result){
											$.toptip("投递成功!", 'success');
										}else{
											 $.toptip(data.error_msg, 'error');
										}
										$.hideLoading();
									}
								});
							}
						},
					})
						$.hideLoading();
					
				}
			})
		</script>
  </body>
</html>
