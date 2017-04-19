<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>

	<head>
		<title>编辑个人信息</title>
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
			<form id="upform" action="<%=basePath%>addinfo" method="post" enctype="multipart/form-data">
			<input type="hidden" name="student.open_id" id="openid" />	
			<div class="weui_cell">
				<div class="weui_cell_hd margin-r-15"><label class="weui_label">姓名</label></div>
				<div class="weui_cell_bd weui_cell_primary">
					<input class="weui_input" type="text" v-model="student.student_name" name="student.student_name" placeholder="请输入您真实姓名">
				</div>
			</div>
			<div class="weui_cell">
				<div class="weui_cell_hd margin-r-15"><label class="weui_label">学校</label></div>
				<div class="weui_cell_bd weui_cell_primary">
					<input class="weui_input" type="text" v-model="student.student_school" name="student.student_school" placeholder="请输入您的学校">
				</div>
			</div>
			<div class="weui_cell">
				<div class="weui_cell_hd margin-r-15"><label class="weui_label">专业</label></div>
				<div class="weui_cell_bd weui_cell_primary">
					<input class="weui_input" type="text" v-model="student.student_major" name="student.student_major" placeholder="请输入您的专业">
				</div>
			</div>
			<div class="weui_cell">
				<div class="weui_cell_hd margin-r-15"><label class="weui_label">学历</label></div>
				<div class="weui_cell_bd weui_cell_primary">
					<select class="weui_input" v-model="student.student_qualifications" name="student.student_qualifications">
						<option value="高中">高中</option>
						<option value="专科">专科</option>
						<option value="本科">本科</option>
						<option value="研究生">研究生</option>
					</select>
				</div>
			</div>
			<div class="weui_cell">
				<div class="weui_cell_hd margin-r-15"><label for="date" class="weui_label">性别</label></div>
				<div class="weui_cell_bd weui_cell_primary ">
					<select class="weui_input" v-model="student.student_gender" name="student.student_gender">
						<option value="男">男</option>
						<option value="女">女</option>
					</select>
				</div>
			</div>
			<div class="weui_cell">
				<div class="weui_cell_hd margin-r-15"><label for="name" class="weui_label">现居地</label></div>
				<div class="weui_cell_bd weui_cell_primary">
					<select class="weui_input" v-model="student.student_residence" name="student.student_residence">
						<option value="莱山区">莱山区</option>
						<option value="芝罘区">芝罘区</option>
						<option value="高新区">高新区</option>
					</select>
				</div>
			</div>
			<div class="weui_cell">
				<div class="weui_cell_hd margin-r-15"><label for="date" class="weui_label">状态</label></div>
				<div class="weui_cell_bd weui_cell_primary">
					<select class="weui_input" v-model="student.student_state" name="student.student_state">
						<option value="在校学生">在校学生</option>
						<option value="正在找个工作,快速到岗">正在找个工作,快速到岗</option>
						<option value="在职">在职</option>
						<option value="正在考虑换个工作">正在考虑换个工作</option>
					</select>
				</div>
			</div>
			<div class="weui_cell">
				<div class="weui_cell_hd margin-r-15"><label for="date" class="weui_label">出生日期</label></div>
				<div class="weui_cell_bd weui_cell_primary">
					<input class="weui_input"  type="date" v-model="student.student_birthday" name="student.student_birthday">
				</div>
			</div>
			<div class="weui_cell">
				<div class="weui_cell_bd weui_cell_primary">
					<div class="weui_uploader">
						<div class="weui_uploader_hd weui_cell">
							<div class="weui_cell_bd weui_cell_primary">上传头像</div>
							<div class="weui_cell_ft">0/1</div>
						</div>
						<div class="weui_uploader_bd">
							<ul class="weui_uploader_files" id="localImag" style="display: none;" >
								<!-- <li class="weui_uploader_file"><img id="preview" :style="hasImg()" :src="baseUrl + student.student_img.slice(1,-1).split(',')[0]" /></li> -->
								
								<li class="weui_uploader_file"><img id="preview" :style="hasImg()" :src="student.student_img" />
								<!--<li class="weui_uploader_file" style="background-image:url(http://shp.qpic.cn/weixinsrc_pic/pScBR7sbqjOBJomcuvVJ6iacVrbMJaoJZkFUIq4nzQZUIqzTKziam7ibg/)"></li>
								<li class="weui_uploader_file" style="background-image:url(http://shp.qpic.cn/weixinsrc_pic/pScBR7sbqjOBJomcuvVJ6iacVrbMJaoJZkFUIq4nzQZUIqzTKziam7ibg/)"></li>
								<li class="weui_uploader_file weui_uploader_status" style="background-image:url(http://shp.qpic.cn/weixinsrc_pic/pScBR7sbqjOBJomcuvVJ6iacVrbMJaoJZkFUIq4nzQZUIqzTKziam7ibg/)">
									<div class="weui_uploader_status_content">
										<i class="weui_icon_warn"></i>
									</div>
								</li>
								<li class="weui_uploader_file weui_uploader_status" style="background-image:url(http://shp.qpic.cn/weixinsrc_pic/pScBR7sbqjOBJomcuvVJ6iacVrbMJaoJZkFUIq4nzQZUIqzTKziam7ibg/)">
									<div class="weui_uploader_status_content">50%</div>
								</li>-->
							</ul>
							<div class="weui_uploader_input_wrp">
								<input class="weui_uploader_input" type="file" name="file" onchange="javascript:setImagePreview(this);">
							</div>
						</div>
					</div>
				</div>
			</div>
			<a href="javascript:;" class="weui_btn weui_btn_primary margin-l-10 margin-r-10" v-on:click="commitForm();">保存</a>
			</form>
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
							hasImg:function(){
								if(this.student.student_img!=null){
									return {
										'display':'inline-block',
										'width' : '77px',
										'height': '77px'
									};
								}
								return {
									'display':'block'
								};
							},
							isSex:function(){
								if(this.data.student_gender=='男'){
									return true;
								}
								return false;
							},
							commitForm:function(){
								if(this.student.student_name==""){
									$.toast("用户名不能为空!", "text");
									return ;
								}
								if(this.student.student_school==""){
									$.toast("学校不能为空!", "text");
									return ;
								}
								if(this.student.student_major==""){
									$.toast("专业不能为空!", "text");
									return ;
								}
								if(this.student.student_qualifications==""){
									$.toast("请选择学历!", "text");
									return ;
								}
								if(this.student.student_gender==""){
									$.toast("请选择性别!", "text");
									return ;
								}
								if(this.student.student_residence==""){
									$.toast("请选择现居地!", "text");
									return ;
								}
								if(this.student.student_state==""){
									$.toast("请选择您当前状态!", "text");
									return ;
								}
								if(this.student.student_birthday==""){
									$.toast("请选择您的出生日期!", "text");
									return ;
								}
								$("#upform").submit();
							}
						}
					});
					$.hideLoading();
				}
			});
			
			$("#openid").val(localStorage.getItem("openid"));
			//下面用于图片上传预览功能
			function setImagePreview(docObj) {
				//				var docObj = document.getElementById("doc");

				var imgObjPreview = document.getElementById("preview");

				if(docObj.files && docObj.files[0]) {
					//火狐下，直接设img属性
					imgObjPreview.style.display = 'inline-block';
					imgObjPreview.style.width = '79px';
					imgObjPreview.style.height = '79px';
					//imgObjPreview.src = docObj.files[0].getAsDataURL();

					//火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式
					imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
				} else {
					//IE下，使用滤镜
					docObj.select();
					var imgSrc = document.selection.createRange().text;
					var localImagId = document.getElementById("localImag");
					//必须设置初始大小
					localImagId.style.width = "150px";
					localImagId.style.height = "180px";
					//图片异常的捕捉，防止用户修改后缀来伪造图片
					try {
						localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
						localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
					} catch(e) {
						alert("您上传的图片格式不正确，请重新选择!");
						return false;
					}
					imgObjPreview.style.display = 'none';
					document.selection.empty();
				}
				$("#localImag").css("display", "inline-block");
				//				$(".weui_uploader_input_wrp").css("display","none");
				$(".weui_uploader .weui_cell_ft").text('1/1');
				return true;
			}

			//现居地
			
		</script>
	</body>

</html>