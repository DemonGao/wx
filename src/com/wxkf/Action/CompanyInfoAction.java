package com.wxkf.Action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.wxkf.Do.BaseHibernateDAO;
import com.wxkf.Po.CompanyInfo;
import com.wxkf.Po.Student;

public class CompanyInfoAction extends SuperAction{

	BaseHibernateDAO basedao = new BaseHibernateDAO();
	
	private static final long serialVersionUID = 1L;

	private Map<String, Object> dataMap;
	private CompanyInfo companyInfo;
	public Map<String, Object> getDataMap() {
		return dataMap;
	}
	public void setDataMap(Map<String, Object> dataMap) {
		this.dataMap = dataMap;
	}
	
	public CompanyInfo getCompanyInfo() {
		return companyInfo;
	}
	public void setCompanyInfo(CompanyInfo companyInfo) {
		this.companyInfo = companyInfo;
	}
	public String query() throws Exception{
		dataMap = new HashMap<String, Object>();
		CompanyInfo cinfo = (CompanyInfo) basedao.findById(CompanyInfo.class,companyInfo.getOpenid());
		if (cinfo != null) {
			dataMap.put("result", true);
			dataMap.put("list", cinfo);
			return SUCCESS;
		} else {
			cinfo = new CompanyInfo();
			dataMap.put("list", cinfo);
			dataMap.put("result", false);
		}
		return SUCCESS;
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
		if(request.getParameter("type")!=null){
			type = request.getParameter("type").toString();//查询分类 ,如:1.id 2.时间 ...
		}
		switch (type){
			case "title" :
				signarg=request.getParameter("signarg").toString();
				hql="from CompanyInfo where case_name like '%"+signarg+"%'";
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
	public String updateHrInfo(){
		dataMap = new HashMap<String, Object>();
		
		CompanyInfo ci;
		try {
			ci = (CompanyInfo) basedao.findById(CompanyInfo.class,companyInfo.getOpenid());
			ci.setCompanyinfo_nickname(companyInfo.getCompanyinfo_nickname());
//			ci.setCompanyinfo_nickname(new String(companyInfo.getCompanyinfo_nickname().getBytes("iso-8859-1"),"utf-8"));
			ci.setCompanyinfo_tel(companyInfo.getCompanyinfo_tel());
			ci.setCompanyinfo_pjob(companyInfo.getCompanyinfo_pjob());
//			new String(companyInfo.getCompanyinfo_nickname().getBytes("iso-8859-1"),"utf-8");
//			System.out.println("======================企业负责人姓名"+companyInfo.getCompanyinfo_nickname());
//			System.out.println("======================企业负责人姓名"+new String(companyInfo.getCompanyinfo_nickname().getBytes("iso-8859-1"),"utf-8"));
			basedao.update(ci);
			dataMap.put("result",true);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			dataMap.put("result",false);
		}
		
		return SUCCESS;
	}
}
