package com.admin.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import com.util.DBUtil;
import com.util.RandomNum;

public class addActiveServlet extends HttpServlet {

	
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
        
        String activecode_time = request.getParameter("activecode_time");
        
        int activecode_num =Integer.parseInt(request.getParameter("activecode_num").toString());
        String sql = "";
        for(int i=0;i<activecode_num;i++){
        	String activecode = RandomNum.generateLowerString(16);
        	while(true){
        		sql="select activecode from activecode where activecode ='"+activecode+"'";
        		if(DBUtil.query(sql).size()==0){
        			break ;
            	}
        		activecode = RandomNum.generateLowerString(16);
        	}
        	sql="insert into activecode(ACTIVECODE_TIME,ACTIVECODE) value('"+activecode_time+"','"+activecode+"')";
        	if(!DBUtil.update(sql)){
        		object.put("result", false);
                out.write(object.toString());//将数据以json的格式输出到ajax的回调函数。
        		return;
        	}
        }
        object.put("result", true);
        out.write(object.toString());//将数据以json的格式输出到ajax的回调函数。
	}

}
