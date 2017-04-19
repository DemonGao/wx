<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>边学边实践-公司认证</title>
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
            <span class="fl color-4b margin-l-15"><form action="<%=basePath%>pc/exit" method="post" id=""><input type="submit" value="退出"></form></a></span>
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
                <form action="<%=basePath%>pc/add3" method="post" id="companyinfoForm" enctype="multipart/form-data">
                    <div class="box-defalut-tip padding10 margin-t-15" >
                        <h3 class="margin-l-10">基本信息</h3>
                    </div>
                    
                    <div class="listform">
                            <div class="form-group">
                                <label for="companyinfo_name">公司网址</label>
                                <input type="text" id="companyinfo_url" class="inputtext" name="companyinfo.companyinfo_url" />
                            </div>
                            <div class="form-group">
                                <label for="companyinfo_address">所在城市</label>
                                <input type="text" id="companyinfo_city" class="inputtext" name="companyinfo.companyinfo_city" />
                            </div>
                            <div class="form-group">
                                <label for="companyinfo_address">公司规模</label>
                                <input type="text" id="companyinfo_size" class="inputtext" name="companyinfo.companyinfo_size" />
                            </div>
                            <div class="form-group">
                                <label for="companyinfo_address">公司性质</label>
                                <input type="text" id="companyinfo_type" class="inputtext" name="companyinfo.companyinfo_type" />
                            </div>
                            <div class="form-group">
                                <label for="companyinfo_img">营业执照</label>
                                <input type="file" id="companyinfo_img1" class="inputtext" name="file" onchange="javascript:setImagePreview(this);"/>
                                <img alt="" src="" id="imgde1">
                            </div>
                            <div class="form-group">
                                <label for="companyinfo_address">法人</label>
                                <input type="text" id="companyinfo_legal_person" class="inputtext" name="companyinfo.companyinfo_legal_person" />
                            </div>
                            <div class="form-group">
                                <label for="companyinfo_img">法人证件</label>
                                <input type="file" id="companyinfo_img2" class="inputtext" name="file" onchange="javascript:setImagePreview(this);" />
                                <img alt="" src="" id="imgde2">
                                <input type="hidden" id="openid" name="companyinfo.openid" class="inputtext" value="<%=session.getAttribute("OPENID") %>">
                            </div>
                            <div id="group"></div>
                    
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
<script type="text/javascript">
function btn2(){
   var companyinfo_url= document.getElementById("companyinfo_url").value;
   var companyinfo_city= document.getElementById("companyinfo_city").value;
   var companyinfo_size= document.getElementById("companyinfo_size").value;
   var companyinfo_type= document.getElementById("companyinfo_type").value;
   var companyinfo_img1= document.getElementById("companyinfo_img1").value;
   var companyinfo_legal_person= document.getElementById("companyinfo_legal_person").value;
   var companyinfo_img2= document.getElementById("companyinfo_img2").value;
  
 if(companyinfo_url==""||companyinfo_city==""||companyinfo_size==""||companyinfo_legal_person==""||companyinfo_type==""){
     document.getElementById("group").innerHTML="亲 ，每个内容都不能为空哦！";
     return ;
   }
  if(companyinfo_img1==""||companyinfo_img2==""){
  document.getElementById("group").innerHTML="亲 ，图片需要从新上传哦！";
  return;
  }
   	$("#companyinfoForm").submit();
}


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
             
              document.getElementById("companyinfo_url").value=list.companyinfo_url;
              document.getElementById("companyinfo_city").value=list.companyinfo_city;
              document.getElementById("companyinfo_size").value=list.companyinfo_size;
              document.getElementById("companyinfo_type").value=list.companyinfo_type;
              document.getElementById("companyinfo_legal_person").value=list.companyinfo_legal_person;
              var img='<%=basePath%>'+list.companyinfo_copy;
              var img1='<%=basePath%>'+list.companyinfo_certificates;
         
              $("#imgde1").attr("src",img);
              $("#imgde2").attr("src",img1);
            
            }
          });
          
          
       });
       
        //下面用于图片上传预览功能
function setImagePreview(docObj) {
				//				var docObj = document.getElementById("doc");

				var imgObjPreview = document.getElementById("preview");

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