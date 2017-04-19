package com.wxkf.Action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.util.DBUtil;
import com.wxkf.Do.BaseHibernateDAO;
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


	public String query(){
		dataMap = new HashMap<String, Object>();
		try {

			Job jobnew = (Job) basedao.findById(Job.class, job.getJob_id());
			dataMap.put("result",true);
			dataMap.put("list",jobnew);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			dataMap.put("result",false);
			Job jobnew = new Job();
			dataMap.put("list",jobnew);
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
				signarg=request.getParameter("signarg").toString();
				hql="from Job where job_style='"+job.getJob_style()+"'and job_name like '%"+signarg+"%' and(job_delete=0) order by job_time desc";
				break;
			case "place" :
				signarg=request.getParameter("signarg").toString();
				hql="from Job where job_style='"+job.getJob_style()+"'and companyinfo.companyinfo_city='"+signarg+"' and(job_delete=0) order by job_time desc";
				break;
			case "salary" :
				signarg=request.getParameter("signarg").toString();
				int up =Integer.parseInt(request.getParameter("up").toString());
				int down =Integer.parseInt(request.getParameter("down").toString());
				hql="from Job where job_style='"+job.getJob_style()+"'and job_salary BETWEEN "+up+" AND "+down+" and(job_delete=0) order by job_time desc";
				break;
			case "type" :
				signarg=request.getParameter("signarg").toString();
				if(signarg.equals("不限")){
					hql="from Job where job_style='"+job.getJob_style()+"' and(job_delete=0) order by job_time desc";
				}else{
					hql="from Job where job_style='"+job.getJob_style()+"'and job_type='"+signarg+"' and(job_delete=0) order by job_time desc";
				}
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
	
	public String del(){
		//职位关闭
		dataMap = new HashMap<String, Object>();
		try {
			Job delete=(Job) basedao.findById(Job.class, job.getJob_id());
			
			delete.setJob_delete(1);
			basedao.update(delete);
			dataMap.put("result", true);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			dataMap.put("error_msg", "服务器出现了点小问题,请稍候再试...");
			dataMap.put("result", false);
		}
		return SUCCESS;
	}
	
	public String update() {
		dataMap = new HashMap<String, Object>();
		try {
			basedao.update(job);
		 dataMap.put("result", true);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			dataMap.put("result", false);
		}
		return SUCCESS;
	}
	
	public String getJobNum() throws Exception{
		dataMap = new HashMap<String, Object>();
		String hql="from Job where companyinfo.openid='"+job.getCompanyinfo().getOpenid()+"' and(job_delete=0)";
		List list = basedao.findByHQL(hql);
		if(list!=null){
			dataMap.put("jobNum", list.size());
		}else{
			dataMap.put("jobNum", 0);
		}
		dataMap.put("result", true);
		return SUCCESS;
	}
}
