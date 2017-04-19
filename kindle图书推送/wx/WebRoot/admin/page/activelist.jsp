<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Kindle书城后台管理系统</title>
<link href="<%=basePath %>admin/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=basePath %>admin/css/style.css" rel="stylesheet" />
<link href="<%=basePath %>admin/css/booklist.css" rel="stylesheet" />

</head>

<body>
	<!-- 注销 -->
	<div id="loginout" class="modal fade bs-example-modal-sm" tabindex="-1"
		role="dialog" aria-labelledby="loginout">
		<div class="modal-dialog modal-sm">
			<form action="/wx/ExitLoginServlet" method="get">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">提示信息</h4>
					</div>
					<div class="modal-body">
						<p>亲,你真的要退出么?</p>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">Yes</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">No</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- 添加 -->
	<div id="addactivecodelist" class="modal fade bs-example-modal-bg formlist" tabindex="-1"
		role="dialog" aria-labelledby="addactivecodelist">
		<div class="modal-dialog modal-bg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title clearfix">
							<b>批量添加激活码</b>
							<div class="btn-group hasmargin">
								<span>时长:</span>
								<select class="option" id="option_activecodetime">
									<option value="86400000">1天</option>
									<option value="604800000">1周</option>
									<option value="2678400000">1月</option>
									<option value=8035200000>1季</option>
									<option value="16070400000">半年</option>
									<option value="31536000000">1年</option>
								</select>
							</div>
						</h4>
					</div>
					<div class="modal-body">
						<!-- 数量 -->
						<div class="form-group form-group-sm clearfix">
							<label class="col-sm-2 control-label" for="addactivecode_num">数量</label>
							<div class="col-sm-10">
								<input class="form-control" type="number" id="addactivecode_num" value="" placeholder="请输入整数">
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" id="addactivebtn" class="btn btn-primary">添加</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					</div>
				</div>
		</div>
	</div>
	<!-- 删除 -->
	<div id="delctivelist" class="modal fade bs-example-modal-sm" tabindex="-1"
		role="dialog" aria-labelledby="delbooklist">
		<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title"><b>删除激活码</b></h4>
					</div>
					<div class="modal-body">
						<p id="modalp_delactivelist"></p>
					</div>
					<div class="modal-footer">
						<button type="button" id="delbookbtn" class="btn btn-primary">Yes</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">No</button>
					</div>
				</div>
		</div>
	</div>
	
	<!-- 查看详情 -->
	<div id="seeactivelist" class="modal fade bs-example-modal-bg" tabindex="-1"
		role="dialog" aria-labelledby="seeactivelist">
		<div class="modal-dialog modal-bg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">查看详情</h4>
					</div>
					<div class="modal-body" id="content_seebooklist">
						<!-- 书籍号 -->
						<div class="form-group form-group-sm clearfix">
							<label class="col-sm-3 control-label" for="seeactivecode_id">序号</label>
							<div class="col-sm-9">
								<input class="form-control" type="text" id="seeactivecode_id" value="1" placeholder="Small input" readonly="">
							</div>
						</div>
						<!-- 书名 -->
						<div class="form-group form-group-sm clearfix">
							<label class="col-sm-3 control-label" for="seeactivecode_code">激活码</label>
							<div class="col-sm-9">
								<input class="form-control" type="text" id="seeactivecode_code" value="" placeholder="激活码">
							</div>
						</div>
						<!-- 分类 -->
						<div class="form-group form-group-sm clearfix">
							<label class="col-sm-3 control-label" for="seeactivecode_time">激活时长</label>
							<div class="col-sm-9">
								<select id="seeactivecode_time" class="form-control">
									<option value="86400000">1天</option>
									<option value="604800000">1周</option>
									<option value="2678400000">1月</option>
									<option value=8035200000>1季</option>
									<option value="16070400000">半年</option>
									<option value="31536000000">1年</option>
								</select>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" id="seeactivecodebtn" class="btn btn-primary">修改</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					</div>
				</div>
		</div>
	</div>
	<!--下面是顶部导航栏的代码-->
	<nav class="navbar navbar-default navbar-inverse navbar-fixed-top"
		role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">Kindle书城后台管理</a>
		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			

			<%
				if(session.getAttribute("admin")!=null){
					%>
					<p class="navbar-form navbar-right" role="search">
						<button type="submit" class="btn btn-default">管理员:<%=session.getAttribute("admin") %>,你好!</button>
						<button data-toggle="modal" data-target="#loginout"
							class="btn btn-default">注销</button>
					</p>
					<%
				}else{
					%>
					<script type="text/javascript">
						window.location.href="<%=basePath%>admin/index.jsp";
					</script>
					<%
				}
			%>
		</div>
	</div>
	</nav>

	<!―自适应布局-->
	<div class="container-fluid">
		<div class="row">
			<!―左侧导航栏-->

			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li><a href="<%=basePath%>/admin/page/userlist.jsp">用户管理</a></li>
					<li><a href="<%=basePath%>/admin/page/booklist.jsp">图书管理</a></li>
					<li class="active"><a href="javascript:;">激活码管理</a></li>

				</ul>
				<ul class="nav nav-sidebar">
					<li><a href="#">设置</a></li>
					<li><a href="#">帮助</a></li>
				</ul>
			</div>
			<!―右侧管理控制台-->
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1 class="page-header">管理控制台</h1>
				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<h3 class="panel-title">激活码管理</h3>
							</div>
							<div class="navbar-form navbar-left">
								<!-- Single button -->
								<div class="btn-group">
								  <select class="option" id="pageSize">
								  	<option value="6" selected="selected">6</option>
								  	<option value="10">10</option>
								  	<option value="15">15</option>
								  	<option value="20">20</option>
								  </select>
								</div>
								
								<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addactivecodelist">添加</button>
								<button type="button" id="delbook_btn" class="btn btn-danger">删除</button>

							</div>
							<!--
							<form class="navbar-form navbar-right" role="search" action="javascript:;">
							    <div class="form-group">
							        <input type="text" class="form-control" placeholder="用户搜索">
							    </div>
							    <button type="submit" class="btn btn-default">搜索</button>
							</form>
							 -->
							<div class="panel-body">
								<table class="table table-condensed table-hover">
									<thead>
										<tr>
											<th>
												<button type="button" id="allorone_check" class="btn btn-success btn-xs">全选</button>
												<button type="button" id="invert_check" class="btn btn-info btn-xs">反选</button>
											</th>
											<th>序号</th>
											<th>激活码</th>
											<th>激活时长</th>
											<th>状态</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody id="activecodelist">
										
									</tbody>
								</table>
								<!--
								<p>
									<a class="btn btn-primary" href="<%=basePath%>admin/page/lookthrough.jsp" role="button">查看更多&raquo;</a>
								</p>
								  -->
							</div>
						</div>
						<nav>
						  <ul class="pagination" id="pagination">
						    <!-- 
						    <li id="page_previous"><a href="#">&laquo;</a></li>
						    <li><a href="#">1</a></li>
						    <li><a href="#">2</a></li>
						    <li><a href="#">3</a></li>
						    <li><a href="#">4</a></li>
						    <li><a href="#">5</a></li>
						    <li id="page_next"><a href="#">&raquo;</a></li>
						     -->
						  </ul>
</nav>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="<%=basePath %>admin/publicity-1.0.0/jquery-1.7.2.js"></script>
	<script src="<%=basePath %>admin/js/bootstrap.min.js"></script>
	<script src="<%=basePath %>admin/js/ViewCommand.js"></script>
	<script src="<%=basePath %>admin/js/activelist.js"></script>
</body>
</html>