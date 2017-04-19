<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>边学边实践-发布职位</title>
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
            <span class="fl color-4b margin-r-15"><%=session.getAttribute("USERNAME") %><%=session.getAttribute("OPENID") %></span>
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
                <form action="<%=basePath%>pc/add1" method="post" id="jobreleaseform">
                    <div class="box-defalut-tip padding10 margin-t-15" >
                        <h3 class="margin-l-10">基本信息</h3>
                    </div>
                    
                    <div class="listform">
                            <div class="form-group">
                                <label for="companyinfo_name">职位名称</label>
                                <input type="text" id="job_name" class="inputtext" name="job.job_name" placeholder="请输入职位名称"/>
                            </div>
                            <div class="form-group">
                                <label for="companyinfo_address">工资</label>
                                <input type="number" id="job_salary" class="inputtext number" name="job.job_salary" placeholder="请输入工资" />
                                <span>元</span>
                            </div>
                            <div class="form-group">
                                <label for="companyinfo_about">期限</label>
                                <input type="number" id="job_limittime" class="inputtext number" name="job.job_limittime" placeholder="请输入职位招募期限"/>
                                <span>天</span>
                            </div>
                            <div class="form-group">
                                <label for="companyinfo_about">学历</label>
                                <input type="text" id="job_education" class="inputtext" name="job.job_education" />
                            </div>
                            <div class="form-group">
                                <label for="companyinfo_about">职位标签</label>
                                <input type="text" id="job_label" class="inputtext" name="job.job_label"  />
                            </div>
                            <div class="form-group">
                                <label for="companyinfo_about">招聘人数</label>
                                <input type="number" id="job_recivenum" class="inputtext number" name="job.job_recivenum" />
                                <span>人</span>
                            </div>
                            <div class="form-group">
                                <label for="companyinfo_about">职位要求</label>
                                <textarea form="jobreleaseform" name="job.job_require" id="job_require" class="inputtextarea" cols="30" rows="5"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="companyinfo_about">工作类型</label>
                                <input type="text" id="job_style" class="inputtext" name="job.job_style" />
                            </div>
                            <div class="form-group">
                                <label for="companyinfo_about">职位分类</label>
                                <input type="text" id="job_type" class="inputtext" name="job.job_type" />
                            </div>
                            <div class="form-group" id="group"></div>
                    </div>
                    
                    <div class="form-group">
                            <label for="companyinfo_img"></label>
                            <button type="button" onclick="btn2()">提交</button>
                            <button type="submit">提交</button>
                    </div>
                  
                    <input type="hidden" id="openid" name="job.companyinfo.openid" class="companyinfo.openid" value="<%=session.getAttribute("OPENID") %>">
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

   var job_name= document.getElementById("job_name").value;
   var job_salary= document.getElementById("job_salary").value;
   var job_limittime= document.getElementById("job_limittime").value;
   var job_education= document.getElementById("job_education").value;
   var job_label= document.getElementById("job_label").value;
   var job_recivenum= document.getElementById("job_recivenum").value;
   var job_require= document.getElementById("job_require").value;
   var job_style= document.getElementById("job_style").value;
   var job_type= document.getElementById("job_type").value;
   
 
   if(job_name==""||job_salary==""||job_limittime==""||job_education==""||job_label==""||job_recivenum==""||job_require==""||job_style==""||job_type==""){
     document.getElementById("group").innerHTML="亲 ，每个内容都不能为空哦！";
     return ;
   }
   if(parseInt(job_salary)!=job_salary){
   document.getElementById("group").innerHTML="亲 ，您的工资格式不对哦，只能是数字哦！";
     return;
   }
   if("<%=session.getAttribute("STATIC") %>"=="未验证"){
   document.getElementById("group").innerHTML="亲 ，请先填写公司资料通过认证后才可以发布职位哦！";
     return;
   }
   	$("#jobreleaseform").submit();
}
</script>

</body>
</html>