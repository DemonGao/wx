<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>边学边实践-修改工作信息</title>
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
                <form action="<%=basePath%>pc/add2" method="post" id="companyinfoForm">
                    <div class="box-defalut-tip padding10 margin-t-15" >
                        <h3 class="margin-l-10">基本信息</h3>
                    </div>
                    
                    <div class="listform">
                            <div class="form-group">
                                <label for="companyinfo_name">职位名称</label>
                                <input type="text" id="job_name" class="inputtext" name="job.job_name" />
                            </div>
                            <div class="form-group">
                                <label for="companyinfo_address">工资</label>
                                <input type="text" id="job_salary" class="inputtext" name="job.job_salary" />
                            </div>
                            <div class="form-group">
                                <label for="companyinfo_about">期限</label>
                                <input type="text" id="job_limittime" class="inputtext" name="job.job_limittime" />
                            </div>
                            <div class="form-group">
                                <label for="companyinfo_about">学历</label>
                                <input type="text" id="job_education" class="inputtext" name="job.job_education" />
                            </div>
                            <div class="form-group">
                                <label for="companyinfo_about">职位标签</label>
                                <input type="text" id="job_label" class="inputtext" name="job.job_label" />
                            </div>
                            <div class="form-group">
                                <label for="companyinfo_about">招聘人数</label>
                                <input type="text" id="job_recivenum" class="inputtext" name="job.job_recivenum" />
                            </div>
                            <div class="form-group">
                                <label for="companyinfo_about">职位要求</label>
                                <textarea form="companyinfoForm" name="job.job_require" id="job_require" class="inputtextarea" cols="30" rows="5"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="companyinfo_about">职位分类</label>
                                <input type="text" id="job_type" class="inputtext" name="job.job_type" />
                            </div>
                            <div class="form-group">
                                <label for="companyinfo_about">职位类型</label>
                                <input type="text" id="job_style" class="inputtext" name="job.job_style" />
                            </div>
                            <div class="form-group">
                                <input type="hidden" id="openid" name="job.companyinfo.openid" class="inputtext" value="<%=session.getAttribute("OPENID") %>">
                                <!--<input type="hidden" id="job_examine" name="job.job_examine" class="inputtext" value="0">-->
                            </div>
                    </div>
                    
                    <div class="form-group">
                            <label for="companyinfo_img"></label>
                             <button type="button" onclick="btn3()">提交</button>
                            <input type="submit" id="btn2" class="demon_btn demon_btn_primary bg_white " style="width: 150px;padding: 10px auto" value="立即修改" onclick="btn2()"/>
                    </div>
                    <input type="hidden" id="job_id" name="job_id" class="job.job_id">
                    <input type="hidden" id="openid" name="openid" class="companyinfo.openid" value="<%=session.getAttribute("OPENID") %>">
                </form>
            </div>
        </div>
    </section>
</article>

<script type="text/javascript" src="<%=basePath%>pc/commonstatic/js/vue.js"></script>
<script type="text/javascript"  src="<%=basePath%>pc/commonstatic/js/jquery-1.11.1.js"></script>
<script type="text/javascript"  src="<%=basePath%>pc/commonstatic/js/jquery.validate.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
 var job_id=${param.job_id};

 $.ajax({
            type: 'POST',
            url: '<%=basePath%>pcd/Job_query',
            data: {
                "job_id":job_id
	        	},
            dataType: 'json',
            cache: false,
            success: function(data) {
              var list=data.list;
              
              document.getElementById("job_name").value=list.job_name;
              document.getElementById("job_salary").value=list.job_salary;
              document.getElementById("job_limittime").value=list.job_limittime;
              document.getElementById("job_education").value=list.job_education;
              document.getElementById("job_label").value=list.job_label;
              document.getElementById("job_recivenum").value=list.job_recivenum;
              document.getElementById("job_require").value=list.job_require;
              document.getElementById("job_type").value=list.job_type;
              document.getElementById("job_style").value=list.job_style;
              document.getElementById("job_id").value=list.job_id;
              
                
            }
          });
          
          
       });
       

function btn3(){
   
   var job_name= document.getElementById("job_name").value;
   var job_salary= document.getElementById("job_salary").value;
   var job_limittime= document.getElementById("job_limittime").value;
   var job_education= document.getElementById("job_education").value;
   var job_label= document.getElementById("job_label").value;
   var job_recivenum= document.getElementById("job_recivenum").value;
   var job_require= document.getElementById("job_require").value;
   var job_style= document.getElementById("job_style").value;
   var job_require= document.getElementById("job_require").value;
   var job_id= document.getElementById("job_id").value;
   
    alert(job_id);
   
   
  if(job_name==""||job_salary==""||job_limittime==""||job_education==""||job_label==""||job_recivenum==""||job_require==""||job_style==""||job_type==""){
     document.getElementById("group").innerHTML="亲 ，每个内容都不能为空哦！";
     return ;
   }
   if(parseInt(job_salary)!=job_salary){
   alert(22);
   document.getElementById("group").innerHTML="亲 ，您的工资格式不对哦，只能是数字哦！";
     return;
   }
   if("<%=session.getAttribute("STATIC") %>"=="未验证"){
   document.getElementById("group").innerHTML="亲 ，请先填写公司资料通过认证后才可以发布职位哦！";
     return;
   }
   	$("#companyinfoForm").submit();
   
};

</script>

</body>
</html>