<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>

	<head>
		<title>工作经验</title>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">

		<meta name="description" content="Write an awesome description for your new site here. You can edit this line in _config.yml. It will appear in your document head meta (for Google search results) and in your feed.xml site description.
">
		<link rel="stylesheet" href="../static/JqueryWeUI/lib/weui.min.css">
		<link rel="stylesheet" href="../static/JqueryWeUI/css/jquery-weui.css">

		<link rel="stylesheet" href="../static/css/style.css" />
		<style>
			.weui_label {
				width: 70px;
			}
			
			html {
				font-size: 10px;
			}
		</style>
	</head>

	<body>
		<div class="weui_cells weui_cells_form nomargin" id="bxbsj">

		<div class="weui_cell">
			<div class="weui_cell_hd margin-r-15">
				<label for="date" class="weui_label">工作类型</label>
			</div>
			<div class="weui_cell_bd weui_cell_primary ">
				<select class="weui_input" v-model="stuExp.studentexp_jobtype">
					<option value="实习">实习</option>
					<option value="见习">见习</option>
					<option value="全职">全职</option>
					<option value="兼职">兼职</option>
				</select>
			</div>
		</div>
		<div class="weui_cell">
			<div class="weui_cell_hd margin-r-15">
				<label class="weui_label">公司</label>
			</div>
			<div class="weui_cell_bd weui_cell_primary">
				<input class="weui_input" type="text" placeholder="请输入您公司名称"
					v-model="stuExp.studentexp_company">
			</div>
		</div>
		<div class="weui_cell">
			<div class="weui_cell_hd margin-r-15">
				<label class="weui_label">职位名称</label>
			</div>
			<div class="weui_cell_bd weui_cell_primary">
				<input class="weui_input" type="text" placeholder="请输入职位名称"
					v-model="stuExp.studentexp_jobname">
			</div>
		</div>
		<div class="weui_cell">
			<div class="weui_cell_hd margin-r-15">
				<label for="date" class="weui_label">任职时间</label>
			</div>
			<div class="weui_cell_bd weui_cell_primary">
				<input class="weui_input" type="month"
					v-model="stuExp.studentexp_entrytime">
			</div>
		</div>
		<div class="weui_cell">
			<div class="weui_cell_hd margin-r-15">
				<label for="date" class="weui_label">离职时间</label>
			</div>
			<div class="weui_cell_bd weui_cell_primary">
				<input class="weui_input" type="month"
					v-model="stuExp.studentexp_departuretime">
			</div>
		</div>
		<div class="weui_cells_title color-default font-16">工作描述</div>
		<div class="weui_cells weui_cells_form">
			<div class="weui_cell">
				<div class="weui_cell_bd weui_cell_primary">
					<textarea class="weui_textarea" placeholder="请输入工作描述,有助于hr进步一了解你" rows="3"
						v-model="stuExp.studentexp_describe"></textarea>
					<div class="weui_textarea_counter">
						<span>0</span>/200
					</div>
				</div>
			</div>
		</div>
		<a href="javascript:;" class="weui_btn weui_btn_primary margin-l-10 margin-r-10" v-on:click="commitForm()">保存</a>
	</div>
		<script src="../static/JqueryWeUI/lib/jquery-2.1.4.js"></script>
		<script src="../static/JqueryWeUI/lib/fastclick.js"></script>
		<script>
			$(function() {
				FastClick.attach(document.body);
			});
		</script>
		<script src="../static/JqueryWeUI/js/jquery-weui.js"></script>
		<script src="../static/JqueryWeUI/js/city-picker.js"></script>
		<script type="text/javascript" src="../static/js/vue.js" ></script>
		<script>
		
			$.showLoading();
			$.ajax({
				url:"/wxkf/api/StudentExperience_query",
				data:{
					//"student.open_id":localStorage.getItem("openid"),
					"stuExp.studentexp_id":sessionStorage.getItem("stuExp_id")
				},
				success:function(data){
					console.log(data);
					var bxbsj  =new Vue({
						el: '#bxbsj',
						data: {
							//baseUrl:'/wxkf',
							//result:data.result,
							//student:data.student
							stuExp:data.stuExp
						},
						methods:{
							commitForm:function(){
								if(this.stuExp.studentexp_jobtype==""){
									$.toast("请选择工作类型!", "text");
									return ;
								}
								if(bxbsj.stuExp.studentexp_company==""){
									$.toast("请输入公司名称!", "text");
									return ;
								}
								if(bxbsj.stuExp.studentexp_jobname==""){
									$.toast("请输入职位名称!", "text");
									return ;
								}
								if(bxbsj.stuExp.studentexp_entrytime==""){
									$.toast("请选择你任职时间!", "text");
									return ;
								}
								if(bxbsj.stuExp.studentexp_departuretime==""){
									$.toast("请选择你离职时间!", "text");
									return ;
								}
								if(bxbsj.stuExp.studentexp_describe==""){
									$.toast("请填写您的工作描述!", "text");
									return ;
								}
								$.showLoading();
								$.ajax({
									url:"/wxkf/api/StudentExperience_addExp",
									type:"POST",
									data:{
										"stuExp.studentexp_id":sessionStorage.getItem("stuExp_id"),
										"stuExp.studentexp_jobtype":bxbsj.stuExp.studentexp_jobtype,
										"stuExp.studentexp_company":bxbsj.stuExp.studentexp_company,
										"stuExp.studentexp_jobname":bxbsj.stuExp.studentexp_jobname,
										"stuExp.studentexp_entrytime":bxbsj.stuExp.studentexp_entrytime,
										"stuExp.studentexp_departuretime":bxbsj.stuExp.studentexp_departuretime,
										"stuExp.studentexp_describe":bxbsj.stuExp.studentexp_describe,
										"stuExp.student.open_id":localStorage.getItem("openid")
										//"student.open_id":"o6yKmw8QEd6vVrud2ZpBBMLG8z3Y"
									},
									success:function(data){
										if(data.result){
											 $.toptip('操作成功', 'success');
											 setTimeout(function(){
												 window.location.href="/wxkf/bxbsj/page/resume.jsp";
											 }, 1500);
										}else{
											 $.toptip('操作失败', 'error');
										}
										console.log(data);
									}
								});
								
							}
						}
					})
					$.hideLoading();
				}
			})
			/*
			var rz_time = 0,
				lz_time = 0;

			//任职时间
			$("#date").calendar({
				onChange: function(p, values, displayValues) {
					console.log(parseInt(displayValues.toString()));
					rz_time = parseInt(displayValues.toString());
				}
			});
			//离职时间
			$("#date1").calendar({
				onChange: function(p, values, displayValues) {
					lz_time = parseInt(displayValues.toString());
				},
				onClose: function() {
					if(lz_time < rz_time) {
						$("#date1").val("");
						alert("离职时间不能早于任职时间");
					}

				}
			});
			*/
		</script>
		
	</body>

</html>