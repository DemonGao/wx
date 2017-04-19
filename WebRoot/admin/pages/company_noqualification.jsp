<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<meta name="keywords"
	content="admin, dashboard, bootstrap, template, flat, modern, theme, responsive, fluid, retina, backend, html5, css, css3">
<meta name="description" content="">
<meta name="author" content="ThemeBucket">
<link rel="shortcut icon" href="#" type="image/png">

<title>AdminX</title>

<!--common-->
<link href="<%=basePath%>admin/static/css/style.css" rel="stylesheet">
<link href="<%=basePath%>admin/static/css/style-responsive.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<%=basePath%>admin/static/css/bootstrap-fileupload.min.css" />
<link href="<%=basePath%>admin/statics/css/demonstyle.css" rel="stylesheet" />
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
  <script src="<%=basePath%>admin/static/js/html5shiv.js"></script>
  <script src="<%=basePath%>admin/static/js/respond.min.js"></script>
  <![endif]-->
  <style type="text/css">
  	@media (min-width: 768px){
  		.modal-dialog {
		    width: 750px;
		    margin: 30px auto;
		}
  	}
  </style>
</head>
<%
	//记录当前地址,便于跳转404 后返回
	session.setAttribute("backurl", basePath + "admin/index.jsp");
%>
<body class="sticky-header">
	<section>
		<!-- left side start-->
		<div class="left-side sticky-left-side">
			<!--logo and iconic logo start-->
			<div class="logo">
				<a href="index.html"><img
					src="<%=basePath%>admin/static/images/logo.png" alt=""></a>
			</div>
			<div class="logo-icon text-center">
				<a href="index.html"><img
					src="<%=basePath%>admin/static/images/logo_icon.png" alt=""></a>
			</div>
			<!--logo and iconic logo end-->
			<div class="left-side-inner">
				<!-- visible to small devices only -->
				<div class="visible-xs hidden-sm hidden-md hidden-lg">
					<div class="media logged-user">
						<img alt=""
							src="<%=basePath%>admin/static/images/photos/user-avatar.png"
							class="media-object">
						<div class="media-body">
							<h4>
								<a href="#"> <s:if test="#session.login_admin!=null">
										<span>${login_admin.adminname}</span>
									</s:if> <s:else>
										<script>window.location.href="<%=basePath%>admin/pages/login.jsp"
										</script>
									</s:else>
								</a>
							</h4>
							<span>"Hello There..."</span>
						</div>
					</div>
					<h5 class="left-nav-title">Account Information</h5>
					<ul class="nav nav-pills nav-stacked custom-nav">
						<li><a href="#"><i class="fa fa-user"></i> <span>Profile</span></a></li>
						<li><a href="#"><i class="fa fa-cog"></i> <span>Settings</span></a></li>
						<li><a href="<%=path%>/Admin/Admin_adminLogOut"><i
								class="fa fa-sign-out"></i> <span>Sign Out</span></a></li>
					</ul>
				</div>
				<!--sidebar nav start-->
				<ul class="nav nav-pills nav-stacked custom-nav">
					<li class="menu-list nav-active">
						<a href="<%=basePath%>admin/index.jsp"><i class="fa fa-home"></i><span>首页</span></a>
					</li>
					<li class="menu-list">
						<a href="#"><i class="fa fa-th-list"></i><span>微信用户</span></a>
						<ul class="sub-menu-list">
							<li><a href="<%=basePath%>admin/pages/news.jsp">关注者信息</a></li>
						</ul>
					</li>
					<li class="menu-list">
						<a href="#"><i class="fa fa-th-list"></i><span>学生管理</span></a>
						<ul class="sub-menu-list">
							<li><a href="<%=basePath%>admin/pages/news.jsp">学生信息</a></li>
							<li><a href="<%=basePath%>admin/pages/cases.jsp">简历管理</a></li>
						</ul>
					</li>
					<li class="menu-list nav-active">
						<a href="#"><i class="fa fa-th-list"></i><span>企业管理</span></a>
						<ul class="sub-menu-list">
							<li><a href="<%=basePath%>admin/pages/Companylist.jsp">企业账号</a></li>
							<li><a href="<%=basePath%>admin/pages/cases.jsp">企业信息</a></li>
							<li><a href="<%=basePath%>admin/pages/company_noqualification.jsp">待审核企业</a></li>
							<li><a href="<%=basePath%>admin/pages/company_qualification.jsp">已认证企业</a></li>
						</ul>
					</li>
				</ul>
				<!--sidebar nav end-->
			</div>
		</div>
		<!-- left side end-->
		<!-- main content start-->
		<div class="main-content">
			<!-- header section start-->
			<div class="header-section">
				<!--toggle button start-->
				<a class="toggle-btn"><i class="fa fa-bars"></i></a>
				<!--toggle button end-->
				<!--search start-->
				<form class="searchform" action="index.html" method="post">
					<input type="text" class="form-control" name="keyword"
						placeholder="Search here..." />
				</form>
				<!--search end-->

				<!--notification menu start -->
				<div class="menu-right">
					<ul class="notification-menu">
						<li><a href="#"
							class="btn btn-default dropdown-toggle info-number"
							data-toggle="dropdown"> <i class="fa fa-tasks"></i> <span
								class="badge">8</span>
						</a>
							<div class="dropdown-menu dropdown-menu-head pull-right">
								<h5 class="title">You have 8 pending task</h5>
								<ul class="dropdown-list user-list">
									<li class="new"><a href="#">
											<div class="task-info">
												<div>Database update</div>
											</div>
											<div class="progress progress-striped">
												<div style="width: 40%" aria-valuemax="100"
													aria-valuemin="0" aria-valuenow="40" role="progressbar"
													class="progress-bar progress-bar-warning">
													<span class="">40%</span>
												</div>
											</div>
									</a></li>
									<li class="new"><a href="#">
											<div class="task-info">
												<div>Dashboard done</div>
											</div>
											<div class="progress progress-striped">
												<div style="width: 90%" aria-valuemax="100"
													aria-valuemin="0" aria-valuenow="90" role="progressbar"
													class="progress-bar progress-bar-success">
													<span class="">90%</span>
												</div>
											</div>
									</a></li>
									<li><a href="#">
											<div class="task-info">
												<div>Web Development</div>
											</div>
											<div class="progress progress-striped">
												<div style="width: 66%" aria-valuemax="100"
													aria-valuemin="0" aria-valuenow="66" role="progressbar"
													class="progress-bar progress-bar-info">
													<span class="">66% </span>
												</div>
											</div>
									</a></li>
									<li><a href="#">
											<div class="task-info">
												<div>Mobile App</div>
											</div>
											<div class="progress progress-striped">
												<div style="width: 33%" aria-valuemax="100"
													aria-valuemin="0" aria-valuenow="33" role="progressbar"
													class="progress-bar progress-bar-danger">
													<span class="">33% </span>
												</div>
											</div>
									</a></li>
									<li><a href="#">
											<div class="task-info">
												<div>Issues fixed</div>
											</div>
											<div class="progress progress-striped">
												<div style="width: 80%" aria-valuemax="100"
													aria-valuemin="0" aria-valuenow="80" role="progressbar"
													class="progress-bar">
													<span class="">80% </span>
												</div>
											</div>
									</a></li>
									<li class="new"><a href="">See All Pending Task</a></li>
								</ul>
							</div></li>
						<li><a href="#"
							class="btn btn-default dropdown-toggle info-number"
							data-toggle="dropdown"> <i class="fa fa-envelope-o"></i> <span
								class="badge">5</span>
						</a>
							<div class="dropdown-menu dropdown-menu-head pull-right">
								<h5 class="title">You have 5 Mails</h5>
								<ul class="dropdown-list normal-list">
									<li class="new"><a href=""> <span class="thumb"><img
												src="<%=basePath%>/admin/static/images/photos/user1.png"
												alt="" /></span> <span class="desc"> <span class="name">John
													Doe <span class="badge badge-success">new</span>
											</span> <span class="msg">Lorem ipsum dolor sit amet...</span>
										</span>
									</a></li>
									<li><a href=""> <span class="thumb"><img
												src="<%=basePath%>/admin/static/images/photos/user2.png"
												alt="" /></span> <span class="desc"> <span class="name">Jonathan
													Smith</span> <span class="msg">Lorem ipsum dolor sit
													amet...</span>
										</span>
									</a></li>
									<li><a href=""> <span class="thumb"><img
												src="<%=basePath%>/admin/static/images/photos/user3.png"
												alt="" /></span> <span class="desc"> <span class="name">Jane
													Doe</span> <span class="msg">Lorem ipsum dolor sit amet...</span>
										</span>
									</a></li>
									<li><a href=""> <span class="thumb"><img
												src="<%=basePath%>/admin/static/images/photos/user4.png"
												alt="" /></span> <span class="desc"> <span class="name">Mark
													Henry</span> <span class="msg">Lorem ipsum dolor sit
													amet...</span>
										</span>
									</a></li>
									<li><a href=""> <span class="thumb"><img
												src="<%=basePath%>/admin/static/images/photos/user5.png"
												alt="" /></span> <span class="desc"> <span class="name">Jim
													Doe</span> <span class="msg">Lorem ipsum dolor sit amet...</span>
										</span>
									</a></li>
									<li class="new"><a href="">Read All Mails</a></li>
								</ul>
							</div></li>
						<li><a href="#"
							class="btn btn-default dropdown-toggle info-number"
							data-toggle="dropdown"> <i class="fa fa-bell-o"></i> <span
								class="badge">4</span>
						</a>
							<div class="dropdown-menu dropdown-menu-head pull-right">
								<h5 class="title">Notifications</h5>
								<ul class="dropdown-list normal-list">
									<li class="new"><a href=""> <span
											class="label label-danger"><i class="fa fa-bolt"></i></span>
											<span class="name">Server #1 overloaded. </span> <em
											class="small">34 mins</em>
									</a></li>
									<li class="new"><a href=""> <span
											class="label label-danger"><i class="fa fa-bolt"></i></span>
											<span class="name">Server #3 overloaded. </span> <em
											class="small">1 hrs</em>
									</a></li>
									<li class="new"><a href=""> <span
											class="label label-danger"><i class="fa fa-bolt"></i></span>
											<span class="name">Server #5 overloaded. </span> <em
											class="small">4 hrs</em>
									</a></li>
									<li class="new"><a href=""> <span
											class="label label-danger"><i class="fa fa-bolt"></i></span>
											<span class="name">Server #31 overloaded. </span> <em
											class="small">4 hrs</em>
									</a></li>
									<li class="new"><a href="">See All Notifications</a></li>
								</ul>
							</div></li>
						<li><a href="#" class="btn btn-default dropdown-toggle"
							data-toggle="dropdown"> <img
								src="<%=basePath%>/admin/static/images/photos/user-avatar.png"
								alt="" /> <s:if test="#session.login_admin!=null">
									<span>${login_admin.adminname}</span>
								</s:if> <span class="caret"></span>
						</a>
							<ul class="dropdown-menu dropdown-menu-usermenu pull-right">
								<li><a href="#"><i class="fa fa-user"></i> Profile</a></li>
								<li><a href="#"><i class="fa fa-cog"></i> Settings</a></li>
								<li><a href="<%=path%>/Admin/Admin_adminLogOut"><i
										class="fa fa-sign-out"></i> Log Out</a></li>
							</ul></li>

					</ul>
				</div>
				<!--notification menu end -->

			</div>
			<!-- header section end-->

			<!-- page heading start-->
			<div class="page-heading">
				<h3>边学边实践后台管理</h3>
				<ul class="breadcrumb">
					<li><a href="#">企业管理</a></li>
					<li class="active">企业认证</li>
				</ul>
				<div class="state-info">
					<section class="panel">
						<div class="panel-body">
							<div class="summary">
								<span>yearly expense</span>
								<h3 class="red-txt">$ 45,600</h3>
							</div>
							<div id="income" class="chart-bar"></div>
						</div>
					</section>
					<section class="panel">
						<div class="panel-body">
							<div class="summary">
								<span>yearly income</span>
								<h3 class="green-txt">$ 45,600</h3>
							</div>
							<div id="expense" class="chart-bar"></div>
						</div>
					</section>
				</div>
			</div>
			<!-- page heading end-->

			<!--body wrapper start-->
			<div class="wrapper container-fluid">
				<div class="row">
					<div class="col-sm-12">
						<section class="panel">
							<header class="panel-heading">
								待审核列表<span class="tools pull-right"> <a
									href="javascript:;" class="fa fa-chevron-down"></a> <a
									href="javascript:;" class="fa fa-times"></a>
								</span>
							</header>
							<div class="panel-body" id="tableVue">
<!-- 修改操作模态框（Modal） -->
	<div class="modal fade" id="updateModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="caseModalLabel">公司信息</h4>
				</div>
				<div class="modal-body">
					<!-- <form action="/wxkf/adminapi/Company_checkInfo"  class="form-horizontal" role="form" id="upModelForm" enctype="multipart/form-data" method="post">
				--><form action="javascript:;"  class="form-horizontal" role="form" id="upModelForm" enctype="multipart/form-data" method="post">
							
						<input type="hidden" name="companyInfo.openid" v-model="data.openid"/>
						
						<div class="form-group form-group-lg">
							<label class="col-sm-2 col-xs-12 control-label">公司名称</label>
							<div class="col-sm-10 col-xs-12">{{data.companyinfo_name}}</div>
						</div>
						<div class="form-group form-group-lg" v-if="data.companyinfo_url">
							<label class="col-sm-2 col-xs-12 control-label">公司性质</label>
							<div class="col-sm-10 col-xs-12">{{data.companyinfo_type}}</div>
						</div>
						<div class="form-group form-group-lg" v-if="data.companyinfo_url">
							<label class="col-sm-2 col-xs-12 control-label">企业规模</label>
							<div class="col-sm-10 col-xs-12">
								{{data.companyinfo_size}} 人
							</div>
						</div>
						<div class="form-group form-group-lg" v-if="data.companyinfo_url">
							<label class="col-sm-2 col-xs-12 control-label">公司网址</label>
							<div class="col-sm-10 col-xs-12">
								{{data.companyinfo_url}} 
							</div>
						</div>
						<div class="form-group form-group-lg" id="lxyz_type">
							<label class="col-sm-2 col-xs-12 control-label" for="case_name">公司营业执照</label>
							<div class="col-sm-10 col-xs-12">
								<img id="up_news_img" :src="imgPath(data.companyinfo_copy)" alt="" style="width:100%;height:100%;">
							</div>
						</div>
						<div class="form-group form-group-lg" v-if="data.companyinfo_url">
							<label class="col-sm-2 col-xs-12 control-label">法人姓名</label>
							<div class="col-sm-10 col-xs-12">
								{{data.companyinfo_legal_person}} 
							</div>
						</div>
						
						<div class="form-group form-group-lg" id="lxyz_type">
							<label class="col-sm-2 col-xs-12 control-label" for="case_name">法人证件</label>
							<div class="col-sm-10 col-xs-12">
								<img id="up_news_img" :src="imgPath(data.companyinfo_certificates)" alt="" style="width:100%;height:100%;">
							</div>
						</div>
						<div class="form-group form-group-lg">
							<label class="col-sm-2 col-xs-12 control-label" for="update_news_info">企业介绍</label>
							<div class="col-sm-10 col-xs-12">
								{{data.companyinfo_about}} 
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" @click="checkInfo(data.openid)">批准</button>
					<<!--<button type="submit" class="btn btn-primary" >批准</button>  -->
					
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
								<div class="adv-table editable-table ">
									<div class="" style="margin-bottom:15px">
										<!-- 
										<button v-on:click="add()" class="btn btn-primary" type="button" >
											<i class="fa fa-plus"></i> 添加
										</button>
										<button v-on:click="del()" class="btn btn-primary" type="button">
											<i class="fa fa-minus"></i> 删除
										</button>
										 -->
										<button v-on:click="update()" class="btn btn-primary" type="button">
											<i class="fa fa-pencil"></i> 查看
										</button>
										<div class="input-group" style="width:300px;float:right;">
											
											<input type="text" class="form-control" v-model="serchText" placeholder="根据公司名称查询"  v-on:keyup.enter="SerchDate"> <span
												class="input-group-btn">
												<button type="button" class="btn btn-default" v-on:click="SerchDate">
													<i class="fa fa-search"></i>
												</button>
											</span>
										</div>
										<select class="form-control" style="width:100px;float:right;">
											<option>公司名称</option>
										</select>
									</div>
									<div class="table-responsive" >
										<table class="table table-striped table-hover table-bordered table-condensed" id="editable-sample">
											<thead>
												<tr>
													<th style="width:100px;">
														<button type="button" id="allorone_check" onclick="_selectall(this)"
															class="btn btn-success btn-xs">全选</button>
														<button type="button" id="invert_check" onclick="_selectnoall()"
															class="btn btn-info btn-xs">反选</button>
													</th>
													<th style="text-align:center">公司名称</th>
													<th style="text-align:center">提交时间</th>
													<th style="text-align:center">负责人</th>
													<th style="text-align:center">联系电话</th>
												</tr>
											</thead>
											<tbody class="tbodylist">							
												 <tr v-for="item in list " v-on:dblclick="trdbclick($event)" style="text-align:center">
												 	<td>
												 		<input type="checkbox" :value="item.openid" />
												 	</td>
												 	<td>{{item.companyinfo_name}}</td>
												 	<td>{{(new Date(item.companyinfo_uptime)).Format("yyyy-MM-dd hh:mm")}}</td>
												 	<td>{{item.companyinfo_nickname}}</td>
												 	<td>{{item.companyinfo_tel}}</td>
												 	
												 </tr>
											</tbody>
										</table>
										<div>
											<span style="float:left;margin: 20px 0;">当前：{{pageNum*pageSize+1}}-{{(pageNum+1)*pageSize+1}}条数据<span style="margin-right:20px"></span><span style="margin-right:20px"></span> 共 {{pageNums}}页</span>
											<ul class="pagination pagination-sm" style="float:right">
												<li><a href="javascript:;" v-on:click="page_pre()" id="page_pre"><i class="fa fa-angle-double-left"></i></a></li>
												<li v-for="(i,index) in pageNums" v-on:click="page_index(index)">
													<a href="#">{{i}}</a>
												</li>
												<li><a href="javascript:;" v-on:click="page_next()"><i class="fa fa-angle-double-right"></i></a></li>
											</ul>
											
										</div>
									</div>
								</div>
							</div>
						</section>
					</div>
				</div>
			</div>
			<!--body wrapper end-->

			<!--footer section start-->
			<footer> 2014 &copy; AdminEx by ThemeBucket </footer>
			<!--footer section end-->
		</div>
		<!-- main content end-->
	</section>
	
	<!-- Placed js at the end of the document so the pages load faster -->
	<script src="<%=basePath%>admin/static/js/jquery-1.10.2.min.js"></script>
	<script src="<%=basePath%>admin/static/js/jquery-ui-1.9.2.custom.min.js"></script>
	<script src="<%=basePath%>admin/static/js/bootstrap.min.js"></script>
	<!-- <script src="<%=basePath%>admin/static/js/modernizr.min.js"></script> -->
	<script src="<%=basePath%>admin/static/js/jquery.nicescroll.js"></script>
	<!-- Vue.js -->
	<script type="text/javascript" src="<%=basePath%>admin/statics/js/vue.js"></script>
	<!--common scripts for all pages-->
	<script src="<%=basePath%>admin/static/js/scripts.js"></script>
	<!-- caseJs -->
	<script type="text/javascript" src="<%=basePath%>admin/statics/js/GscUtil.js"></script>
	<!-- Ajax -->
	<script type="text/javascript" src="<%=basePath%>admin/statics/js/company_noqualification.js"></script>
</body>
</html>

