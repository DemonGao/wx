package com.pc.Action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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

	public BaseHibernateDAO getBasedao() {
		return basedao;
	}
	public void setBasedao(BaseHibernateDAO basedao) {
		this.basedao = basedao;
	}
	private Company company;
	public Company getCompany() {
		return company;
	}
	public void setCompany(Company company) {
		this.company = company;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	//查询
	public String login() throws Exception{
		dataMap = new HashMap<String, Object>();
		Company com = new Company();
		String hql ="from Company where company_username = '"+company.getCompany_username()+"'";
		List<Company> list = (List<Company>) basedao.findByHQL(hql);
		if(list!=null&&list.size()==0){
			dataMap.put("result", false);
			dataMap.put("error_msg","用户名不存在!");
			return SUCCESS;
		}
		com = list.get(0);
		if(com.getCompany_password().equals(company.getCompany_password())){
			com.setCompany_password("");
			dataMap.put("userinfo",com);
			dataMap.put("result", true);
			return SUCCESS;
		}
		dataMap.put("error_msg","密码不正确!");
		dataMap.put("result", false);
		return SUCCESS;
	}
	
	//查询表
	public String querys(){
		System.out.println(222);
		dataMap=new HashMap<String,Object>();
		HttpSession session=request.getSession();
		
         String hql="from Company";
         try {
			List<Company> list=(List<Company>) basedao.findByHQL(hql);
			System.out.println(list.size());
			if(list==null){
				dataMap.put("result", false);
				dataMap.put("error_msg","服务器开了个小差...");
				return ERROR;
			}
			for(int i=0;i<list.size();i++){
				Company com = new Company();
				com = list.get(i);
				System.out.println(list.get(i));
				System.out.println(com.getCompany_username());
				
				if(com.getCompany_username().equals(company.getCompany_username())){
					if(com.getCompany_password().equals(company.getCompany_password())){
						System.out.println("验证成功");
						dataMap.put("result", true);
						session.setAttribute("OPENID", com.getOpenid());
						session.setAttribute("USERNAME", com.getCompany_username());
						if(com.getStatus()==0){
						session.setAttribute("STATIC", "未验证");
						}else if(com.getStatus()==1){session.setAttribute("STATIC", "已验证");}
						return SUCCESS;
					}else{
//						System.out.println("com"+com.getCompany_password());
//						System.out.println("company"+company.getCompany_password());
//						dataMap.put("error_msg","密码不正确!");
//						return ERROR;
						System.out.println("密码不正确");
						String err="密码错误";
						session.setAttribute("ERR", err);
						return ERROR;
					}
				}else{
					System.out.println("用户名不正确");
					dataMap.put("error_msg","用户名不正确!");
				}
			}
			
		} catch (Exception e) {
			dataMap.put("result", false);
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ERROR;
	}
	
	//增加公司
	public String add(){
		dataMap = new HashMap<String, Object>();
		Company com=new Company();
		System.out.println(company.getCompany_password());
		try {
			basedao.add(company);
			dataMap.put("result", true);
		} catch (Exception e) {
			dataMap.put("result", false);
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}

	//修改内容
	public String update(){
		dataMap = new HashMap<String, Object>();
		Company com=new Company();
		try {
		Company comp=(Company) basedao.findById(Company.class, company.getOpenid());
		comp.setCompany_password(company.getCompany_password());
		comp.setCompany_username(company.getCompany_username());
			basedao.update(comp);
			dataMap.put("result", true);
		} catch (Exception e) {
			dataMap.put("result", false);
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return SUCCESS;
	}
	
	//退出
	public String exit(){
		HttpSession session=request.getSession();
		session.setAttribute("OPENID",null);
		session.setAttribute("USERNAME",null);
		
		//session.setAttribute("STATIC", "未验证");
		
		return SUCCESS;
	}
	
	

}
