<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Kindle书城-微信推送</title>
    
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
		<meta charset="utf-8" />
		<title>Kindle书城-书库</title>
		<link rel="stylesheet" type="text/css"
	href="<%=basePath%>book/static/JqueryWeUI/lib/weui.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>book/static/JqueryWeUI/css/jquery-weui.css" />
  </head>
  
  <body>
    <div class="container" id="container">
     <div class="hd">
</div>
<div class="bd">
    <div class="weui_cells_title">图书推送</div>
    <div class="weui_cells weui_cells_form">
        <div class="weui_cell">
            <div class="weui_cell_hd"><label class="weui_label">书名</label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <input class="weui_input" type="text" value="<%=request.getParameter("book_name")%>" readonly="readonly"/>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd"><label class="weui_label">格式</label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <input class="weui_input" type="text" value="<%=request.getParameter("book_url").substring(request.getParameter("book_url").lastIndexOf('.')+1) %>" readonly="readonly"/>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd"><label class="weui_label">下载量</label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <input class="weui_input" type="text" value="<%=request.getParameter("book_downnum")%>"  readonly="readonly"/>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd"><label class="weui_label">推送邮箱</label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <input class="weui_input" type="text" value="" id="email"  readonly="readonly"/>
            </div>
        </div>
    </div>
    <div class="weui_cells_tips">
        <div style="text-indent:1em">
        正常推送时间在2-20分钟不等，视文件的大小和格式而定。 非mobi格式文件会进行格式转换，存在一定的转换失败率，大于25M的文件耗时较长，请耐心等待。 如有未送达情况请检查信任列表，或者联系kefu@kindle4me.cn。
        </div>
    </div>
    <div class="weui_btn_area">
        <button class="weui_btn weui_btn_primary" href="javascript:" id="pushbookbtn">推送到Kindle邮箱</button>
    </div>
</div>
    </div>
	<script src="<%=basePath%>book/static/JqueryWeUI/lib/jquery-2.1.4.js"></script>
	<script src="<%=basePath%>book/static/JqueryWeUI/lib/fastclick.js"></script>
	
	<script>
	$(function () {
		FastClick.attach(document.body);
	});
	</script>
	<script src="<%=basePath%>book/static/JqueryWeUI/js/jquery-weui.js"></script>
	
	<script>
	$(function () {
		$.ajax({
			type : "GET",
			url : "/wx/getEmailServlet",
			dataType : 'json',
			data : {
				openid : sessionStorage.getItem("openid")
			},
			success : function(data) {
				
				if (data.result) {
					if (data.email != "") {
						$('#email').val(data.email);
					}
				}else{
					$.confirm("您还没有绑定邮箱,是否跳转到邮箱绑定界面?", "邮箱未绑定?", function() {
				          //$.toast("文件已经删除!");
						window.location.href="/wx/book/page/kindleBind.jsp?openid="+sessionStorage.getItem("openid");
				    }, function() {
				          //取消操作
				    });
					
				}
			}

		});
		
	});
	
	$("#container").on("click","#pushbookbtn",function(){
		alert("正在推送!");
		timer(60);
		$.showLoading("正在推送中...");
		$.ajax({
			type : "GET",
			url : "/wx/sendEmailServlet",
			dataType : 'json',
			data : {
				openid : sessionStorage.getItem("openid"),
				bookurl: "<%=request.getParameter("book_url") %>",
				bookname:"<%=request.getParameter("book_name")%>",
				bookid:"<%=request.getParameter("book_id")%>",
				bookdownnum:"<%=request.getParameter("book_downnum")%>",
				type : "pushbook"
			},
			success : function(data) {
				$.hideLoading();
				if (data.result) {
					$.toast("推送成功", function() {
						console.log('close');
					});
				}else{
					$.toast(data.msg, "cancel", function(toast) {
						console.log(toast);
					});
				}
			}

		});
	});
	
	//防止多次发送
	function timer(time) {
		var btn = $("#pushbookbtn");
		btn.attr("disabled", true); //按钮禁止点击
		btn.css({"background-color":"#ccc","color":"#000"});
		btn.html(time <= 0 ? "推送到Kindle邮箱" : ("" + (time) + "秒后可再次推送"));
		var hander = setInterval(function() {
			if (time <= 0) {
				clearInterval(hander); //清除倒计时
				btn.html("再推送一次");
				btn.css({"background-color":"#04be02","color":"#fff"});
				btn.attr("disabled", false);
				return false;
			} else {
				btn.html("" + (time--) + "秒后可再次推送");
			}
		}, 1000);
	}
	</script>
  </body>
</html>
