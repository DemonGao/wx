package com.wx.action;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import net.sf.json.JSONObject;

import com.wx.po.AccessToken;
import com.wx.util.AccessTokenUtil;
import com.wx.util.WeixinUtil;

public class InitListener implements ServletContextListener{

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		//系统的初始化工作    
        // ...    
		new Thread(new AccessTokenUtil()).start(); //启动进程
		try {
			AccessToken token = WeixinUtil.getAccessToken();
			System.out.println("票据:"+token.getToken());
			System.out.println("时限:"+token.getExpiresIn());
			
			String menu = JSONObject.fromObject(WeixinUtil.initMenu()).toString();
			int result = WeixinUtil.createMenu(token.getToken(), menu);
			if(result==0){
				System.out.println("创建菜单成功!");
			}else{
				System.out.println("错误码:"+result);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
