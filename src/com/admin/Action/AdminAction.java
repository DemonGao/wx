package com.admin.Action;

import com.wxkf.Action.SuperAction;
import com.wxkf.Do.AdminDAO;
import com.wxkf.Do.Impl.AdminDAOImpl;
import com.wxkf.Po.Admin;





public class AdminAction extends SuperAction{

	AdminDAO admindao=new AdminDAOImpl();
	
	private Admin admin;

	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	
	//管理员登陆
	public String adminLogin() throws Exception{
		boolean islogin=admindao.AdminLogin(admin);
		if (islogin) {
			System.out.println("登陆成功!");
			return SUCCESS;
		}
		System.out.println("登陆失败!");
		return INPUT;
	}
	
	//管理员注销
	public String adminLogOut(){
		if(admindao.AdminLogOut()){
			return SUCCESS;
		}
		return INPUT;
//		
	}
	
}
