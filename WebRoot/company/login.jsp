<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>企业登录</title>
    <link type="text/css" rel="stylesheet" href="<%=basePath %>company/commonstatic/css/cssreset.css" />
    <link type="text/css" rel="stylesheet" href="<%=basePath %>company/commonstatic/css/Gscstyle.css" />
    <link type="text/css" rel="stylesheet" href="<%=basePath %>company/static/css/clogin.css"/>
   
</head>
<body id="body">
<div class="contaniner" id="contaniner">
	<div class="loginbox">
		<h1>账号登录</h1>
	    <form id="loginForm" action="<%=basePath %>capi/Company_login"  method="post">
	        <div class="form-list">
	            <label class="formlabel userlabel" for="username"></label>
	            <input type="text" id="username" name="company.company_username" placeholder="请输入账号"/>
	        </div>
	        <div class="form-list">
	            <label class="formlabel psdlabel" for="password"></label>
	            <input  type="password" id="password" name="company.company_password" placeholder="请输入密码"/>
	        </div>
	        <button type="submit">登<span style="margin-right:15px;"></span>录</button>
	    </form>
	</div>
	<div class="pcgroup">
		<div class="pc pc1"></div>
		<div class="pc pc2"></div>
		<div class="pc pc3"></div>
		<div class="pc pc4"></div>
		<div class="pc pc5"></div>
		<div class="pc pc6"></div>
	</div>
	<div class="cloudgroup">
		<div class="cloud1">
			<img src="<%=basePath %>company/static/img/cloud-1.png" />
		</div>
		<div class="cloud2">
			<img src="<%=basePath %>company/static/img/cloud-2.png" />
		</div>
		<div class="cloud3">
			<img src="<%=basePath %>company/static/img/cloud-3.png" />
		</div>
		<div class="cloud4">
			<img src="<%=basePath %>company/static/img/cloud-4.png" />
		</div>
		<div class="cloud5">
			<img src="<%=basePath %>company/static/img/cloud-5.png" />
		</div>
		<div class="cloud6">
			<img src="<%=basePath %>company/static/img/cloud-6.png" />
		</div>
		<div class="cloud7">
			<img src="<%=basePath %>company/static/img/cloud-7.png" />
		</div>
		<div class="rocket-1">
			<img src="<%=basePath %>company/static/img/rocket-1.png"/>
		</div>
		<div class="rocket-2">
			<img src="<%=basePath %>company/static/img/rocket-2.png"/>
		</div>
	</div>

</div>

<script type="text/javascript"  src="<%=basePath %>company/commonstatic/js/jquery-1.11.1.js"></script>
<script type="text/javascript"  src="<%=basePath %>company/commonstatic/js/jquery.validate.min.js"></script>
<script type="text/javascript"  src="<%=basePath %>company/commonstatic/js/GscUtil.js"></script>
<script type="text/javascript"></script>
<script>
	
    $(function(){
        $("#loginForm").validate({
            //debug:true,
            rules: {
                "company.company_username":{
                    required:true
                },
                "company.company_password":{
                    required:true
                }
            },
            messages:{
                "company.company_username":{
                    required:"用户名不能为空!"
                },
                "company.company_password":{
                    required:"密码不能为空!"
                }
            },
            submitHandler: function(form) 
            {      
            	ajax($(form).serializeObject(),function(data){
            		if(data.result){
            			//Json 转换成字符串存储到localStorage中
            			localStorage.setItem("bxbsj_userinfo", JSON.stringify(data.userinfo));
            			window.location.href="/wxkf/company/index.jsp";
            			//console.log(localStorage.getItem("bxbsj_userinfo"));
            			//var obj=JSON.parse(localStorage.getItem("bxbsj_userinfo"));
            			
            		}else{
            			alert(data.error_msg);
            		}
            		
            	})
            }
           
        })
    });
function ajax(data,fn){
	$.ajax({
    	url:"/wxkf/capi/Company_login",
    	type:"POST",
    	data:data,
    	success:function(data){
    		fn(data);
    	}
    })
}
    
   
</script>

</body>
</html>