package com.wxkf.Action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.wxkf.Do.BaseHibernateDAO;
import com.wxkf.Po.Job;
import com.wxkf.Po.JobCollection;
import com.wxkf.Po.Student;

public class JobCollectionAction extends SuperAction{

	BaseHibernateDAO basedao = new BaseHibernateDAO();
	
	private static final long serialVersionUID = 1L;

	private Map<String, Object> dataMap;
	
	
	public Map<String, Object> getDataMap() {
		return dataMap;
	}


	public void setDataMap(Map<String, Object> dataMap) {
		this.dataMap = dataMap;
	}
	
	private JobCollection jobclt;
	
	public JobCollection getJobclt() {
		return jobclt;
	}


	public void setJobclt(JobCollection jobclt) {
		this.jobclt = jobclt;
	}
	//增加感兴趣
	public String add() {
		dataMap=new HashMap<String,Object>();
		try {
			Student student = (Student) basedao.findById(Student.class, jobclt.getStudent().getOpen_id());
			if(student==null){
				//判断 当学生不存在的话(没有完善简历信息),则不能收藏
				dataMap.put("result", false);
				dataMap.put("error_msg", "您还没有完善简历信息，请先完善简历信息再进行收藏！");
				return SUCCESS;
			}
			List<JobCollection> list  = (List<JobCollection>) basedao.findByHQL("from JobCollection where job_id ='"+jobclt.getJob().getJob_id()+"' and student.open_id ='"+jobclt.getStudent().getOpen_id()+"'");
			if(list!=null&&list.size()!=0){
				dataMap.put("result", false);
				dataMap.put("error_msg", "您已经收藏了此公司！");
				return SUCCESS;
			}
			Job job=(Job) basedao.findById(Job.class, jobclt.getJob().getJob_id());
			jobclt.setJob(job);
			jobclt.setStudent(student);
			jobclt.setJobCollection_time(System.currentTimeMillis());
			basedao.add(jobclt);
			dataMap.put("result", true);
		} catch (Exception e) {
			dataMap.put("result", false);
			dataMap.put("error_msg", "抱歉！服务器开了个小差，请稍候再试！");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String getNum() throws Exception{
		dataMap = new HashMap<String, Object>();
		List list = basedao.findByHQL("from JobCollection where student.open_id='"+jobclt.getStudent().getOpen_id()+"'");
		if(list!=null){
			dataMap.put("jobCollectionNum", list.size());
		}else{
			dataMap.put("jobCollectionNum", 0);
		}
		dataMap.put("result", true);
		return SUCCESS;
	}
	//获取公司发布职位被学生收藏的个数
	public String getNumbyCompany() throws Exception{
		dataMap = new HashMap<String, Object>();
		List list = basedao.findByHQL("from JobCollection where job.companyinfo.openid='"+ jobclt.getJob().getCompanyinfo().getOpenid() + "' and status=0 order by jobCollection_time desc");
		if(list!=null){
			dataMap.put("jobCollectionNum", list.size());
		}else{
			dataMap.put("jobCollectionNum", 0);
		}
		
		dataMap.put("result", true);
		return SUCCESS;
	}
    //查询感兴趣的职位
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
		String signarg = "";//
		String hql = "";
		if(request.getParameter("type")!=null){
			type = request.getParameter("type").toString();//查询分类 ,如:1.id 2.时间 ...
		}
		switch (type){
			case "name" :
				signarg=request.getParameter("signarg").toString();
				hql="from JobCollection where job_name like '%"+signarg+"%' order by job_pubdate desc";
				break;
			case "jobCollection" :
				//查询学生已感性的职位
				signarg=request.getParameter("signarg").toString();
				hql="from JobCollection where student.open_id='"+signarg+"' order by jobCollection_time desc";
				break;
			case "cjobCollection":
				//公司查看投递查看
				signarg = request.getParameter("signarg").toString();
				hql = "from JobCollection where job.companyinfo.openid='"+ signarg + "' and status=0 order by jobCollection_time desc";
				break;	
			default :
				hql="from JobCollection order by jobCollection_time desc";
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
	public String update() {
		dataMap = new HashMap<String, Object>();
		try {
			JobCollection jobCollection = (JobCollection) basedao.findById(JobCollection.class,jobclt.getJobCollection_id());
			jobCollection.setStatus(jobclt.getStatus());
			basedao.update(jobCollection);
		 dataMap.put("result", true);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			dataMap.put("result", false);
			dataMap.put("error_msg", "服务器出现了点小问题,请稍候再试...");
		}
		return SUCCESS;
		
	}
	
	
}
