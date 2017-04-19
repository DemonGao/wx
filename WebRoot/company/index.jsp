<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>首页-边学边实践</title>
    <link type="text/css" rel="stylesheet" href="<%=basePath %>company/commonstatic/font/iconfont.css" />
    <link type="text/css" rel="stylesheet" href="<%=basePath %>company/commonstatic/css/cssreset.css" />
    <link type="text/css" rel="stylesheet" href="<%=basePath %>company/static/css/pcstyle.css" />
    <link type="text/css" rel="stylesheet" href="<%=basePath %>company/commonstatic/css/Gscstyle.css" />
</head>
<script>
	if(localStorage.getItem("bxbsj_userinfo")==null){
		window.location.href="/wxkf/company/login.jsp";
	}
</script>
<body class="b-index">
<div id="bxbsj">
    <header>
        <div class="w">
            <div class="h_logo float_l margin-t-15"><a href="http://bianxuebianshijian.com/wxkf/company/index.jsp"></a></div>
            <div class="h_version color-4b float_l">企业版</div>
            <ul class="nav">
                <li>管理中心</li>
                <!--
                <li class="line"></li>
                <li>
                    <a href="http://vip.doumi.com/zhaopin/">招聘合作</a>
                </li>
                <li class="line"></li>
                <li><a href="http://www.doumi.com/bj/" target="_blank">职位</a></li>
                li class="line"></li>
                <li><a href="/">帮助中心</a></li-->
            </ul>
            <div class="float_r clearfix">
                <span class="fl color-4b margin-r-15" v-cloak>{{ui.company_username}}</span>
                <i class="fl l"></i>
                <span class="fl color-4b margin-l-15"><a v-on:click="logout()" href="javascript:;">退出</a></span>
            </div>
        </div>
    </header>
    <aside class="ad w margin-t-10"><a href="javascript:;"><img src="static/img/vip_service.jpg"  width="100%"/></a></aside>
    <article class="content w clearfix margin-t-10">
        <section class="c-l">
            <aside>
                <div class="pub-job">
                    <a v-on:click="publicJob()" href="javascript:;" class="demon_btn demon_btn_block_100 padding15 demon_btn_all_warning">发布职位</a>
                </div>
                <nav>
                    <h2><a href="#"><i class="iconfont icon-yijianfankui margin-r-10"></i>首页</a></h2>
                    <h2 class="active"><a href="#"><i class="iconfont icon-48copy2 margin-r-10"></i>职位管理</a></h2>
                    <p><a href="#" class="active">进行中</a></p>
                    <p><a href="#">已结束</a></p>
                    <h2><a href="#"><i class="iconfont icon-48copy2 margin-r-10"></i>企业信息</a></h2>
                    <p><a href="company_edit.html">信息完善</a></p>
                    <p><a v-on:click="addComapnyInfo()" href="javascript:;">企业认证</a></p>
                </nav>
            </aside>
        </section>
        <section class="c-r">
                <dl v-if="cominfo.result" class="company bg_white">
                    <dt class="company-pic">
                    	<img v-if="cominfo.list.companyinfo_img!=null"  :src="baseUrl + cominfo.list.companyinfo_img" alt="">
						<img v-else="cominfo.list.companyinfo_img!=null" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAHgAAAB4CAMAAAAOusbgAAAAeFBMVEUAwAD///+U5ZTc9twOww7G8MYwzDCH4YcfyR9x23Hw+/DY9dhm2WZG0kbT9NP0/PTL8sux7LFe115T1VM+zz7i+OIXxhes6qxr2mvA8MCe6J6M4oz6/frr+us5zjn2/fa67rqB4IF13XWn6ad83nxa1loqyirn+eccHxx4AAAC/klEQVRo3u2W2ZKiQBBF8wpCNSCyLwri7v//4bRIFVXoTBBB+DAReV5sG6lTXDITiGEYhmEYhmEYhmEYhmEY5v9i5fsZGRx9PyGDne8f6K9cfd+mKXe1yNG/0CcqYE86AkBMBh66f20deBc7wA/1WFiTwvSEpBMA2JJOBsSLxe/4QEEaJRrASP8EVF8Q74GbmevKg0saa0B8QbwBdjRyADYxIhqxAZ++IKYtciPXLQVG+imw+oo4Bu56rjEJ4GYsvPmKOAB+xlz7L5aevqUXuePWVhvWJ4eWiwUQ67mK51qPj4dFDMlRLBZTqF3SDvmr4BwtkECu5gHWPkmDfQh02WLxXuvbvC8ku8F57GsI5e0CmUwLz1kq3kD17R1In5816rGvQ5VMk5FEtIiWislTffuDpl/k/PzscdQsv8r9qWq4LRWX6tQYtTxvI3XyrwdyQxChXioOngH3dLgOFjk0all56XRi/wDFQrGQU3Os5t0wJu1GNtNKHdPqYaGYQuRDfbfDf26AGLYSyGS3ZAK4S8XuoAlxGSdYMKwqZKM9XJMtyqXi7HX/CiAZS6d8bSVUz5J36mEMFDTlAFQzxOT1dzLRljjB6+++ejFqka+mXIe6F59mw22OuOw1F4T6lg/9VjL1rLDoI9Xzl1MSYDNHnPQnt3D1EE7PrXjye/3pVpr1Z45hMUdcACc5NVQI0bOdS1WA0wuz73e7/5TNqBPhQXPEFGJNV2zNqWI7QKBd2Gn6AiBko02zuAOXeWIXjV0jNqdKegaE/kJQ6Bfs4aju04lMLkA2T5wBSYPKDGF3RKhFYEa6A1L1LG2yacmsaZ6YPOSAMKNsO+N5dNTfkc5Aqe26uxHpx7ZirvgCwJpWq/lmX1hA7LyabQ34tt5RiJKXSwQ+0KU0V5xg+hZrd4Bn1n4EID+WkQdgLfRNtvil9SPfwy+WQ7PFBWQz6dGWZBLkeJFXZGCfLUjCgGgqXo5TuSu3cugdcTv/HjqnBTEMwzAMwzAMwzAMwzAMw/zf/AFbXiOA6frlMAAAAABJRU5ErkJggg==" alt="">
                    </dt>
                    <dd class="company-text clearfix">
                        <div class="company-nm">
                            <h2 class="float_l margin-r-15" v-cloak>{{cominfo.list.companyinfo_name}}</h2>
                            <b v-if="cominfo.list.companyinfo_status==0" href="#" ><i class="iconfont icon-renzheng1"></i>未认证</b>
                            <b v-else="cominfo.list.companyinfo_status==0" href="#" class="ok"><i class="iconfont icon-renzheng1"></i>已认证</b>
                        </div>
                        <div class="company-jif">
                            <span>在招职位：<em class="color-orange">{{total}}</em></span>
                            <!-- <span>待审核职位：<em class="color-orange">0</em></span> -->
                        </div>
                    </dd>
                </dl>
                <dl v-else="cominfo.result" class="company bg_white">
                    <p class="text-center margin-t-10">您还没有进行企业信息完善</p>
                    <p class="text-center margin-t-10 margin-b-15">请点击下方完善企业信息</p>
                    <p>
                    	<a href="company_edit.html" class="demon_btn demon_btn_block_20 padding15 demon_btn_all_warning">完善信息</a>
                    </p>
                </dl>
                <div class="box margin-t-10 ">
                    <div class="box-t bg_white clearfix">
                        <h2 class="float_l">全部职位</h2>
                        <a v-on:click="SerchDate()" href="javascript:;" class="demon_btn demon_btn_inline demon_btn_all_warning padding7 float_r" style="border-radius: 0">搜索</a>
                        <input  class="from-list float_r" type="text" placeholder="请输入职位名称"  v-model="serchText"/>
                    </div>
                    <div class="box-list margin-t-10 bg_white">
                        <div v-if="!result" class="nolist clearfix">
                            <p class="margin-b-25">暂无职位，马上发布一个吧</p>
                            <a v-on:click="publicJob()" href="#" class="demon_btn demon_btn_all_warning">发布职位</a>
                        </div>
                        <div v-else="!result" class="haslist joblist">
                            <div class="jobitem clearfix" v-for="item in list">
                            	<div class="job_l">
                            		<h1>
                            			{{item.job_name}}
                            			<span class="signtabs" v-for="label in item.job_label.split(',')">{{label}}</span>
                            		</h1>
                            		<div>
                            			<p><span>工资类型:</span>{{item.job_style}}</p>
                            			<p><span>学历要求:</span>{{item.job_education}}</p>
                            			
                            		</div>
                            		<div>
                            			<p><span>职位薪资:</span>{{item.job_salary}}元</p>
                            			<p><span>招聘人数:</span>{{item.job_recivenum}}人</p>
                            		</div>
                            		
                            	</div>
                            	<div class="job_r">
                            		<a v-on:click="rejob(item.job_id)" href="javascript:;" class="demon_btn demon_btn_success">修改职位</a>
                            		<a v-on:click="closejob(item.job_id)" href="#" class="demon_btn demon_btn_primary">关闭职位</a>
                            	</div>
                            </div>
                            <div class="pageBox clearfix">
								<span style="float:left;margin: 20px 0;">当前：{{pageNum*pageSize+1}}-{{(pageNum+1)*pageSize+1}}条数据<span style="margin-right:20px"></span><span style="margin-right:20px"></span> 共 {{pageNums}}页</span>
								<ul class="pagination pagination-sm" style="float:right">
									<li><a href="javascript:;" v-on:click="page_pre()" id="page_pre"><i class="fa fa-angle-double-left">上一页</i></a></li>
									<li v-for="(i,index) in pageNums" v-on:click="page_index(index)" :class="{'active': pageNum==index}">
										<a href="javascript:;">{{i}}</a>
									</li>
									<li><a href="javascript:;" v-on:click="page_next()"><i class="fa fa-angle-double-right">下一页</i></a></li>
								</ul>		
							</div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </article>
</div>
<script type="text/javascript" src="commonstatic/js/vue.js"></script>
<script type="text/javascript"  src="commonstatic/js/jquery-1.11.1.js"></script>
<script type="text/javascript"  src="static/js/ajax.js"></script>
<script type="text/javascript">
	var bxbsj=new Vue({
		el: '#bxbsj',
		data: {
			baseUrl:'/wxkf',	//根目录
			ui:{},				//登陆者的信息
			cominfo:{},			//登陆者绑定的公司
			result:false,		//是否有job
			list:[],			//Job数组
			pageNum:0,			//当且页数
			pageNums:1,			//总页数
			pageSize:2,			//每页显示条数
			total:0,
			serchText:'',		//搜索字段
		},
		methods:{
			logout:function(){
				if(localStorage.getItem("bxbsj_userinfo")!=null){
					localStorage.removeItem("bxbsj_userinfo");
					window.location.href="/wxkf/company/login.jsp";
				}
			},
			//企业认证
			addComapnyInfo:function(){
				if(!bxbsj.cominfo.result){
					alert("您还没有完善公司信息!");
					return;
				}
				window.location.href="/wxkf/company/company_qualification.html";
			},
			//发布职位
			publicJob:function(){
				if(!bxbsj.cominfo.result){
					alert("您还没有完善公司信息!");
					return;
				}
				if(bxbsj.cominfo.list.companyinfo_status==0){
					alert("您公司未认证或认证失败,认证成功后方可发布职位!");
					return;
				}
				window.location.href="/wxkf/company/job_publish.jsp";
			},
			//修改职位
			rejob:function(job_id){
				window.location.href="/wxkf/company/job_publish.jsp?job_id="+job_id;
			},
			//关闭职位
			closejob:function(job_id){
				alert(job_id);
				var datas = AjaxTeam.closeJob(job_id);
				console.log(datas);
				if(datas.result){
					window.location.href="/wxkf/company/index.jsp";
				}else{
					alert(datas.error_msg);
				}
			},
			SerchDate:function(){
				bxbsj.pageNum=0;
				var datas = AjaxTeam.getJobs(bxbsj.ui.openid,bxbsj.serchText,bxbsj.pageNum,bxbsj.pageSize);
				if(!datas.result){
					alert("没有搜到此职位!");
					return ;
				}
				bxbsj.list = datas.list;
				bxbsj.result =  datas.result;
				bxbsj.pageNum = datas.pageNum;
				bxbsj.pageNums =datas.pageNums;	
			},
			//分页方法
			//下一页
			page_next:function(){
				if(bxbsj.pageNum>=bxbsj.pageNums-1){
					return ;
				}
				bxbsj.pageNum++
				var datas = AjaxTeam.getJobs(bxbsj.ui.openid,bxbsj.serchText,bxbsj.pageNum,bxbsj.pageSize);
				bxbsj.list = datas.list;
				bxbsj.result =  datas.result;
				bxbsj.pageNum = datas.pageNum;
				bxbsj.pageNums =datas.pageNums;	
			},
			//上一页
			page_pre:function(){
				if(bxbsj.pageNum<1){
					return ;
				}
				bxbsj.pageNum--
				var datas = AjaxTeam.getJobs(bxbsj.ui.openid,bxbsj.serchText,bxbsj.pageNum,bxbsj.pageSize);
				bxbsj.list = datas.list;
				bxbsj.result =  datas.result;
				bxbsj.pageNum = datas.pageNum;
				bxbsj.pageNums =datas.pageNums;	
			},
			//直接选页
			page_index:function(index){
				bxbsj.pageNum=index;
				var datas = AjaxTeam.getJobs(bxbsj.ui.openid,bxbsj.serchText,bxbsj.pageNum,bxbsj.pageSize);
				bxbsj.list = datas.list;
				bxbsj.result =  datas.result;
				bxbsj.pageNum = datas.pageNum;
				bxbsj.pageNums =datas.pageNums;	
			},
		}
	})
	
	bxbsj.ui = JSON.parse(localStorage.getItem("bxbsj_userinfo"));
	bxbsj.cominfo = AjaxTeam.CompanyInfo(bxbsj.ui.openid);
	
	var datas = AjaxTeam.getJobs(bxbsj.ui.openid,bxbsj.serchText,0,bxbsj.pageSize);
	console.log(datas);
	bxbsj.list = datas.list;
	bxbsj.result =  datas.result;
	bxbsj.pageNum = datas.pageNum;
	bxbsj.pageNums = datas.pageNums;			//总页数
	bxbsj.total = datas.total;
	//进行名称改换(如果公司信息完善后,会显示负责人姓名)
	if(bxbsj.cominfo.result){
		bxbsj.ui.company_username=bxbsj.cominfo.list.companyinfo_nickname;
		localStorage.setItem("bxbsj_userinfo",JSON.stringify(bxbsj.ui));
		//console.log(bxbsj.ui);
	}
	console.log(bxbsj.job);
</script>
</body>
</html>