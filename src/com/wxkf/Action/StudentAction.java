package com.wxkf.Action;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.wxkf.Do.BaseHibernateDAO;
import com.wxkf.Po.Student;
import com.wxkf.Po.StudentExperience;
import com.wxkf.Po.StudentResume;
import com.wxkf.Util.Upload;

public class StudentAction extends SuperAction {

	BaseHibernateDAO basedao = new BaseHibernateDAO();

	private static final long serialVersionUID = 1L;

	private Map<String, Object> dataMap;
	private Student student;

	private StudentExperience stuExp;
	public Map<String, Object> getDataMap() {
		return dataMap;
	}

	public void setDataMap(Map<String, Object> dataMap) {
		this.dataMap = dataMap;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	/* 上传文件 */
	private List<File> file;
	private List<String> fileFileName;
	private List<String> fileContentType;

	public List<File> getFile() {
		return file;
	}

	public void setFile(List<File> file) {
		this.file = file;
	}

	public List<String> getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(List<String> fileFileName) {
		this.fileFileName = fileFileName;
	}

	public List<String> getFileContentType() {
		return fileContentType;
	}

	public void setFileContentType(List<String> fileContentType) {
		this.fileContentType = fileContentType;
	}
	public StudentExperience getStuExp() {
		return stuExp;
	}

	public void setStuExp(StudentExperience stuExp) {
		this.stuExp = stuExp;
	}

	/* end */
	// 个人信息增加/修改
	public String addinfo() throws Exception {
		System.out.println("1");
		boolean isadd = true;
		Student studentnew = (Student) basedao.findById(Student.class,
				student.getOpen_id());
		if (studentnew != null) {
			isadd = false;
		} else {
			studentnew = new Student();
			studentnew.setOpen_id(student.getOpen_id());
		}
		studentnew.setStudent_name(student.getStudent_name());
		studentnew.setStudent_gender(student.getStudent_gender());
		studentnew.setStudent_residence(student.getStudent_residence());
		studentnew.setStudent_state(student.getStudent_state());
		studentnew.setStudent_birthday(student.getStudent_birthday());
		studentnew.setStudent_school(student.getStudent_school());
		studentnew.setStudent_major(student.getStudent_major());
		studentnew.setStudent_qualifications(student
				.getStudent_qualifications());
		ArrayList list = null;
		if (file != null) {
			Upload upload = new Upload();
			list = upload.upload(file, this.getFileFileName(), "/upload/");
			studentnew.setStudent_img(list.toString());
		}
		// 设置日期格式
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		studentnew.setStudent_time(df.format(new Date()));

		if (isadd) {
			basedao.add(studentnew);

		} else {
			basedao.update(studentnew);
		}
		return SUCCESS;
	}

	// 学生插入联系方式
	public String updateContact() {
		dataMap = new HashMap<String, Object>();
		try {
			Student studentnew = (Student) basedao.findById(Student.class,
					student.getOpen_id());

			studentnew.setStudent_qq(student.getStudent_qq());
			studentnew.setStudent_tel(student.getStudent_tel());
			studentnew.setStudent_mailbox(student.getStudent_mailbox());
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			studentnew.setStudent_time(df.format(new Date()));
			basedao.update(studentnew);
			dataMap.put("result", true);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			dataMap.put("result", false);
		}

		return SUCCESS;
	}
	//修改或添加自我介绍
	public String updateAbout(){
		dataMap = new HashMap<String, Object>();
		try {
			Student studentnew = (Student) basedao.findById(Student.class,
					student.getOpen_id());
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			studentnew.setStudent_time(df.format(new Date()));
			studentnew.setStudent_aboutme(student.getStudent_aboutme());
			basedao.update(studentnew);
			dataMap.put("result", true);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			dataMap.put("result", false);
		}

		return SUCCESS;
	}
	//修改或添加自我介绍
	public String updateSpeciality(){
		dataMap = new HashMap<String, Object>();
		try {
			Student studentnew = (Student) basedao.findById(Student.class,
					student.getOpen_id());
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			studentnew.setStudent_time(df.format(new Date()));
			studentnew.setStudent_speciality(student.getStudent_speciality());
			basedao.update(studentnew);
			dataMap.put("result", true);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			dataMap.put("result", false);
		}
			return SUCCESS;
	}
	//修改或添加或删除职业技能
	public String updateSkill(){
		dataMap = new HashMap<String, Object>();
		try {
			Student studentnew = (Student) basedao.findById(Student.class,
					student.getOpen_id());
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			studentnew.setStudent_time(df.format(new Date()));
			studentnew.setStudent_skill(student.getStudent_skill());
			basedao.update(studentnew);
			dataMap.put("result", true);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			dataMap.put("result", false);
		}
			return SUCCESS;
	}
	
	// 查询所有学生
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
		case "title":
			signarg = request.getParameter("signarg").toString();
			hql = "from Student where case_name like '%" + signarg
					+ "%' order by case_id desc";
			break;
		case "id":
			signarg = request.getParameter("signarg").toString();
			hql = "from Student where case_id='" + signarg
					+ "' order by case_id desc";
			break;
		default:
			hql = "from Student order by case_id desc";
			break;
		}
		List<Student> list = (List<Student>) basedao.findByHQL(hql);
		if (list != null && list.size() > 0) {
			dataMap.put("result", true);
			dataMap.put("total", list.size());
			dataMap.put("pageSize", pageSize);
			dataMap.put("pageNum", pageNum);
			dataMap.put("pageNums", (list.size() - 1) / pageSize + 1);
			list = (List<Student>) basedao.findByHQL(hql, index, pageSize);
			dataMap.put("list", list);
		} else {
			dataMap.put("result", false);
			dataMap.put("error_msg", "没有查到数据...");
			dataMap.put("total", 0);
		}
		return SUCCESS;
	}

	// 查询单一学生简历
	public String query() {
		dataMap = new HashMap<String, Object>();
		// String hql="from student where open_id='"+openid+"'";
		System.out.println(student.getOpen_id());
		try {
			Student studentnew = (Student) basedao.findById(Student.class,
					student.getOpen_id());
			if (studentnew != null) {
				dataMap.put("result", true);
				dataMap.put("student", studentnew);
				return SUCCESS;
			} else {
				studentnew = new Student();
				dataMap.put("student", studentnew);
				dataMap.put("result", false);
			}
		} catch (Exception e) {
			dataMap.put("result", false);
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}

}
