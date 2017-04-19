<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>

	<head>
		<title>实习职位</title>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">

		<meta name="description" content="Write an awesome description for your new site here. You can edit this line in _config.yml. It will appear in your document head meta (for Google search results) and in your feed.xml site description.
">
		<link rel="stylesheet" href="../static/font/iconfont.css" />
		<link rel="stylesheet" href="../static/JqueryWeUI/lib/weui.min.css">
		<link rel="stylesheet" href="../static/JqueryWeUI/css/jquery-weui.css">
		<link rel="stylesheet" href="../static/css/practical.css" />
		<style>
			body{
				background-color: #efeff4;
			}
			.weui_navbar .weui_search_bar {
			    width: 100%;
			}
		</style>
	</head>

	<body ontouchstart>
		<div class="weui_tab">
			<div class="weui_navbar">
				<div class="weui_search_bar" id="search_bar">
					<form action="javascript:;" class="weui_search_outer">
						<div class="weui_search_inner">
							<i class="weui_icon_search"></i>
							<input type="search" class="weui_search_input" id="search_input" placeholder="搜索"/>
							<a href="javascript:;" class="weui_icon_clear" id="search_clear"></a>
						</div>
						<label for="search_input" class="weui_search_text" id="search_text">
          			<i class="weui_icon_search"></i>
          			<span>搜索</span>
        		</label>
					</form>
					<a href="javascript:;" class="weui_search_cancel" id="search_cancel">取消</a>
				</div>
			</div>
			<div class="weui_tab_bd">
				<div class="weui-row weui-no-gutter picker">
					<div class="weui-col-33 selects">
						<a id="joba" class="select_a_rb">职位类别</a>
						<input class="weui_input" id="job" type="hidden" value="">
					</div>
					<div class="weui-col-33 selects">
						<a id="placea" class="select_a_rb">地点</a>
						<input class="weui_input" id="place" type="hidden" value="">
					</div>
					<div class="weui-col-33 selects">
						<a id="moneya">薪资</a>
						<input class="weui_input" id="money" type="hidden" value="">
					</div>
				</div>
				<div class="weui_panel weui_panel_access" style="margin-top: 0;">
					<!--<div class="weui_panel_hd">图文组合列表</div>-->
					<div class="weui_panel_bd" id="content">

					</div>
					<a class="weui_panel_ft" id="nextpage" href="javascript:void(0);">查看更多</a>
				</div>
			</div>
		</div>
		<!--展示模板===============================-->
		<script id="ViewTpl" type="text/x-dot-template">
			<a href="/wxkf/bxbsj/page/recruitment.jsp?job_id={{=it.job_id}}" class="weui_media_box weui_media_appmsg">
				<div class="weui_media_hd">
					<img class="weui_media_appmsg_thumb" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAHgAAAB4CAMAAAAOusbgAAAAeFBMVEUAwAD///+U5ZTc9twOww7G8MYwzDCH4YcfyR9x23Hw+/DY9dhm2WZG0kbT9NP0/PTL8sux7LFe115T1VM+zz7i+OIXxhes6qxr2mvA8MCe6J6M4oz6/frr+us5zjn2/fa67rqB4IF13XWn6ad83nxa1loqyirn+eccHxx4AAAC/klEQVRo3u2W2ZKiQBBF8wpCNSCyLwri7v//4bRIFVXoTBBB+DAReV5sG6lTXDITiGEYhmEYhmEYhmEYhmEY5v9i5fsZGRx9PyGDne8f6K9cfd+mKXe1yNG/0CcqYE86AkBMBh66f20deBc7wA/1WFiTwvSEpBMA2JJOBsSLxe/4QEEaJRrASP8EVF8Q74GbmevKg0saa0B8QbwBdjRyADYxIhqxAZ++IKYtciPXLQVG+imw+oo4Bu56rjEJ4GYsvPmKOAB+xlz7L5aevqUXuePWVhvWJ4eWiwUQ67mK51qPj4dFDMlRLBZTqF3SDvmr4BwtkECu5gHWPkmDfQh02WLxXuvbvC8ku8F57GsI5e0CmUwLz1kq3kD17R1In5816rGvQ5VMk5FEtIiWislTffuDpl/k/PzscdQsv8r9qWq4LRWX6tQYtTxvI3XyrwdyQxChXioOngH3dLgOFjk0all56XRi/wDFQrGQU3Os5t0wJu1GNtNKHdPqYaGYQuRDfbfDf26AGLYSyGS3ZAK4S8XuoAlxGSdYMKwqZKM9XJMtyqXi7HX/CiAZS6d8bSVUz5J36mEMFDTlAFQzxOT1dzLRljjB6+++ejFqka+mXIe6F59mw22OuOw1F4T6lg/9VjL1rLDoI9Xzl1MSYDNHnPQnt3D1EE7PrXjye/3pVpr1Z45hMUdcACc5NVQI0bOdS1WA0wuz73e7/5TNqBPhQXPEFGJNV2zNqWI7QKBd2Gn6AiBko02zuAOXeWIXjV0jNqdKegaE/kJQ6Bfs4aju04lMLkA2T5wBSYPKDGF3RKhFYEa6A1L1LG2yacmsaZ6YPOSAMKNsO+N5dNTfkc5Aqe26uxHpx7ZirvgCwJpWq/lmX1hA7LyabQ34tt5RiJKXSwQ+0KU0V5xg+hZrd4Bn1n4EID+WkQdgLfRNtvil9SPfwy+WQ7PFBWQz6dGWZBLkeJFXZGCfLUjCgGgqXo5TuSu3cugdcTv/HjqnBTEMwzAMwzAMwzAMwzAMw/zf/AFbXiOA6frlMAAAAABJRU5ErkJggg==" alt="">
				</div>
				<div class="weui_media_bd">
					<h4 class="weui_media_title">{{=it.job_name}}</h4>
					<p class="weui_media_desc margin-b-5">{{=it.companyinfo.companyinfo_name}}</p>
					<p class="weui_media_desc"><span class="color-warning">{{=it.job_salary/1000.0}}k/月</span> | {{=it.companyinfo.companyinfo_city}} | {{=it.job_education}}</p>
				</div>
			</a>
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
			var pageNum = 0;
			var pageNums = 0;
			var pageSize = 2;
			var Point_type="all";
			var Point = {
			all:{
				pageNum: pageNum,
				pageSize: pageSize,
				"job.job_style":"实习",
			},
			place:{
				pageNum: pageNum,
				pageSize: pageSize,
				"job.job_style":"实习",
				type:"place",
				signarg:"不限"
			},
			name:{
				pageNum: pageNum,
				pageSize: pageSize,
				"job.job_style":"实习",
				type:"name",
				signarg:"不限"
			},
			salary:{
				pageNum: pageNum,
				pageSize: pageSize,
				"job.job_style":"全职",
				type:"salary",
				signarg:"不限",
				up:0,
				down:0
			}
			}; //0:全部 1:职位类别 2:
			querys(Point[Point_type],function(data){
				Point[Point_type].pageNums = data.pageNums;
				
			});
			$("#search_input").on('search',function(){
				Point_type="name";
				Point[Point_type].pageNum=0;
				Point[Point_type].signarg=$("#search_input").val();
				querys(Point[Point_type],function(data){
					$("#content").html("");
				});
			});
			/*下一页*/
			$("#nextpage").on("click", function() {
				Point[Point_type].pageNum++;
				if(Point[Point_type].pageNum>=Point[Point_type].pageNums){
					$.toast("亲~没有更多数据了", "text");
					return;
				}
				console.log(Point[Point_type]);
				querys(Point[Point_type],function(data){
				});
			})

			$.ajax({
				type: "post", // 或者 "get"
				url: "/wxkf/api/Jobtype_querys",
				dataType: "json",
				data: {

				},
				success: function(data) {
					if(data.result) {
						var items = [];
						console.log(data);
						for(var i in data.list) {
							console.log();
							items.push(data.list[i].job_type_name);
						}
						$("#joba").click(function() {
							$("#job").trigger("click");
						})
						$("#job").select({
							title: "选择职位类别",
							items: items,
							onChange: function(d) {
								console.log(this, d);
								$("#joba").text(d.values);

							},
							onClose: function() {
								console.log("close");
							},
							onOpen: function() {
								console.log("open");
							},
						});
					} else {
						$.toast("服务器开了个小差...", "text");
					}

				}
			});
			$.ajax({
				type: "post", // 或者 "get"
				url: "/wxkf/api/Place_querys",
				dataType: "json",
				data: {

				},
				success: function(data) {
					if(data.result) {
						var items = [];
						for(var i in data.list) {
							items.push(data.list[i].place_name);
						}
						$("#placea").click(function() {
							$("#place").trigger("click");
						})
						$("#place").select({
							title: "选择地点",
							items: items,
							onChange: function(d) {
								console.log(this, d);
								Point_type="place";
								Point[Point_type].pageNum=0;
								Point[Point_type].signarg=d.titles;
								querys(Point[Point_type],function(data){
									$("#placea").text(d.titles);
									$("#content").html("");
								});

							},
							onClose: function() {
								console.log("close");
							},
							onOpen: function() {
								console.log("open");
							}
						});

					} else {
						$.toast("服务器开了个小差...", "text");
					}

				}
			});
			$.ajax({
				type: "post", // 或者 "get"
				url: "/wxkf/api/Salary_querys",
				dataType: "json",
				data: {

				},
				success: function(data) {
					if(data.result) {
						console.log(data);
						var items = [];
						for(var i in data.list) {
							items.push(data.list[i].salary);
						}
						$("#moneya").click(function() {
							$("#money").trigger("click");
						})
						$("#money").select({
							title: "选择薪资范畴",
							items: items,
							onChange: function(d) {
								Point_type="salary";
								Point[Point_type].pageNum=0;
								Point[Point_type].signarg=d.titles;
								console.log(d.titles);
								switch(d.titles){
									case "不限":
										Point[Point_type].up=0;
										Point[Point_type].down=1000000;
										break;
									case "1K以下":
										Point[Point_type].up=0;
										Point[Point_type].down=1000;
										break;
									case "1~2K":
										Point[Point_type].up=1000;
										Point[Point_type].down=2000;
										break;
									case "2-4K":
										Point[Point_type].up=2000;
										Point[Point_type].down=4000;
										break;
									case "4-8K":
										Point[Point_type].up=4000;
										Point[Point_type].down=8000;
										break;
									case "8-10K":
										Point[Point_type].up=8000;
										Point[Point_type].down=10000;
										break;
									case "10K以上":
										Point[Point_type].up=10000;
										Point[Point_type].down=1000000;
										break;
								}
								
								querys(Point[Point_type],function(data){
									$("#moneya").text(d.titles);
									$("#content").html("");
								});
							},
							onClose: function() {
								console.log("close");
							},
							onOpen: function() {
								console.log("open");
							}
						});

					} else {
						$.toast("服务器开了个小差...", "text");
					}

				}
			});
			
			function querys(data,callback){
				$.showLoading();
				$.ajax({
					type: "post", // 或者 "get"
					url: "/wxkf/api/Job_querys",
					dataType: "json",
					data:data ,
					success: function(data) {
						$.hideLoading();
						if(data.result) {
							//PageNums = data.pageNums;
							callback(data);
							for(var i = 0; i < data.list.length; i++) {
								var interText = doT.template($("#ViewTpl").text());
								$("#content").append(interText(data.list[i]));
							}
							
						}else{
							if(Point["all"].pageNum==0){
								$("#content").html("<img src='../static/img/pic_01.png' style='width:100%'/>");
								$("#nextpage").css("display","none");
							}else{
								$.toast(data.error_msg, "text");
							}
						}
					}
				});
			}
		</script>

	</body>

</html>
