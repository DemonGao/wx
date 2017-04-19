package com.pc.Action;

import com.wxkf.Do.AdminDAO;
import com.wxkf.Do.Impl.AdminDAOImpl;
import com.wxkf.Po.Admin;





public class AdminAction {

	public final static String SUCCESS = "success";
	public final static String INPUT = "input";
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
	
	//管理员挂机锁
//	public String adminLock(){
//		
//		return SUCCESS;
//	}
	
}
