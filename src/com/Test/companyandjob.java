package com.Test;

import java.util.HashSet;
import java.util.Set;

import org.junit.Test;

import com.wxkf.Do.BaseHibernateDAO;
import com.wxkf.Po.CompanyInfo;
import com.wxkf.Po.Job;
import com.wxkf.Po.Student;
import com.wxkf.Po.StudentExperience;
import com.wxkf.Po.StudentResume;


public class companyandjob {

	BaseHibernateDAO basedao = new BaseHibernateDAO();
	//@Test
	public void add() throws Exception{
		
		
		CompanyInfo companyInfo = new CompanyInfo();
		companyInfo.setOpenid("1");
		Set<Job> setjobs = new HashSet<Job>();
		
		
		Job job =new Job();
		job.setJob_name("web工程师");
		//job.setCompanyinfo(companyInfo);
		setjobs.add(job);
		companyInfo.setJobSet(setjobs);
		
		basedao.add(companyInfo);
	}
	@Test
	public void del() throws Exception{
		//basedao.findById(CompanyInfo.class, "1")
		basedao.delete(CompanyInfo.class,"1");
	}
}
