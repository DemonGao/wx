package com.web.servlet.book;

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

import com.util.DBUtil;
import com.web.po.Book;
import com.wx.po.UnionID;

import net.sf.json.JSONObject;

public class getBookServlet extends HttpServlet {

//	private int pageSize=2;
	
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
		sql = " SELECT COUNT(1) NUM FROM BOOK ";
		list = DBUtil.query(sql);
		total=list.size();
		start = (Integer.parseInt(currentPage) - 1)*pageSize;
		end = Integer.parseInt(currentPage)*pageSize;
		
		if(list != null && list.size() > 0){
			total = Integer.parseInt(String.valueOf(list.get(0).get("NUM")));
		}
		pageNum = (total -1)/pageSize + 1; 	
        switch (serchTag){
        	case "id":
        		sql="SELECT * FROM BOOK ORDER BY BOOK_ID ASC LIMIT "+start+","+pageSize;
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
		List<Book> books=new ArrayList<Book>();
		if(list.size()==0){
			object.put("result", false);
			out.write(object.toString());//将数据以json的格式输出到ajax的回调函数。
			return ;
		}
		for(Map<String,Object> map:list)
    	{
			Book book = new Book();
			book.setBook_id(Long.parseLong(map.get("BOOK_ID").toString()));
			book.setBook_name(map.get("BOOK_NAME").toString());
			book.setBook_img(map.get("BOOK_IMG").toString());
			book.setBook_info(map.get("BOOK_INFO").toString());
			book.setBook_url(map.get("BOOK_URL").toString());
			book.setBook_uptime(map.get("BOOK_UPTIME").toString());
			book.setBook_type(map.get("BOOK_TYPE").toString());
			book.setBook_downnum(Integer.parseInt(map.get("BOOK_DOWNNUM").toString()));
//			System.out.println(map.get("BOOK_NAME").toString());
			books.add(book);
    	}
        object.put("result", true);
        object.put("books", books);
        object.put("pageNum",pageNum);
		object.put("currentPage",currentPage);
//        object.put("list", list);
        out.write(object.toString());//将数据以json的格式输出到ajax的回调函数。
	}

}
