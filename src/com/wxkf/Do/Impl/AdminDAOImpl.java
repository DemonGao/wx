package com.wxkf.Do.Impl;

import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.wxkf.Do.AdminDAO;
import com.wxkf.Do.BaseHibernateDAO;
import com.wxkf.Po.Admin;



public class AdminDAOImpl extends BaseHibernateDAO implements AdminDAO{

	ActionContext actionContext = ActionContext.getContext();
	Map<String, Object> sessionMap = actionContext.getSession();
	
	@Override
	public boolean AdminLogin(Admin a) {
		
//		ActionContext actionContext = ActionContext.getContext();
//		Map<String, Object> sessionMap = actionContext.getSession();
		String hql = "from Admin where adminname='" + a.getAdminname() + "'";
		List list;
		try {
			list = findByHQL(hql);
			if (!list.isEmpty()) {
				Admin admin = (Admin) list.get(0);
				if (admin.getPassword().equals(a.getPassword())) {
					if (sessionMap.get("login_msg") != null) {
						sessionMap.remove("login_msg");
					}
					sessionMap.put("login_admin", admin);
					return true;
				} else {
					sessionMap.put("login_msg", "密码错误!");
					
					return false;
				}
			}
			sessionMap.put("login_msg", "用户名不存在!");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean AdminLogOut() {
		if (sessionMap.get("login_admin") != null) {
			sessionMap.remove("login_admin");
			System.out.println("管理员已注销");
		}
		return true;
	}

//	@Override
//	public boolean AdminLock(Admin a) {
//		
//		return false;
//	}
}
