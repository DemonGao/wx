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

import com.admin.Po.ActiveCode;
import com.util.DBUtil;
import com.web.po.Book;

public class getActiveServlet extends HttpServlet {

	
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
        String serchTag = request.getParameter("serchTag");//获取搜索的字段名
        String sql="";
        List<Map<String,Object>> list=null;
        /*留言板   分页*/
		String currentPage = request.getParameter("currentPage");
		int total = 0;
		int pageSize=4;
		if(request.getParameter("pageSize")!=null){
			pageSize=Integer.parseInt(request.getParameter("pageSize").toString());
		}
		int pageNum = 0;
		int start = 0;
		int end = 0;
		sql = " SELECT COUNT(1) NUM FROM ACTIVECODE ";
		list = DBUtil.query(sql);
		total=list.size();
		start = (Integer.parseInt(currentPage) - 1)*pageSize;
		end = Integer.parseInt(currentPage)*pageSize;
		
		if(list != null && list.size() > 0){
			total = Integer.parseInt(String.valueOf(list.get(0).get("NUM")));
		}
		pageNum = (total -1)/pageSize + 1; 	
        switch (serchTag){
        	case "default":
        		sql="SELECT * FROM ACTIVECODE ORDER BY isused ASC LIMIT "+start+","+pageSize;
				break;
        	case "id":
        		String activecode_id = request.getParameter("activecode_id");
        		sql = "select * from activecode where activecode_id='"+activecode_id+"'";
        		break;
			case "time":
				//首页 init 
				sql="SELECT * FROM BOOK ORDER BY BOOK_UPTIME DESC LIMIT "+start+","+pageSize;
				break;
			case "name":
				String BOOK_NAME = request.getParameter("book_name");
				sql="SELECT * FROM BOOK WHERE BOOK_NAMESERCH LIKE '%"+BOOK_NAME+"%' ORDER BY BOOK_UPTIME DESC LIMIT "+start+","+pageSize;
				break;
			case "serch":
				//首页   搜索栏
				String Serch_BOOK_NAME = request.getParameter("book_name");
				sql="SELECT * FROM BOOK WHERE BOOK_NAMESERCH LIKE '%"+Serch_BOOK_NAME+"%' ORDER BY BOOK_UPTIME DESC LIMIT "+start+","+pageSize;
				object.put("serch", true);
				break;
			case "sort":
				//书库排行
				sql="select * from book order by BOOK_DOWNNUM DESC LIMIT "+start+","+pageSize;
				object.put("sort", true);
				break;
				
			case "type":
				String BOOK_TYPE = request.getParameter("book_type");
				sql="select * from book where BOOK_TYPE = '"+BOOK_TYPE+"' order by BOOK_DOWNNUM DESC LIMIT "+start+","+pageSize;
				object.put("type", true);
				break;
		}
		list=DBUtil.query(sql);
		List<ActiveCode> activecodes=new ArrayList<ActiveCode>();
		if(list.size()==0){
			object.put("result", false);
			out.write(object.toString());//将数据以json的格式输出到ajax的回调函数。
			return ;
		}
		
		for(Map<String,Object> map:list)
    	{
			ActiveCode activecode = new ActiveCode();
			activecode.setActivecode_id(Long.parseLong(map.get("ACTIVECODE_ID").toString()));
			activecode.setActivecode_time(map.get("ACTIVECODE_TIME").toString());
			activecode.setActivecode(map.get("ACTIVECODE").toString());
			activecode.setIsused(map.get("ISUSED").toString());
			activecodes.add(activecode);
    	}
        object.put("result", true);
        object.put("activecodes", activecodes);
        object.put("pageNum",pageNum);
		object.put("currentPage",currentPage);
//        object.put("list", list);
        out.write(object.toString());//将数据以json的格式输出到ajax的回调函数。
	}

}
