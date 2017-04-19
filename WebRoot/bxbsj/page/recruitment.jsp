<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>

	<head>
		<title>职位详情</title>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">

		<meta name="description" content="Write an awesome description for your new site here. You can edit this line in _config.yml. It will appear in your document head meta (for Google search results) and in your feed.xml site description.
">
		<link rel="stylesheet" href="../static/font/iconfont.css" />
		<link rel="stylesheet" href="../static/JqueryWeUI/lib/weui.min.css">
		<link rel="stylesheet" href="../static/JqueryWeUI/css/jquery-weui.css">
		
		<link rel="stylesheet" href="../static/css/style.css" />
		<link rel="stylesheet" href="../static/css/recruitment.css" />
		<style>
			[v-cloak] {
				display:none !important;
			}
		</style>
	</head>

	<body ontouchstart >
		<div :class="{ 'weui_tab': !isCompanyUser}" id="recruitment">
			<div :class="{ 'weui_tab_bd': !isCompanyUser}">
				<div class="home userinfo recruitment">
					<div class="weui_cells weui_cells_access">
						<div class="weui_panel weui_panel_access info_head">
							<!--<a href="javascript:;" class="weui_media_box weui_media_appmsg">-->
								<div class="weui_media_hd info_head_img">
									<img class="weui_media_appmsg_thumb" src="../static/img/swiper-1.jpg" alt="">
								</div>
								<div class="weui_media_hd info_head_title">
									<b v-cloak>{{data.job_name}}</b>
									<p v-cloak>{{data.companyinfo.companyinfo_name}}</p>
								</div>
							<!--</a>-->
						</div>
						<div class="weui-row weui-no-gutter navtype">
							<div class="weui-col-33 navtype_list_border">
								<div>
									<i class="iconfont icon-jinqianjiang01"></i>
									<p v-cloak class="color-warning">{{data.job_salary | money}}k/月</p>
								</div>
							</div>
							<div class="weui-col-33 navtype_list_border">
								<div>
									<i class="iconfont icon-shijian"></i>
									<p v-cloak>{{data.job_time|time}}天</p>
								</div>
							</div>
							<div class="weui-col-33">
								<div>
									<i class="iconfont icon-dingwei"></i>
									<p v-cloak>{{data.companyinfo.companyinfo_city}}</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div>
					<div class="box nospacebox">
						<ul class="tabs signtabs clearfix">
							<li v-cloak class="tab margin-r-10 margin-b-5 margin-t-5" v-for="label in data.job_label.split(',')">{{label}}</li>
						</ul>
					</div>
					<div class="box nospacebox nopadding">
						<a href="javascript:;" class="weui_media_box weui_media_appmsg">
							<div class="weui_media_hd">
								<img class="weui_media_appmsg_thumb" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAHgAAAB4CAMAAAAOusbgAAAAeFBMVEUAwAD///+U5ZTc9twOww7G8MYwzDCH4YcfyR9x23Hw+/DY9dhm2WZG0kbT9NP0/PTL8sux7LFe115T1VM+zz7i+OIXxhes6qxr2mvA8MCe6J6M4oz6/frr+us5zjn2/fa67rqB4IF13XWn6ad83nxa1loqyirn+eccHxx4AAAC/klEQVRo3u2W2ZKiQBBF8wpCNSCyLwri7v//4bRIFVXoTBBB+DAReV5sG6lTXDITiGEYhmEYhmEYhmEYhmEY5v9i5fsZGRx9PyGDne8f6K9cfd+mKXe1yNG/0CcqYE86AkBMBh66f20deBc7wA/1WFiTwvSEpBMA2JJOBsSLxe/4QEEaJRrASP8EVF8Q74GbmevKg0saa0B8QbwBdjRyADYxIhqxAZ++IKYtciPXLQVG+imw+oo4Bu56rjEJ4GYsvPmKOAB+xlz7L5aevqUXuePWVhvWJ4eWiwUQ67mK51qPj4dFDMlRLBZTqF3SDvmr4BwtkECu5gHWPkmDfQh02WLxXuvbvC8ku8F57GsI5e0CmUwLz1kq3kD17R1In5816rGvQ5VMk5FEtIiWislTffuDpl/k/PzscdQsv8r9qWq4LRWX6tQYtTxvI3XyrwdyQxChXioOngH3dLgOFjk0all56XRi/wDFQrGQU3Os5t0wJu1GNtNKHdPqYaGYQuRDfbfDf26AGLYSyGS3ZAK4S8XuoAlxGSdYMKwqZKM9XJMtyqXi7HX/CiAZS6d8bSVUz5J36mEMFDTlAFQzxOT1dzLRljjB6+++ejFqka+mXIe6F59mw22OuOw1F4T6lg/9VjL1rLDoI9Xzl1MSYDNHnPQnt3D1EE7PrXjye/3pVpr1Z45hMUdcACc5NVQI0bOdS1WA0wuz73e7/5TNqBPhQXPEFGJNV2zNqWI7QKBd2Gn6AiBko02zuAOXeWIXjV0jNqdKegaE/kJQ6Bfs4aju04lMLkA2T5wBSYPKDGF3RKhFYEa6A1L1LG2yacmsaZ6YPOSAMKNsO+N5dNTfkc5Aqe26uxHpx7ZirvgCwJpWq/lmX1hA7LyabQ34tt5RiJKXSwQ+0KU0V5xg+hZrd4Bn1n4EID+WkQdgLfRNtvil9SPfwy+WQ7PFBWQz6dGWZBLkeJFXZGCfLUjCgGgqXo5TuSu3cugdcTv/HjqnBTEMwzAMwzAMwzAMwzAMw/zf/AFbXiOA6frlMAAAAABJRU5ErkJggg==" alt="">
							</div>
							<div class="weui_media_bd">
								<h4 v-cloak class="weui_media_title">{{data.companyinfo.companyinfo_nickname}}</h4>
								<p v-cloak class="weui_media_desc margin-b-5">{{data.companyinfo.companyinfo_name}}<i v-if="data.companyinfo.companyinfo_status==1" class="iconfont icon-renzheng color-warning margin-l-5"></i><span class="float_r margin-r-15" v-cloak>{{data.companyinfo.companyinfo_pjob}}</span></p>
								<p class="weui_media_desc">在招职位<span class="color-success margin-r-15" v-cloak> {{data.companyinfo.openid|JobNums}} </span>职业档案处理率<span class="color-warning" v-cloak> {{data.companyinfo.openid|JobdelNums}}%</span> </p>
							</div>
							<span class="weui_cell_ft"><i class="iconfont icon-contact color-warning" style="font-size: 2rem;"></i></span>
						</a>	
					</div>
					<div class="box nospacebox">
						<p>
							<b>工作地点:</b>
							<p v-cloak>{{data.companyinfo.companyinfo_address}}</p>
						</p>
						<p>
							<b>招聘人数:</b>
							<span v-cloak>{{data.job_recivenum}}人</span>
						</p>
						<p>
							<b>岗位职责:</b>
							<p v-cloak>{{data.job_require}}</p>
						</p>
					</div>
					<div class="box nospacebox nopadding">
						<a :href="getCompanyHref(data.companyinfo.openid)" class="weui_media_box weui_media_appmsg" style="padding-bottom: 20px;">
							<div class="weui_media_hd">
								<img class="weui_media_appmsg_thumb" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAHgAAAB4CAMAAAAOusbgAAAAeFBMVEUAwAD///+U5ZTc9twOww7G8MYwzDCH4YcfyR9x23Hw+/DY9dhm2WZG0kbT9NP0/PTL8sux7LFe115T1VM+zz7i+OIXxhes6qxr2mvA8MCe6J6M4oz6/frr+us5zjn2/fa67rqB4IF13XWn6ad83nxa1loqyirn+eccHxx4AAAC/klEQVRo3u2W2ZKiQBBF8wpCNSCyLwri7v//4bRIFVXoTBBB+DAReV5sG6lTXDITiGEYhmEYhmEYhmEYhmEY5v9i5fsZGRx9PyGDne8f6K9cfd+mKXe1yNG/0CcqYE86AkBMBh66f20deBc7wA/1WFiTwvSEpBMA2JJOBsSLxe/4QEEaJRrASP8EVF8Q74GbmevKg0saa0B8QbwBdjRyADYxIhqxAZ++IKYtciPXLQVG+imw+oo4Bu56rjEJ4GYsvPmKOAB+xlz7L5aevqUXuePWVhvWJ4eWiwUQ67mK51qPj4dFDMlRLBZTqF3SDvmr4BwtkECu5gHWPkmDfQh02WLxXuvbvC8ku8F57GsI5e0CmUwLz1kq3kD17R1In5816rGvQ5VMk5FEtIiWislTffuDpl/k/PzscdQsv8r9qWq4LRWX6tQYtTxvI3XyrwdyQxChXioOngH3dLgOFjk0all56XRi/wDFQrGQU3Os5t0wJu1GNtNKHdPqYaGYQuRDfbfDf26AGLYSyGS3ZAK4S8XuoAlxGSdYMKwqZKM9XJMtyqXi7HX/CiAZS6d8bSVUz5J36mEMFDTlAFQzxOT1dzLRljjB6+++ejFqka+mXIe6F59mw22OuOw1F4T6lg/9VjL1rLDoI9Xzl1MSYDNHnPQnt3D1EE7PrXjye/3pVpr1Z45hMUdcACc5NVQI0bOdS1WA0wuz73e7/5TNqBPhQXPEFGJNV2zNqWI7QKBd2Gn6AiBko02zuAOXeWIXjV0jNqdKegaE/kJQ6Bfs4aju04lMLkA2T5wBSYPKDGF3RKhFYEa6A1L1LG2yacmsaZ6YPOSAMKNsO+N5dNTfkc5Aqe26uxHpx7ZirvgCwJpWq/lmX1hA7LyabQ34tt5RiJKXSwQ+0KU0V5xg+hZrd4Bn1n4EID+WkQdgLfRNtvil9SPfwy+WQ7PFBWQz6dGWZBLkeJFXZGCfLUjCgGgqXo5TuSu3cugdcTv/HjqnBTEMwzAMwzAMwzAMwzAMw/zf/AFbXiOA6frlMAAAAABJRU5ErkJggg==" alt="">
							</div>
							<div class="weui_media_bd">
								<h4 v-cloak class="weui_media_title margin-b-10">{{data.companyinfo.companyinfo_name}}<i v-if="data.companyinfo.companyinfo_status==1" class="iconfont icon-renzheng1 color-warning margin-l-5"></i></h4>
								<p class="weui_media_desc">规模:<span v-cloak class="color-default">{{data.companyinfo.companyinfo_size}}</span></p>
								<p class="weui_media_desc">性质:<span v-cloak class="color-default">{{data.companyinfo.companyinfo_type}}</span></p>
								<p class="weui_media_desc">网址:<span v-cloak class="color-default">{{data.companyinfo.companyinfo_url}}</span></p>
								<!--  
								<p class="weui_media_desc">评分:<span class="color-default">3星</span></p>
								<p class="weui_media_desc">点评:<span class="color-default">45条</span></p>
								-->
							</div>
							<span class="weui_cell_ft" ><i class="iconfont icon-youjiantou" style="font-size: 2rem;"></i></span>
						</a>	
					</div>
				</div>
			</div>
			<div v-if="!isCompanyUser" class="weui_tabbar">
				<a href="javascript:;" class="weui_tabbar_item margin-l-15 margin-r-15 bg-error">
					<p class="weui_tabbar_label" v-on:click="jobPost()"><i class="iconfont icon-toudi"></i>立即投递</p>
				</a>
				<a href="javascript:;" class="weui_tabbar_item margin-l-15 margin-r-15 bg-success" >
					<p class="weui_tabbar_label" v-on:click="jobCollection()"><i class="iconfont icon-ganxingqu"></i>感兴趣</p>
				</a>
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
			Vue.filter('money', function (input) {
			    return (input/1000).toFixed(1)
			})
			Vue.filter('time', function (input) {
			    var limittime = new Date().getTime() - input ;
				return Math.ceil(limittime / 1000 / 60 / 60 / 24);
			})
			Vue.filter('JobdelNums', function (val) {
				var result = 100;
				$.ajax({
					url:"/wxkf/api/JobPost_getdealPostNum",
					type:"POST",
					async: false,
					data:{
						"jobPost.job.companyinfo.openid":val,
					},
					success:function(data){
						if(data.result){
							result=data.dealjobPostNum;
						}
					}
				});
				console.log(result);
				return result;
			})
			Vue.filter('JobNums', function (val) {
				var result = 0;
				$.ajax({
					url:"/wxkf/api/Job_getJobNum",
					type:"POST",
					async: false,
					data:{
						//"job.companyinfo.openid":"o6yKmw8QEd6vVrud2ZpBBMLG8z3Y",
						"job.companyinfo.openid":val
					},
					success:function(data){
						console.log(data);
						if(data.result){
							
							//$("#jobNum").text(data.jobNum);
							result=data.jobNum;
							console.log(result);
						}
					}
				});
				console.log(result);
				return result;
			})
			var bxbsj  =new Vue({
				el: '#recruitment',
				data: {
					//labels: ["实习","互联网金融行业","交易员/操盘手","本科及本科以上","行业领先薪酬待遇"]
					data:[],
					isCompanyUser:false
				},
				methods:{
					getCompanyHref:function(val){			
						return 'company.jsp?company_id='+val;
					},
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
			$.showLoading();
			$.ajax({
				url:"/wxkf/api/Job_query",
				data:{
					"job.job_id":<%=request.getParameter("job_id")%>
				},
				success:function(data){
					bxbsj.data = data.list;
					$.hideLoading();
				}
			})
			$.ajax({
				url:"/wxkf/api/CompanyInfo_query",
				data:{
					"companyInfo.openid":localStorage.getItem("openid"),
				},
				success:function(data){
					if(data.result){
						bxbsj.isCompanyUser=true;
					}
					
				}
			});
		</script>
	</body>

</html>