$(function() {
	var currentPage=1;
	var serch_currentPage=1;
	var isserch=false;
	$('#container').on('focus', '#search_input', function() {
		var $weuiSearchBar = $('#search_bar');
		$weuiSearchBar.addClass('weui_search_focusing');
	}).on('blur', '#search_input', function() {
		var $weuiSearchBar = $('#search_bar');
		$weuiSearchBar.removeClass('weui_search_focusing');
		if ($(this).val()) {
			$('#search_text').hide();
		} else {
			$('#search_text').show();
		}
	}).on('input', '#search_input', function() {
		var $searchShow = $("#search_show");
		if ($(this).val()) {
			ajaxBook({serchTag:'name',book_name:$(this).val(),currentPage:1},'search_show','search_show');
			$searchShow.show();
		} else {
			$searchShow.hide().html('');
		}
	}).on('touchend', '#search_cancel', function() {
//		取消 事件绑定
		$("#search_show").hide().html('');
		$('#search_input').val('');
	}).on('touchend', '#search_clear', function() {
//		搜索栏× 按钮事件绑定
		$("#search_show").hide();
		$("#search_show").hide().html('');
		$('#search_input').val('');
	}).on('touchend','#lookmore',function(){
		if(isserch){
			serch_currentPage++;
			ajaxBook({serchTag:'name',book_name:$("#search_input").val(),currentPage:serch_currentPage},'booklist','booklist');
			return ;
		}
		currentPage++;
		ajaxBook({serchTag:'time',currentPage:currentPage},'booklist','booklist');
	}).on('click','#closeconfirm',function(){
		$("#moreconfirm").remove();
	}).on('search',"#search_input",function(){
		//点击键盘搜索时
		$('#booklist').html("");
		ajaxBook({serchTag:'name',book_name:$("#search_input").val(),currentPage:serch_currentPage},'booklist','booklist');
		$("#search_show").hide();
		$("#search_show").hide().html('');
		isserch=true;
	});
	
  // .container 设置了 overflow 属性, 导致 Android 手机下输入框获取焦点时, 输入法挡住输入框的 bug
  // 相关 issue: https://github.com/weui/weui/issues/15
  // 解决方法:
  // 0. .container 去掉 overflow 属性, 但此 demo 下会引发别的问题
  // 1. 参考 http://stackoverflow.com/questions/23757345/android-does-not-correctly-scroll-on-input-focus-if-not-body-element
  //    Android 手机下, input 或 textarea 元素聚焦时, 主动滚一把
  if (/Android/gi.test(navigator.userAgent)) {
      window.addEventListener('resize', function () {
          if (document.activeElement.tagName == 'INPUT' || document.activeElement.tagName == 'TEXTAREA') {
              window.setTimeout(function () {
                  document.activeElement.scrollIntoViewIfNeeded();
              }, 0);
          }
      })
  }
  ajaxBook({serchTag:'time',currentPage:currentPage},'booklist','booklist');
});
/**
 * 对ajax封装一下
 * @param 参数一	data{}	
 * @param 参数二	容器id		
 * @param 参数三	模板名称
 * @param 参数四	识别是否是实时搜索的ajax		
 */
function ajaxBook(){
	var data=arguments[0];
	var container=arguments[1];
	var tmp=arguments[2];
	
	$.ajax({
		type:"get",
		url:"/wx/getBookServlet",
		dataType:'json',
		data:data,
		success:function(data){
			console.log(data);
			if(data.result){
				ViewCommand({
					command: 'display',
					param:[container,data.books,tmp]
				})
			}
			if(!data.result&&tmp=="search_show"){
				$("#search_show").hide().html('');
			}
			if(!data.result&&tmp=="booklist"){
//				alert("没有更多数据了！");			
				$("#container").append(
					'<div class="weui_dialog_confirm" id="moreconfirm">'+
						'<div class="weui_mask"></div>'+
						'<div class="weui_dialog">'+
							'<div class="weui_dialog_hd"><strong class="weui_dialog_title">提示</strong></div>'+
							'<div class="weui_dialog_bd">亲~，已经没有内容可以加载了</div>'+
							'<div class="weui_dialog_ft">'+
								'<a href="#" class="weui_btn_dialog primary" id="closeconfirm">确定</a>'+
							'</div>'+
						'</div>'+
					'</div>'
				);
			}
		}
	});
}


