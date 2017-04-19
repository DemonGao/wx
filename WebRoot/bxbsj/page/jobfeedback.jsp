<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>

	<head>
		<title>投递反馈</title>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">

		<meta name="description" content="Write an awesome description for your new site here. You can edit this line in _config.yml. It will appear in your document head meta (for Google search results) and in your feed.xml site description.
">
		<link rel="stylesheet" href="../static/font/iconfont.css" />
		<link rel="stylesheet" href="../static/JqueryWeUI/lib/weui.min.css">
		<link rel="stylesheet" href="../static/JqueryWeUI/css/jquery-weui.css">

		<link rel="stylesheet" href="../static/css/style.css" />
		<link rel="stylesheet" href="../static/css/jobfeedback.css" />
	</head>

	<body ontouchstart>
		<div class="weui_panel weui_panel_access" style="margin-top: 0;" id="bxbsj">
			<div v-for="item in data" class="weui_panel weui_panel_access">
				<div class="weui_panel_bd border-t-default">
					<a href="javascript:;" class="weui_media_box weui_media_appmsg padding10">
						<div class="weui_media_hd">
							<img class="weui_media_appmsg_thumb" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAHgAAAB4CAMAAAAOusbgAAAAeFBMVEUAwAD///+U5ZTc9twOww7G8MYwzDCH4YcfyR9x23Hw+/DY9dhm2WZG0kbT9NP0/PTL8sux7LFe115T1VM+zz7i+OIXxhes6qxr2mvA8MCe6J6M4oz6/frr+us5zjn2/fa67rqB4IF13XWn6ad83nxa1loqyirn+eccHxx4AAAC/klEQVRo3u2W2ZKiQBBF8wpCNSCyLwri7v//4bRIFVXoTBBB+DAReV5sG6lTXDITiGEYhmEYhmEYhmEYhmEY5v9i5fsZGRx9PyGDne8f6K9cfd+mKXe1yNG/0CcqYE86AkBMBh66f20deBc7wA/1WFiTwvSEpBMA2JJOBsSLxe/4QEEaJRrASP8EVF8Q74GbmevKg0saa0B8QbwBdjRyADYxIhqxAZ++IKYtciPXLQVG+imw+oo4Bu56rjEJ4GYsvPmKOAB+xlz7L5aevqUXuePWVhvWJ4eWiwUQ67mK51qPj4dFDMlRLBZTqF3SDvmr4BwtkECu5gHWPkmDfQh02WLxXuvbvC8ku8F57GsI5e0CmUwLz1kq3kD17R1In5816rGvQ5VMk5FEtIiWislTffuDpl/k/PzscdQsv8r9qWq4LRWX6tQYtTxvI3XyrwdyQxChXioOngH3dLgOFjk0all56XRi/wDFQrGQU3Os5t0wJu1GNtNKHdPqYaGYQuRDfbfDf26AGLYSyGS3ZAK4S8XuoAlxGSdYMKwqZKM9XJMtyqXi7HX/CiAZS6d8bSVUz5J36mEMFDTlAFQzxOT1dzLRljjB6+++ejFqka+mXIe6F59mw22OuOw1F4T6lg/9VjL1rLDoI9Xzl1MSYDNHnPQnt3D1EE7PrXjye/3pVpr1Z45hMUdcACc5NVQI0bOdS1WA0wuz73e7/5TNqBPhQXPEFGJNV2zNqWI7QKBd2Gn6AiBko02zuAOXeWIXjV0jNqdKegaE/kJQ6Bfs4aju04lMLkA2T5wBSYPKDGF3RKhFYEa6A1L1LG2yacmsaZ6YPOSAMKNsO+N5dNTfkc5Aqe26uxHpx7ZirvgCwJpWq/lmX1hA7LyabQ34tt5RiJKXSwQ+0KU0V5xg+hZrd4Bn1n4EID+WkQdgLfRNtvil9SPfwy+WQ7PFBWQz6dGWZBLkeJFXZGCfLUjCgGgqXo5TuSu3cugdcTv/HjqnBTEMwzAMwzAMwzAMwzAMw/zf/AFbXiOA6frlMAAAAABJRU5ErkJggg==" alt="">
						</div>
						<div class="weui_media_bd padding">
							<h4 class="weui_media_title"><span class="font-14 color-blue">{{item.job.job_name}}</span> <span class="float_r font-14" style="vertical-align: super;">{{item.job.job_time | date}}</span></h4>
							<p class="weui_media_desc">
								<span class="font-12 color-default" style="vertical-align: -webkit-baseline-middle;">{{item.job.companyinfo.companyinfo_name}}</span>
								<span :class="getStatusStyle(item.jobPost_state)" class="demon_btn demon_btn_inline padding2 float_r" style="">{{item.jobPost_state |status}}</span>
							</p>
						</div>
					</a>
				</div>
			</div>
			<a v-if="pageNums!=1" v-on:click="getMore()" class="weui_panel_ft" id="nextpage" href="javascript:void(0);">查看更多</a>	
		</div>
		
	<script src="../static/JqueryWeUI/lib/jquery-2.1.4.js"></script>
	<script src="../static/JqueryWeUI/lib/fastclick.js"></script>
	<script>
		$(function() {
			FastClick.attach(document.body);
		});
	</script>
	<script src="../static/JqueryWeUI/js/jquery-weui.js"></script>
	<script type="text/javascript" src="../static/js/vue.js"></script>
	<script type="text/javascript">
		$.showLoading();
		//转换日期2016年11月22日 17:34:09 转换成 2016.11.22
		Vue.filter('date', function (input) {
			var date = new Date(input);
			var date_year = date.getFullYear();
			var date_month = date.getMonth()+1;
			var date_day = date.getDate();
			var dateStr =date_month+'月'+date_day+'日';
			if(new Date().getFullYear()!=date_year){
				dateStr =date_year +'年'+date_month+'月'+date_day+'日';
			}
		    return dateStr;
		})
		//投递状态内容
		Vue.filter('status', function (input) {
			var str = '';
			switch(input){
				case 0:
					str="已投递";
					break;
				case 1:
					str="HR已查看";
					break;
					
				case 2:
					str="标记感兴趣";
					break;
				case 3:
					str="已拒绝";
					break;
			}
		    return str;
		})
		var bxbsj = new Vue({
			el : '#bxbsj',
			data : {
				data : [],
				pageNum : 0,
				pageNums : 1,
				pageSize : 8,
			},
			methods : {
				getjobHref : function(val) {
					return '/wxkf/bxbsj/page/recruitment.jsp?job_id=' + val;
				},
				getStatusStyle:function(input){
					var statuStyle={
							demon_btn_primary: false,
							demon_btn_warning: false,
							demon_btn_success:false,
							demon_btn_failed:false
					}
					switch(input){
						case 0:
							statuStyle.demon_btn_primary=true;
							break;
						case 1:
							statuStyle.demon_btn_warning=true;
							break;
							
						case 2:
							statuStyle.demon_btn_success=true;
							break;
						case 3:
							statuStyle.demon_btn_failed=true;
							break;
					}
					return statuStyle;
				},
				getMore : function() {
					this.pageNum++
					if (this.pageNum >= this.pageNums) {
						alert("亲~没有更多数据了");
						return;
					}
					$.ajax({
						url : "/wxkf/api/JobPost_querys",
						type : "POST",
						data : {
							"pageNum" : this.pageNum,
							"pageSize" : this.pageSize,
							"type" : "jobfeedback",
							"signarg":localStorage.getItem("openid"),
							//"signarg" : "o6yKmw8QEd6vVrud2ZpBBMLG8z3Y"
						},
						success : function(data) {
							$.hideLoading();
							console.log(bxbsj.data);
							bxbsj.data = bxbsj.data.concat(data.list);//数据拼接
							bxbsj.pageNum = data.pageNum;
							bxbsj.pageNums = data.pageNums;
						}
					});
				}
			}
		});
		$.ajax({
			url : "/wxkf/api/JobPost_querys",
			type : "POST",
			data : {
				"pageNum" : 0,
				"pageSize" : bxbsj.pageSize,
				"type" : "jobfeedback",
				"signarg":localStorage.getItem("openid"),
				//"signarg" : "o6yKmw8QEd6vVrud2ZpBBMLG8z3Y"
			},
			success : function(data) {
				$.hideLoading();
				console.log(data);
				bxbsj.data = data.list;
				bxbsj.pageNum = data.pageNum;
				bxbsj.pageNums = data.pageNums;
			}
		});
	</script>

	</body>

</html>