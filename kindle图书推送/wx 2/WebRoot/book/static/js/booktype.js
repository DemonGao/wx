$(function() {
	$("#lookmore").hide();
	var currentPage=1;
	var book_type="";
	ajaxBookType({},'booktype','booktype');
	
	$("#booktype").on("click","#booktype_a",function(){
		currentPage=1;
		book_type = $(this).find("p").html();
		ajaxBook({serchTag:'type',book_type:book_type,currentPage:currentPage},'booklist','booklist',function(){
			$("#lookmore").show();
			$("#booktype").hide();
			$("#book_type_name").append(" - "+book_type);
		});
	})
	
	
	$("#container").on('click','#closeconfirm',function(){
		$("#moreconfirm").remove();
	}).on('click','#lookmore',function(){
		currentPage++;
		ajaxBook({serchTag:'type',book_type:book_type,currentPage:currentPage},'booklist','booklist',function(){});
	})
});
/**
 * 对ajax封装一下
 * @param 参数一	data{}	
 * @param 参数二	容器id		
 * @param 参数三	模板名称
 * @param 参数四	识别是否是实时搜索的ajax		
 */
function ajaxBookType(){
	var data=arguments[0];
	var container=arguments[1];
	var tmp=arguments[2];
	
	$.ajax({
		type:"get",
		url:"/wx/getBookTypeServlet",
		dataType:'json',
		data:data,
		success:function(data){
			console.log(data);
			if(data.result){
				ViewCommand({
					command: 'display',
					param:[container,data.booktypes,tmp]
				})
			}
		}
	});
}
/*回到书籍分类*/
function booktype_back(){
	$("#booklist").html('');
	$("#booktype").show();
	$("#book_type_name").html('<a href="javascript:;" onclick="booktype_back()">书库分类</a>');
}
