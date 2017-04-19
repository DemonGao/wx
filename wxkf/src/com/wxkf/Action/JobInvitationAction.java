package com.wxkf.Action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.wxkf.Do.BaseHibernateDAO;
import com.wxkf.Po.Job;
import com.wxkf.Po.JobCollection;
import com.wxkf.Po.JobInvitation;
import com.wxkf.Po.JobPost;
import com.wxkf.Po.Student;

public class JobInvitationAction extends SuperAction {

	BaseHibernateDAO basedao = new BaseHibernateDAO();

	private static final long serialVersionUID = 1L;

	private Map<String, Object> dataMap;

	public Map<String, Object> getDataMap() {
		return dataMap;
	}

	public void setDataMap(Map<String, Object> dataMap) {
		this.dataMap = dataMap;
	}

	private JobInvitation jobInvitation;
	public JobInvitation getJobInvitation() {
		return jobInvitation;
	}

	public void setJobInvitation(JobInvitation jobInvitation) {
		this.jobInvitation = jobInvitation;
	}

	// 职位投递
	public String add() {
		dataMap = new HashMap<String, Object>();
		try {
			Student student = (Student) basedao.findById(Student.class, jobInvitation.getStudent().getOpen_id());
			if (student == null) {
				// 判断 当学生不存在的话(没有完善简历信息),则不能收藏
				dataMap.put("result", false);
				dataMap.put("error_msg", "您还没有完善简历信息，请先完善简历信息再进行投递！");
				return SUCCESS;
			}
			List<JobInvitation> list = (List<JobInvitation>) basedao.findByHQL("from JobInvitation where job_id ='"+ jobInvitation.getJob().getJob_id() + "' and student.open_id ='"+jobInvitation.getStudent().getOpen_id()+"' ");
			if (list != null && list.size() != 0) {
				dataMap.put("result", false);
				dataMap.put("error_msg", "您已经发送过职位邀约");
				return SUCCESS;
			}
			Job job = (Job) basedao.findById(Job.class, jobInvitation.getJob()
					.getJob_id());
			jobInvitation.setJob(job);
			jobInvitation.setStudent(student);
			jobInvitation.setJobInvitation_time(System.currentTimeMillis());
			basedao.add(jobInvitation);
			dataMap.put("result", true);
		} catch (Exception e) {
			dataMap.put("result", false);
			dataMap.put("error_msg", "抱歉！服务器开了个小差，请稍候再试！");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	//获取投递数量
	public String getNum() throws Exception{
		dataMap = new HashMap<String, Object>();
		List list = basedao.findByHQL("from JobInvitation where student.open_id='"+jobInvitation.getStudent().getOpen_id()+"'");
		if(list!=null){
			dataMap.put("jobInvitationNum", list.size());
		}else{
			dataMap.put("jobInvitationNum", 0);
		}
		dataMap.put("result", true);
		return SUCCESS;
	}
	//投递职位状态更新
	public String update() throws Exception{
		dataMap = new HashMap<String, Object>();
		JobPost jp = (JobPost) basedao.findById(JobPost.class, jobInvitation.getJobInvitation_id());
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
			hql = "from JobInvitation where student.open_id='"+ signarg + "' order by jobInvitation_time desc";
			break;
		case "cjobfeedback":
			//公司查看投递查看
			signarg = request.getParameter("signarg").toString();
			hql = "from JobInvitation where job.companyinfo.openid='"+ signarg + "' order by jobInvitation_time desc";
			break;	
		default:
			hql = "from JobInvitation order by jobInvitation_time desc";
			break;
		}
		List<JobInvitation> list = (List<JobInvitation>) basedao.findByHQL(hql);
		List<JobInvitation> listfind = (List<JobInvitation>) basedao.findByHQL(hql, index, pageSize);
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
