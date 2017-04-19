package com.wxkf.Do;

import com.wxkf.Po.Admin;



public interface AdminDAO {

	//管理员登录方法
	public boolean AdminLogin(Admin admin);
	
	//管理员注销
	public boolean AdminLogOut();
	
	//管理员锁
//	public boolean AdminLock(Admin admin);
}
