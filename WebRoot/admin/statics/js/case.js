//模块实现模块
var ViewCommand = (function(){
	var templet={
		//博文
		caseTable:[
			'<tr class="">',
				'<td>{#case_id#}</td>',
				'<td>{#case_name#}</td>',
				'<td>{#case_type#}</td>',
				'<td>{#case_img#}</td>',
				'<td style="text-align:center"><a class="edit" href="javascript:;" data-toggle="modal" data-target="#caseModal">修改</a></td>',
				'<td style="text-align:center"><a class="delete" href="javascript:;" data-toggle="modal" data-target="#caseModal_d">删除</a></td>',
			'</tr>'		
		].join('')
	},
		html='';
	function formateString(str,obj){
		//替换'{#'与'#}'之间的字符串
//		return str.replace(/\{#(\w+)#\}/g,function(match,key){
//			return obj[key];
//		})
		return str.replace(/\{#(\w+)#\}/g,function(match,key){
			//创建一个变量,赋值为obj
			var newobj=obj;
			while(key.indexOf("__")>0){
				var index=key.indexOf("__");
				newobj=newobj[key.slice(0,index)];
				key=key.slice(index+2);
			}
			return newobj[key];
		})
	}
	//方法集合
	var Action = {
		//创建方法
		create: function(data,view){
			//解析数据 如果数据是一个数组
			if(data.length){
				//遍历数组
				for(var i=0,len=data.length;i<len;i++){
					html+=formateString(templet[view],data[i]);
				}
			}else{
				//直接格式化字符串缓存到html中
				html+=formateString(templet[view],data);
			}
		},
		//展示方法
		display: function(container,data,view){
			//如果传入数组
			if(data){
				//根据给定的数据创建视图
				this.create(data,view);
			}
			//展示模块 若container中含有内容,***
			document.getElementById(container).innerHTML=html;
			//展示后清空缓存字符串
			html='';
		},
		//获取案例的数据
		getCaseData:function(){
			$.ajax({
				type:"get",
				url:"/DTech/json/QueryCase_QueryCase",
				dataType:'json',
				success:function(data){
//					if(data.success){
						ViewCommand({
							command: 'display',
							param:['casetbody',data.data,'caseTable']
						});
//					}
				}
			});
		}
	};
	
	//命令接口
	return function excute(msg){
		//解析命令  如果msg.param不是数组,则将其转换为数组 apply方法要求第二个参数必须为数组
		msg.param=Object.prototype.toString.call(msg.param)==="[object Array]"?msg.param:[msg.param];
		Action[msg.command].apply(Action,msg.param);
	};
})();

ViewCommand({
	command: 'getCaseData',
	param:[]
});

var tds=null;
/*点击修改时,获取当前行的信息,并绘制到模态框中*/
$("#casetbody").delegate('.edit','click',function(){
	var tr=$(this).parent().parent()[0];
	tds=$(tr).find("td");
	$("#caseModalLabel").html(tds.eq(1).html());
	$("#case_id").val(tds.eq(0).html());
	$("#case_name").val(tds.eq(1).html());
	$("#case_type").val(tds.eq(2).html());
	$("#case_img").val(tds.eq(3).html());
//	console.log(tds);
})

$("#casetbody").delegate('.delete','click',function(){
	var tr=$(this).parent().parent()[0];
	tds=$(tr).find("td");
	$("#caseModalLabel_d").html(tds.eq(1).html());
	$("#case_id_d").val(tds.eq(0).html());
//	$("#case_name").val(tds.eq(1).html());
//	$("#case_type").val(tds.eq(2).html());
//	$("#case_img").val(tds.eq(3).html());
//	console.log(tds);
})

/**
 * 事件委托 进行案例修改操作
 * 父级元素 id=caseModal	事件元素 .btn-primary
 * */
$("#caseModal").delegate('.btn-primary','click',function(){
	if(tds!=null){
		//获取修改模态框中的数据
		var case_id=$("#case_id").val();
		var case_name=$("#case_name").val();
		var case_type = $("#case_type").val();
		var case_img = $("#case_img").val();
		
		//修改当前行中的数据
		tds.eq(1).html(case_name);
		tds.eq(2).html(case_type);
		tds.eq(3).html(case_img);
		
		//进行异步请求 后台进行数据库修改操作
		$.ajax({
			type:"GET",
			url:"/DTech/Admin/Case_editCase",
			data:{
				"cases.case_id":case_id,
				"cases.case_name":case_name,
				"cases.case_type":case_type,
				"cases.case_img":case_img
			},
			success:function(){
//				alert("修改成功!");
			}
		})
	}
	$('#caseModal').modal('hide');
})
 

/**
 * 事件委托 进行案例修改操作
 * 父级元素 id=caseModal	事件元素 .btn-primary
 * */
$("#caseModal_d").delegate('.btn-primary','click',function(){
	if(tds!=null){
		//获取修改模态框中的数据
		var case_id=$("#case_id_d").val();
//		console.log(tds);
		tds.remove();
		//进行异步请求 后台进行数据库修改操作
		$.ajax({
			type:"GET",
			url:"/DTech/Admin/Case_delCase",
			data:{
				"cases.case_id":case_id,
			},
			success:function(){
//				alert("修改成功!");
			}
		})
	}
	$('#caseModal_d').modal('hide');
})


