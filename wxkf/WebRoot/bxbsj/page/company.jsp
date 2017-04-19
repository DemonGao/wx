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
				background-color: #fff;
			}
			.weui_navbar .weui_search_bar {
			    width: 100%;
			}
			/*page*/
		</style>
  </head>
  <body>
		<div class="weui_panel weui_panel_access" id="bxbsj">
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
					</div>
				</a>
			</div>
		</div>
		<div class="box nomargin noborder">
			<ul id="pagenavi" class="gsc-tab">
				<li class="gsc-tab-item">
					<a href="javascript:;" class="active">简介</a>
				</li>
				<li class="gsc-tab-item">
					<a href="javascript:;">职位</a>
				</li>
			</ul>
		</div>
		<div id="slider" style="height:100%">
			<ul>
				<li id="company">
					<p class="margin-l-15 margin-t-15"><span class="margin-r-10">规模</span>{{data.companyinfo_size}}</p>
					<p class="margin-l-15"><span class="margin-r-10">性质</span>{{data.companyinfo_type}}</p>
					<p class="margin-l-15"><span class="margin-r-10">网址</span>{{data.companyinfo_url}}</p>
					<p class="margin-l-15"><span class="margin-r-10">地区</span>{{data.companyinfo_address}}</p>
					<p class="margin-l-15 margin-t-15">{{data.companyinfo_about}}</p>
				</li>
				<li id="joblist" class="margin-t-15">
					<div class="weui_panel weui_panel_access" style="margin-top: 0;" id="bxbsj">
					    <div class="weui_panel_hd">全部职位</div>
					    <div class="weui_panel_bd">
					        <a v-for="item in data" :href="getjobHref(item.job_id)" class="weui_media_box weui_media_appmsg">
					            <div class="weui_media_hd">
					                <img class="weui_media_appmsg_thumb" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAHgAAAB4CAMAAAAOusbgAAAAeFBMVEUAwAD///+U5ZTc9twOww7G8MYwzDCH4YcfyR9x23Hw+/DY9dhm2WZG0kbT9NP0/PTL8sux7LFe115T1VM+zz7i+OIXxhes6qxr2mvA8MCe6J6M4oz6/frr+us5zjn2/fa67rqB4IF13XWn6ad83nxa1loqyirn+eccHxx4AAAC/klEQVRo3u2W2ZKiQBBF8wpCNSCyLwri7v//4bRIFVXoTBBB+DAReV5sG6lTXDITiGEYhmEYhmEYhmEYhmEY5v9i5fsZGRx9PyGDne8f6K9cfd+mKXe1yNG/0CcqYE86AkBMBh66f20deBc7wA/1WFiTwvSEpBMA2JJOBsSLxe/4QEEaJRrASP8EVF8Q74GbmevKg0saa0B8QbwBdjRyADYxIhqxAZ++IKYtciPXLQVG+imw+oo4Bu56rjEJ4GYsvPmKOAB+xlz7L5aevqUXuePWVhvWJ4eWiwUQ67mK51qPj4dFDMlRLBZTqF3SDvmr4BwtkECu5gHWPkmDfQh02WLxXuvbvC8ku8F57GsI5e0CmUwLz1kq3kD17R1In5816rGvQ5VMk5FEtIiWislTffuDpl/k/PzscdQsv8r9qWq4LRWX6tQYtTxvI3XyrwdyQxChXioOngH3dLgOFjk0all56XRi/wDFQrGQU3Os5t0wJu1GNtNKHdPqYaGYQuRDfbfDf26AGLYSyGS3ZAK4S8XuoAlxGSdYMKwqZKM9XJMtyqXi7HX/CiAZS6d8bSVUz5J36mEMFDTlAFQzxOT1dzLRljjB6+++ejFqka+mXIe6F59mw22OuOw1F4T6lg/9VjL1rLDoI9Xzl1MSYDNHnPQnt3D1EE7PrXjye/3pVpr1Z45hMUdcACc5NVQI0bOdS1WA0wuz73e7/5TNqBPhQXPEFGJNV2zNqWI7QKBd2Gn6AiBko02zuAOXeWIXjV0jNqdKegaE/kJQ6Bfs4aju04lMLkA2T5wBSYPKDGF3RKhFYEa6A1L1LG2yacmsaZ6YPOSAMKNsO+N5dNTfkc5Aqe26uxHpx7ZirvgCwJpWq/lmX1hA7LyabQ34tt5RiJKXSwQ+0KU0V5xg+hZrd4Bn1n4EID+WkQdgLfRNtvil9SPfwy+WQ7PFBWQz6dGWZBLkeJFXZGCfLUjCgGgqXo5TuSu3cugdcTv/HjqnBTEMwzAMwzAMwzAMwzAMw/zf/AFbXiOA6frlMAAAAABJRU5ErkJggg==" alt="">
					            </div>
					            <div class="weui_media_bd">
					                <h4 class="weui_media_title">{{item.job_name}}</h4>
					                <p class="weui_media_desc margin-b-5">{{item.companyinfo.companyinfo_name}}<i v-if="item.companyinfo.companyinfo_status==1" class="iconfont icon-renzheng color-warning margin-l-5"></i></p>
					                <p class="weui_media_desc"><span class="color-warning">{{item.job_salary | money}}K元/月</span> | {{item.companyinfo.companyinfo_city}} | {{item.job_education}}</p>
					            </div>
					        </a>
					    </div>
					    <a v-if="pageNums!=1&&pageNum!=pageNums-1" v-on:click="getMore()" class="weui_panel_ft" id="nextpage" href="javascript:void(0);">查看更多</a>
					</div>
				</li>
			</ul>
		</div>
	<script src="../static/JqueryWeUI/lib/jquery-2.1.4.js"></script>
	<script type="text/javascript" src="../static/js/touchslider.js"></script>
	<script src="../static/JqueryWeUI/lib/fastclick.js"></script>
	<script>
			$(function() {
				FastClick.attach(document.body);
			});
			var page = 'pagenavi';
			var mslide = 'slider';
			var mtitle = 'emtitle';
			arrdiv = 'arrdiv';
			var as = document.getElementById(page).getElementsByTagName('a');
			var tt = new TouchSlider({
				id : mslide,
				'auto' : '-1',
				fx : 'ease-out',
				direction : 'left',
				speed : 600,
				timeout : 5000,
				'before' : function(index) {
					var as = document.getElementById(this.page)
							.getElementsByTagName('a');
					as[this.p].className = '';
					as[index].className = 'active';
					this.p = index;
					var txt = as[index].innerText;
					$("#" + this.page).parent().find('.emtitle').text(txt);
					var txturl = as[index].getAttribute('href');
					var turl = txturl.split('#');
					$("#" + this.page).parent().find('.go_btn').attr('href',
							turl[1]);
				}
			});

			tt.page = page;
			tt.p = 0;
			for (var i = 0; i < as.length; i++) {
				(function() {
					var j = i;
					as[j].tt = tt;
					as[j].onclick = function() {
						this.tt.slide(j);
						return false;
					}
				})();
			}
		</script>
		<script src="../static/JqueryWeUI/js/jquery-weui.js"></script>
		<script type="text/javascript" src="../static/js/vue.js" ></script>
		<script>
			$.showLoading();
			$.ajax({
				url:"/wxkf/api/CompanyInfo_query",
				data:{
					"companyInfo.openid":"<%=request.getParameter("company_id")%>"
					//"companyInfo.openid":"o6yKmw8QEd6vVrud2ZpBBMLG8z3Y"
				},
				success:function(data){
					console.log(data);
					var bxbsj  =new Vue({
						el: '#bxbsj',
						data: {
							data:data.list,
						}
					})
					var company  =new Vue({
						el: '#company',
						data: {
							data:data.list,
						}
					})
					$.hideLoading();
				}
			})
			$.showLoading();
Vue.filter('money', function (input) {
    return (input/1000).toFixed(1)
})
var bxbsj  =new Vue({
	el: '#joblist',
	data: {
		data:[],
		pageNum:0,
		pageNums:1,
		pageSize:1,
	},
	methods:{
		getjobHref:function(val){
            return '/wxkf/bxbsj/page/recruitment.jsp?job_id=' + val 
        },
		getMore:function(){
			this.pageNum++
			if(this.pageNum>=this.pageNums){
				alert("没有数据了");
				return ;
			}
			$.ajax({
				url:"/wxkf/api/Job_querys",
				type:"POST",
				data:{
					"pageNum":this.pageNum,
					"pageSize":this.pageSize,
					"type":"company",
					"job.companyinfo.openid":"<%=request.getParameter("company_id")%>",
					//"signarg":"o6yKmw8QEd6vVrud2ZpBBMLG8z3Y"
				},
				success:function(data){
					$.hideLoading();
					console.log(bxbsj.data);
					bxbsj.data=bxbsj.data.concat(data.list);//数据拼接
					bxbsj.pageNum=data.pageNum;
					bxbsj.pageNums=data.pageNums;
				}
			});
		}
	}
});
$.ajax({
	url:"/wxkf/api/Job_querys",
	type:"POST",
	data:{
		"pageNum":0,
		"pageSize":bxbsj.pageSize,
		"type":"company",
		"job.companyinfo.openid":"<%=request.getParameter("company_id")%>"
		//"job.companyinfo.openid":"o6yKmw8QEd6vVrud2ZpBBMLG8z3Y"
	},
	success:function(data){
		$.hideLoading();
		console.log(data);
		bxbsj.data=data.list;
		bxbsj.pageNum=data.pageNum;
		bxbsj.pageNums=data.pageNums;
	}
});
		</script>
  </body>
</html>
