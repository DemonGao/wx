<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>

	<head>
		<title>简历</title>
		<meta charset="utf-8">
		<!-- 禁止识别手机号 -->
		<meta name="format-detection" content="telephone=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">

		<meta name="description" content="Write an awesome description for your new site here. You can edit this line in _config.yml. It will appear in your document head meta (for Google search results) and in your feed.xml site description.
">
		<link rel="stylesheet" href="../static/font/iconfont.css" />
		<link rel="stylesheet" href="../static/JqueryWeUI/lib/weui.min.css">
		<link rel="stylesheet" href="../static/JqueryWeUI/css/jquery-weui.css">

		<link rel="stylesheet" href="../static/css/style.css" />
		<link rel="stylesheet" href="../static/css/resume.css" />
		<link rel="stylesheet" href="../static/css/recruitment.css" />
		<style>
		
		</style>
	</head>

	<body ontouchstart>
		<div class="weui_tab" id="bxbsj">
			<div v-if="result" class="weui_tab_bd">
				<div class="box nospacebox nopadding nomargin">
					<div class="weui-row weui-no-gutter box plate nomargin">
						<div class="weui-col-25 padding10">
							<img v-if="hasImg()" style="width: 100%;height: 100%;" class="weui_media_appmsg_thumb" :src="baseUrl + data.student_img.slice(1,-1).split(',')[0]" alt="">
							<img v-else="hasImg()" style="width: 100%;height: 100%;" class="weui_media_appmsg_thumb" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAHgAAAB4CAMAAAAOusbgAAAAeFBMVEUAwAD///+U5ZTc9twOww7G8MYwzDCH4YcfyR9x23Hw+/DY9dhm2WZG0kbT9NP0/PTL8sux7LFe115T1VM+zz7i+OIXxhes6qxr2mvA8MCe6J6M4oz6/frr+us5zjn2/fa67rqB4IF13XWn6ad83nxa1loqyirn+eccHxx4AAAC/klEQVRo3u2W2ZKiQBBF8wpCNSCyLwri7v//4bRIFVXoTBBB+DAReV5sG6lTXDITiGEYhmEYhmEYhmEYhmEY5v9i5fsZGRx9PyGDne8f6K9cfd+mKXe1yNG/0CcqYE86AkBMBh66f20deBc7wA/1WFiTwvSEpBMA2JJOBsSLxe/4QEEaJRrASP8EVF8Q74GbmevKg0saa0B8QbwBdjRyADYxIhqxAZ++IKYtciPXLQVG+imw+oo4Bu56rjEJ4GYsvPmKOAB+xlz7L5aevqUXuePWVhvWJ4eWiwUQ67mK51qPj4dFDMlRLBZTqF3SDvmr4BwtkECu5gHWPkmDfQh02WLxXuvbvC8ku8F57GsI5e0CmUwLz1kq3kD17R1In5816rGvQ5VMk5FEtIiWislTffuDpl/k/PzscdQsv8r9qWq4LRWX6tQYtTxvI3XyrwdyQxChXioOngH3dLgOFjk0all56XRi/wDFQrGQU3Os5t0wJu1GNtNKHdPqYaGYQuRDfbfDf26AGLYSyGS3ZAK4S8XuoAlxGSdYMKwqZKM9XJMtyqXi7HX/CiAZS6d8bSVUz5J36mEMFDTlAFQzxOT1dzLRljjB6+++ejFqka+mXIe6F59mw22OuOw1F4T6lg/9VjL1rLDoI9Xzl1MSYDNHnPQnt3D1EE7PrXjye/3pVpr1Z45hMUdcACc5NVQI0bOdS1WA0wuz73e7/5TNqBPhQXPEFGJNV2zNqWI7QKBd2Gn6AiBko02zuAOXeWIXjV0jNqdKegaE/kJQ6Bfs4aju04lMLkA2T5wBSYPKDGF3RKhFYEa6A1L1LG2yacmsaZ6YPOSAMKNsO+N5dNTfkc5Aqe26uxHpx7ZirvgCwJpWq/lmX1hA7LyabQ34tt5RiJKXSwQ+0KU0V5xg+hZrd4Bn1n4EID+WkQdgLfRNtvil9SPfwy+WQ7PFBWQz6dGWZBLkeJFXZGCfLUjCgGgqXo5TuSu3cugdcTv/HjqnBTEMwzAMwzAMwzAMwzAMw/zf/AFbXiOA6frlMAAAAABJRU5ErkJggg==" alt="">
							
						</div>
						<div class="weui-col-75 padding10">
							<p>
								<b class="font-16">{{data.student_name}}</b>
								<i class="iconfont" v-bind:class="{ 'icon-nv': data.student_gender==='女','color-deepred': data.student_gender==='女', 'icon-shouyezhuyetubiao06': data.student_gender==='男','color-blue': data.student_gender==='男' }" ></i>
							</p>
							<p>
								<span class="margin-r-15">{{data.student_school}}</span>
								<span>{{data.student_major}}</span>
							</p>
							<p class="font-12 margin-t-5">
								<span>{{data.student_residence}}</span> | <span>{{data.student_qualifications}}</span>
								<p class="color-default06 font-12 margin-t-5">{{data.student_state}}</p>
							</p>
						</div>
							<ul class="tab clearfix">
								<li class="active"><a href="#experience">经历信息</a></li>
								<li><a href="#assess">评价信息</a></li>
								<li><a href="#skill">技能信息</a></li>
							</ul>
					</div>
				</div>
				<div v-if="data.student_mailbox!=null&&data.student_tel!=null&&data.student_qq!=null" class="box padding10">
					<b class="color-default04">联系方式</b>
					<p v-if="data.student_mailbox!=null&&data.student_mailbox!=''"><i class="iconfont icon-youxiang margin-r-5 font-22"></i>{{data.student_mailbox}}</p>
					<p v-if="data.student_tel!=null&&data.student_tel!=''"><i class="iconfont icon-shouji margin-r-5 font-22"></i><a class="color-orange" :href="tel(data.student_tel)">{{data.student_tel}}</a></p>
					<p v-if="data.student_qq!=null&&data.student_qq!=''"><i class="iconfont icon-qq margin-r-5 font-22"></i>{{data.student_qq}}</p>
				</div>
				<div v-if="data.studentExperience.length!=0" class="box padding10" id="experience">
					<div class="color-default04 margin-b-10"><b>工作经历</b></div>
					<div class="font-14 color-default04">
						<p v-if="data.studentExperience.length==0">添加工作经历,发展人脉现同行拓</p>
						<div v-else="data.studentExperience.length==0">
							<div v-for="(stuExp,index) in data.studentExperience">
								<span class="color-default06 margin-r-10">{{stuExp.studentexp_entrytime}} — {{stuExp.studentexp_departuretime}}</span>
								<span class="color-default">{{stuExp.studentexp_company}}</span>
								<span class="color-default">{{stuExp.studentexp_jobname}}({{stuExp.studentexp_jobtype}})</span>
								<p style="margin-left: 66px;">{{stuExp.studentexp_describe}}</p>
								<div class="clearfix margin-t-5 margin-b-5">
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--<div class="box padding10">
					<b class="color-default04">项目经历</b>
					<div class="font-14 color-default04">
						<div>
							添加工作经历,发展人脉现同行拓
						</div>
						<div class="clearfix">
							<a href="#" class="demon_btn demon_btn_failed float_r">删除</a>
							<a href="#" class="demon_btn demon_btn_success float_r margin-r-15">编辑</a>
						</div>
						
					</div>
					<a href="#" class="demon_btn demon_btn_block_100 demon_btn_success padding5 margin-t-15"> + 新增</a>
				</div>
				<div class="box padding10">
					<b class="color-default04">教育经历</b>
					<div class="font-14 color-default04">
						<div>
							<p>
								<span class="color-default06 margin-r-10">2013.09</span>
								<span class="color-default">软件工程</span>
							</p>
							<p>
								<span class="color-default06 margin-r-10">2013.09</span>
								<span class="color-default08">
									鲁东大学
									<p style="margin-left: 66px;">
										鲁东大学鲁东大学鲁东大学鲁东大学鲁东大学鲁东大学鲁东大学鲁东大学鲁东大学鲁东大学鲁东大学鲁东大学
									</p>
								</span>
							</p>
							
						</div>
						<div class="clearfix">
							<a href="#" class="demon_btn demon_btn_failed float_r">删除</a>
							<a href="#" class="demon_btn demon_btn_success float_r margin-r-15">编辑</a>
						</div>
						
					</div>
					<a href="#" class="demon_btn demon_btn_block_100 demon_btn_success padding5 margin-t-15"> + 新增</a>
				</div>
				-->
				<div v-if="data.student_aboutme!=null&&data.student_aboutme!=''" class="box padding10" id="assess">
					<b class="color-default04">关于我</b>
					<div class="font-14 color-default04" >
						<div v-if="data.student_aboutme==null||data.student_aboutme==''">
							一段简要的自我描述,可让别人快速了解自己
						</div>
						<div v-else="data.student_aboutme==null||data.student_aboutme==''">
							{{data.student_aboutme}}
						</div>
						<div v-show="data.student_aboutme!=null&&data.student_aboutme!=''" class="clearfix margin-t-5 margin-b-5"></div>
					</div>
				</div>
				<div v-if="data.student_speciality!=null&&data.student_speciality!=''" class="box padding10">
					<b class="color-default04">我的专长</b>
					<div class="font-14 color-default04">
						<div v-if="data.student_speciality==null||data.student_speciality==''">
							一段简要的自我描述,可让别人快速了解自己
						</div>
						<div v-else="data.student_speciality==null||data.student_speciality==''">
							{{data.student_speciality}}
						</div>
						<div v-show="data.student_speciality!=null&&data.student_speciality!=''" class="clearfix">
						</div>
					</div>
				</div>
				<div v-if="data.student_skill!=null&&data.student_skill!='' " class="box padding10" id="skill">
					<b class="color-default04">技能介绍</b>
					<div class="font-14 color-default04">
						<div v-if="data.student_skill==null||data.student_skill==''">
							一段简要的自我掌握的职业技能,可让别人快速了解自己
						</div>
						<div v-html="data.student_skill"  v-else="data.student_skill==null||data.student_skill==''">
						</div>
						<div v-show="data.student_skill!=null&&data.student_skill!=''" class="clearfix">
						</div>
					</div>
				</div>
				
			</div>
			<div class="weui_tabbar">
				<a href="javascript:;" class="weui_tabbar_item margin-l-15 margin-r-15 bg-error">
					<p class="weui_tabbar_label" v-on:click="JobInvitation_yes()"><i class="iconfont icon-toudi"></i>职位邀约</p>
				</a>
				<a href="javascript:;" class="weui_tabbar_item margin-l-15 margin-r-15 bg-success" >
					<p class="weui_tabbar_label" v-on:click="JobCollection_hidden()"><i class="iconfont icon-ganxingqu"></i>不再查看</p>
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
			url:"/wxkf/api/Student_query",
			type:"POST",
			data:{
				"student.open_id":'<%=request.getParameter("student_id")%>',
				//"student.open_id":"o6yKmw0KDIv18KyJ7zxuI4Nt4P8E"
			},
			success:function(data){
				console.log(data);
				$.hideLoading();
				var jobVue  =new Vue({
					el: '#bxbsj',
					data: {
						baseUrl:'/wxkf',
						result:data.result,
						//labels: ["实习","互联网金融行业","交易员/操盘手","本科及本科以上","行业领先薪酬待遇"]
						data:data.student,
					},
					methods:{
						tel:function(val){
							return 'tel:'+val;
						},
						hasImg:function(){
							//判断图片是否上传,若没上传则用默认图片
							if(this.data.student_img!=null){
								return true;
							}
							return false;
						},
						isSex:function(){
							//性别判断
							if(this.data.student_gender=='男'){
								return true;
							}
							return false;
						},
						JobInvitation_yes:function(){
							$.ajax({
								url:"/wxkf/api/JobInvitation_add",
								type:"POST",
								data:{
									"jobInvitation.job.job_id":<%=request.getParameter("job_id")%>,
									"jobInvitation.student.open_id":'<%=request.getParameter("student_id")%>',
									//"jobInvitation.student.open_id":"o6yKmw0KDIv18KyJ7zxuI4Nt4P8E"
								},
								success:function(data){
									if(data.result){
										$.toptip('职位邀约发送成功!', 'success');
									}else{
										$.toptip(data.error_msg, 'error');
									}
								}
							});
						},
						//不再显示此简历   改变status=1
						JobCollection_hidden:function(){
							$.ajax({
								url:"/wxkf/api/JobCollection_update",
								type:"POST",
								data:{
									"jobclt.jobCollection_id":'<%=request.getParameter("jobCollection_id")%>',
									"jobclt.status":1
								},
								success:function(data){
									if(data.result){
										$.toptip('已隐藏此简历!', 'success');
									}else{
										$.toptip(data.error_msg, 'error');
									}
								}
							});
						},
					}
				})
			}
		})
		function ajax(action){
			$.ajax({
				url:"/wxkf/api/JobPost_update",
				type:"POST",
				data:{
					"action":action,
					"jobPost.JobPost_id":'<%=request.getParameter("jobPost_id")%>',
					//"student.open_id":"o6yKmw0KDIv18KyJ7zxuI4Nt4P8E"
				},
				success:function(data){
					if(data.result){
						if(data.msg!=null)
							$.toptip(data.msg, 'success');
					}else{
						$.toptip(data.msg, 'error');
					}
				}
			});
		}
		</script>
	</body>

</html>