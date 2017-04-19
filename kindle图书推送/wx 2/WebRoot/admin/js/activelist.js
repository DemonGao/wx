$(function(){
		var currentPage =1;
		var pageNum = 0;
		
		
		$.ajax({
			async : false,
			type:"get",
			url:"/wx/getActiveServlet",
			dataType:'json',
			data:{
				serchTag:'default',
				currentPage : currentPage,
				pageSize	: $("#pageSize").val()
			},
			success:function(data){
//				console.log(data);
				if(data.result){
					ViewCommand({
						command: 'display',
						param:['activecodelist',data.activecodes,'activecodelist']
					})
					pageNum = data.pageNum;
					$("#pagination").html('');
					$("#pagination").append("<li id='page_previous'><a href='javascript:;'>&laquo;</a></li>");
					for(var i=1;i<=pageNum;i++){
						if(i==1){
							$("#pagination").append("<li class='active'><a href=javascript:;>"+i+"</a></li>");
						}else{
							$("#pagination").append("<li><a href=javascript:;>"+i+"</a></li>");
						}
						
					}
					$("#pagination").append("<li id='page_next'><a href='javascript:;'>&raquo;</a></li>");
					if(pageNum==1){
						$("#page_previous").addClass("disabled");
						$("#page_next").addClass("disabled");
						return ;
					}
					if(data.currentPage==1){
						$("#page_previous").addClass("disabled");
						$("#page_next").removeClass("disabled");
					}else if(data.currentPage==pageNum){
						$("#page_next").addClass("disabled");
						$("#page_previous").removeClass("disabled");
					}
				}
			}
		});

		$("#pagination").on("click","li",function(){
			var index = $(this).index();
			if($(this).attr("class")=="disabled"){
				return ;
			}
			if(index>pageNum){
				currentPage++;
				$.ajax({
					async : false,
					type:"get",
					url:"/wx/getActiveServlet",
					dataType:'json',
					data:{
						serchTag:'default',
						currentPage : currentPage,
						pageSize	: $("#pageSize").val()
					},
					success:function(data){
						console.log(data);
						if(data.result){
							ViewCommand({
								command: 'display',
								param:['activecodelist',data.activecodes,'activecodelist']
							})
							pageNum = data.pageNum;
							$("#pagination").html('');
							$("#pagination").append("<li id='page_previous'><a href='javascript:;'>&laquo;</a></li>");
							for(var i=1;i<=pageNum;i++){
								if(i==currentPage){
									$("#pagination").append("<li class='active'><a href=javascript:;>"+i+"</a></li>");
								}else{
									$("#pagination").append("<li><a href=javascript:;>"+i+"</a></li>");
								}
								
							}
							$("#pagination").append("<li id='page_next'><a href='javascript:;'>&raquo;</a></li>");
							if(pageNum==1){
								$("#page_previous").addClass("disabled");
								$("#page_next").addClass("disabled");
								return ;
							}
							if(data.currentPage==1){
								$("#page_previous").addClass("disabled");
								$("#page_next").removeClass("disabled");
							}else if(data.currentPage==pageNum){
								$("#page_next").addClass("disabled");
								$("#page_previous").removeClass("disabled");
							}
						}
					}

				});
			}else if(index==0){
				currentPage--;
				//alert("上一页"+$(this).attr("class"));
				$.ajax({
					async : false,
					type:"get",
					url:"/wx/getActiveServlet",
					dataType:'json',
					data:{
						serchTag:'default',
						currentPage : currentPage,
						pageSize	: $("#pageSize").val()
					},
					success:function(data){
						console.log(data);
						if(data.result){
							ViewCommand({
								command: 'display',
								param:['activecodelist',data.activecodes,'activecodelist']
							})
							pageNum = data.pageNum;
							$("#pagination").html('');
							$("#pagination").append("<li id='page_previous'><a href='javascript:;'>&laquo;</a></li>");
							for(var i=1;i<=pageNum;i++){
								if(i==currentPage){
									$("#pagination").append("<li class='active'><a href=javascript:;>"+i+"</a></li>");
								}else{
									$("#pagination").append("<li><a href=javascript:;>"+i+"</a></li>");
								}
							}
							$("#pagination").append("<li id='page_next'><a href='javascript:;'>&raquo;</a></li>");
							if(pageNum==1){
								$("#page_previous").addClass("disabled");
								$("#page_next").addClass("disabled");
								return ;
							}
							if(data.currentPage==1){
								$("#page_previous").addClass("disabled");
								$("#page_next").removeClass("disabled");
							}else if(data.currentPage==pageNum){
								$("#page_next").addClass("disabled");
								$("#page_previous").removeClass("disabled");
							}
						}
					}

				});
			}else{
				$.ajax({
					async : false,
					type:"get",
					url:"/wx/getActiveServlet",
					dataType:'json',
					data:{
						serchTag:'default',
						currentPage : index,
						pageSize	: $("#pageSize").val()
					},
					success:function(data){
						console.log(data);
						if(data.result){
							ViewCommand({
								command: 'display',
								param:['activecodelist',data.activecodes,'activecodelist']
							})
							pageNum = data.pageNum;
							$("#pagination").html('');
							$("#pagination").append("<li id='page_previous'><a href='javascript:;'>&laquo;</a></li>");
							for(var i=1;i<=pageNum;i++){
								if(i==index){
									$("#pagination").append("<li class='active'><a href=javascript:;>"+i+"</a></li>");
								}else{
									$("#pagination").append("<li><a href=javascript:;>"+i+"</a></li>");
								}
							}
							$("#pagination").append("<li id='page_next'><a href='javascript:;'>&raquo;</a></li>");
							if(pageNum==1){
								$("#page_previous").addClass("disabled");
								$("#page_next").addClass("disabled");
								return ;
							}
							if(data.currentPage==1){
								$("#page_previous").addClass("disabled");
								$("#page_next").removeClass("disabled");
							}else if(data.currentPage==pageNum){
								$("#page_next").addClass("disabled");
								$("#page_previous").removeClass("disabled");
							}
						}
					}

				});
				
			}
		});
		$("#pageSize").on("change",function(){
			$.ajax({
				async : false,
				type:"get",
				url:"/wx/getActiveServlet",
				dataType:'json',
				data:{
					serchTag:'default',
					currentPage : currentPage,
					pageSize	: $("#pageSize").val()
				},
				success:function(data){
					if(data.result){
						ViewCommand({
							command: 'display',
							param:['activecodelist',data.activecodes,'activecodelist']
						})
						pageNum = data.pageNum;
						$("#pagination").html('');
						$("#pagination").append("<li id='page_previous'><a href='javascript:;'>&laquo;</a></li>");
						for(var i=1;i<=pageNum;i++){
							$("#pagination").append("<li><a href=javascript:;>"+i+"</a></li>");
						}
						$("#pagination").append("<li id='page_next'><a href='javascript:;'>&raquo;</a></li>");
						if(pageNum==1){
							$("#page_previous").addClass("disabled");
							$("#page_next").addClass("disabled");
							return ;
						}
						if(data.currentPage==1){
							$("#page_previous").addClass("disabled");
							$("#page_next").removeClass("disabled");
						}else if(data.currentPage==pageNum){
							$("#page_next").addClass("disabled");
							$("#page_previous").removeClass("disabled");
						}
					}
				}
			});
		});
		
		//全选和全不选
		$("#allorone_check").click(function(){
			if(!$(this).hasClass("selectall")){
				$("#activecodelist input[type=checkbox]:checkbox").attr("checked", true);
				$(this).addClass("selectall");
			}else{
				$("#activecodelist input[type=checkbox]:checkbox").attr("checked", false);
				$(this).removeClass("selectall");
			}
		});
		//反选
		$("#invert_check").click(function(){
			 $("#activecodelist input[type=checkbox]:checkbox").each(function () {   
			        $(this).attr("checked", !$(this).attr("checked"));   
			 }); 
		});
		
		//批量添加激活码
		$("#addactivebtn").click(function(){
			$.ajax({
				type:"get",
				url:"/wx/addActiveServlet",
				dataType:'json',
				data:{
					activecode_time : $("#option_activecodetime").val(),
					activecode_num : $("#addactivecode_num").val()
				},
				success:function(data){
					if(data.result){
						
						$("#addactivecodelist").modal('hide');
					}else{
						alert("修改失败,请联系管理员排查问题!");
					}
				}
			});
		});
		
		//点击删除时获取选中的书序号(book_id)
		var delbook_arr = [];
		var activecode_ids = [];
		$("#delbook_btn").click(function(){
			delbook_arr = [];
			activecode_ids = [];
			var html = "<h4 style='margin-top:0'>您确定删除以下激活码:</h4>";
			$("#activecodelist input[type=checkbox]:checkbox").each(function () {
				if($(this).is(':checked')){
					html+= "序号:<span style='color:green'>"+$(this).val()+"</span> <span style='margin-right:.4em'></span>";
					delbook_arr.push($(this).parent().parent());
					activecode_ids.push($(this).val());
				}
			});
			if(delbook_arr.length!=0){
				$('#delctivelist').modal('show');
				$("#modalp_delactivelist").html(html);
			}else{
				alert("您还没有选择需要删除的激活码!");
			}
		});
		//删除模态框中删除事件绑定!
		$("#delbookbtn").click(function(){
			for(var i =0 ;i < delbook_arr.length;i++){
				delbook_arr[i].remove();
			}
//			console.log(bookids.toString());
			$.ajax({
				type:"get",
				url:"/wx/DelactiveServlet",
				dataType:'json',
				data:{
					activecode_ids : activecode_ids.toString()
				},
				success:function(data){
					if(data.result){
						$('#delctivelist').modal('hide');
					}else{
						alert("删除失败,请联系管理员排查问题!");
					}
				}
			});
			
		});
		var updatetds = null;
		//查看详情--ajax获取详细内容
		$("#activecodelist").delegate("tr button","click",function(){
			var activecode_id = $(this).parent().parent().find("td").eq(1).text();
			updatetds = $(this).parent().parent().find("td");
			$.ajax({
				type:"get",
				url:"/wx/getActiveServlet",
				dataType:'json',
				data:{
					serchTag:'id',
					activecode_id:activecode_id,
					currentPage : currentPage,
					pageSize	: $("#pageSize").val()
				},
				success:function(data){
					console.log(data);
					if(data.result){
						
						var active=data.activecodes[0];
						$("#seeactivecode_id").val(active.activecode_id);
						$("#seeactivecode_code").val(active.activecode);
						$("#seeactivecode_time option[value='"+active.activecode_time+"']").attr("selected",true);
					}
				}
			});
		});
		
		//查看详情 修改按钮 事件
		$("#seeactivecodebtn").click(function(){
			$.ajax({
				type:"get",
				url:"/wx/updateActiveServlet",
				dataType:'json',
				data:{
					activecode_id : $("#seeactivecode_id").val(),
					activecode_code : $("#seeactivecode_code").val(),
					activecode_time	: $("#seeactivecode_time").val()
				},
				success:function(data){
					if(data.result){
						console.log(updatetds.eq(2).html());
						updatetds.eq(2).html($("#seeactivecode_code").val());
						updatetds.eq(3).html(formatSeconds($("#seeactivecode_time").val()));
						$("#seeactivelist").modal('hide');
					}else{
						alert("修改失败,请联系管理员排查问题!");
					}
				}
			});
		});
})
	
	