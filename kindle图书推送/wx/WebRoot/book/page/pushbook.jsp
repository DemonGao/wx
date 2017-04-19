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
                <input class="weui_input" id="book_name" type="text"  readonly="readonly"/>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd"><label class="weui_label">格式</label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <input class="weui_input" id="book_urltype" type="text"  readonly="readonly"/>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd"><label class="weui_label">大小</label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <input class="weui_input" id="book_size" type="text"  readonly="readonly"/>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd"><label class="weui_label">下载量</label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <input class="weui_input"  type="text" id="book_downnum"   readonly="readonly"/>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd"><label class="weui_label">推送邮箱</label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <input class="weui_input" type="text"  id="email"  readonly="readonly"/>
            </div>
        </div>
    </div>
    <input type="hidden"  id="book_url"  />
    <input type="hidden" id="book_id" />
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
	<script src="<%=basePath%>book/static/JqueryWeUI/js/jquery-weui.js"></script>
	
	<script>
	$('#book_id').val(<%=request.getParameter("book_id")%>);
	var sendemail = false;
	var sendemailmsg = "";
	var sendemailmsgtitle="";
	$(function () {
		FastClick.attach(document.body);
		$.ajax({
			type : "GET",
			url : "/wx/getEmailServlet",
			dataType : 'json',
			data : {
				openid : sessionStorage.getItem("openid"),
				bookid : $('#book_id').val()
			},
			success : function(data) {
				if(data.getbook){
					$("#book_name").val(data.book.book_name);
					$("#book_size").val(data.book.book_size);
					$("#book_urltype").val(data.book.book_url.substring(data.book.book_url.lastIndexOf('.')+1));
					$("#book_url").val(data.book.book_url);
					$("#book_downnum").val(data.book.book_downnum);	
				}else{
					alert("获取书籍信息失败,请及时联系管理员!");
				}
				if(data.bindemail){
					$("#email").val(data.email);
				}else{
					$.confirm("您还没有绑定邮箱,是否跳转到邮箱绑定界面?", "邮箱未绑定", function() {
				          //$.toast("文件已经删除!");
						window.location.href="/wx/book/page/kindleBind.jsp?openid="+sessionStorage.getItem("openid");
				    }, function() {
				          //取消操作
				    });
					return ;
				}
				
				if(data.sendemail){
					sendemail=true;
				}else{
					sendemailmsg = data.sendemailmsg;
					sendemailmsgtitle = data.sendemailmsgtitle;
					$.confirm(sendemailmsg+",是否跳转到用户激活界面?", sendemailmsgtitle, function() {
				          //$.toast("文件已经删除!");
						window.location.href="/wx/book/page/useractive.jsp?openid="+sessionStorage.getItem("openid");
				    }, function() {
				          //取消操作
				    });
				}
				
			}
		});
	});
	//$("#container").delegate("#pushbookbtn","click",function(event){
	//$("#pushbookbtn").unbind('click').bind('click',function(){
	//$("#pushbookbtn").one("click",function(){
		//var count=0;
	//var pushbookbtn = document.getElementById("pushbookbtn");
	//pushbookbtn.addEventListener("touchstart", function(event){
	$("#container").delegate("#pushbookbtn","click",function(event){
		//event.preventDefault();
		if($("#email").val()==""){
			$.toast("你还没有绑定邮箱", "cancel", function(toast) {
				//console.log(toast);
			});
			return ;
		}
		if(!sendemail){
			$.toast("你还没有激活", "cancel", function(toast) {
				//console.log(toast);
			});
			return ;
		}
		timer(60);
		$.showLoading("正在推送中...");
			$.ajax({
				type : "get",
				url : "/wx/sendEmailServlet",
				timeout:60000,
				dataType : 'json',
				async : true, //异步 默认异步
				data : {
					openid : sessionStorage.getItem("openid"),
					bookurl: $("#book_url").val(),
					bookname:$("#book_name").val(),
					bookid: $("#book_id").val(),
					bookdownnum:$("#book_downnum").val(),
					type : "pushbook"
				},
				success : function(data) {
					$.hideLoading();
					if (data.result) {
						$.toast("推送成功", function() {
							$("#book_downnum").val(parseInt($("#book_downnum").val())+1);
							//console.log('close');
						});
					}else{
						$.toast(data.msg, "cancel", function(toast) {
							//console.log(toast);
						});
					}
				},
				complete : function(XMLHttpRequest,textStatus){
					$.hideLoading();
					$.toast("推送成功", function() {
						$("#book_downnum").val(parseInt($("#book_downnum").val())+1);
						//console.log('close');
					});	
				}
			});
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
