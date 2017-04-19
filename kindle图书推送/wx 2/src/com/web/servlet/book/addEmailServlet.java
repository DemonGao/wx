package com.web.servlet.book;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import com.util.DBUtil;
import com.web.po.Book;

public class addEmailServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		/*设置编码UTF-8   防止乱码*/
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out=response.getWriter();
        JSONObject object =new JSONObject();//定义一个json对象
		
        HttpSession session = request.getSession(); 
        String openid = request.getParameter("openid");
        String type = request.getParameter("type");
        System.out.println(type);
        
        String sql="";
        List<Map<String,Object>> list=null;
        switch (type){
        	case "useractive" :
        		String activecode= request.getParameter("activecode").toString();
                sql="select * from activecode where ACTIVECODE='"+activecode+"' and ISUSED='false'";
        		list=DBUtil.query(sql);
        		if(list.size()!=0){
        			Map<String,Object> map = list.get(0);
        			//获取激活码的激活时间
        			String ACTIVECODE_TIME=map.get("ACTIVECODE_TIME").toString();
        			String ACTIVECODE_ID=map.get("ACTIVECODE_ID").toString();
        			String ACTIVEDATE_now = System.currentTimeMillis()+"";
        			sql="select * from user where openid='"+openid+"'";
            		list=DBUtil.query(sql);
            		if(list.size()==0){
//            			System.out.println("没有此用户");
            			//如果没有此用户 则insert
            			sql="insert into user(OPENID,ACTIVEDATE,TIMELENGTH,ISACTIVED) values('"+openid+"','"+ACTIVEDATE_now+"','"+ACTIVECODE_TIME+"','true')";
            		}else{
            			System.out.println("有有此用户");
            			String ACTIVEDATE="";
            			if(list.get(0).get("ACTIVEDATE")!=null&&list.get(0).get("ACTIVEDATE")!=""){
            				System.out.println("激活时间存在");
            				ACTIVEDATE = list.get(0).get("ACTIVEDATE").toString();
            			}else{
            				System.out.println("激活时间为空");
            				ACTIVEDATE=ACTIVEDATE_now;
            			}
            			String ISACTIVED=list.get(0).get("ISACTIVED").toString();
            			if("true".equals(ISACTIVED)){
            				//如果已经激活，并且想续费，则执行
            				String TIMELENGTH=list.get(0).get("TIMELENGTH").toString();
            				//判断是否过期
            				if(Long.parseLong(ACTIVEDATE_now)>Long.parseLong(ACTIVEDATE)+Long.parseLong(TIMELENGTH)){
            					//如果激活日期已经过期
            					sql="UPDATE user SET ACTIVEDATE='"+ACTIVEDATE_now+"',TIMELENGTH='"+ACTIVECODE_TIME+"',ISACTIVED='true' where openid='"+openid+"'";
            				}else{
            					//如果激活日期没有过期
            					//激活时长
            					ACTIVECODE_TIME = Long.parseLong(ACTIVECODE_TIME)+Long.parseLong(TIMELENGTH)+"";
            					sql="UPDATE user SET ACTIVEDATE='"+ACTIVEDATE+"',TIMELENGTH='"+ACTIVECODE_TIME+"',ISACTIVED='true' where openid='"+openid+"'";
                				
            				}
            			}else{
            				sql="UPDATE user SET ACTIVEDATE='"+ACTIVEDATE+"',TIMELENGTH='"+ACTIVECODE_TIME+"',ISACTIVED='true' where openid='"+openid+"'";
            			}
            		}
            		if(DBUtil.update(sql)){
//            			System.out.println("用户激活");
            			sql="update activecode SET ISUSED='true' where ACTIVECODE_ID='"+ACTIVECODE_ID+"'";
            			if(DBUtil.update(sql)){
            				object.put("result", true);
    	        			//计算到期时间
    	        			object.put("time", DBUtil.strToDate(ACTIVECODE_TIME, ACTIVEDATE_now));
            			}
	        		}else{
	        	        object.put("result", false);
	        	        object.put("msg", "激活失败");
	        		}
        		}else{
        			object.put("result", false);
        			object.put("msg", "此激活码已被使用");
        			System.out.println("此激活码已被使用");
        		}
        		break;
        	case "kindleBind" :
        		String email = request.getParameter("email");
                list=null;
                sql="select COUNT(*) NUM from user where openid='"+openid+"'";
        		list=DBUtil.query(sql);
        		if(list.size()!=0){
        			int num=Integer.parseInt(list.get(0).get("NUM").toString());
        			if(num==0){
        				//如果没有此用户 则insert
        				sql="insert into user(OPENID,EMAIL,ISACTIVED) values('"+openid+"','"+email+"','false')";
        			}else if(num==1){
        				//如果有此用户信息,则update
        				sql="UPDATE user SET email='"+email+"' where openid='"+openid+"'";
        			}
        		}
        		if(DBUtil.update(sql)){
        			object.put("result", true);
        			object.put("email", email);
        		}else{
        	        object.put("result", false);
        		}
        		break;
        }
        out.write(object.toString());//将数据以json的格式输出到ajax的回调函数。
	}
}
