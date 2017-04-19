package com.admin.Action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.wxkf.Action.SuperAction;
import com.wxkf.Do.BaseHibernateDAO;
import com.wxkf.Po.Company;
import com.wxkf.Po.CompanyInfo;

public class CompanyAction extends SuperAction{
	BaseHibernateDAO basedao = new BaseHibernateDAO();
	private static final long serialVersionUID = 1L;
	private Map<String, Object> dataMap;
	public Map<String, Object> getDataMap() {
		return dataMap;
	}
	private CompanyInfo companyInfo;
	public CompanyInfo getCompanyInfo() {
		return companyInfo;
	}
	public void setCompanyInfo(CompanyInfo companyInfo) {
		this.companyInfo = companyInfo;
	}


	public String querys() throws Exception{
		dataMap = new HashMap<String, Object>();
		//获取每页显示多少
		int pageSize = 8;
		if(request.getParameter("pageSize")!=null){
			pageSize = Integer.parseInt(request.getParameter("pageSize").toString());
		}
		//获取页数
		int pageNum = Integer.parseInt(request.getParameter("pageNum").toString());
		int index = pageNum*pageSize;
		String type ="";
		String signarg = "";//两学一做 分类
		String hql = "";
		
		System.out.println(request.getParameter("type"));
		System.out.println(pageNum);
		if(request.getParameter("type")!=null){
			type = request.getParameter("type").toString();//查询分类 ,如:1.id 2.时间 ...
		}
		switch (type){
			case "all_name" :
				//根据公司名称查询
				signarg=request.getParameter("signarg").toString();
				hql="from CompanyInfo where companyinfo_name like '%"+signarg+"%'";
				break;
			case "no_all" :
				//查询所有未审核的企业信息
				hql="from CompanyInfo where companyinfo_status=0 order by companyinfo_uptime desc";
				break;
			case "id" :
				hql="from CompanyInfo where openid='"+companyInfo.getOpenid()+"'";
				break;
			default :
				hql="from CompanyInfo order by case_id desc";
				break;
		}
		List<CompanyInfo> list=(List<CompanyInfo>) basedao.findByHQL(hql);
		if(list!=null&&list.size()>0){
			dataMap.put("result",true);
			dataMap.put("total", list.size());
			dataMap.put("pageSize",pageSize);
			dataMap.put("pageNum",pageNum);
			dataMap.put("pageNums", (list.size() -1)/pageSize + 1);
			list=(List<CompanyInfo>) basedao.findByHQL(hql,index,pageSize);
			dataMap.put("list", list);
		}else{
			dataMap.put("result", false);
			dataMap.put("error_msg", "没有查到数据...");
			dataMap.put("total", 0);
		}
		return SUCCESS;
	}
	
	public String checkInfo(){
		dataMap = new HashMap<String, Object>();
		Company c ;
		CompanyInfo ci;
		try {
			ci = (CompanyInfo) basedao.findById(CompanyInfo.class,companyInfo.getOpenid());
			c = (Company) basedao.findById(Company.class,companyInfo.getOpenid());
			ci.setCompanyinfo_status(1);
			c.setStatus(1);
			basedao.update(ci);
			basedao.update(c);
			dataMap.put("result",true);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			dataMap.put("result",false);
		}
		
		return SUCCESS;
	}
}
