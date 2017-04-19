package com.wxkf.Action;
//学生简历投递
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.wxkf.Do.BaseHibernateDAO;
import com.wxkf.Po.Job;
import com.wxkf.Po.Student;
import com.wxkf.Po.StudentExperience;
import com.wxkf.Po.StudentResume;

public class StudentResumnAction extends SuperAction{

	BaseHibernateDAO basedao = new BaseHibernateDAO();
	
	private static final long serialVersionUID = 1L;

	private Map<String, Object> dataMap;
	
	public Map<String, Object> getDataMap() {
		return dataMap;
	}


	public void setDataMap(Map<String, Object> dataMap) {
		this.dataMap = dataMap;
	}
	private StudentResume studentrm;

	public StudentResume getStudentrm() {
		return studentrm;
	}


	public void setStudentrm(StudentResume studentrm) {
		this.studentrm = studentrm;
	}
	
	//创建简历
	public String add(){
		dataMap=new HashMap<String,Object>();
		//JobCollection jobclt=new JobCollection();
		try {
//		String jobid=request.getParameter("job_id");
//		Long job_id = Long.parseLong(jobid);
//		String open_id=request.getParameter("student_openid");
		
		Student student = (Student) basedao.findById(Student.class, studentrm.getStudent().getOpen_id());
		System.out.println(student);
		if(student==null){
			//判断 当学生不存在的话(没有完善简历信息),则不能收藏
			dataMap.put("result", false);
			dataMap.put("error_msg", "您还没有完善简历信息，请先完善简历信息在进行投递！");
			return SUCCESS;
		}
//		StudentExperience experience=(StudentExperience) basedao.findById(StudentExperience.class, studentrm.getExperience().getOpen_id());
		//studentrm.setExperience(experience);
		studentrm.setStudent(student);
			basedao.add(studentrm);
			dataMap.put("result", true);
		} catch (Exception e) {
			dataMap.put("result", false);
			dataMap.put("error_msg", "抱歉！服务器开了个小差，请稍候再试！");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return SUCCESS;
	}

    //查询简历
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
				hql="from StudentResume where job_name like '%"+signarg+"%' order by job_pubdate desc";
				break;
			case "place" :
				signarg=request.getParameter("signarg").toString();
				hql="from StudentResume where companyinfo.companyinfo_city='"+signarg+"' order by job_pubdate desc";
				break;
			default :
				hql="from StudentResume order by jobCollection_time desc";
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
	//修改简历
	public String update(){
		dataMap=new HashMap<String,Object>();
		//JobCollection jobclt=new JobCollection();
		try {
//		String jobid=request.getParameter("job_id");
//		Long job_id = Long.parseLong(jobid);
//		String open_id=request.getParameter("student_openid");
		
		Student student = (Student) basedao.findById(Student.class, studentrm.getStudent().getOpen_id());
		if(student==null){
			//判断 当学生不存在的话(没有完善简历信息),则不能收藏
			dataMap.put("result", false);
			dataMap.put("error_msg", "您还没有完善简历信息，请先完善简历信息在进行投递！");
			return SUCCESS;
		}
//		StudentExperience experience=(StudentExperience) basedao.findById(StudentExperience.class, studentrm.getExperience().getOpen_id());
//		studentrm.setExperience(experience);
		studentrm.setStudent(student);
			basedao.update(studentrm);
			dataMap.put("result", true);
		} catch (Exception e) {
			dataMap.put("result", false);
			dataMap.put("error_msg", "抱歉！服务器开了个小差，请稍候再试！");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return SUCCESS;
	}

	
	public String querytest() throws Exception{
		dataMap=new HashMap<String,Object>();
		
		
		dataMap.put("Student", basedao.findByHQL("from Student"));
		return SUCCESS;
	}
	
}
