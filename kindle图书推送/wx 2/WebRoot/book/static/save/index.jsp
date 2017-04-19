<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>

<head>
<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta charset="utf-8" />
<title>Kindle书城</title>

<link rel="stylesheet" href="<%=basePath%>book/static/bootstrap-3.3.0-dist/css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath%>book/static/css/common_style.css" />

</head>
<body>
	<div class="jumbotron">
  <h1>Hello, world!</h1>
  <p>...</p>
  <p><a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a></p>
</div>
	<div class=".container-fluid" id="container">
		<div class="row">
  <div class="col-lg-6">
    <div class="input-group">
      <div class="input-group-btn">
        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">Action <span class="caret"></span></button>
        <ul class="dropdown-menu" role="menu">
          <li><a href="#">Action</a></li>
          <li><a href="#">Another action</a></li>
          <li><a href="#">Something else here</a></li>
          <li class="divider"></li>
          <li><a href="#">Separated link</a></li>
        </ul>
      </div><!-- /btn-group -->
      <input type="text" class="form-control">
    </div><!-- /input-group -->
  </div><!-- /.col-lg-6 -->
  <div class="col-lg-6">
    <div class="input-group">
      <input type="text" class="form-control">
      <div class="input-group-btn">
        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">Action <span class="caret"></span></button>
        <ul class="dropdown-menu dropdown-menu-right" role="menu">
          <li><a href="#">Action</a></li>
          <li><a href="#">Another action</a></li>
          <li><a href="#">Something else here</a></li>
          <li class="divider"></li>
          <li><a href="#">Separated link</a></li>
        </ul>
      </div><!-- /btn-group -->
    </div><!-- /input-group -->
  </div><!-- /.col-lg-6 -->
</div><!-- /.row -->
	</div>

	<script type="text/javascript" src="<%=basePath%>book/static/js/jquery.js"></script>
	<script type="text/javascript" src="<%=basePath%>book/static/bootstrap-3.3.0-dist/js/bootstrap.min.js"></script>



	<!--
	<script type="text/javascript"
		src="<%=basePath%>book/static/js/jquery.nicescroll.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>book/static/js/zepto.min.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>book/static/js/router.min.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>book/static/js/example.js"></script>
	<script>
			
			$("html").niceScroll({styler:"fb",cursorcolor:"#65cea7", cursorwidth: '6', cursorborderradius: '0px', background: '#424f63', spacebarenabled:false, cursorborder: '0',  zindex: '99999'});
		</script>
	-->
</body>

</html>
