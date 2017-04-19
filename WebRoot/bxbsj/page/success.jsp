<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'success.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="../static/JqueryWeUI/lib/weui.min.css">
	<link rel="stylesheet" href="../static/JqueryWeUI/css/jquery-weui.css">
  </head>
  
  <body>
    <div class="weui_msg">
      <div class="weui_icon_area"><i class="weui_icon_success weui_icon_msg"></i></div>
      <div class="weui_text_area">
        <h2 class="weui_msg_title">操作成功</h2>
        <p class="weui_msg_desc">内容详情，可根据实际需要安排</p>
      </div>
      <div class="weui_opr_area">
        <p class="weui_btn_area">
          <a href="javascript:;" class="weui_btn weui_btn_primary">确定</a>
          <a href="javascript:;" class="weui_btn weui_btn_default">取消</a>
        </p>
      </div>
      <div class="weui_extra_area">
        <a href="">查看详情</a>
      </div>
    </div>
  </body>
</html>
