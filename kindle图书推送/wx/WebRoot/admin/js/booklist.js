$(function(){
		var isserch=false;
		var currentPage =1;
		var serch_currentPage = 1;
		var pageNum = 0;
		$.ajax({
			async : false,
			type:"get",
			url:"/wx/getBookServlet",
			dataType:'json',
			data:{
				serchTag:'id',
				currentPage : currentPage,
				pageSize	: $("#pageSize").val()
			},
			success:function(data){
//				console.log(data);
				if(data.result){
					ViewCommand({
						command: 'display',
						param:['booklist',data.books,'booklist']
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

		setTimeout(function(){
			// 初始化插件
			$("#zyupload").zyUpload({
				width            :   "100%",                 // 宽度
				height           :   "",                 // 宽度
				itemWidth        :   "140px",                 // 文件项的宽度
				itemHeight       :   "115px",                 // 文件项的高度
				url              :   "/wx/UploadBookServlet",  // 上传文件的路径
				fileType         :   ["jpg","png","txt"],// 上传文件的类型
				fileSize         :   51200000,                // 上传文件的大小
				multiple         :   true,                    // 是否可以多个文件上传
				dragDrop         :   true,                    // 是否可以拖动上传文件
				tailor           :   true,                    // 是否可以裁剪图片
				del              :   true,                    // 是否可以删除文件
				finishDel        :   true,  				  // 是否在上传文件完成后删除预览
				/* 外部获得的回调接口 */
				onSelect: function(selectFiles, allFiles){    // 选择文件的回调方法  selectFile:当前选中的文件  allFiles:还没上传的全部文件
					//console.info("当前选择了以下文件：");
					//console.info(selectFiles);
				},
				onDelete: function(file, files){              // 删除一个文件的回调方法 file:当前删除的文件  files:删除之后的文件
					//console.info("当前删除了此文件：");
					//console.info(file.name);
				},
				onSuccess: function(file, response){          // 文件上传成功的回调方法
					//console.info("此文件上传成功：");
					//console.info(file.name);
					//console.info("此文件上传到服务器地址：");
					//console.info(response);
					//$("#uploadInf").append("<p>上传成功，文件地址是：" + response + "</p>");
				},
				onFailure: function(file, response){          // 文件上传失败的回调方法
					console.info("此文件上传失败：");
					console.info(file.name);
					alert(file.name+"文件上传失败!");
				},
				onComplete: function(response){           	  // 上传完成的回调方法
					//console.info("文件上传完成");
					//console.info(response);
//					alert("文件上传成功!");
				}
			});
			$.ajax({
				type:"get",
				url:"/wx/getBookTypeServlet",
				dataType:'json',
				data:{},
				success:function(data){
					if(data.result){
						var booktypes = data.booktypes;
						console.log(booktypes);
						var html="";
						for(var i=0;i<booktypes.length;i++){
							html +="<option value="+booktypes[i].booktype_name+">"+booktypes[i].booktype_name+"</option>";
//							console.log(booktypes[i].booktype_name);
						}
						$("#option_booktype").html(html);
						$("#seebook_type").html(html);
						
						$.ajax({
							async : false,
							type:"get",
							url:"/wx/SetBookTypeServlet",
							dataType:'json',
							data:{
								booktype:$("#option_booktype").val()
							},
							success:function(data){
								console.log("success!");
							}
						});
					}
				}
			});
		}, 500);
		$("#pagination").on("click","li",function(){
			var index = $(this).index();
			if($(this).attr("class")=="disabled"){
				return ;
			}
			if(index>pageNum){
				if(isserch){
					serch_currentPage++;
					$.ajax({
						async : false,
						type:"get",
						url:"/wx/getBookServlet",
						dataType:'json',
						data:{
							serchTag:'serch',
							book_name:$("#book_name").val(),
							currentPage : serch_currentPage,
							pageSize	: $("#pageSize").val()
						},
						success:function(data){
							console.log(data);
							if(data.result){
								ViewCommand({
									command: 'display',
									param:['booklist',data.books,'booklist']
								})
								pageNum = data.pageNum;
								$("#pagination").html('');
								$("#pagination").append("<li id='page_previous'><a href='javascript:;'>&laquo;</a></li>");
								for(var i=1;i<=pageNum;i++){
									if(i==serch_currentPage){
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
					return ;
				}
				currentPage++;
				//alert("下一页"+$(this).attr("class"));
				
				$.ajax({
					async : false,
					type:"get",
					url:"/wx/getBookServlet",
					dataType:'json',
					data:{
						serchTag:'id',
						currentPage : currentPage,
						pageSize	: $("#pageSize").val()
					},
					success:function(data){
						console.log(data);
						if(data.result){
							ViewCommand({
								command: 'display',
								param:['booklist',data.books,'booklist']
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
				if(isserch){
					serch_currentPage--;
					$.ajax({
						async : false,
						type:"get",
						url:"/wx/getBookServlet",
						dataType:'json',
						data:{
							serchTag:'serch',
							book_name:$("#book_name").val(),
							currentPage : serch_currentPage,
							pageSize	: $("#pageSize").val()
						},
						success:function(data){
							if(data.result){
								ViewCommand({
									command: 'display',
									param:['booklist',data.books,'booklist']
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
					return ;
				}
				currentPage--;
				//alert("上一页"+$(this).attr("class"));
				$.ajax({
					async : false,
					type:"get",
					url:"/wx/getBookServlet",
					dataType:'json',
					data:{
						serchTag:'id',
						currentPage : currentPage,
						pageSize	: $("#pageSize").val()
					},
					success:function(data){
						console.log(data);
						if(data.result){
							ViewCommand({
								command: 'display',
								param:['booklist',data.books,'booklist']
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
				if(isserch){
					serch_currentPage = index;
					$.ajax({
						async : false,
						type:"get",
						url:"/wx/getBookServlet",
						dataType:'json',
						data:{
							serchTag:'serch',
							book_name:$("#book_name").val(),
							currentPage : serch_currentPage,
							pageSize	: $("#pageSize").val()
						},
						success:function(data){
							console.log(data);
							if(data.result){
								ViewCommand({
									command: 'display',
									param:['booklist',data.books,'booklist']
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
					return ;
				}
				//$(this).addClass("active").siblings().removeClass("active");
				currentPage = index;
				$.ajax({
					async : false,
					type:"get",
					url:"/wx/getBookServlet",
					dataType:'json',
					data:{
						serchTag:'id',
						currentPage : currentPage,
						pageSize	: $("#pageSize").val()
					},
					success:function(data){
						console.log(data);
						if(data.result){
							ViewCommand({
								command: 'display',
								param:['booklist',data.books,'booklist']
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
		//设置上传的booktype
		$("#option_booktype").on("change",function(){
			$.ajax({
				async : false,
				type:"get",
				url:"/wx/SetBookTypeServlet",
				dataType:'json',
				data:{
					booktype:$("#option_booktype").val()
				},
				success:function(data){
					console.log("success!");
				}
			});
		});
		$("#pageSize").on("change",function(){
			if(isserch){
				$.ajax({
					async : false,
					type:"get",
					url:"/wx/getBookServlet",
					dataType:'json',
					data:{
						serchTag:'serch',
						book_name:$("#book_name").val(),
						currentPage : serch_currentPage,
						pageSize	: $("#pageSize").val()
					},
					success:function(data){
						if(data.result){
							ViewCommand({
								command: 'display',
								param:['booklist',data.books,'booklist']
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
				return ;
			}
			$.ajax({
				async : false,
				type:"get",
				url:"/wx/getBookServlet",
				dataType:'json',
				data:{
					serchTag:'id',
					currentPage : currentPage,
					pageSize	: $("#pageSize").val()
				},
				success:function(data){
					console.log(data);
					if(data.result){
						ViewCommand({
							command: 'display',
							param:['booklist',data.books,'booklist']
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
				$("#booklist input[type=checkbox]:checkbox").attr("checked", true);
				$(this).addClass("selectall");
			}else{
				$("#booklist input[type=checkbox]:checkbox").attr("checked", false);
				$(this).removeClass("selectall");
			}
		});
		//反选
		$("#invert_check").click(function(){
			 $("#booklist input[type=checkbox]:checkbox").each(function () {   
			        $(this).attr("checked", !$(this).attr("checked"));   
			 }); 
		});
		
		//点击删除时获取选中的书序号(book_id)
		var delbook_arr = [];
		var bookids = [];
		$("#delbook_btn").click(function(){
			delbook_arr = [];
			bookids = [];
			var html = "<h4 style='margin-top:0'>您确定删除以下书籍:</h4>";
			$("#booklist input[type=checkbox]:checkbox").each(function () {
				if($(this).is(':checked')){
					html+= "书序号:<span style='color:green'>"+$(this).val()+"</span> <span style='margin-right:.4em'></span>";
					delbook_arr.push($(this).parent().parent());
					bookids.push($(this).val());
				}
			});
			if(delbook_arr.length!=0){
				$('#delbooklist').modal('show');
				$("#modalp_delbooklist").html(html);
			}else{
				alert("您还没有选择需要删除的书籍!");
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
				url:"/wx/DelbookServlet",
				dataType:'json',
				data:{
					bookids : bookids.toString()
				},
				success:function(data){
					if(data.result){
						$('#delbooklist').modal('hide');
					}
				}
			});
			
		});
		var updatetds = null;
		//查看详情--ajax获取详细内容
		$("#booklist").delegate("tr button","click",function(){
			var bookid = $(this).parent().parent().find("td").eq(1).text();
			updatetds = $(this).parent().parent().find("td");
			$.ajax({
				type:"get",
				url:"/wx/getBookMsgServlet",
				dataType:'json',
				data:{
					bookid : bookid
				},
				success:function(data){
					if(data.result){
						var book=data.book;
						$("#seebook_id").val(book.book_id);
						$("#seebook_name").val(book.book_name);
						$("#seebook_img").val(book.book_img);
						$("#seebook_url").val(book.book_url);
						$("#seebook_type option[value='"+book.book_type+"']").attr("selected",true);
						$("#seebook_downnum").val(book.book_downnum);
						$("#seebook_uptime").val(book.book_uptime);
						$("#seebook_info").val(book.book_info);
					}
				}
			});
		});
		
		//查看详情 修改按钮 事件
		$("#seebookbtn").click(function(){
			$.ajax({
				type:"get",
				url:"/wx/updateBookServlet",
				dataType:'json',
				data:{
					bookid : $("#seebook_id").val(),
					bookname : $("#seebook_name").val(),
					bookimg	: $("#seebook_img").val(),
					booktype : $("#seebook_type").val(),
					bookdownnum : $("#seebook_downnum").val(),
					bookinfo : $("#seebook_info").val()
				},
				success:function(data){
					if(data.result){
						console.log(updatetds.eq(2).html());
						updatetds.eq(2).html("<img src='"+$("#seebook_img").val()+"'/>");
						updatetds.eq(4).html($("#seebook_downnum").val());
						$("#seebooklist").modal('hide');
					}else{
						alert("修改失败,请联系管理员排查问题!");
					}
				}
			});
		});
		//查看详情  预览图片
		var previewpic = null;
		$("#seebook_previewpic").on("mouseover",function(){
			
//			var titleText = $(this).attr("data-title"); 
			previewpic =$("<div></div>").html("<img style='width:50px;' src='"+$("#seebook_img").val()+"' />").appendTo($("#seebooklist"));
			
			previewpic.css({"position":"fixed","width":"70px","height":"66px","color":"#fff","background-color":"#000","padding":"8px 10px","border-radius":"10px","opacity":".8"});
			
			var top = $(this).offset().top - previewpic.outerHeight()-20;
			var left = $(this).offset().left - previewpic.outerWidth()/2 + $(this).outerWidth()/2;
			console.log($(this).offset().left);
			console.log(previewpic.outerWidth());
			previewpic.css({"left":left,"top":top});
			var titlebox_point =$("<div></div>").css({"width":"10px","height":"10px","position":"absolute","background-color":"#000","transform":"rotate(45deg)"}).appendTo(previewpic);
			var point_left = previewpic.outerWidth()/2 - titlebox_point.width()/2;
			var point_top = titlebox_point.height()/2;
			
			titlebox_point.css({"left":point_left,"bottom":-point_top});
		})
		$("#seebook_previewpic").on("mouseout",function(){
			previewpic.remove();
		})
		
		$('#book_name').bind('keypress',function(event){  
		    if(event.keyCode == "13")
		    	$('#serchbtn').click();  
		});  
		//搜索事件
		$("#serchbtn").click(function(){
			isserch=true;
			serch_currentPage = 1;
			$.ajax({
				async : false,
				type:"get",
				url:"/wx/getBookServlet",
				dataType:'json',
				data:{
					serchTag:'serch',
					book_name:$("#book_name").val(),
					currentPage : serch_currentPage,
					pageSize	: $("#pageSize").val()
				},
				success:function(data){
					if(data.result){
						ViewCommand({
							command: 'display',
							param:['booklist',data.books,'booklist']
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
		});
})
	
	
