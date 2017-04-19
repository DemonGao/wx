/**
 * Auto:DemonGao
 * Time:2016-11-28
 */
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

Date.prototype.Format = function (fmt) { //author: meizz 
    var o = {
        "M+": this.getMonth() + 1, //月份 
        "d+": this.getDate(), //日 
        "h+": this.getHours(), //小时 
        "m+": this.getMinutes(), //分 
        "s+": this.getSeconds(), //秒 
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
        "S": this.getMilliseconds() //毫秒 
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}