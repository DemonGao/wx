<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>

	<head>
		<title>编辑联系方式</title>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">

		<meta name="description" content="Write an awesome description for your new site here. You can edit this line in _config.yml. It will appear in your document head meta (for Google search results) and in your feed.xml site description.
">
		<link rel="stylesheet" href="../static/JqueryWeUI/lib/weui.min.css">
		<link rel="stylesheet" href="../static/JqueryWeUI/css/jquery-weui.css">

		<style>
			.weui_label {
				width: 70px;
			}
			
			html {
				font-size: 20px;
			}
		</style>
	</head>

	<body>
		<div class="weui_cells weui_cells_form nomargin" id="bxbsj">
			<div class="weui_cell">
				<div class="weui_cell_hd margin-r-15"><label class="weui_label">负责人</label></div>
				<div class="weui_cell_bd weui_cell_primary">
					<input class="weui_input" type="text" v-model="data.companyinfo_nickname"  placeholder="请输入负责人名称">
				</div>
			</div>
			<div class="weui_cell">
				<div class="weui_cell_hd margin-r-15"><label class="weui_label">手机</label></div>
				<div class="weui_cell_bd weui_cell_primary">
					<input class="weui_input" type="tel" v-model="data.companyinfo_tel"  placeholder="请输入负责人手机号">
				</div>
			</div>
			<div class="weui_cell">
				<div class="weui_cell_hd margin-r-15"><label class="weui_label">职位</label></div>
				<div class="weui_cell_bd weui_cell_primary">
					<input class="weui_input" type="tel" v-model="data.companyinfo_pjob"  placeholder="请输入负责人职位">
				</div>
			</div>
			<a href="javascript:;" v-on:click="commitForm()" class="weui_btn weui_btn_primary margin-l-10 margin-r-10">修改</a>
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
			type:"POST",
			data:{
				"companyInfo.openid":localStorage.getItem("openid"),
				//"companyInfo.openid":"o6yKmw8QEd6vVrud2ZpBBMLG8z3Y"
			},
			success:function(data){
				console.log(data);
				var bxbsj  =new Vue({
					el: '#bxbsj',
					data: {
						//baseUrl:'/wxkf',
						//result:data.result,
						data:data.list
					},
					methods:{
						commitForm:function(){
							console.log(bxbsj.data);
							if(bxbsj.data.companyinfo_nickname==null||bxbsj.data.companyinfo_tel==null||bxbsj.data.companyinfo_pjob==null){
								$.toast("请将信息填写完整!", "text");
								return ;
							}
							$.showLoading();
							$.ajax({
								url:"/wxkf/api/CompanyInfo_updateHrInfo",
								type:"POST",
								data:{
									"companyInfo.openid":localStorage.getItem("openid"),
									//"companyInfo.openid":"o6yKmw8QEd6vVrud2ZpBBMLG8z3Y",
									"companyInfo.companyinfo_nickname":bxbsj.data.companyinfo_nickname,
									"companyInfo.companyinfo_tel":bxbsj.data.companyinfo_tel,
									"companyInfo.companyinfo_pjob":bxbsj.data.companyinfo_pjob,
								},
								success:function(data){
									if(data.result){
										 $.toptip('操作成功', 'success');
										 setTimeout(function(){
											 window.location.href="/wxkf/bxbsj/cpage/cme.jsp";
										 }, 1500);
									}else{
										 $.toptip('操作失败', 'error');
									}
									$.hideLoading();
								}
							});
						}
					}
				})
				$.hideLoading();
			}
		})
		</script>
	</body>

</html>