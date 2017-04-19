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
		})
		
	})