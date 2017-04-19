$(function(){
	FastClick.attach(document.body);
});

$('#container').on('click','#activebtn',function(){
	if($("#activecode").val()==""){
		$.toast("激活码不能为空", "cancel");
		return ;
	}
	$.ajax({
		type:"GET",
		url:"/wx/addEmailServlet",
		dataType:'json',
		data:{
			openid:$('#openid').val(),
			activecode:$("#activecode").val(),
			type:"useractive"
		},
		success:function(data){
			if(data.result){
				$.toast("激活成功！");
//				window.href.location='../index.jsp';
			}else{
				$.toast(data.msg, "cancel");
			}
		}
		
	});
});

///*最后一页操作提示*/
//$(document).on("click", "#activebtn", function() {
//	$.toast("操作成功", function() {
//		console.log('close');
//	});
//}).on("click", "#show-toast-cancel", function() {
//	$.toast("取消操作", "cancel", function(toast) {
//		console.log(toast);
//	});
//}).on("click", "#show-toast-forbidden", function() {
//	$.toast("禁止操作", "forbidden");
//}).on("click", "#show-toast-text", function() {
//	$.toast("纯文本", "text");
//}).on("click", "#show-loading", function() {
//	$.showLoading();
//
//	setTimeout(function() {
//		$.hideLoading();
//	}, 3000)
//});