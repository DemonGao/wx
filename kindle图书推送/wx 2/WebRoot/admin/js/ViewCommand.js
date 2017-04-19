//模块实现模块
var ViewCommand = (function(){
	var templet={
		userlist:[
			'<tr>',
				'<td>{#openid#}</td>',
				'<td>{#email#}</td>',
				'<td>{#activedate#}</td>',
				'<td>{#timelength#}</td>',
				'<td>查看详情</td>',
			'</tr>'
		].join(''),
		booklist:[
			'<tr>',
				'<td><input type="checkbox" value="{#book_id#}"></td>',
				'<td>{#book_id#}</td>',
				'<td><img src="{#book_img#}" alt="{#book_name#}" /></td>',
				'<td>{#book_name#}</td>',
				'<td>{#book_downnum#}</td>',
				'<td>{#book_uptime#}</td>',
				'<td><button type="button" class="btn btn-warning" data-toggle="modal" data-target="#seebooklist">查看详情</button></td>',
			'</tr>'   
		].join(''),
		seebooklist:[
			'<form class="form-horizontal" role="form">',
				'<div class="form-group form-group-sm clearfix">',
					'<label class="col-sm-3 control-label" for="book_id">书籍号</label>',
				  	'<div class="col-sm-9">',
				  		'<input class="form-control" type="text" id="book_id" value="{#book_id#}" placeholder="Small input" readonly>',
				  	'</div>',
				'</div>',
				'<div class="form-group form-group-sm clearfix">',
					'<label class="col-sm-3 control-label" for="book_name">书名</label>',
				  	'<div class="col-sm-9">',
				  		'<input class="form-control" type="text" id="book_name" value="{#book_name#}" placeholder="书名">',
				  	'</div>',
			  	'</div>',
			  	'<div class="form-group form-group-sm clearfix">',
			  		'<label class="col-sm-3 control-label" for="book_name">分类</label>',
			  		'<div class="col-sm-9">',
			  			'<select class="form-control">',
			  				'<option>1</option>',
			  				'<option>2</option>',
			  			'</select>',
			  		'</div>',
			  	'</div>',
				'<div class="form-group form-group-sm clearfix">',
					'<label class="col-sm-3 control-label" for="book_img">图片路径</label>',
					'<div class="col-sm-7">',
						'<input class="form-control" type="text" id="book_img" value="{#book_img#}" placeholder="可设置网络图片">',
					'</div>',
					'<div class="col-sm-2" style="padding-left:0">',
						'<button type="button" class="btn btn-info">显示图片</button>',
					'</div>',
				'</div>',
				'<div class="form-group form-group-sm clearfix">',
					'<label class="col-sm-3 control-label" for="book_url">下载地址</label>',
					'<div class="col-sm-9">',
			  			'<input class="form-control" type="text" id="book_url" value="{#book_url#}" placeholder="书籍下载地址" readonly>',
			  		'</div>',
			  	'</div>',
			'</form>'
		].join(''),
		activecodelist:[
			'<tr>',
				'<td><input type="checkbox" value="{#activecode_id#}"></td>',
				'<td>{#activecode_id#}</td>',
				'<td>{#activecode#}</td>',
				'<td>{#activecode_time#}</td>',
				'<td>{#isused#}</td>',
				'<td><button type="button" class="btn btn-warning" data-toggle="modal" data-target="#seeactivelist">查看详情</button></td>',
			'</tr>'  
		].join('')
	},
		html='';
	function formateString(str,obj){
		//替换'{#'与'#}'之间的字符串
		return str.replace(/\{#(\w+)#\}/g,function(match,key){
			//创建一个变量,赋值为obj
			
			
			var newobj=obj;
			while(key.indexOf("__")>0){
				var index=key.indexOf("__");
				newobj=newobj[key.slice(0,index)];
				key=key.slice(index+2);
			}
			
			if(key=="activedate"){
//				console.log(format(newobj[key], 'yyyy-MM-dd HH:mm:ss'));
				
				if(newobj[key]==""){
					newobj[key]="还未激活过!";
				}else{
					newobj[key]=format(newobj[key], 'yyyy-MM-dd HH:mm:ss');
				}
			}
			if(key=="timelength"||key=="activecode_time"){
				if(newobj[key]==""){
					newobj[key]="还未激活过!";
				}else{
					newobj[key]=formatSeconds(newobj[key]);
				}
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
		}
	};
	//命令接口
	return function excute(msg){
		//解析命令  如果msg.param不是数组,则将其转换为数组 apply方法要求第二个参数必须为数组
		msg.param=Object.prototype.toString.call(msg.param)==="[object Array]"?msg.param:[msg.param];
		Action[msg.command].apply(Action,msg.param);
	};
})();
function ajaxBook(){
	var data=arguments[0];
	var container=arguments[1];
	var tmp=arguments[2];
	var fn =arguments[3];
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
				if(fn!=null){
					fn();
				}
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

/*字符串1970到现在毫秒数转换成日期*/
var format = function(time1, format){
	var time=parseInt(time1.toString());
    var t = new Date(time);
    var tf = function(i){return (i < 10 ? '0' : '') + i};
    return format.replace(/yyyy|MM|dd|HH|mm|ss/g, function(a){
        switch(a){
            case 'yyyy':
                return tf(t.getFullYear());
                break;
            case 'MM':
                return tf(t.getMonth() + 1);
                break;
            case 'mm':
                return tf(t.getMinutes());
                break;
            case 'dd':
                return tf(t.getDate());
                break;
            case 'HH':
                return tf(t.getHours());
                break;
            case 'ss':
                return tf(t.getSeconds());
                break;
        }
    })
}

/*毫秒转换成时间*/
function formatSeconds(value) {
    var theTime = parseInt(value);// 秒
    theTime= theTime/1000;
    var theTime1 = 0;// 分
    var theTime2 = 0;// 小时
    var theTime3 = 0;//天
    if(theTime > 60) {
        theTime1 = parseInt(theTime/60);
        theTime = parseInt(theTime%60);
            if(theTime1 > 60) {
	            theTime2 = parseInt(theTime1/60);
	            theTime1 = parseInt(theTime1%60);
	            if(theTime2>24){
	            	theTime3 = parseInt(theTime2/24);
		            theTime2 = parseInt(theTime2%24);
	            }
            }
    }
        var result = "";
        if(theTime >0){
        	result = ""+parseInt(theTime)+"秒";
        }
        if(theTime1 > 0) {
        	result = ""+parseInt(theTime1)+"分"+result;
        }
        if(theTime2 > 0) {
        	result = ""+parseInt(theTime2)+"小时"+result;
        }
        if(theTime3 > 0) {
            result = ""+parseInt(theTime3)+"天"+result;
        }
    return result;
}