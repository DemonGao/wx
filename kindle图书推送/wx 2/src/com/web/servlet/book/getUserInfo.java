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
import com.wx.po.UnionID;

import net.sf.json.JSONObject;

public class getUserInfo extends HttpServlet {

	
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
        String sql="select * from userinfo where OPENID='"+openid+"'";
        
        List<Map<String,Object>> list=DBUtil.query(sql);
        if(list.size()==0){
        	return;
        }
        Map<String,Object> map = list.get(0);
        UnionID unionid =new UnionID();
        unionid.setOpenid(openid);
        unionid.setNickname(map.get("NICKNAME").toString());
        unionid.setHeadimgurl(map.get("HEADIMGURL").toString());
        unionid.setSex(map.get("SEX").toString());
        unionid.setSubscribe_time(map.get("SUBSCRIBE_TIME").toString());
        unionid.setLanguage(map.get("LANGUAGE").toString());
        unionid.setCity(map.get("CITY").toString());
        unionid.setProvince(map.get("PROVINCE").toString());
        unionid.setCountry(map.get("COUNTRY").toString());
        
        object.put("result", true);
        object.put("userinfo", unionid);
        
        sql="select * from user where OPENID='"+openid+"'";
        list=DBUtil.query(sql);
        
        if(list.size()==0){
        	object.put("email", "未绑定");
        	object.put("limittime", "未激活");
        	
        }else{
        	map = list.get(0);
        	//获取邮箱
        	String email = map.get("EMAIL").toString();
        	if(email!=null&&!email.equals("")){
        		object.put("email", email);
        	}else{
        		object.put("email", "未绑定");
        	}
        	
        	//获取到期时间
        	String isactived =map.get("ISACTIVED").toString();
        	if(isactived.equals("false")){
        		object.put("limittime", "未激活");
        	}else{
        		String activedate = map.get("ACTIVEDATE").toString();
        		String timelength = map.get("TIMELENGTH").toString();
        		
        		//截止日期
				Long lasttime = Long.parseLong(activedate)+Long.parseLong(timelength);
				//当前日期
				Long nowtime = System.currentTimeMillis();
				
				if(lasttime>nowtime){
					//没过期
					object.put("limittime", DBUtil.strToDate(lasttime.toString()));
				}else{
					object.put("limittime", "未激活");
				}
        	}
        	
        }
        out.write(object.toString());//将数据以json的格式输出到ajax的回调函数。
	}
}
