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

import com.admin.Po.User;
import com.util.DBUtil;
import com.web.po.Book;

import net.sf.json.JSONObject;

public class getEmailServlet extends HttpServlet {

	
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
        
        
        String openid = request.getParameter("openid");
        
//      String type = request.getParameter("type");
        String sql ="select * from user where openid='"+openid+"'";
        List<Map<String,Object>> list=DBUtil.query(sql);
        if(list!=null&&list.size()!=0){
        	Map<String,Object> map = list.get(0);
//        	User user = new User();
//        	user.setOpenid(openid);
        	if(map.get("EMAIL")!=null){
        		String email = map.get("EMAIL").toString();
            	//object.put("result", true);
            	object.put("bindemail", true);
            	object.put("email", email);
//            	user.setEmail(email);
        	}else{
        		//object.put("result", false);
        		object.put("bindemail", false);
        	}
        	String ISACTIVED=map.get("ISACTIVED").toString(); 
        	if("false".equals(ISACTIVED)){
				System.out.println("您没有激活");
				object.put("sendemail", false);
				object.put("sendemailmsg", "您还没有激活Kindle推送功能");
				object.put("sendemailmsgtitle", "用户未激活");
			}else{
				String ACTIVEDATE = map.get("ACTIVEDATE").toString();
				String TIMELENGTH = map.get("TIMELENGTH").toString();
				//截止日期
				Long lasttime = Long.parseLong(ACTIVEDATE)+Long.parseLong(TIMELENGTH);
				//当前日期
				Long nowtime = System.currentTimeMillis();
				if(nowtime>lasttime){
					//激活时间过期!
    				//修改user中的ISACTIVED字段为false
    				sql="update user set ISACTIVED='false' where openid='"+openid+"'";
    				DBUtil.update(sql);
    				object.put("sendemail", false);
    				object.put("sendemailmsg", "您Kindle推送功能已到期");
    				object.put("sendemailmsgtitle", "用户激活已到期");
    				return ;
				}else{
					object.put("sendemail", true);
				}
			}
//        	user.setIsactived(map.get("ISACTIVED").toString());
//        	String email = list.get(0).get("EMAIL").toString();
//        	object.put("result", true);
//        	object.put("email", email);
//        	System.out.println("getEmail");
        }
        String BOOK_ID = request.getParameter("bookid");
        sql = "select * from book where BOOK_ID = '"+BOOK_ID+"'";
        list=DBUtil.query(sql);
        Book book = new Book();
        if(list!=null&&list.size()!=0){
        	object.put("getbook", true);
        	Map<String,Object> map=list.get(0);
        	book.setBook_id(Long.parseLong(map.get("BOOK_ID").toString()));
			book.setBook_name(map.get("BOOK_NAME").toString());
			book.setBook_img(map.get("BOOK_IMG").toString());
			book.setBook_info(map.get("BOOK_INFO").toString());
			book.setBook_url(map.get("BOOK_URL").toString());
			book.setBook_uptime(map.get("BOOK_UPTIME").toString());
			book.setBook_type(map.get("BOOK_TYPE").toString());
			book.setBook_downnum(Integer.parseInt(map.get("BOOK_DOWNNUM").toString()));
			book.setBook_size(map.get("BOOK_SIZE").toString());
			object.put("book", book);
        }else{
        	object.put("getbook", false);
        }
        
        out.write(object.toString());//将数据以json的格式输出到ajax的回调函数。
	}

}
