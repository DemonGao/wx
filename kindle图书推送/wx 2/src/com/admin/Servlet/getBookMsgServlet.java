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
import com.web.po.Book;

public class getBookMsgServlet extends HttpServlet {

	
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
        
        String bookid = request.getParameter("bookid");
        Book book = new Book();
        
        String sql = "select * from book where book_id='"+bookid+"'";
        
        List<Map<String,Object>> list = DBUtil.query(sql);
        if(list.size()==0){
			object.put("result", false);
			out.write(object.toString());//将数据以json的格式输出到ajax的回调函数。
			return ;
		}
        Map<String,Object> map = list.get(0);
        book.setBook_id(Long.parseLong(map.get("BOOK_ID").toString()));
		book.setBook_name(map.get("BOOK_NAME").toString());
		book.setBook_img(map.get("BOOK_IMG").toString());
		book.setBook_info(map.get("BOOK_INFO").toString());
		book.setBook_url(map.get("BOOK_URL").toString());
		book.setBook_uptime(map.get("BOOK_UPTIME").toString());
		book.setBook_type(map.get("BOOK_TYPE").toString());
		book.setBook_downnum(Integer.parseInt(map.get("BOOK_DOWNNUM").toString()));
        object.put("result", true);
        object.put("book", book);
        out.write(object.toString());//将数据以json的格式输出到ajax的回调函数。
	}

}
