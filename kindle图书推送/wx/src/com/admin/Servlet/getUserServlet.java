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

import com.admin.Po.User;
import com.util.DBUtil;
import com.web.po.Book;
import com.wx.po.UnionID;

import net.sf.json.JSONObject;

public class getUserServlet extends HttpServlet {

	
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
		String currentPage = request.getParameter("currentPage");
		int pageSize =Integer.parseInt(request.getParameter("pageSize").toString());
		int total = 0;
		int pageNum = 0;
		int start = 0;
		int end = 0;
		sql = " SELECT COUNT(1) NUM FROM USER ";
		list = DBUtil.query(sql);
		total=list.size();
		start = (Integer.parseInt(currentPage) - 1)*pageSize;
		end = Integer.parseInt(currentPage)*pageSize;
		
		if(list != null && list.size() > 0){
			total = Integer.parseInt(String.valueOf(list.get(0).get("NUM")));
		}
		pageNum = (total -1)/pageSize + 1; 	
		
		sql="SELECT * FROM user LIMIT "+start+","+pageSize;
		
		list = DBUtil.query(sql);
		if(list!=null&&list.size()!=0){
			
			List<User> users=new ArrayList<User>();
			for(Map<String,Object> map : list){
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
				users.add(user);
			}
			object.put("result", true);
			object.put("users", users);
			object.put("pageNum",pageNum);
			object.put("currentPage",currentPage);
			
		}else{
			object.put("result", false);
		}
        out.write(object.toString());//将数据以json的格式输出到ajax的回调函数。
	}

}
