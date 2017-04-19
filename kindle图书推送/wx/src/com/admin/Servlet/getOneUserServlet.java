package com.admin.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import com.admin.Po.User;
import com.util.DBUtil;

public class getOneUserServlet extends HttpServlet {

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
        String sql="";
        List<Map<String,Object>> list=null;
        /*留言板   分页*/
		String OPENID = request.getParameter("openid").toString();
		sql = " SELECT *  FROM USER WHERE OPENID = '"+OPENID+"' ";
		list = DBUtil.query(sql);
		if(list!=null&&list.size()!=0){
			Map<String,Object> map = list.get(0);
			User user = new User();
			user.setOpenid(map.get("OPENID").toString());
			if(map.get("EMAIL")!=null){
				user.setEmail(map.get("EMAIL").toString());
			}
			if(map.get("ACTIVEDATE")!=null){
				user.setActivedate(map.get("ACTIVEDATE").toString());
			}
			if(map.get("TIMELENGTH")!=null){
				user.setTimelength(map.get("TIMELENGTH").toString());
			}
			if(map.get("ISACTIVED")!=null){
				user.setIsactived(map.get("ISACTIVED").toString());
			}
			object.put("result", true);
			object.put("user", user);
			
		}else{
			object.put("result", false);
		}
        out.write(object.toString());//将数据以json的格式输出到ajax的回调函数。
	}

}
