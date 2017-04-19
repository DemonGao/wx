<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'test.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <button class="weui_btn weui_btn_primary" href="javascript:" id="pushbookbtn">推送到Kindle邮箱</button>
  <script src="<%=basePath%>book/static/JqueryWeUI/lib/jquery-2.1.4.js"></script>
  <script>
  var sign=0;
	//$("#container").delegate("#pushbookbtn","click",function(event){
	$("#pushbookbtn").unbind('click').bind('click',function(){
		console.log("1");
	//$("#pushbookbtn").one("click",function(){
		//var count=0;
	//var pushbookbtn = document.getElementById("pushbookbtn");
	//pushbookbtn.addEventListener("touchstart", function(event){
	//$("#pushbookbtn").touchstart(function(){
		//event.preventDefault();
		timer(60);
		if(sign==0){
			sign=1;
			$.ajax({
				type : "get",
				url : "/wx/sendEmailServlet",
				dataType : 'json',
				async : true, //异步 默认异步
				data : {
					openid : "o6yKmw8QEd6vVrud2ZpBBMLG8z3Y",
					bookurl: "c:/kindlebook/upload/widget/201610/盗墓笔记_272.txt",
					bookname:"盗墓笔记",
					bookid:"25",
					bookdownnum:"1",
					type : "pushbook"
				},
				success : function(data) {
					if (data.result) {
						console.log("成功");
					}else{
						console.log("失败");
					}
				}
				
			});
		}else{
			return;
		}
	});
	//防止多次发送
	function timer(time) {
		var btn = $("#pushbookbtn");
		$("#pushbookbtn").attr("disabled", true); //按钮禁止点击
		btn.css({"background-color":"#ccc","color":"#000"});
		btn.html(time <= 0 ? "推送到Kindle邮箱" : ("" + (time) + "秒后可再次推送"));
		var hander = setInterval(function() {
			if (time <= 0) {
				clearInterval(hander); //清除倒计时
				btn.html("再推送一次");
				btn.css({"background-color":"#04be02","color":"#fff"});
				$("#pushbookbtn").attr("disabled", false);
				return false;
			} else {
				btn.html("" + (time--) + "秒后可再次推送");
			}
		}, 1000);
	}
  </script>
  </body>
</html>
