package com.wxkf.Po;


import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

@Entity
public class StudentResume {
	private String studentResume_id;
	private Student student;
	
	private Set<StudentExperience> experience = new HashSet<StudentExperience>();
	
	@Id  
    @GeneratedValue(generator = "myForeignGenerator")  
    @GenericGenerator(name = "myForeignGenerator",   
            strategy = "foreign",   
            parameters = @Parameter(name = "property", value = "student")) 
	public String getStudentResume_id() {
		return studentResume_id;
	}
	public void setStudentResume_id(String studentResume_id) {
		this.studentResume_id = studentResume_id;
	}
	
	@OneToOne(cascade=CascadeType.ALL,mappedBy="studentResume")
	@JoinColumn(name="open_id")//设置外键字段为student_id
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	@OneToMany(mappedBy="studentResume",cascade=CascadeType.ALL)
	public Set<StudentExperience> getExperience() {
		return experience;
	}
	public void setExperience(Set<StudentExperience> experience) {
		this.experience = experience;
	}

}

/*
 * package com.wxkf.Po;


import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
@Entity
public class StudentResume {
	private Long studentResume_id;
	private Student student;
	
	private Set<StudentExperience> experience = new HashSet<StudentExperience>();
	
//	@ManyToOne(cascade=CascadeType.ALL)
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="open_id")//设置外键字段为student_id
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="studentResume_id",length=11,unique=true)
	public Long getStudentResume_id() {
		return studentResume_id;
	}
	public void setStudentResume_id(Long studentResume_id) {
		this.studentResume_id = studentResume_id;
	}
	
	@OneToMany(mappedBy="studentResume",cascade=CascadeType.ALL)
	public Set<StudentExperience> getExperience() {
		return experience;
	}
	public void setExperience(Set<StudentExperience> experience) {
		this.experience = experience;
	}

}
 * 
 * **/
