package com.pc.Action;

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
