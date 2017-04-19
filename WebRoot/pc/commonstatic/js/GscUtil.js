/**
 * 
 */
window.serverUrl="http://maquanjun.tunnel.2bdata.com/";
	// table
	// 全选和全不选
	function _selectall(dom){
		if (!$(dom).hasClass("selectall")) {
			$(".tbodylist input:checkbox").prop("checked", true);
			$(dom).addClass("selectall");
		} else {
			$(".tbodylist input:checkbox").prop("checked", false);
			$(dom).removeClass("selectall");
		}

	}
	// 反选
	function _selectnoall(){
		$(".tbodylist input[type=checkbox]:checkbox").each(function() {
			// $(this).attr("checked", !$(this).prop("checked"));
			if ($("#allorone_check").hasClass("selectall")) {
				$("#allorone_check").removeClass("selectall");
			}
			$(this).prop("checked", function(index, attr) {
				// console.log(index +":"+ attr);
				return !attr;
			});
		});
	}
	//点击删除时获取选中的书序号(book_id)
	var del_arr = [];
	var del_ids = [];
	$("#delbook_btn").click(function(){
		del_arr = [];
		del_ids = [];
		var html = "<h4 style='margin-top:0'>您确定删除以下书籍:</h4>";
		$(".tbodylist input[type=checkbox]:checkbox").each(function () {
			if($(this).is(':checked')){
				html+= "书序号:<span style='color:green'>"+$(this).val()+"</span> <span style='margin-right:.4em'></span>";
				del_arr.push($(this).parent().parent());
				del_ids.push($(this).val());
			}
		});
		if(del_arr.length!=0){
			$('#delbooklist').modal('show');
			$("#modalp_delbooklist").html(html);
		}else{
			alert("您还没有选择需要删除的书籍!");
		}
	});
var GscUtil = {
	ajax : function(url,type,data, dataType, _call) {
		var _type = (typeof arguments[1] == "undefined" || arguments[1] == null) ? "POST" : arguments[1];
		var _data = (typeof arguments[2] == "undefined" || arguments[2] == null) ? {} : arguments[2];
		var _dataType = (typeof arguments[3] == "undefined" || arguments[3] == null) ? "json" : arguments[3];
		$.ajax({
			type : _type,
			url : url,
			dataType : _dataType,
			data : _data,
			success : function(data) {
				if ( typeof _call == "function") {
					_call(data);
				}
			}
		})
	}
}