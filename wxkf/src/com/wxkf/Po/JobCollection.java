package com.wxkf.Po;
//感兴趣
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.apache.struts2.json.annotations.JSON;
@Entity
public class JobCollection {

	private long jobCollection_id;
	private Job job;
	private Student student;
	private Long jobCollection_time;		//学生收藏职位的时间
	private int status;		//状态	0:展示	1:不展示
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)   //@GeneratedValue  一样
	@Column(length=10,unique=true)
	public long getJobCollection_id() {
		return jobCollection_id;
	}
	public void setJobCollection_id(long jobCollection_id) {
		this.jobCollection_id = jobCollection_id;
	}
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="job_id")//设置外键字段为job_id
	public Job getJob() {
		return job;
	}
	public void setJob(Job job) {
		this.job = job;
	}
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="openid")//设置外键字段为student_id
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	
	@Column(length=20)
	public Long getJobCollection_time() {
		return jobCollection_time;
	}
	public void setJobCollection_time(Long jobCollection_time) {
		this.jobCollection_time = jobCollection_time;
	}
	@Column(length=20,columnDefinition="INT default 0")
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	
	
	
}
