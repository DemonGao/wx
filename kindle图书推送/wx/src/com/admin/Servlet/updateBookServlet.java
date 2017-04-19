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

public class updateBookServlet extends HttpServlet {

	
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

        String book_id = request.getParameter("bookid").toString();
        String book_name = request.getParameter("bookname").toString();
        String book_img = request.getParameter("bookimg").toString();
        String book_type = request.getParameter("booktype").toString();
        String book_downnum = request.getParameter("bookdownnum").toString();
        String book_info = request.getParameter("bookinfo").toString();
        System.out.println("名称1:"+book_name);
        System.out.println("名称2:"+request.getParameter("bookname").toString());
        String sql ="update book set book_name='"+book_name+"',book_img='"+book_img+"',book_type='"+book_type+"',book_downnum='"+book_downnum+"',book_info='"+book_info+"' where book_id='"+book_id+"'";
        if(DBUtil.update(sql)){
        	object.put("result", true);
        }else{
        	object.put("result", false);
        }
        out.write(object.toString());//将数据以json的格式输出到ajax的回调函数。
	}

}
