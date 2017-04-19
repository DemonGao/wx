package com.Test;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.junit.Test;

import com.wxkf.Do.BaseHibernateDAO;
import com.wxkf.Po.FaceBack;
import com.wxkf.Po.Student;
import com.wxkf.Po.StudentExperience;
import com.wxkf.hibernate.HibernateSessionFactory;

public class test {

	
	public void update() throws Exception {
		Student s = new Student();
		s.setOpen_id("o6yKmw8QEd6vVrud2ZpBBMLG8z3Y1");
		s.setStudent_name("王秋实");
		s.setStudent_major("软件工程");

		Set<StudentExperience> sets = new HashSet<StudentExperience>();
		StudentExperience sexp = new StudentExperience();
		sexp.setStudentexp_company("大业数据");
		sexp.setStudentexp_jobtype("实习");
		sexp.setStudent(s);
		StudentExperience sexp1 = new StudentExperience();
		sexp1.setStudentexp_company("烟台九五零");
		sexp1.setStudentexp_jobtype("就业");
		sexp1.setStudent(s);
		sets.add(sexp);
		sets.add(sexp1);
		s.setStudentExperience(sets);
		BaseHibernateDAO basedao = new BaseHibernateDAO();

		basedao.add(s);
		// 开启会话
		Session session = HibernateSessionFactory.getSession();
		// 开启事务
		Transaction tc = null;
		try {
			tc = session.beginTransaction();
			// 执行操作
			session.update(s);
			tc.commit();
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			tc.rollback();
		} finally {
			HibernateSessionFactory.closeSession();
		}
	}

	
	public void query() throws Exception {
		BaseHibernateDAO basedao = new BaseHibernateDAO();

		Student student = (Student) basedao.findById(Student.class,
				"o6yKmw8QEd6vVrud2ZpBBMLG8z3Y");
		System.out.println(student.getStudent_name());
		Set set=student.getStudentExperience();
		System.out.println(set.size());
		// create an iterator
		
	}
	
	@Test
	public void add() throws Exception {
		BaseHibernateDAO basedao = new BaseHibernateDAO();

		FaceBack fb = new FaceBack();
		fb.setFaceback_text("12312");
		
		basedao.add(fb);
		
	}
}
