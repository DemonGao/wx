package com.wxkf.Action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.util.DBUtil;
import com.wxkf.Do.BaseHibernateDAO;
import com.wxkf.Po.Company;

public class CompanyAction extends SuperAction{

	BaseHibernateDAO basedao = new BaseHibernateDAO();
	
	private static final long serialVersionUID = 1L;

	private Map<String, Object> dataMap;
	public Map<String, Object> getDataMap() {
		return dataMap;
	}
	public void setDataMap(Map<String, Object> dataMap) {
		this.dataMap = dataMap;
	}

	private Company company;
	public BaseHibernateDAO getBasedao() {
		return basedao;
	}
	public void setBasedao(BaseHibernateDAO basedao) {
		this.basedao = basedao;
	}
	public Company getCompany() {
		return company;
	}
	public void setCompany(Company company) {
		this.company = company;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String login() throws Exception{
		dataMap = new HashMap<String, Object>();
		Company com = new Company();
		String hql ="from Company";
		List<Company> list = (List<Company>) basedao.findByHQL(hql);
		if(list==null){
			dataMap.put("result", false);
			dataMap.put("error_msg","服务器开了个小差...");
			return SUCCESS;
		}
		for(int i=0 ; i<list.size();i++){
			com = list.get(i);
			if(com.getCompany_username().equals(company.getCompany_username())){
				if(com.getCompany_password().equals(company.getCompany_password())){
					if(com.getStatus()==0){
						dataMap.put("error_msg","你还没有进行企业认证,请到PC端进行企业认证!");
						dataMap.put("result", false);
						return SUCCESS;
					}
					if(com.getOpenid().equals(company.getOpenid())){
						String sql="update user set type ='1' where openid = '"+company.getOpenid()+"'";
						DBUtil.update(sql);
						com.setOpenid(company.getOpenid());
						basedao.update(com);
						dataMap.put("result", true);
						return SUCCESS;
					}
					dataMap.put("error_msg","此微信号与注册时微信号不一致!");
					dataMap.put("result", false);
					return SUCCESS;
				}else{
					dataMap.put("error_msg","密码不正确!");
				}
			}else{
				dataMap.put("error_msg","用户名不正确!");
			}
		}
		dataMap.put("result", false);
		return SUCCESS;
	}
	
	public String reg() throws Exception{
		dataMap = new HashMap<String, Object>();
		String hql ="from Company where company_username ='"+company.getCompany_username()+"'";
		List<Company> list = (List<Company>) basedao.findByHQL(hql);
		if(list==null){
			dataMap.put("result", false);
			dataMap.put("error_msg","服务器开了个小差...");
			return SUCCESS;
		}
		if(list.size()!=0){
			dataMap.put("result", false);
			dataMap.put("error_msg","用户名已存在!");
			return SUCCESS;
		}
		company.setCompany_time(System.currentTimeMillis());
		basedao.add(company);
		dataMap.put("result", true);
		return SUCCESS;
	}
}
