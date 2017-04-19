<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
<link href="<%=basePath %>admin/static/css/style.css" rel="stylesheet">
<link href="<%=basePath %>admin/static/css/style-responsive.css"
	rel="stylesheet">

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
  <script src="<%=basePath %>admin/static/js/html5shiv.js"></script>
  <script src="<%=basePath %>admin/static/js/respond.min.js"></script>
  <![endif]-->
</head>
<%
	//记录当前地址,便于跳转404 后返回
	session.setAttribute("backurl", basePath+"admin/index.jsp");
%>
<body class="sticky-header">
	<section>
		<!-- left side start-->
		<div class="left-side sticky-left-side">

			<!--logo and iconic logo start-->
			<div class="logo">
				<a href="index.html"><img
					src="<%=basePath %>admin/static/images/logo.png" alt=""></a>
			</div>

			<div class="logo-icon text-center">
				<a href="index.html"><img
					src="<%=basePath %>admin/static/images/logo_icon.png" alt=""></a>
			</div>
			<!--logo and iconic logo end-->

			<div class="left-side-inner">

				<!-- visible to small devices only -->
				<div class="visible-xs hidden-sm hidden-md hidden-lg">
					<div class="media logged-user">
						<img alt=""
							src="<%=basePath %>admin/static/images/photos/user-avatar.png"
							class="media-object">
						<div class="media-body">
							<h4>
								<a href="#"> <s:if test="#session.login_admin!=null">
										<span>${login_admin.adminname}</span>
									</s:if> <s:else>
										<script>window.location.href="<%=basePath %>admin/pages/login.jsp"</script>
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
					<li><a href="<%=basePath %>admin/index.jsp"><i
							class="fa fa-home"></i> <span>首页</span></a></li>

					<li class="menu-list"><a href="#"><i
							class="fa fa-th-list"></i> <span>大业案例管理</span></a>
						<ul class="sub-menu-list">
							<li><a href="#">案例</a></li>
							<li><a href="#">案例操作</a></li>
							<li><a href="#">案例查看</a></li>
						</ul>
					</li>
					<li class="menu-list nav-active"><a href="#"><i
							class="fa fa-th-list"></i> <span>大业动态管理</span></a>
						<ul class="sub-menu-list nav-active">
							<li class="active"><a href="login">动态</a></li>
							<li><a href="case.jsp">案例</a></li>
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
												src="<%=basePath %>/admin/static/images/photos/user1.png"
												alt="" /></span> <span class="desc"> <span class="name">John
													Doe <span class="badge badge-success">new</span>
											</span> <span class="msg">Lorem ipsum dolor sit amet...</span>
										</span>
									</a></li>
									<li><a href=""> <span class="thumb"><img
												src="<%=basePath %>/admin/static/images/photos/user2.png"
												alt="" /></span> <span class="desc"> <span class="name">Jonathan
													Smith</span> <span class="msg">Lorem ipsum dolor sit
													amet...</span>
										</span>
									</a></li>
									<li><a href=""> <span class="thumb"><img
												src="<%=basePath %>/admin/static/images/photos/user3.png"
												alt="" /></span> <span class="desc"> <span class="name">Jane
													Doe</span> <span class="msg">Lorem ipsum dolor sit amet...</span>
										</span>
									</a></li>
									<li><a href=""> <span class="thumb"><img
												src="<%=basePath %>/admin/static/images/photos/user4.png"
												alt="" /></span> <span class="desc"> <span class="name">Mark
													Henry</span> <span class="msg">Lorem ipsum dolor sit
													amet...</span>
										</span>
									</a></li>
									<li><a href=""> <span class="thumb"><img
												src="<%=basePath %>/admin/static/images/photos/user5.png"
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
								src="<%=basePath %>/admin/static/images/photos/user-avatar.png"
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
				<h3>案例</h3>
				<ul class="breadcrumb">
					<li><a href="#">大业后台</a></li>
					<li class="active">案例</li>
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
								案例管理 <span class="tools pull-right"> <a
									href="javascript:;" class="fa fa-chevron-down"></a> <a
									href="javascript:;" class="fa fa-times"></a>
								</span>
							</header>
							<div class="panel-body">
								<div class="adv-table editable-table ">
									<div class="space15"></div>
									<div class="table-responsive">
										<table class="table table-striped table-hover table-bordered table-condensed"  id="editable-sample">
											<thead>
												<tr>
													<th style="text-align:center">案例ID</th>
													<th style="text-align:center">案例名称</th>
													<th style="text-align:center">案例类型</th>
													<th style="text-align:center">案例图片路径</th>
													<th style="text-align:center" colspan="2">操作</th>
												</tr>
											</thead>
											<tbody id="casetbody">
											</tbody>
										</table>
									</div>
									<!-- 修改操作模态框（Modal） -->
									<div class="modal fade" id="caseModal" tabindex="-1" role="dialog"
										aria-labelledby="myModalLabel" aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal"
														aria-hidden="true">&times;</button>
													<h4 class="modal-title" id="caseModalLabel">模态框（Modal）标题</h4>
												</div>
												<div class="modal-body">
												<form class="form-horizontal" role="form">
													<div class="form-group form-group-lg">
														<label class="col-sm-2 col-xs-12 control-label" for="case_id">案例ID</label>
														<div class="col-sm-10 col-xs-12">
															<input type="text" class="form-control" id="case_id" name="case_id" placeholder="案例Id" readonly>
													    </div>
													</div>
													<div class="form-group form-group-lg">
														<label class="col-sm-2 col-xs-12 control-label" for="case_name">案例名称</label>
														<div class="col-sm-10 col-xs-12">
															<input type="text" class="form-control" id="case_name" name="case_name" placeholder="案例名称" >
													    </div>
													</div>
													<div class="form-group form-group-lg">
														<label class="col-sm-2 col-xs-12 control-label" for="case_type">案例类型</label>
														<div class="col-sm-10 col-xs-12">
															<input type="text" class="form-control" id="case_type" name="case_type" placeholder="案例类型" >
													    </div>
													</div>
													<div class="form-group form-group-lg">
														<label class="col-sm-2 col-xs-12 control-label" for="case_img">案例图片</label>
														<div class="col-sm-10 col-xs-12">
															<input type="text" class="form-control" id="case_img" name="case_img" placeholder="案例图片路径" >
													    </div>
													</div>
												</form>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-default"
														data-dismiss="modal">关闭</button>
													<button type="button" class="btn btn-primary">提交更改</button>
												</div>
											</div>
											<!-- /.modal-content -->
										</div>
										<!-- /.modal -->
									</div>
									
									<!-- 删除操作模态框（Modal） -->
									<div class="modal fade" id="caseModal_d" tabindex="-1" role="dialog"
										aria-labelledby=""caseModal_d"" aria-hidden="true">
										<div class="modal-dialog modal-sm">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal"
														aria-hidden="true">&times;</button>
													<h4 class="modal-title" id="caseModalLabel_d"></h4>
												</div>
												<div class="modal-body">
												<form class="form-horizontal" role="form">
													<div class="form-group form-group-lg">
														<label class="col-sm-4 col-xs-12 control-label" for="case_id_d">案例ID</label>
														<div class="col-sm-8 col-xs-12">
															<input type="text" class="form-control" id="case_id_d" name="case_id" placeholder="案例Id" readonly>
													    </div>
													</div>
												</form>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-default"
														data-dismiss="modal">关闭</button>
													<button type="button" class="btn btn-primary">确定删除</button>
												</div>
											</div>
											<!-- /.modal-content -->
										</div>
										<!-- /.modal -->
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
	<script src="<%=basePath %>admin/static/js/jquery-1.10.2.min.js"></script>
	<script src="<%=basePath %>admin/static/js/jquery-ui-1.9.2.custom.min.js"></script>

	<script src="<%=basePath %>admin/static/js/bootstrap.min.js"></script>
	
	<!-- <script src="<%=basePath %>admin/static/js/modernizr.min.js"></script> -->
	<script src="<%=basePath %>admin/static/js/jquery.nicescroll.js"></script>


	<!--common scripts for all pages-->
	<script src="<%=basePath %>admin/static/js/scripts.js"></script>
	<!-- caseJs -->
	<script type="text/javascript" src="<%=basePath %>admin/statics/js/case.js"></script>
</body>
</html>

