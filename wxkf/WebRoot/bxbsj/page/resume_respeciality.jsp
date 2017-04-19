<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>

	<head>
		<title>我的专长</title>
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
		<div class="weui_cells weui_cells_form" id="bxbsj" style="margin-top:0">
			<div class="weui_cells_title" style="color:#000;font-size:18px">我的专长</div>
			<div class="weui_cells weui_cells_form">
				<div class="weui_cell">
					<div class="weui_cell_bd weui_cell_primary">
						<textarea v-model="student.student_speciality" class="weui_textarea" placeholder="请输入您的专长" rows="3"></textarea>
						<div class="weui_textarea_counter"><span>0</span>/200</div>
					</div>
				</div>
			</div>
			<a href="javascript:;" v-on:click="commitForm()" class="weui_btn weui_btn_primary margin-l-10 margin-r-10">保存</a>
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
		<script>
		$.showLoading();
		$.ajax({
			url:"/wxkf/api/Student_query",
			data:{
				"student.open_id":localStorage.getItem("openid")
				//"student.open_id":"o6yKmw8QEd6vVrud2ZpBBMLG8z3Y"
			},
			success:function(data){
				console.log(data);
				var bxbsj  = new Vue({
					el: '#bxbsj',
					data: {
						baseUrl:'/wxkf',
						student:data.student
					},
					methods:{
						commitForm:function(){
							console.log(bxbsj.student);
							if(bxbsj.student.student_speciality==""){
								$.toast("请将信息填写完整!", "text");
								return ;
							}
							$.ajax({
								url:"/wxkf/api/Student_updateSpeciality",
								data:{
									"student.open_id":localStorage.getItem("openid"),
									"student.student_speciality":bxbsj.student.student_speciality,
								},
								success:function(data){
									if(data.result){
										 $.toptip('操作成功', 'success');
										 setTimeout(function(){
											 window.location.href="/wxkf/bxbsj/page/resume.jsp";
										 }, 1000);
									}else{
										 $.toptip('操作失败', 'error');
									}
									console.log(data);
								}
							});
						}
					}
				});
				$.hideLoading();
			}
		});
		</script>
	</body>

</html>