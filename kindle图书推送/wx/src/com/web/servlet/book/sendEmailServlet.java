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

import net.sf.json.JSONObject;

import com.util.DBUtil;
import com.wx.util.javaMail.MessageSender;

public class sendEmailServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("doget");
		doPost(request, response);
		
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String path=this.getServletConfig().getServletContext().getRealPath("/");
		
		/*设置编码UTF-8   防止乱码*/
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out=response.getWriter();
        JSONObject object =new JSONObject();//定义一个json对象
		
        HttpSession session = request.getSession(); 

        String openid = request.getParameter("openid");
//        String bookurl = new String (request.getParameter("bookurl").getBytes("iso-8859-1"), "UTF-8");
        String bookurl = request.getParameter("bookurl");
        System.out.println("书地址:"+bookurl);
        System.out.println("session.getAttribute(openid+bookurl):"+session.getAttribute(openid+bookurl));
        if(session.getAttribute(openid+bookurl)==null){
        	System.out.println("等于null"+System.currentTimeMillis());
        	session.setAttribute(openid+bookurl, System.currentTimeMillis());
        }else{
        	Long lasttime =Long.parseLong(session.getAttribute(openid+bookurl).toString());
        	System.out.println("不等于null");
        	System.out.println(System.currentTimeMillis()-lasttime);
        	if(System.currentTimeMillis()-lasttime<20000){
        		System.out.println("终止发送");
        		return;
        	}else{
        		System.out.println("继续发送");
        		session.setAttribute(openid+bookurl, System.currentTimeMillis());
        	}
        }
        
        
        String sql ="select * from user where openid='"+openid+"'";
        List<Map<String,Object>> list=DBUtil.query(sql);
        if(list!=null&&list.size()!=0){
        	Map<String,Object> map= list.get(0);
        	if(map.get("EMAIL")==null){
        		object.put("result", false);
            	object.put("msg", "您还没绑定邮箱!");
            	session.setAttribute("emailmsg", "您还没绑定邮箱!");
            	out.write(object.toString());//将数据以json的格式输出到ajax的回调函数。
            	return ;
        	}
        	String email = map.get("EMAIL").toString();
        	MessageSender msgSend=new MessageSender();
        	try {
        		if(bookurl==null){
        			String bookpath=path+"upload/book/使用指南.txt";
        			String head="Kindle书城提醒您,绑定邮箱已成功!";
        			String body="<h4>恭喜您的邮箱已经绑定成功,使用指南也已经发送给你,请详细了解使用方法</h4> </br>" ;
        			msgSend.sendEMail(bookpath,email,head,body);
        			object.put("result", true);
        			object.put("msg", "测试邮件已发送!");
        			out.write(object.toString());//将数据以json的格式输出到ajax的回调函数。
    				return;
        		}else{
//        			if(map.get("ISACTIVED")==null){
//        				object.put("result", false);
//        				object.put("msg", "您还未进行激活操作!");
//        				out.write(object.toString());//将数据以json的格式输出到ajax的回调函数。
//        				return;
//        			}
        			String ISACTIVED=map.get("ISACTIVED").toString();
        			if("false".equals(ISACTIVED)){
        				System.out.println("您没有激活");
        				object.put("result", false);
        				object.put("msg", "您还没有激活");
        				out.write(object.toString());//将数据以json的格式输出到ajax的回调函数。
        				return ;
        			}else{
        				System.out.println("有激活");
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
            				
            				object.put("result", false);
            				object.put("msg", "您激活已到期");
            				out.write(object.toString());//将数据以json的格式输出到ajax的回调函数。
            				return ;
        				}else{
        					String bookname=request.getParameter("bookname").toString();
        					System.out.println("书名:"+bookname);
//        					bookname = new String (bookname.getBytes("iso-8859-1"), "UTF-8");
        					
//                			String bookpath=path+bookurl;
        					String bookpath=bookurl;
                			String head="Kindle书城提醒您,你需要的图书已经推送成功!!";
                			String body="<h4>推送图书名:"+bookname+"</h4><p>欢迎您下次再来!</p> </br>" ;
                			msgSend.sendEMail(bookpath,email,head,body);
                			
                			//下载量+1
                			Long BOOK_ID =Long.parseLong(request.getParameter("bookid").toString());
//                			System.out.println(BOOK_ID);
                			
                			int BOOK_DOWNNUM = Integer.parseInt(request.getParameter("bookdownnum").toString())+1;
//                			System.out.println(BOOK_DOWNNUM);
                			sql="update book set BOOK_DOWNNUM='"+BOOK_DOWNNUM+"' where BOOK_ID='"+BOOK_ID+"'";
                			DBUtil.update(sql);
                			object.put("result", true);
                			object.put("msg", "推送成功!");
                			object.put("book_downnum",BOOK_DOWNNUM );
                			out.write(object.toString());//将数据以json的格式输出到ajax的回调函数。
            				return ;
        				}
        			}
        		}
			} catch (Exception e) {
				e.printStackTrace();
				object.put("result", false);
	        	object.put("msg", "邮件发送失败!");
				out.write(object.toString());//将数据以json的格式输出到ajax的回调函数。
				return ;
			}
        }else{
        	object.put("result", false);
        	object.put("msg", "您还没绑定邮箱!");
        	out.write(object.toString());//将数据以json的格式输出到ajax的回调函数。
        }
	}

}
