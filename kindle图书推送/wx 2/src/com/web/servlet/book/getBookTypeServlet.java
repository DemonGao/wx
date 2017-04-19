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
import com.web.po.BookType;

import net.sf.json.JSONObject;

public class getBookTypeServlet extends HttpServlet {

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
        
        String sql ="select * from booktype";
        
        List<Map<String,Object>> list = DBUtil.query(sql);
        List<BookType> booktypes=new ArrayList<BookType>();
        for(Map<String,Object> map : list){
        	
        	BookType booktype= new BookType();
        	booktype.setBooktype_id(Long.parseLong(map.get("BOOKTYPE_ID").toString()));
        	booktype.setBooktype_name(map.get("BOOKTYPE_NAME").toString());
        	booktype.setBooktype_img(map.get("BOOKTYPE_IMG").toString());
        	booktypes.add(booktype);
        }
        object.put("result", true);
        object.put("booktypes", booktypes);
	    out.write(object.toString());//将数据以json的格式输出到ajax的回调函数。
	}

}
