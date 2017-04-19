package com.wxkf.Po;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
@Entity
public class Place {
	private Long place_id;
	private String place_name;
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)   //@GeneratedValue  一样
	@Column(length=5,unique=true)
	public Long getPlace_id() {
		return place_id;
	}
	public void setPlace_id(Long place_id) {
		this.place_id = place_id;
	}
	@Column(length=20)
	public String getPlace_name() {
		return place_name;
	}
	public void setPlace_name(String place_name) {
		this.place_name = place_name;
	}
	
	
	
	
	

}
