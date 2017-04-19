$(function(){
		var currentPage =1;
		var pageNum = 0;
		var pagination = false;
		$.ajax({
			async : false,
			type : "GET",
			url : "/wx/getUserServlet",
			dataType : 'json',
			data : {
				currentPage : currentPage,
				pageSize	: $("#pageSize").val()
			},
			success : function(data) {
				if (data.result) {
					ViewCommand({
						command: 'display',
						param:['userlist',data.users,'userlist']
					});
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

		$("#pagination").on("click","li",function(){
			var index = $(this).index();
			if($(this).attr("class")=="disabled"){
				return ;
			}
			if(index>pageNum){
				currentPage++;
				//alert("下一页"+$(this).attr("class"));
				
				$.ajax({
					async : false,
					type : "GET",
					url : "/wx/getUserServlet",
					dataType : 'json',
					data : {
						currentPage : currentPage,
						pageSize	: $("#pageSize").val()
					},
					success : function(data) {
						if (data.result) {
							ViewCommand({
								command: 'display',
								param:['userlist',data.users,'userlist']
							});
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
			}else if(index==0){
				currentPage--;
				//alert("上一页"+$(this).attr("class"));
				$.ajax({
					async : false,
					type : "GET",
					url : "/wx/getUserServlet",
					dataType : 'json',
					data : {
						currentPage : currentPage,
						pageSize	: $("#pageSize").val()
					},
					success : function(data) {
						if (data.result) {
							ViewCommand({
								command: 'display',
								param:['userlist',data.users,'userlist']
							});
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
			}else{
				//$(this).addClass("active").siblings().removeClass("active");
				$.ajax({
					async : false,
					type : "GET",
					url : "/wx/getUserServlet",
					dataType : 'json',
					data : {
						currentPage : index,
						pageSize	: $("#pageSize").val()
					},
					success : function(data) {
						if (data.result) {
							ViewCommand({
								command: 'display',
								param:['userlist',data.users,'userlist']
							});
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
				
			}
		});
		
		$("#pageSize").on("change",function(){
			$.ajax({
				async : false,
				type : "GET",
				url : "/wx/getUserServlet",
				dataType : 'json',
				data : {
					currentPage : currentPage,
					pageSize	: $(this).val()
				},
				success : function(data) {
					if (data.result) {
						ViewCommand({
							command: 'display',
							param:['userlist',data.users,'userlist']
						});
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
		var selectTr=null;
		//查看详情--ajax获取详细内容
		$("#userlist").delegate("tr button","click",function(){
			selectTr=$(this).parent().parent();
			var openid = $(this).parent().parent().find("td").eq(0).text();
			updatetds = $(this).parent().parent().find("td");
			var timelimitdate = $(this).parent().parent().find("td").eq(2).text();
			var timelength = $(this).parent().parent().find("td").eq(4).text();
			$.ajax({
				type:"get",
				url:"/wx/getOneUserServlet",
				dataType:'json',
				data:{
					openid : openid
				},
				success:function(data){
					if(data.result){
						var user=data.user;
						$("#seeopenid").val(user.openid);
						$("#seeemail").val(user.email);
						if(user.activedate==""){
							$("#seeactivedate").val("未激活!");
						}else{
							$("#seeactivedate").val(format(user.activedate,'yyyy-MM-dd HH:mm:ss'));
						}
						//$("#seetimelength option[value='"+user.timelength+"']").attr("selected",true);
						$("#seetimelimitdate").val(timelimitdate);
						$("#seetimelength").val(timelength);
					}
				}
			});
		});
		
		//查看详情 修改按钮 事件
		$("#seeuserlistbtn").click(function(){
			$.ajax({
				type:"get",
				url:"/wx/updateUserServlet",
				dataType:'json',
				data:{
					openid : $("#seeopenid").val(),
					email : $("#seeemail").val(),
					timelength	: $("#seetimelength").val(),
					addtimelength : $("#seeaddtimelength").val(),
				},
				success:function(data){
					if(data.result){
//						console.log(updatetds.eq(2).html());
						updatetds.eq(1).html(data.seeemail);
						
						updatetds.eq(2).html(data.seetimelimitdate);
						if(data.seeactivedate!=null){
							updatetds.eq(3).html(data.seeactivedate);
						}
						updatetds.eq(4).html(formatSeconds(data.seetimelength));
						$("#seeuserlist").modal('hide');
					}else{
						alert("修改失败,请联系管理员排查问题!");
					}
				}
			});
		});
		//查看详情 删除按钮 事件
		$("#seeuserlistdelbtn").click(function(){
			$.ajax({
				type:"get",
				url:"/wx/delUserServlet",
				dataType:'json',
				data:{
					openid : $("#seeopenid").val()
				},
				success:function(data){
					if(data.result){
						selectTr.remove();
						$("#seeuserlist").modal('hide');
					}else{
						alert("修改失败,请联系管理员排查问题!");
					}
				}
			});
		});
	})