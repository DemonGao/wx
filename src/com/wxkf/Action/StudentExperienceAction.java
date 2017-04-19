package com.wxkf.Action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.cfg.Configuration;

import com.wxkf.Do.BaseHibernateDAO;
import com.wxkf.Po.Student;
import com.wxkf.Po.StudentExperience;
import com.wxkf.hibernate.HibernateSessionFactory;

public class StudentExperienceAction extends SuperAction {

	BaseHibernateDAO basedao = new BaseHibernateDAO();

	private static final long serialVersionUID = 1L;

	private Map<String, Object> dataMap;

	public Map<String, Object> getDataMap() {
		return dataMap;
	}

	public void setDataMap(Map<String, Object> dataMap) {
		this.dataMap = dataMap;
	}

	private StudentExperience stuExp;

	public StudentExperience getStuExp() {
		return stuExp;
	}

	public void setStuExp(StudentExperience stuExp) {
		this.stuExp = stuExp;
	}

	// 工作经验
	public String addExp() {
		dataMap = new HashMap<String, Object>();
		try {
			Student studentnew = (Student) basedao.findById(Student.class,
					stuExp.getStudent().getOpen_id());
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			studentnew.setStudent_time(df.format(new Date()));
			stuExp.setStudent(studentnew);
			if (stuExp.getStudentexp_id() == null) {
				// 获取当前的工作经验集合
				Set<StudentExperience> set = studentnew.getStudentExperience();
				set.add(stuExp);
				studentnew.setStudentExperience(set);
				basedao.update(studentnew);
			} else {
				StudentExperience stuExp1 = (StudentExperience) basedao
						.findById(StudentExperience.class, stuExp.getStudentexp_id());
				stuExp1.setStudentexp_company(stuExp.getStudentexp_company());
				stuExp1.setStudentexp_jobname(stuExp.getStudentexp_jobname());
				stuExp1.setStudentexp_jobtype(stuExp.getStudentexp_jobtype());
				stuExp1.setStudentexp_entrytime(stuExp.getStudentexp_entrytime());
				stuExp1.setStudentexp_departuretime(stuExp.getStudentexp_departuretime());
				stuExp1.setStudentexp_describe(stuExp.getStudentexp_describe());
				basedao.update(stuExp1);
			}
			dataMap.put("result", true);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			dataMap.put("result", false);
		}

		return SUCCESS;
	}

	// 删除 工作经验
	public String delExp() {
		dataMap = new HashMap<String, Object>();
		try {
			StudentExperience a=new StudentExperience();
			a.setStudentexp_id(stuExp.getStudentexp_id());
			basedao.del(a);
			dataMap.put("result", true);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			dataMap.put("result", false);
		}
		return SUCCESS;
	}
	
	public String query(){
		dataMap = new HashMap<String, Object>();
		try {
			StudentExperience stuExp1 = (StudentExperience)basedao.findById(StudentExperience.class, stuExp.getStudentexp_id());
			dataMap.put("stuExp", stuExp1);
			dataMap.put("result", true);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			dataMap.put("result", false);
		}
		return SUCCESS;
		
	}
}
