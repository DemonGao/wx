package com.pc.Action;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.util.DBUtil;
import com.wxkf.Do.BaseHibernateDAO;
import com.wxkf.Po.Company;
import com.wxkf.Po.CompanyInfo;
import com.wxkf.Po.Job;

public class JobAction extends SuperAction{

	BaseHibernateDAO basedao = new BaseHibernateDAO();
	
	private static final long serialVersionUID = 1L;

	private Map<String, Object> dataMap;
	
	
	public Map<String, Object> getDataMap() {
		return dataMap;
	}


	public void setDataMap(Map<String, Object> dataMap) {
		this.dataMap = dataMap;
	}


	private Job job;
	

	
	public Job getJob() {
		return job;
	}


	public void setJob(Job job) {
		this.job = job;
	}

	/*------------gsc--------------*/
	//增加职位
    public String add() throws Exception{
			dataMap = new HashMap<String, Object>();
			job.setJob_time(System.currentTimeMillis());
			if(job.getJob_id()!=null){
				basedao.update(job);
				dataMap.put("result", true);
			}
			CompanyInfo ci = (CompanyInfo) basedao.findById(CompanyInfo.class, job.getCompanyinfo().getOpenid());
			job.setCompanyinfo(ci);
			try {
				if(job.getJob_id()!=null){
					basedao.update(job);
				}else{
					basedao.add(job);
				}
				dataMap.put("result", true);
			} catch (Exception e) {
				dataMap.put("result", false);
				dataMap.put("error_msg", "抱歉!服务器开了个小差,请稍后再试");
				// TODO Auto-generated catch block
				e.printStackTrace();
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
			case "name" :
				hql="from Job where companyinfo.openid='"+job.getCompanyinfo().getOpenid()+"' and job_name like '%"+job.getJob_name()+"%' and(job_delete=0) order by job_time desc";
				break;
			case "company":
				hql="from Job where companyinfo.openid='"+job.getCompanyinfo().getOpenid()+"' and(job_delete=0) order by job_time desc";
				break;
			default :
				hql="from Job where job_style='"+job.getJob_style()+"' and(job_delete=0) order by job_time desc";
				break;
		}
		List<Job> list=(List<Job>) basedao.findByHQL(hql);
		List<Job> listfind=(List<Job>) basedao.findByHQL(hql,index,pageSize);
		if(listfind!=null&&listfind.size()>0){
			dataMap.put("result",true);
			dataMap.put("total", list.size());
			dataMap.put("pageSize",pageSize);
			dataMap.put("pageNum",pageNum);
			dataMap.put("pageNums", (list.size() -1)/pageSize + 1);
			dataMap.put("list", listfind);
		}else{
			dataMap.put("result", false);
			dataMap.put("error_msg", "没有查到数据...");
			dataMap.put("total", 0);
		}
		return SUCCESS;
	}
    /*------------gsc end--------------*/
	public String update() {
		System.out.println("修改职位");
		dataMap = new HashMap<String, Object>();
		try {
			String job1=request.getParameter("job_id");
			long jobid= Long.parseLong(job1); 
			System.out.println(jobid);
			System.out.println(System.currentTimeMillis());
			job.setJob_time(System.currentTimeMillis());
			job.setJob_id(jobid);
			job.setJob_delete(0);
			basedao.update(job);
		 dataMap.put("result", true);
		 return SUCCESS;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			dataMap.put("result", false);
		}
		return ERROR;
		
	}
	
	public String delete() {
		dataMap = new HashMap<String, Object>();
		System.out.println("删除招聘信息");
		String job=request.getParameter("job_id").toString();
			long jobid= Long.parseLong(job);
			try {
				Job delete=(Job) basedao.findById(Job.class, jobid);
				
				delete.setJob_delete(1);
				basedao.update(delete);
				dataMap.put("result", true);
				return SUCCESS;
			} catch (Exception e) {
		
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		   dataMap.put("result", false);	
			
		return SUCCESS;
		
	}
}
