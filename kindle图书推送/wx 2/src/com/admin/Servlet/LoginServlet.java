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

import com.admin.Po.Admin;
import com.util.DBUtil;

import net.sf.json.JSONObject;

public class LoginServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		/*设置编码UTF-8   防止乱码*/
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		
        HttpSession session = request.getSession(); 
        
        String username =request.getParameter("username");
        String password = request.getParameter("password");
        
        String sql = "select * from admin where username='"+username+"' and password='"+password+"'";
        
        List<Map<String,Object>> list=DBUtil.query(sql);
        
        if(list!=null&&list.size()!=0){
        	session.setAttribute("admin",username);
        	response.sendRedirect("/wx/admin/page/userlist.jsp");
        }
	}

}
