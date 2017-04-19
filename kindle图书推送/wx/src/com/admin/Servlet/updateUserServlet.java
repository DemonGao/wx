package com.admin.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import com.util.DBUtil;

public class updateUserServlet extends HttpServlet {

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
        String email = request.getParameter("email");
        String addtimelength = request.getParameter("addtimelength");
        String sql="select * from user where openid = '"+openid+"'";
        String TIMELENGTH = "";
        List<Map<String,Object>> list = DBUtil.query(sql);
        if(list.size()!=0&&list!=null){
        	Map<String,Object> map = list.get(0);
        	
        	String ISACTIVED=map.get("ISACTIVED").toString();
        	String ACTIVEDATE = "";
        	if("false".equals(ISACTIVED)){
        		ACTIVEDATE = System.currentTimeMillis()+"";
        		TIMELENGTH = addtimelength;
        		sql="update user set ISACTIVED = '"+true+"',ACTIVEDATE='"+ACTIVEDATE+"',TIMELENGTH ='"+TIMELENGTH+"',EMAIL = '"+email+"' where OPENID = '"+openid+"'";
        		object.put("seeactivedate",DBUtil.strToDate(ACTIVEDATE));
        		object.put("seetimelimitdate",DBUtil.strToDate(Long.parseLong(ACTIVEDATE)+Long.parseLong(addtimelength)+""));
        		object.put("seetimelength",addtimelength);
        		object.put("seeemail",email);
        	}else{
        		TIMELENGTH = map.get("TIMELENGTH").toString();
        		ACTIVEDATE = map.get("ACTIVEDATE").toString();
        		//截止日期
				Long lasttime = Long.parseLong(ACTIVEDATE)+Long.parseLong(TIMELENGTH);
				//当前日期
				Long nowtime = System.currentTimeMillis();
				
        		if(nowtime>lasttime){
        			ACTIVEDATE = nowtime+"";
            		TIMELENGTH = addtimelength;
            		sql="update user set ISACTIVED = '"+true+"',ACTIVEDATE='"+ACTIVEDATE+"',TIMELENGTH ='"+TIMELENGTH+"',EMAIL = '"+email+"' where OPENID = '"+openid+"'";
            		object.put("seetimelimitdate",DBUtil.strToDate(nowtime+Long.parseLong(addtimelength)+""));
            		object.put("seetimelength",addtimelength);
            		object.put("seeemail",email);
        		}else{
        			TIMELENGTH =Long.parseLong(TIMELENGTH)+ Long.parseLong(addtimelength) +"";
        			sql="update user set TIMELENGTH ='"+TIMELENGTH+"',EMAIL = '"+email+"' where OPENID = '"+openid+"'";
        			object.put("seetimelimitdate",DBUtil.strToDate(lasttime+Long.parseLong(addtimelength)+""));
        			object.put("seetimelength",TIMELENGTH);
        			object.put("seeemail",email);
        		}
        	}
        	if(DBUtil.update(sql)){
        		object.put("result", true);
        	}else{
        		object.put("result", false);
        	}
        	out.write(object.toString());//将数据以json的格式输出到ajax的回调函数。
        }
//        if(limittime>now){
//        	timelength = Long.parseLong(timelength)+
//        	sql = "update user set timelength = '"++"'";
//        }
//        if()
//        String sql ="update activecode set activecode='"+activecode_code+"',activecode_time='"+activecode_time+"' where activecode_id='"+activecode_id+"'";
//        if(DBUtil.update(sql)){
//        	object.put("result", true);
//        }else{
//        	object.put("result", false);
//        }
//        out.write(object.toString());//将数据以json的格式输出到ajax的回调函数。
	}

}
