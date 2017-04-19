<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	
%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>首页-边学边实践</title>
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
                <span class="fl color-4b margin-r-15"><%=session.getAttribute("USERNAME")%></span>
                <i class="fl l"></i>
                <span class="fl color-4b margin-l-15"><form action="<%=basePath%>pc/exit" method="post" id=""><input type="submit" value="退出"></form></span>
            </div>
        </div>
    </header>
    <aside class="ad w margin-t-10"><a href="javascript:;"><img src="<%=basePath%>pc/static/img/vip_service.jpg"  width="100%"/></a></aside>
    <article class="content w clearfix margin-t-10">
        <section class="c-l">
            <aside>
                <div class="pub-job">
                    <a href="<%=basePath%>pc/static/job_release.jsp" class="demon_btn demon_btn_block_100 padding15 demon_btn_all_warning" id="pub_btn">发布职位</a>
                </div>
                <nav>
                    <h2><a href="active"><i class="iconfont icon-yijianfankui margin-r-10"></i>首页</a></h2>
                    <h2><a href="#"><i class="iconfont icon-48copy2 margin-r-10"></i>企业信息</a></h2>
                    <p><a href="<%=basePath%>pc/static/company_edit.jsp" >企业注册</a></p>
                    <p><a href="<%=basePath%>pc/authentication.jsp">企业认证</a></p>
                    <p><a href="#">企业资料</a></p>
                </nav>
            </aside>
        </section>
        <section class="c-r">
                <dl class="company bg_white">
                    <dt class="company-pic"></dt>
                    <dd class="company-text clearfix">
                        <div class="company-nm">
                            <h2 class="float_l margin-r-15"><%=session.getAttribute("USERNAME") %></h2>
                            <!--<a href="#" ><i class="iconfont icon-renzheng1"></i>未认证</a>-->
                            <a href="#" class="ok"><i class="iconfont icon-renzheng1"></i><span id="status"><%=session.getAttribute("STATIC") %></a>
                        </div>
                        <div class="company-jif">
                            <span>在招职位：<em class="color-orange"><span id="zz"></span></em></span>
                            <span>待审核职位：<em class="color-orange"><span id="examine"></em></span>
                        </div>
                    </dd>
                </dl>
                <div class="box margin-t-10 ">
                    <div class="box-t bg_white clearfix">
                        <h2 class="float_l">全部职位</h2>
                       <!-- <a href="#" class="demon_btn demon_btn_inline demon_btn_all_warning padding7 float_r" style="border-radius: 0">搜索</a>-->
                        <input id="examine" class="demon_btn demon_btn_inline demon_btn_all_warning padding7 float_r" type="button" onClick="examine()" value="搜索" style="border-radius: 0"/>
                        <input id="from-list" class="from-list float_r" type="text" placeholder="请输入职位名称" />
                    </div>
                    <div class="box-list margin-t-10 bg_white">
                        <div class="nolist clearfix" id="nolist">
                            <p class="margin-b-25">暂无职位，马上发布一个吧</p>
                            <a href="<%=basePath%>pc/static/job_release.jsp" class="demon_btn demon_btn_all_warning">发布职位</a>
                        </div>
                        <div id="tolist">
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </article>

<script type="text/javascript" src="<%=basePath%>pc/commonstatic/js/vue.js"></script>
<script type="text/javascript" src="<%=basePath %>pc/commonstatic/js/jquery-1.11.1.js"></script>
<script type="text/javascript">
 var stid="";   
   
$(document).ready(function(){
 var pageNum=0;
  
  $.ajax({
            type: 'POST',
            url: '<%=basePath%>pcd/Job_querys',
            data: {
            	"pageNum":pageNum,
	        	"type":"id",
	        	"signarg":"<%=session.getAttribute("OPENID")%>",
	        	},
            dataType: 'json',
            cache: false,
            success: function(data) {
           console.log(data);
            document.getElementById("zz").innerText=data.total;
          
           
            var list=data.list;
            var total=data.total;
            var value="";
            var valuet="";
            var examine=0;
            
            if(list!=null){
            for(var i=0;i<list.length;i++){
            var st=list[i];
	        var status=st.companyinfo.companyinfo_status;
	       var jobid=st.job_id;
	          
	       stid=st.job_id;
	       		value+='<table><tr><th>职位名称</th><th>工资</th><th>学历</th><th>职位分类</th><th>招聘人数</th><th>发布时间</th><th colspan="2">操作</th>';
	            value+="<tr><td class='t1' style='width=50px;'>"+st.job_name+"</td><td class='t1'>"+st.job_salary+"</td>"+
	    "<td class='t1'>"+st.job_education+"</td><td class='t1'>"+st.job_type+"</td><td class='t1'>"+st.job_recivenum+"</td><td class='t1'>"+st.job_time+"</td><td><a href='<%=basePath%>pc/static/job_update.jsp?job_id="+jobid+"' class='demon'>修改职位</a></td>"+
	            "<td><input id='jobdelete' class='jobdelete' onClick='jobdelete()' value='删除' type='button' style='border-radius: 0'/></td><td><input type='hidden' id='job_id' class='job_id' value="+st.job_id+"></td></tr>";
	           if(st.job_examine==1){
	           examine+=1;
	           }
	        } 
            value+='</tr></table>';
	        valuet+="<div><p class='pageNum'><input id='ye1' class='demon' type='button' onClick='page1()' value='上一页' style=’border-radius: 0'/><input id='ye2' class='demon' type='button' onClick='page2()' value='下一页' style='border-radius: 0'/></p>";
	        valuet+="<p>总条数：<span id='ztotal' >"+data.total+"</span> 当前页：<span id='dpageNum'>"+data.pageNum+"</span></div></p>"
	        document.getElementById("examine").innerHTML=examine;
	        document.getElementById("nolist").innerHTML=value;
	        document.getElementById("tolist").innerHTML=valuet;
	        
	        document.getElementById("tolist").style.display="block";
	      } 
	      
    },
            error: function(err) {
                alert("有点小问题哦");
            }
        });
    });
    

 /** 搜索**/   
 function examine(){
   var pageNum=0;
   var type="name";
   var value="";
   var signarg=document.getElementById("from-list").value;
 
  if(signarg==""){
   return;
  }
   $.ajax({
            type: 'POST',
            url: '<%=basePath%>pcd/Job_querys',
            data: {
            	"pageNum":pageNum,
	        	"type":type,
	        	"signarg":signarg,
	        	},
            dataType: 'json',
            cache: false,
            success: function(data) {
             var list=data.list;
              
            if(list!=null){
            for(var i=0;i<list.length;i++){
            var st=list[i];
           
	       stid=st.job_id;
	      
	            value+="<div><table class=''><tr><td class='t1'></td><td class='t1' style='width=50px;'>职位名称:"+st.job_name+"</td><td class='t1'>工资:"+st.job_salary+"</td>"+
	    "<td class='t1'>学历:"+st.job_education+"</td><td class='t1'>职位标签:"+st.job_label+"</td><td class='t1'>招聘人数:"+st.job_recivenum+"</td><td class='t1'>职位要求:"
	    +st.job_require+"</td><td class='t1'>职位分类:"+st.job_type+"</td><td class='t1'>发布时间:"+st.job_time+"</td></tr></table><a href='job_update.jsp' class='demon' target=_blank>修改职位</a>"+
	     "<input id='jobdelete' class='jobdelete' onClick='jobdelete()' value='删除' type='button' style='border-radius: 0'/></div>";
	       
	        }
	          document.getElementById("nolist").innerHTML=value;   
            }else{
            document.getElementById("nolist").innerHTML="没有搜索到哦";
            document.getElementById("tolist").style.display="none";
            }
          }
       });
    };
    
/**删除简历**/
function jobdelete(){

   stid=document.getElementById("job_id").value;
   alert(stid);
    $.ajax({
            type: 'POST',
            url: '<%=basePath%>pcd/Job_delete',
            data: {
               "job_id":stid,
               "companyinfo":"<%=session.getAttribute("OPENID")%>"
	        	},
            dataType: 'json',
            cache: false,
            success: function(data) {
              if(data.result==true){
            window.location.href="<%=basePath%>pc/static/index.jsp";
            }else if(data.result==false){
            alert("删除失败了呢。。。");
            }
            }
           }); 

};

/**翻页下一页**/
function page2(){

   var ztotal=document.getElementById("ztotal").innerHTML;
   var ztota=parseInt(ztotal);
   var pageNu=document.getElementById("dpageNum").innerHTML;
   var pageNum=parseInt(pageNu);
   var ye=Math.ceil(ztotal/3);
  alert(pageNum);
  if(pageNum<ye){
  $.ajax({
            type: 'POST',
            url: '<%=basePath%>pcd/Job_querys',
            data: {
            	"pageNum":pageNum,
	        	"type":"id",
	        	"signarg":"<%=session.getAttribute("OPENID")%>",
	        	},
            dataType: 'json',
            cache: false,
            success: function(data) {
           
            document.getElementById("zz").innerText=data.total;
          
           
            var list=data.list;
            var total=data.total;
            var value="";
            var valuet="";
            var examine=0;
            
            if(list!=null){
            for(var i=0;i<list.length;i++){
            var st=list[i];
	        var status=st.companyinfo.companyinfo_status;
	       var jobid=st.job_id;
	          
	       stid=st.job_id;
	       
	            value+="<div><table class=''><tr><td class='t1'></td><td class='t1' style='width=50px;'>职位名称:"+st.job_name+"</td><td class='t1'>工资:"+st.job_salary+"</td>"+
	    "<td class='t1'>学历:"+st.job_education+"</td><td class='t1'>职位标签:"+st.job_label+"</td><td class='t1'>招聘人数:"+st.job_recivenum+"</td><td class='t1'>职位要求:"
	    +st.job_require+"</td><td class='t1'>职位分类:"+st.job_type+"</td><td class='t1'>发布时间:"+st.job_time+"</td></tr></table><a href='<%=basePath%>pc/static/job_update.jsp?job_id="+jobid+"' class='demon' target=_blank>修改职位</a>"+
	            "<input id='jobdelete' class='jobdelete' onClick='jobdelete()' value='删除' type='button' style='border-radius: 0'/></div>";
	           if(st.job_examine==1){
	           examine+=1;
	           }
	        } 	
            valuet+="<div><table><tr><td>总条数：</td><td id='ztotal' >"+data.total+"</td><input id='ye1' class='demon' type='button' onClick='page1()' value='上一页' style=’border-radius: 0'/><td>当前页：</td><td id='dpageNum'>"+data.pageNum+"</td><input id='ye2' class='demon' type='button' onClick='page2()' value='下一页' style='border-radius: 0'/></tr></table></div>";	       
	        document.getElementById("examine").innerHTML=examine;
	        document.getElementById("nolist").innerHTML=value;
	        document.getElementById("tolist").innerHTML=valuet;    
	      }                
            },
            error: function(err) {
                alert("有点小问题哦");
            }
        });
      }  
};	

/**翻页上一页**/
function page1(){
   var pageNu=document.getElementById("dpageNum").innerHTML;
   var pageNum=parseInt(pageNu);
   
  alert(pageNum);
  if(pageNum>1){
  pageNum=pageNum-2
  $.ajax({
            type: 'POST',
            url: '<%=basePath%>pcd/Job_querys',
            data: {
            	"pageNum":pageNum,
	        	"type":"id",
	        	"signarg":"<%=session.getAttribute("OPENID")%>",
	        	},
            dataType: 'json',
            cache: false,
            success: function(data) {
            document.getElementById("zz").innerText=data.total;
          
            var list=data.list;
            var total=data.total;
            var value="";
            var valuet="";
            var examine=0;
            
            if(list!=null){
            for(var i=0;i<list.length;i++){
            var st=list[i];
	        var status=st.companyinfo.companyinfo_status;
	       var jobid=st.job_id;
	          
	       stid=st.job_id;
	       
	            value+="<div><table class=''><tr><td class='t1'></td><td class='t1' style='width=50px;'>职位名称:"+st.job_name+"</td><td class='t1'>工资:"+st.job_salary+"</td>"+
	    "<td class='t1'>学历:"+st.job_education+"</td><td class='t1'>职位标签:"+st.job_label+"</td><td class='t1'>招聘人数:"+st.job_recivenum+"</td><td class='t1'>职位要求:"
	    +st.job_require+"</td><td class='t1'>职位分类:"+st.job_type+"</td><td class='t1'>发布时间:"+st.job_time+"</td></tr></table><a href='<%=basePath%>pc/static/job_update.jsp?job_id="+jobid+"' class='demon' target=_blank>修改职位</a>"+
	            "<input id='jobdelete' class='jobdelete' onClick='jobdelete()' value='删除' type='button' style='border-radius: 0'/></div>";
	           if(st.job_examine==1){
	           examine+=1;
	           }
	        } 	
            valuet+="<div><table><tr><td>总条数：</td><td id='ztotal' >"+data.total+"</td><input id='ye1' class='demon' type='button' onClick='page1()' value='上一页' style=’border-radius: 0'/><td>当前页：</td><td id='dpageNum'>"+data.pageNum+"</td><input id='ye2' class='demon' type='button' onClick='page2()' value='下一页' style='border-radius: 0'/></tr></table></div>";	       
	        document.getElementById("examine").innerHTML=examine;
	        document.getElementById("nolist").innerHTML=value;
	        document.getElementById("tolist").innerHTML=valuet;    
	      }                
            },
            error: function(err) {
                alert("有点小问题哦");
            }
        });
      }  
};	      

</script>

</body>
</html>