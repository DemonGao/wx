<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="ThemeBucket">
  <link rel="shortcut icon" href="#" type="image/png">

  <title>404 Page</title>

  <link href="<%=basePath %>admin/static/css/style.css" rel="stylesheet">
  <link href="<%=basePath %>admin/static/css/style-responsive.css" rel="stylesheet">

  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
</head>
<%
	//Back To Home  返回地址
	String backurl=session.getAttribute("backurl").toString();
%>
<body class="error-page">

<section>
    <div class="container ">

        <section class="error-wrapper text-center">
            <h1><img alt="" src="<%=basePath %>admin/static/images/404-error.png"></h1>
            <h2>page not found</h2>
            <h3>We Couldn’t Find This Page</h3>
            <a class="back-btn" href="<%=backurl %>"> Back To Home</a>
        </section>

    </div>
</section>

<!-- Placed js at the end of the document so the pages load faster -->
<script src="<%=basePath %>admin/static/js/jquery-1.10.2.min.js"></script>
<script src="<%=basePath %>admin/static/js/jquery-migrate-1.2.1.min.js"></script>
<script src="<%=basePath %>admin/static/js/bootstrap.min.js"></script>
<script src="<%=basePath %>admin/static/js/modernizr.min.js"></script>


<!--common scripts for all pages-->
<!--<script src="<%=basePath %>admin/static/js/scripts.js"></script>-->

</body>
</html>

