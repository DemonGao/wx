<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>

<head>
    <title>已感兴趣职位</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">

    <meta name="description" content="Write an awesome description for your new site here. You can edit this line in _config.yml. It will appear in your document head meta (for Google search results) and in your feed.xml site description.
">
    <link rel="stylesheet" href="../static/font/iconfont.css" />
    <link rel="stylesheet" href="../static/JqueryWeUI/lib/weui.min.css">
    <link rel="stylesheet" href="../static/JqueryWeUI/css/jquery-weui.css">
    <link rel="stylesheet" href="../static/css/style.css" />
    <link rel="stylesheet" href="../static/css/practical.css" />
</head>

<body ontouchstart>
<div class="weui_panel weui_panel_access" style="margin-top: 0;" id="bxbsj">
    <!--<div class="weui_panel_hd">图文组合列表</div>-->
    <div class="weui_panel_bd" id="content">
        <a v-for="item in data" :href="getjobHref(item.job.job_id)" class="weui_media_box weui_media_appmsg">
            <div class="weui_media_hd">
                <img class="weui_media_appmsg_thumb" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAHgAAAB4CAMAAAAOusbgAAAAeFBMVEUAwAD///+U5ZTc9twOww7G8MYwzDCH4YcfyR9x23Hw+/DY9dhm2WZG0kbT9NP0/PTL8sux7LFe115T1VM+zz7i+OIXxhes6qxr2mvA8MCe6J6M4oz6/frr+us5zjn2/fa67rqB4IF13XWn6ad83nxa1loqyirn+eccHxx4AAAC/klEQVRo3u2W2ZKiQBBF8wpCNSCyLwri7v//4bRIFVXoTBBB+DAReV5sG6lTXDITiGEYhmEYhmEYhmEYhmEY5v9i5fsZGRx9PyGDne8f6K9cfd+mKXe1yNG/0CcqYE86AkBMBh66f20deBc7wA/1WFiTwvSEpBMA2JJOBsSLxe/4QEEaJRrASP8EVF8Q74GbmevKg0saa0B8QbwBdjRyADYxIhqxAZ++IKYtciPXLQVG+imw+oo4Bu56rjEJ4GYsvPmKOAB+xlz7L5aevqUXuePWVhvWJ4eWiwUQ67mK51qPj4dFDMlRLBZTqF3SDvmr4BwtkECu5gHWPkmDfQh02WLxXuvbvC8ku8F57GsI5e0CmUwLz1kq3kD17R1In5816rGvQ5VMk5FEtIiWislTffuDpl/k/PzscdQsv8r9qWq4LRWX6tQYtTxvI3XyrwdyQxChXioOngH3dLgOFjk0all56XRi/wDFQrGQU3Os5t0wJu1GNtNKHdPqYaGYQuRDfbfDf26AGLYSyGS3ZAK4S8XuoAlxGSdYMKwqZKM9XJMtyqXi7HX/CiAZS6d8bSVUz5J36mEMFDTlAFQzxOT1dzLRljjB6+++ejFqka+mXIe6F59mw22OuOw1F4T6lg/9VjL1rLDoI9Xzl1MSYDNHnPQnt3D1EE7PrXjye/3pVpr1Z45hMUdcACc5NVQI0bOdS1WA0wuz73e7/5TNqBPhQXPEFGJNV2zNqWI7QKBd2Gn6AiBko02zuAOXeWIXjV0jNqdKegaE/kJQ6Bfs4aju04lMLkA2T5wBSYPKDGF3RKhFYEa6A1L1LG2yacmsaZ6YPOSAMKNsO+N5dNTfkc5Aqe26uxHpx7ZirvgCwJpWq/lmX1hA7LyabQ34tt5RiJKXSwQ+0KU0V5xg+hZrd4Bn1n4EID+WkQdgLfRNtvil9SPfwy+WQ7PFBWQz6dGWZBLkeJFXZGCfLUjCgGgqXo5TuSu3cugdcTv/HjqnBTEMwzAMwzAMwzAMwzAMw/zf/AFbXiOA6frlMAAAAABJRU5ErkJggg==" alt="">
            </div>
            <div class="weui_media_bd">
                <h4 class="weui_media_title">{{item.job.job_name}}</h4>
                <p class="weui_media_desc margin-b-5">{{item.job.companyinfo.companyinfo_name}}<i v-if="item.job.companyinfo.companyinfo_status==1" class="iconfont icon-renzheng color-warning margin-l-5"></i></p>
                <p class="weui_media_desc"><span class="color-warning">{{item.job.job_salary | money}}K元/月</span> | {{item.job.companyinfo.companyinfo_city}} | {{item.job.job_education}}</p>
            </div>
        </a>
    </div>
    <a v-if="pageNums!=1" v-on:click="getMore()" class="weui_panel_ft" id="nextpage" href="javascript:void(0);">查看更多</a>
</div>

<script src="../static/JqueryWeUI/lib/jquery-2.1.4.js"></script>
<script src="../static/JqueryWeUI/lib/fastclick.js"></script>
<script>
    $(function() {
        FastClick.attach(document.body);

    });
</script>
<script src="../static/JqueryWeUI/js/jquery-weui.js"></script>
<script type="text/javascript" src="../static/js/vue.js" ></script>
<script type="text/javascript">
$.showLoading();
Vue.filter('money', function (input) {
    return (input/1000).toFixed(1)
})
var bxbsj  =new Vue({
	el: '#bxbsj',
	data: {
		data:[],
		pageNum:0,
		pageNums:1,
		pageSize:10,
	},
	methods:{
		getjobHref:function(val){
            return '/wxkf/bxbsj/page/recruitment.jsp?job_id=' + val 
        },
		getMore:function(){
			this.pageNum++
			if(this.pageNum>=this.pageNums){
				alert("没有数据了");
				return ;
			}
			alert(bxbsj.pageNum);
			$.ajax({
				url:"/wxkf/api/JobCollection_querys",
				type:"POST",
				data:{
					"pageNum":this.pageNum,
					"pageSize":this.pageSize,
					"type":"jobCollection",
					"signarg":localStorage.getItem("openid"),
					//"signarg":"o6yKmw8QEd6vVrud2ZpBBMLG8z3Y"
				},
				success:function(data){
					$.hideLoading();
					console.log(bxbsj.data);
					bxbsj.data=bxbsj.data.concat(data.list);//数据拼接
					bxbsj.pageNum=data.pageNum;
					bxbsj.pageNums=data.pageNums;
				}
			});
		}
	}
});
$.ajax({
	url:"/wxkf/api/JobCollection_querys",
	type:"POST",
	data:{
		"pageNum":0,
		"pageSize":bxbsj.pageSize,
		"type":"jobCollection",
		"signarg":localStorage.getItem("openid"),
		//"signarg":"o6yKmw0KDIv18KyJ7zxuI4Nt4P8E"
	},
	success:function(data){
		$.hideLoading();
		bxbsj.data=data.list;
		bxbsj.pageNum=data.pageNum;
		bxbsj.pageNums=data.pageNums;
	}
});
</script>
</body>
</html>