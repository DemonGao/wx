<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>

	<head>
		<title>意见反馈</title>
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
				font-size: 20px;
			}
		</style>
	</head>

	<body>
		<div class="weui_cells weui_cells_form" id="bxbsj" style="margin-top:0">
			<div class="weui_cells weui_cells_form margin-b-5" style="margin-top:0">
				<div class="weui_cell">
					<div class="weui_cell_hd margin-r-15"><label class="weui_label">联系电话</label></div>
					<div class="weui_cell_bd weui_cell_primary">
						<input class="weui_input" type="tel" v-model="faceback_tel"  placeholder="请输入您的手机号">
					</div>
				</div>
				<div class="weui_cells_title font-16 color-default">反馈内容</div>
				<div class="weui_cell">
					<div class="weui_cell_bd weui_cell_primary">
						<textarea id="textarea" class="weui_textarea" v-model="faceback_text" placeholder="请填写反馈内容" rows="5"></textarea>
						<div class="weui_textarea_counter"><span>0</span>/200</div>
					</div>
				</div>
			</div>
			<a href="javascript:;" v-on:click="commitForm()" class="weui_btn weui_btn_primary margin-l-10 margin-r-10">提交</a>
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
		var bxbsj  = new Vue({
			el: '#bxbsj',
			data: {
				baseUrl:'/wxkf',
				faceback_tel:'',
				faceback_text:'',
			},
			methods:{
				replaceAll:function(str,reg,val)  
				{  
				    if(str!=null)  
				    str = str.replace(reg,val);
				    return str;  
				}, 
				commitForm:function(){
					//replaceAll(replaceAll(bxbsj.student.student_skill,/\n/g,"</br>"),/ /g,"&nbsp;")
					if(bxbsj.faceback_tel==""&&bxbsj.faceback_text==""){
						$.toast("请将信息填写完整!", "text");
						return ;
					}
					$.showLoading();
					$.ajax({
						url:"/wxkf/api/FaceBack_add",
						data:{
							"faceback.openid":localStorage.getItem("openid"),
							//"openid":"o6yKmw8QEd6vVrud2ZpBBMLG8z3Y"
							"faceback.faceback_tel":bxbsj.faceback_tel,
							"faceback.faceback_text":bxbsj.replaceAll(bxbsj.replaceAll(bxbsj.faceback_text,/\n/g,"</br>"),/ /g,"&nbsp;"),
						},
						success:function(data){
							if(data.result){
								 $.toptip(data.msg, 'success');
								 setTimeout(function(){
									 window.location.href="/wxkf/bxbsj/page/me.jsp";
								 }, 1000);
							}else{
								 $.toptip(data.msg, 'error');
							}
							console.log(data);
							$.hideLoading();
						}
					});				
				}
			}
		});
				

		</script>
		
		
	</body>

</html>