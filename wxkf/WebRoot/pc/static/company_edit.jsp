<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>边学边实践-公司信息</title>
    <link type="text/css" rel="stylesheet" href="<%=basePath%>pc/commonstatic/font/iconfont.css" />
    <link type="text/css" rel="stylesheet" href="<%=basePath%>pc/commonstatic/css/cssreset.css" />
    <link type="text/css" rel="stylesheet" href="<%=basePath%>pc/static/css/pcstyle.css" />
    <link type="text/css" rel="stylesheet" href="<%=basePath%>pc/commonstatic/css/Gscstyle.css" />
</head>
<body class="b-index">
<header>
    <div class="w">
        <div class="h_logo float_l margin-t-15"><a href="javascript:;"></a></div>
        <div class="h_version color-4b float_l">企业版</div>
        <ul class="nav">
            <li>
                管理中心
            </li>
            <li class="line"></li>
            <li>
                <a href="http://vip.doumi.com/zhaopin/">招聘合作</a>
            </li>
            <li class="line"></li>
            <li><a href="http://www.doumi.com/bj/" target="_blank">职位</a></li>
            <!--li class="line"></li>
            <li><a href="/">帮助中心</a></li-->
        </ul>
        <div class="float_r clearfix">
            <span class="fl color-4b margin-r-15"><%=session.getAttribute("USERNAME") %></span>
            <i class="fl l"></i>
            <span class="fl color-4b margin-l-15"><form action="<%=basePath%>pc/exit" method="post" id=""><input type="submit" value="退出"></form></span>
        </div>
    </div>
</header>
<aside class="ad w margin-t-10"><a href="javascript:;"><img src="<%=basePath%>pc/static/img/vip_service.jpg"  width="100%"/></a></aside>
<article class="content w clearfix margin-t-10">
    <section class="margin-b-25">
        <div class="box margin-t-10 ">
            <div class="box-t bg_white clearfix">
                <h2 class="text-center">填写公司信息</h2>

            </div>
            <div class=" bg_white of-hidden margin-t-15 padding20">
                <div class="box-error-tip padding10" >
                    <p class="tip-con margin-l-10 font-12">
                        完善信息才可以发布兼职消息哦~
                    </p>
                </div>
                <form action="<%=basePath%>pc/add" method="post" id="companyinfoForm" enctype="multipart/form-data">
                    <div class="box-defalut-tip padding10 margin-t-15" >
                        <h3 class="margin-l-10">基本信息</h3>
                    </div>
                    
                    <div class="listform">
                            <div class="form-group">
                                <label for="companyinfo_name">公司名称</label>
                                <input type="text" id="companyinfo_name" class="inputtext" name="companyinfo.companyinfo_name" />
                            </div>
                            <div class="form-group">
                                <label for="companyinfo_address">详细地址</label>
                                <input type="text" id="companyinfo_address" class="inputtext" name="companyinfo.companyinfo_address" />
                            </div>
                            <div class="form-group">
                                <label for="companyinfo_about">公司简介</label>
                                <textarea form="companyinfoForm" name="companyinfo.companyinfo_about" id="companyinfo_about" class="inputtextarea" cols="30" rows="5"></textarea>
                            </div>
                    </div>
                    <div class="box-defalut-tip padding10 margin-t-15" >
                        <h3 class="margin-l-10">联系方式</h3>
                    </div>
                    <div class="listform">
                        <div class="form-group">
                            <label for="companyinfo_nickname">负责人姓名</label>
                            <input type="text" id="companyinfo_nickname" class="inputtext" name="companyinfo.companyinfo_nickname" />
                        </div>
                        <div class="form-group">
                            <label for="companyinfo_tel">负责人联系方式</label>
                            <input type="text" id="companyinfo_tel" class="inputtext" name="companyinfo.companyinfo_tel" />
                        </div>
                        <div class="form-group">
                            <label for="companyinfo_email">公司邮箱</label>
                            <input type="text" id="companyinfo_email" class="inputtext" name="companyinfo.companyinfo_email" />
                        </div>
                    </div>
                    <div class="box-defalut-tip padding10 margin-t-15" >
                        <h3 class="margin-l-10">企业 Logo</h3>
                    </div>
                    <div class="listform">
                        <div class="form-group">
                            <label for="companyinfo_img">企业Logo</label>
                            <input type="file" id="companyinfo_img" class="inputtext" name="file" onchange="javascript:setImagePreview(this);" />
                            <img alt="" src="" id="imgde">
                            <input type="hidden" id="openid" name="companyinfo.openid" class="inputtext" value="<%=session.getAttribute("OPENID") %>">
                        </div>
                        <div class="form-group" id="group"></div>
                        <div class="form-group">
                            <label for="companyinfo_img"></label>
                            <button type="button" onclick="btn2()">提交</button>                        
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
</article>

<script type="text/javascript" src="<%=basePath%>pc/commonstatic/js/vue.js"></script>
<script type="text/javascript"  src="<%=basePath%>pc/commonstatic/js/jquery-1.11.1.js"></script>
<script type="text/javascript"  src="<%=basePath%>pc/commonstatic/js/jquery.validate.min.js"></script>
<script>
function btn2(){
 var companyinfo_name= document.getElementById("companyinfo_name").value;
   var companyinfo_tel= document.getElementById("companyinfo_tel").value;
   var companyinfo_address= document.getElementById("companyinfo_address").value;
   var companyinfo_about= document.getElementById("companyinfo_about").value;
   var companyinfo_nickname= document.getElementById("companyinfo_nickname").value;
   var companyinfo_email= document.getElementById("companyinfo_email").value;
   var companyinfo_img= document.getElementById("companyinfo_img").value;
   
    if(companyinfo_name==""||companyinfo_tel==""||companyinfo_address==""||companyinfo_about==""||companyinfo_nickname==""||companyinfo_email==""){
     document.getElementById("group").innerHTML="亲 ，每个内容都不能为空哦！";
     return ;
        }
   var reg = /^1[0-9]{10}$/;
   if(!reg.test(companyinfo_tel)){
   document.getElementById("group").innerHTML="亲 ，电话号码格式不正确哦！";
   return;
   }
   /**$("#companyinfo_img").each(function(){
           if($(this).val() == "") {
           document.getElementById("group").innerHTML="亲 ，请上传图片哦！";
           flag = 0;
           }
           });**/     
   	$("#companyinfoForm").submit();
}
	
   /** $(function(){
        $("#companyinfoForm").validate({
            debug:true,
            rules: {
                "companyinfo.companyinfo_name":{
                    required:true
                }
            },
            messages:{
                "companyinfo.companyinfo_name":{
                    required:"用户名不能为空!"
                }
            }
        })
    })**/

$(document).ready(function(){

 $.ajax({
            type: 'POST',
            url: '<%=basePath%>pcd/CompanyInfo_query',
            data: {
                "openid":"<%=session.getAttribute("OPENID") %>",
	        	},
            dataType: 'json',
            cache: false,
            success: function(data) {
              var list=data.com; 
              alert(list.companyinfo_name);
             document.getElementById("companyinfo_name").value=list.companyinfo_name;
              document.getElementById("companyinfo_address").value=list.companyinfo_address;
              document.getElementById("companyinfo_about").value=list.companyinfo_about;
              document.getElementById("companyinfo_nickname").value=list.companyinfo_nickname;
              document.getElementById("companyinfo_tel").value=list.companyinfo_tel;
              document.getElementById("companyinfo_email").value=list.companyinfo_email;
              var img=list.companyinfo_img;
              if(img!=null){
              var img1=img.substring(2,img.length-1);
              var img2='<%=basePath%>'+img1;
              $("#imgde").attr("src",img2);
            }
            }
          });
          
          
       });
       
       //下面用于图片上传预览功能
function setImagePreview(docObj) {
				//				var docObj = document.getElementById("doc");

				var imgObjPreview = document.getElementById("imgde");

				if(docObj.files && docObj.files[0]) {
					//火狐下，直接设img属性
					imgObjPreview.style.display = 'inline-block';
					imgObjPreview.style.width = '79px';
					imgObjPreview.style.height = '79px';
					//imgObjPreview.src = docObj.files[0].getAsDataURL();

					//火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式
					imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
				} else {
					//IE下，使用滤镜
					docObj.select();
					var imgSrc = document.selection.createRange().text;
					var localImagId = document.getElementById("localImag");
					//必须设置初始大小
					localImagId.style.width = "150px";
					localImagId.style.height = "180px";
					//图片异常的捕捉，防止用户修改后缀来伪造图片
					try {
						localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
						localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
					} catch(e) {
						alert("您上传的图片格式不正确，请重新选择!");
						return false;
					}
					imgObjPreview.style.display = 'none';
					document.selection.empty();
				}
				$("#localImag").css("display", "inline-block");
				//				$(".weui_uploader_input_wrp").css("display","none");
				$(".weui_uploader .weui_cell_ft").text('1/1');
				return true;
			}

			//现居地
       
</script>
</body>
</html>