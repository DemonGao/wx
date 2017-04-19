//模块实现模块
var ViewCommand = (function(){
	var templet={
		//书籍列表
		booklist:[
		    '<a href="/wx/book/page/pushbook.jsp?book_id={#book_id#}&book_downnum={#book_downnum#}&book_url={#book_url#}&book_name={#book_name#}&book_size={#book_size#}" class="weui_media_box weui_media_appmsg">',
		   		'<div class="weui_media_hd">',
		   			'<img class="weui_media_appmsg_thumb" src="{#book_img#}" alt="">',
		   		'</div>',
		   		'<div class="weui_media_bd">',
		   			'<h4 class="weui_media_title">{#book_name#}</h4>',	   		
		   			'<p class="weui_media_desc">{#book_info#}</p>',
		   		'</div>',
		   	'</a>'
		].join(''),
		search_show:[
		    '<a href="/wx/book/page/pushbook.jsp?book_downnum={#book_downnum#}&book_id={#book_id#}&book_url={#book_url#}&book_name={#book_name#}&book_size={#book_size#}"',
			'<div class="weui_cell serchshow">',
				'<div class="weui_cell_bd weui_cell_primary">',
					'<p>{#book_name#}</p>',
					'</div>',
			'</div>',
			'</a>'
			].join(''),
		booktype:[
		        '<div class="weui_media_box weui_media_small_appmsg">',
		        	'<div class="weui_cells weui_cells_access">',
						'<a class="weui_cell" href="javascript:;" id="booktype_a">',
						'<div class="weui_cell_hd">',
							'<i class="iconfont {#booktype_img#}" style="font-size:24px;vertical-align:super;margin-right:.5em"></i>',
						'</div>',
						'<div class="weui_cell_bd weui_cell_primary">',
						    '<p>{#booktype_name#}</p>',
						'</div>',
						'<span class="weui_cell_ft"></span>',
						'</a>',
					'</div>',
				'</div>',
		].join(''),
		//书籍排行
		booksort:[
		    '<a href="/wx/book/page/pushbook.jsp?book_id={#book_id#}&book_downnum={#book_downnum#}&book_url={#book_url#}&book_name={#book_name#}&book_size={#book_size#}" class="weui_media_box weui_media_appmsg">',
		   		'<div class="weui_media_hd">',
		   			'<img class="weui_media_appmsg_thumb" src="{#book_img#}" alt="">',
		   		'</div>',
		   		'<div class="weui_media_bd">',
		   			'<h4 class="weui_media_title">{#book_name#}<span style="float:right;font-size:12px;color:#87CEEB"><i class="iconfont icon-xiazai"></i>({#book_downnum#})</span></h4>',	   		
		   			'<p class="weui_media_desc">{#book_info#}</p>',
		   		'</div>',
		   	'</a>'
		].join(''),
		userinfo:[
				'<div class="weui_panel weui_panel_access">',
				'<a href="javascript:;" class="weui_media_box weui_media_appmsg">',
					'<div class="weui_media_hd">',
						'<img class="weui_media_appmsg_thumb" src="{#userinfo__headimgurl#}" alt="">',
					'</div>',
					'<div class="weui_media_bd">',
						'<h4 class="weui_media_title">{#userinfo__nickname#}</h4>',
						'<p class="weui_media_desc">',
							'推送邮箱:{#email#}<br> 到期时间:{#limittime#}',
						'</p>',
					'</div>',
				'</a>',
				'</div>'
		].join(''),
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
			console.log(view);
			
			if(view=="search_show"||view=="userinfo"){
				document.getElementById(container).innerHTML=html;
			}else{
				document.getElementById(container).innerHTML+=html;
			}
			
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