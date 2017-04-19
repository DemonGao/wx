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
<title>我</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no">

<meta name="description"
	content="Write an awesome description for your new site here. You can edit this line in _config.yml. It will appear in your document head meta (for Google search results) and in your feed.xml site description.
">
<link rel="stylesheet" href="../static/font/iconfont.css" />
<link rel="stylesheet" href="../static/JqueryWeUI/lib/weui.min.css">
<link rel="stylesheet" href="../static/JqueryWeUI/css/jquery-weui.css">

<link rel="stylesheet" href="../static/css/style.css" />
<link rel="stylesheet" href="../static/css/me.css" />
</head>

<body ontouchstart>
	<div class="weui_tab">
		<div class="weui_tab_bd">
			<div class="home userinfo" id="bxbsj">
				<div class="weui_cells weui_cells_access">
					<div class="weui_panel weui_panel_access info_head bg_blue">
						<!--<a href="javascript:;" class="weui_media_box weui_media_appmsg">-->
						<div class="weui_media_hd info_head_img">
							<img v-if="hasImg()" style="width: 100%;height: 100%;" class="weui_media_appmsg_thumb" :src="baseUrl + data.companyinfo_img.slice(1,-1).split(',')[0]" alt="">
							<img v-else="hasImg()" style="width: 100%;height: 100%;" class="weui_media_appmsg_thumb" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAHgAAAB4CAMAAAAOusbgAAAAeFBMVEUAwAD///+U5ZTc9twOww7G8MYwzDCH4YcfyR9x23Hw+/DY9dhm2WZG0kbT9NP0/PTL8sux7LFe115T1VM+zz7i+OIXxhes6qxr2mvA8MCe6J6M4oz6/frr+us5zjn2/fa67rqB4IF13XWn6ad83nxa1loqyirn+eccHxx4AAAC/klEQVRo3u2W2ZKiQBBF8wpCNSCyLwri7v//4bRIFVXoTBBB+DAReV5sG6lTXDITiGEYhmEYhmEYhmEYhmEY5v9i5fsZGRx9PyGDne8f6K9cfd+mKXe1yNG/0CcqYE86AkBMBh66f20deBc7wA/1WFiTwvSEpBMA2JJOBsSLxe/4QEEaJRrASP8EVF8Q74GbmevKg0saa0B8QbwBdjRyADYxIhqxAZ++IKYtciPXLQVG+imw+oo4Bu56rjEJ4GYsvPmKOAB+xlz7L5aevqUXuePWVhvWJ4eWiwUQ67mK51qPj4dFDMlRLBZTqF3SDvmr4BwtkECu5gHWPkmDfQh02WLxXuvbvC8ku8F57GsI5e0CmUwLz1kq3kD17R1In5816rGvQ5VMk5FEtIiWislTffuDpl/k/PzscdQsv8r9qWq4LRWX6tQYtTxvI3XyrwdyQxChXioOngH3dLgOFjk0all56XRi/wDFQrGQU3Os5t0wJu1GNtNKHdPqYaGYQuRDfbfDf26AGLYSyGS3ZAK4S8XuoAlxGSdYMKwqZKM9XJMtyqXi7HX/CiAZS6d8bSVUz5J36mEMFDTlAFQzxOT1dzLRljjB6+++ejFqka+mXIe6F59mw22OuOw1F4T6lg/9VjL1rLDoI9Xzl1MSYDNHnPQnt3D1EE7PrXjye/3pVpr1Z45hMUdcACc5NVQI0bOdS1WA0wuz73e7/5TNqBPhQXPEFGJNV2zNqWI7QKBd2Gn6AiBko02zuAOXeWIXjV0jNqdKegaE/kJQ6Bfs4aju04lMLkA2T5wBSYPKDGF3RKhFYEa6A1L1LG2yacmsaZ6YPOSAMKNsO+N5dNTfkc5Aqe26uxHpx7ZirvgCwJpWq/lmX1hA7LyabQ34tt5RiJKXSwQ+0KU0V5xg+hZrd4Bn1n4EID+WkQdgLfRNtvil9SPfwy+WQ7PFBWQz6dGWZBLkeJFXZGCfLUjCgGgqXo5TuSu3cugdcTv/HjqnBTEMwzAMwzAMwzAMwzAMw/zf/AFbXiOA6frlMAAAAABJRU5ErkJggg==" alt="">
							
						</div>
						<div class="weui_media_hd info_head_title color-white ">
							<p v-if="data.companyinfo_nickname!=null&&data.companyinfo_nickname!=''" class="font-18 color-white" v-cloak>{{data.companyinfo_nickname}}</p>
							<p v-else="data.student_name!=null&&data.student_name!=''" class="font-18 color-white">Hr</p>
							<p v-if="data.companyinfo_name!=null" v-cloak>{{data.companyinfo_name}}</p>
							<p v-else="data.companyinfo_city!=null&&data.companyinfo_name!=null"></p>
						</div>
					</div>
					<div class="weui_cells_title info_title">我的处理</div>
					<div class="weui-row weui-no-gutter navtype">
						<a href="joblist.jsp" class="weui-col-33 navtype_list_border">
							<div>
								<h3 class="color-blue" id="jobNum">0</h3>
								<p class="color-default">发布的职位</p>
							</div>
						</a>
						<a href="cjobfeedback.jsp"
							class="weui-col-33 navtype_list_border">
							<div>
								<h3 class="color-blue" id="jobPost">0</h3>
								<p class="color-default">职位处理</p>
							</div>
						</a> 
						<a href="cresume_likejob.jsp" class="weui-col-33">
							<div>
								<h3 class="color-blue" id="jobCollection">0</h3>
								<p class="color-default">对我感兴趣的人</p>
							</div>
						</a>
					</div>
				</div>
			</div>
			<div class="box menulist">
				<div class="weui_cells weui_cells_access nomargin">
					<a class="weui_cell" href="<%=basePath%>bxbsj/cpage/Hr_info.jsp">
						<div class="weui_cell_hd">
							<i class="iconfont icon-shoucang color-error"></i>
						</div>
						<div class="weui_cell_bd weui_cell_primary">
							<p>我的信息</p>
						</div>
					</a>
					<a class="weui_cell" href="<%=basePath%>bxbsj/cpage/cmessage.jsp">
						<div class="weui_cell_hd">
							<i class="iconfont icon-xiaoxitongzhi color-warning"></i>
						</div>
						<div class="weui_cell_bd weui_cell_primary">
							<p>消息通知</p>
						</div>
					</a>
				</div>
			</div>
			<div class="box menulist">
				<div class="weui_cells weui_cells_access nomargin">
					<a class="weui_cell" href="<%=basePath%>bxbsj/cpage/company.jsp">
						<div class="weui_cell_hd">
							<i class="iconfont icon-48copy2 color-success"></i>
						</div>
						<div class="weui_cell_bd weui_cell_primary">
							<p>企业档案</p>
						</div>
					</a>
					<a class="weui_cell" href="<%=basePath%>bxbsj/cpage/faceback.jsp">
						<div class="weui_cell_hd">
							<i class="iconfont icon-yijianfankui color-blue"></i>
						</div>
						<div class="weui_cell_bd weui_cell_primary">
							<p>意见反馈</p>
						</div>
					</a>
					
				</div>
			</div>
		</div>
		<div class="weui_tabbar">
			<a href="<%=basePath%>bxbsj/company_index.jsp"
				class="weui_tabbar_item">
				<div class="weui_tabbar_icon" style="text-align:center">
					<i class="iconfont icon-shouye-shouye" style="font-size:22px;"></i>
				</div>
				<p class="weui_tabbar_label">首页</p>
			</a> <a href="<%=basePath%>bxbsj/cpage/cmessage.jsp"
				class="weui_tabbar_item">
				<div class="weui_tabbar_icon" style="text-align:center">
					<i class="iconfont icon-xiaoxi" style="font-size:22px;"></i>
				</div>
				<p class="weui_tabbar_label">消息</p>
			</a> <a href="<%=basePath%>bxbsj/cpage/cme.jsp"
				class="weui_tabbar_item weui_bar_item_on">
				<div class="weui_tabbar_icon" style="text-align:center">
					<i class="iconfont icon-my" style="font-size:22px;"></i>
				</div>
				<p class="weui_tabbar_label">我</p>
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
		<script type="text/javascript">
		$.showLoading();
		$.ajax({
			url:"/wxkf/api/Job_getJobNum",
			type:"POST",
			data:{
				//"job.companyinfo.openid":"o6yKmw8QEd6vVrud2ZpBBMLG8z3Y",
				"job.companyinfo.openid":localStorage.getItem("openid")
			},
			success:function(data){
				if(data.result){
					console.log(data);
					$("#jobNum").text(data.jobNum);
				}
			}
		});
		$.ajax({
			url:"/wxkf/api/JobPost_getNumbyCompany",
			type:"POST",
			data:{
				//"jobPost.job.companyinfo.openid":"o6yKmw8QEd6vVrud2ZpBBMLG8z3Y",
				"jobPost.job.companyinfo.openid":localStorage.getItem("openid")
			},
			success:function(data){
				if(data.result){
					console.log(data);
					$("#jobPost").text(data.jobPostNum);
				}
			}
		});
		$.ajax({
			url:"/wxkf/api/JobCollection_getNumbyCompany",
			type:"POST",
			data:{
				//"jobclt.job.companyinfo.openid":"o6yKmw8QEd6vVrud2ZpBBMLG8z3Y",
				"jobclt.job.companyinfo.openid":localStorage.getItem("openid")
			},
			success:function(data){
				if(data.result){
					console.log(data);
					$("#jobCollection").text(data.jobCollectionNum);
				}
			}
		});
		$.ajax({
			url:"/wxkf/api/CompanyInfo_query",
			type:"POST",
			data:{
				"companyInfo.openid":localStorage.getItem("openid"),
				//"companyInfo.openid":"o6yKmw8QEd6vVrud2ZpBBMLG8z3Y"
			},
			success:function(data){
				$.hideLoading();
				console.log(data);
				var bxbsj  =new Vue({
					el: '#bxbsj',
					data: {
						baseUrl:'/wxkf',
						result:data.result,
						data:data.list,
					},
					methods:{
						hasImg:function(){
							//判断图片是否上传,若没上传则用默认图片
							if(this.data.companyinfo_img!=null){
								return true;
							}
							return false;
						}
					}
				})
				
			}
		})
		</script>
</body>
</html>