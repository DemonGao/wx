$(function(){
//	getAjax({openid:'o6yKmw8QEd6vVrud2ZpBBMLG8z3Y'},'userinfo','userinfo');
	getAjax({openid:sessionStorage.getItem("openid")},'userinfo','userinfo');
	$("#kindlebind").attr("href",$("#kindlebind").attr("href")+sessionStorage.getItem("openid"));
	$("#useractive").attr("href",$("#useractive").attr("href")+sessionStorage.getItem("openid"));
})

function getAjax(data,container,tmp){
	$.ajax({
		type:"get",
		url:"/wx/getUserInfo",
		dataType:'json',
		data:data,
		success:function(data){
			console.log(data);
			if(data.result){
				ViewCommand({
					command: 'display',
					param:[container,data,tmp]
				})
			}
		}
	});
}
