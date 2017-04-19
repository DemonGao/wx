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

public class serchBookServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

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
        String book_name=request.getParameter("book_name");
//        System.out.println(book_name);
        
        String sql="select * from book where BOOK_NAME like '%"+book_name+"%'";
        List<Map<String,Object>> list = DBUtil.query(sql);
        
        session.setAttribute("list", list);
	}

}
