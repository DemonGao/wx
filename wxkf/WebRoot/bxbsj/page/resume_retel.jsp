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
				<div class="weui_cell_hd margin-r-15"><label class="weui_label">手机</label></div>
				<div class="weui_cell_bd weui_cell_primary">
					<input class="weui_input" type="tel" v-model="student.student_tel"  placeholder="请输入您的手机号">
				</div>
			</div>
			<div class="weui_cell">
				<div class="weui_cell_hd margin-r-15"><label class="weui_label">邮箱</label></div>
				<div class="weui_cell_bd weui_cell_primary">
					<input class="weui_input" type="tel" v-model="student.student_mailbox" placeholder="请输入您的邮箱">
				</div>
			</div>
			<div class="weui_cell">
				<div class="weui_cell_hd margin-r-15"><label class="weui_label"  >QQ</label></div>
				<div class="weui_cell_bd weui_cell_primary">
					<input class="weui_input" type="tel" v-model="student.student_qq" placeholder="请输入您的QQ">
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
		<script type="text/javascript" src="../static/js/vue.js" ></script>
		<script>
		$.showLoading();
		$.ajax({
			url:"/wxkf/api/Student_query",
			data:{
				"student.open_id":localStorage.getItem("openid"),
				//"student.open_id":"o6yKmw8QEd6vVrud2ZpBBMLG8z3Y"
				"random": Math.random(10000)
			},
			success:function(data){
				console.log(data);
				var bxbsj  =new Vue({
					el: '#bxbsj',
					data: {
						//baseUrl:'/wxkf',
						//result:data.result,
						student:data.student
					},
					methods:{
						commitForm:function(){
							console.log(bxbsj.student);
							if(bxbsj.student.student_tel==null||bxbsj.student.student_mailbox==null||bxbsj.student.student_tel==null){
								$.toast("请将信息填写完整!", "text");
								return ;
							}
							$.ajax({
								url:"/wxkf/api/Student_updateContact",
								data:{
									"student.open_id":localStorage.getItem("openid"),
									"student.student_mailbox":bxbsj.student.student_mailbox,
									"student.student_qq":bxbsj.student.student_qq,
									"student.student_tel":bxbsj.student.student_tel,
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
		</script>
	</body>

</html>