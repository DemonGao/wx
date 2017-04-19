package com.web.servlet.book;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.DBUtil;

import net.sf.json.JSONObject;

public class getEmailServlet extends HttpServlet {

	
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
        String sql ="select email from user where openid='"+openid+"'";
        List<Map<String,Object>> list=DBUtil.query(sql);
        if(list!=null&&list.size()!=0){
        	if(list.get(0).get("EMAIL")!=null){
        		String email = list.get(0).get("EMAIL").toString();
            	object.put("result", true);
            	object.put("email", email);
        	}else{
        		object.put("result", false);
            	object.put("email", "您之前还没有绑定邮箱");
        	}
//        	String email = list.get(0).get("EMAIL").toString();
//        	object.put("result", true);
//        	object.put("email", email);
        	System.out.println("getEmail");
        }else{
        	object.put("result", false);
        }
//        switch(type){
//        
//        	case "pushbook":
//        		sql="select * from book where ";
//        		break;
//        }
        
        
        
        out.write(object.toString());//将数据以json的格式输出到ajax的回调函数。
	}

}
