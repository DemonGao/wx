var pageNum=0; //全部分类的分页标志
var temp = new Vue({
	el:"#tableVue",
	data: {
		list:[],
		data:{},
		pageNum:0,
		pageNums:1,
		pageSize:1,
		serchText:'',
		baseUrl:'/DTech'
	},
	mounted:function(){
		this._Ajax();
		
	},
	methods:{
		imgPath:function(path){
			return '/wxkf/'+path;
		},
		_Ajax:function(){
			var self =this;
			_Ajax("/wxkf/adminapi/Company_querys", {
				pageNum:self.pageNum,
				type:"no_all",
				pageSize:self.pageSize
			}, function(data){
				self.list=data.list;
				self.pageNum=data.pageNum;
				self.pageNums=data.pageNums;
				self.pageSize=data.pageSize;
			})
		},
		SerchDate:function(){
			temp.pageNum=0;
			_Ajax("/wxkf/adminapi/Company_querys", {
				type : "all_name",
				signarg : this.serchText,
				pageNum:temp.pageNum
			}, function(data){
				temp.list=data.list;
				temp.pageNum=data.pageNum;
				temp.pageNums=data.pageNums;
				temp.pageSize=data.pageSize;
			});
		},
		//下一页
		page_next:function(){
			if(temp.pageNum>=temp.pageNums-1){
				return ;
			}
			temp.pageNum++
			temp._Ajax();
		},
		//上一页
		page_pre:function(){
			if(temp.pageNum<1){
				return ;
			}
			temp.pageNum--
			temp._Ajax();
		},
		//直接选页
		page_index:function(index){
			temp.pageNum=index;
			temp._Ajax();
		},
		//修改按钮操作
		update:function(e){
			var tr = [];
			var id = [];
			$(".tbodylist input[type=checkbox]:checkbox").each(function () {
				if($(this).is(':checked')){
					tr.push($(this).parent().parent());
					id.push($(this).val());
				}
			});
			if(tr.length!=0&&tr!=null){
				if(tr.length>1){
					alert("请选择一条数据!");
					return ;
				}
				console.log(id[0]);
				$("#updateModal").modal("show");
				_Ajax("/wxkf/adminapi/Company_querys",{
					type : "id",
					'companyInfo.openid' : ''+id[0]+'',
					pageNum : 0
				},function(data){
					temp.data=data.list[0];
				});
			}else{
				alert("你还没选择要修改的数据!");
			}
		},
		checkInfo:function(id){
			var self = this;
			_Ajax("/wxkf/adminapi/Company_checkInfo",{
				'companyInfo.openid' : id,
			},function(data){
				self._Ajax();
				
			});
			$("#updateModal").modal("hide");
		},
		//双击选中
		trdbclick:function(e){
			if(e!=undefined){
				var tr = e.currentTarget;
				if(tr.getElementsByTagName("input")[0].checked){
					tr.getElementsByTagName("input")[0].checked=false;
				}else{
					tr.getElementsByTagName("input")[0].checked=true;
				}
			}
		}
	}
});

function _Ajax(url,data,_call){
	GscUtil.ajax(url, "POST", data, "json", 
	function(data) {
		console.log(data);
		if(data.result){
			if ( typeof _call == "function") {
				_call(data);
			}
		}else{
			console.log("亲,已经没有您要的数据了");
		}
	});
}
function _QueryAjax(type,signarg,pageNum,_call){
	GscUtil.ajax("/DTech/api/News_querys", "POST", {
		pageNum : pageNum,
		type : type,
		signarg : signarg
	}, "json", function(data) {
		if(data.result){
			if ( typeof _call == "function") {
				_call(data);
			}
		}
	});
}
function _DelAjax(type,id,_call){
	GscUtil.ajax("/DTech/api/News_del", "POST", {
		ids : signarg
	}, "json", function(data) {
		if(data.result){
			if ( typeof _call == "function") {
				_call(data);
			}
		}
	});
}