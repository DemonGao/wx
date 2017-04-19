var pageNum=0; //全部分类的分页标志
var temp = new Vue({
	el:"#tableVue",
	data: {
		list:[],
		pageNum:0,
		pageNums:1,
		pageSize:8,
		checkeds:[],
		serchText:'',
		baseUrl:'/DTech'
	},
	methods:{
		SerchDate:function(){
			pageNum=0;
			_Ajax("/DTech/api/News_querys", {
				type : "title",
				signarg : this.serchText,
				pageNum:pageNum
			}, function(data){
				temp.list=data.list;
				temp.pageNum=data.pageNum;
				temp.pageNums=data.pageNums;
				temp.pageSize=data.pageSize;
			});
		},
		//下一页
		page_next:function(){
			if(pageNum>=temp.pageNums-1){
				return ;
			}
			pageNum++
			_Ajax("/DTech/api/News_querys", {
				pageNum:pageNum
			}, function(data){
				temp.list=data.list;
				temp.pageNum=data.pageNum;
				temp.pageNums=data.pageNums;
				temp.pageSize=data.pageSize;
			});
		},
		//上一页
		page_pre:function(){
			if(pageNum<1){
				return ;
			}
			pageNum--
			_Ajax("/DTech/api/News_querys", {
				pageNum:pageNum
			}, function(data){
				temp.list=data.list;
				temp.pageNum=data.pageNum;
				temp.pageNums=data.pageNums;
				temp.pageSize=data.pageSize;
			});
		},
		//直接选页
		page_index:function(index){
			pageNum=index;
			_Ajax("/DTech/api/News_querys", {
				pageNum:pageNum
			}, function(data){
				temp.list=data.list;
				temp.pageNum=data.pageNum;
				temp.pageNums=data.pageNums;
				temp.pageSize=data.pageSize;
			});
		},
		//添加按钮操作
		add:function(){
			$("#addModel").modal("show");
			$("#add_btn").on("click",function(){
				$("#addModelForm").submit();
			})
		},
		//删除按钮操作
		del:function(){
			var html = "";
			temp.checkeds=[];
			$(".tbodylist input[type=checkbox]:checkbox").each(function () {
				if($(this).is(':checked')){
					console.log($(this).val());
					html+= "文章序号:<span style='color:green'>"+$(this).val()+"</span> <span style='margin-right:.4em'></span>";
					temp.checkeds.push($(this).val());
				}
			});
			if(html!=""){
				$("#delModel").modal("show");
				$("#delModel_content").html(html);
				$("#delmodal_btn").click(function(){
					console.log(temp.checkeds.toString());
					_Ajax("/DTech/api/News_del", {
						ids:temp.checkeds.toString()
					}, function(){
						_Ajax("/DTech/api/News_querys", {
							pageNum:pageNum
						}, function(data){
							console.log(temp);
							temp.list=data.list;
							temp.pageNum=data.pageNum;
							temp.pageNums=data.pageNums;
							temp.pageSize=data.pageSize;
						});
						$("#delModel").modal("hide");
					})
				})
			}else{
				alert("您还没有选择需要删除的文章!");
			}
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
				$("#updateModal").modal("show");
				_Ajax("/DTech/api/News_querys",{
					type : "id",
					signarg : id[0],
					pageNum : 0
				},function(data){
					console.log(data);
					var item = data.list[0];
					$("#up_news_title").val(item.news_title);
					if(item.news_img!=null&&item.news_img!=""){
						$("#up_news_img").attr("src","/DTech"+item.news_img.slice(1,-1).split(',')[0]);
					}
					$("#up_news_date").val(item.news_date);//设置 news_date
					$("#up_news_id").val(id[0]);//设置 news_id
					$("#up_news_views").val(item.news_views);//设置 news_date
					$("#update_news_info").val(item.news_info);
					$("#up_news_img").val(item.news_img);
					//$("#article_text").val(article.article_text);
					CKEDITOR.instances.applicationform.setData(item.news_text);
					//获取内容
					//CKEDITOR.instances.applicationform.getData();
				});
				$("#update_btn").on("click",function(){
					$("#upModelForm").submit();
				});
			}else{
				alert("你还没选择要修改的数据!");
			}
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
_Ajax("/DTech/api/News_querys", {
	pageNum:pageNum
}, function(data){
//_QueryAjax("type","学习心得",pageNum,function(data){
	temp.list=data.list;
	temp.pageNum=data.pageNum;
	temp.pageNums=data.pageNums;
	temp.pageSize=data.pageSize;
})
function _Ajax(url,data,_call){
	GscUtil.ajax(url, "POST", data, "json", 
	function(data) {
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