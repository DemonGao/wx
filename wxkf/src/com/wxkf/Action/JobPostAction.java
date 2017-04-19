package com.wxkf.Action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.wxkf.Do.BaseHibernateDAO;
import com.wxkf.Po.Job;
import com.wxkf.Po.JobCollection;
import com.wxkf.Po.JobPost;
import com.wxkf.Po.Student;

public class JobPostAction extends SuperAction {

	BaseHibernateDAO basedao = new BaseHibernateDAO();

	private static final long serialVersionUID = 1L;

	private Map<String, Object> dataMap;

	public Map<String, Object> getDataMap() {
		return dataMap;
	}

	public void setDataMap(Map<String, Object> dataMap) {
		this.dataMap = dataMap;
	}

	private JobPost jobPost;

	public JobPost getJobPost() {
		return jobPost;
	}

	public void setJobPost(JobPost jobPost) {
		this.jobPost = jobPost;
	}

	// 职位投递
	public String add() {
		dataMap = new HashMap<String, Object>();
		try {
			Student student = (Student) basedao.findById(Student.class, jobPost.getStudent().getOpen_id());
			if (student == null) {
				// 判断 当学生不存在的话(没有完善简历信息),则不能收藏
				dataMap.put("result", false);
				dataMap.put("error_msg", "您还没有完善简历信息，请先完善简历信息再进行投递！");
				return SUCCESS;
			}
			List<JobPost> list = (List<JobPost>) basedao.findByHQL("from JobPost where job_id ='"+ jobPost.getJob().getJob_id() + "' and student.open_id ='"+ jobPost.getStudent().getOpen_id() + "'");
			if (list != null && list.size() != 0) {
				dataMap.put("result", false);
				dataMap.put("error_msg", "您已经投递了此公司！");
				return SUCCESS;
			}
			Job job = (Job) basedao.findById(Job.class, jobPost.getJob()
					.getJob_id());
			jobPost.setJob(job);
			jobPost.setStudent(student);
			jobPost.setJobPost_state(0);
			jobPost.setJobPost_time(System.currentTimeMillis());
			basedao.add(jobPost);
			dataMap.put("result", true);
		} catch (Exception e) {
			dataMap.put("result", false);
			dataMap.put("error_msg", "抱歉！服务器开了个小差，请稍候再试！");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	//获取此学生投递数量
	public String getNum() throws Exception{
		dataMap = new HashMap<String, Object>();
		
		List list = basedao.findByHQL("from JobPost where student.open_id='"+jobPost.getStudent().getOpen_id()+"'");
		if(list!=null){
			dataMap.put("jobPostNum", list.size());
		}else{
			dataMap.put("jobPostNum", 0);
		}
		
		dataMap.put("result", true);
		return SUCCESS;
	}
	//获取此学生投递数量
	public String getdealPostNum() throws Exception{
		dataMap = new HashMap<String, Object>();
		List list = basedao.findByHQL("from JobPost where job.companyinfo.openid='"+ jobPost.getJob().getCompanyinfo().getOpenid() + "'");
		if(list!=null){
			double sum = list.size();
			System.out.println("==============sum"+sum);
			list = basedao.findByHQL("from JobPost where job.companyinfo.openid='"+ jobPost.getJob().getCompanyinfo().getOpenid() + "' and jobPost_state=0");
			double undel = list.size();
			System.out.println("==============undel"+undel);
			double result = 100-(undel/sum)*100;
			System.out.println("==============result"+result);
			dataMap.put("dealjobPostNum", result);
		}else{
			dataMap.put("dealjobPostNum", 100);
		}
		dataMap.put("result", true);
		return SUCCESS;
	}
	//获取公司被投递数量
	public String getNumbyCompany() throws Exception{
		dataMap = new HashMap<String, Object>();
		List list = basedao.findByHQL("from JobPost where job.companyinfo.openid='"+ jobPost.getJob().getCompanyinfo().getOpenid() + "'");
		if(list!=null){
			dataMap.put("jobPostNum", list.size());
		}else{
			dataMap.put("jobPostNum", 0);
		}
		
		dataMap.put("result", true);
		return SUCCESS;
	}
	//投递职位状态更新
	public String update() throws Exception{
		dataMap = new HashMap<String, Object>();
		JobPost jp = (JobPost) basedao.findById(JobPost.class, jobPost.getJobPost_id());
		String action = request.getParameter("action");
		if(jp.getJobPost_state()!=0&&jp.getJobPost_state()!=1){
			dataMap.put("msg", "此简历你已操作过!");
			dataMap.put("result", false);
			return SUCCESS;
		}
		switch(action){
			case "look":
				System.out.println("");;
				if(jp.getJobPost_state()==0){
					jp.setJobPost_state(1);
				}
				break;
			case "yes":
				jp.setJobPost_state(2);
				dataMap.put("msg", "已标记为感兴趣");
				break;
			case "no":
				jp.setJobPost_state(3);
				dataMap.put("msg", "已拒绝");
				break;	
		}
		basedao.update(jp);
		dataMap.put("result", true);
		return SUCCESS;
	}
	// 查询
	public String querys() throws Exception {
		dataMap = new HashMap<String, Object>();
		// 获取每页显示多少
		int pageSize = 8;
		if (request.getParameter("pageSize") != null) {
			pageSize = Integer.parseInt(request.getParameter("pageSize")
					.toString());
		}
		// 获取页数
		int pageNum = Integer.parseInt(request.getParameter("pageNum")
				.toString());
		int index = pageNum * pageSize;
		String type = "";
		String signarg = "";// 两学一做 分类
		String hql = "";
		if (request.getParameter("type") != null) {
			type = request.getParameter("type").toString();// 查询分类 ,如:1.id 2.时间
															// ...
		}
		switch (type) {
		case "jobfeedback":
			//投递反馈
			signarg = request.getParameter("signarg").toString();
			hql = "from JobPost where student.open_id='"+ signarg + "' order by jobPost_time desc";
			break;
		case "cjobfeedback":
			//公司查看投递查看
			signarg = request.getParameter("signarg").toString();
			hql = "from JobPost where job.companyinfo.openid='"+ signarg + "' order by jobPost_time desc";
			break;	
		default:
			hql = "from JobPost order by jobPost_time desc";
			break;
		}
		List<JobPost> list = (List<JobPost>) basedao.findByHQL(hql);
		List<JobPost> listfind = (List<JobPost>) basedao.findByHQL(hql, index, pageSize);
		if (listfind != null && listfind.size() > 0) {
			dataMap.put("result", true);
			dataMap.put("total", list.size());
			dataMap.put("pageSize", pageSize);
			dataMap.put("pageNum", pageNum);
			dataMap.put("pageNums", (list.size() - 1) / pageSize + 1);
			dataMap.put("list", listfind);
		} else {
			dataMap.put("result", false);
			dataMap.put("error_msg", "没有查到数据...");
			dataMap.put("total", 0);
		}
		return SUCCESS;
	}
}
