package com.wxkf.Po;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


@Entity
public class FaceBack {

	private int faceback_id;	//反馈id
	private String openid;		//反馈人的openid
	private String faceback_text;//反馈内容
	private long faceback_time;//反馈时间
	private String faceback_tel;//反馈人的联系方式
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)   //@GeneratedValue  一样
	@Column(length=20,unique=true)
	public int getFaceback_id() {
		return faceback_id;
	}
	public void setFaceback_id(int faceback_id) {
		this.faceback_id = faceback_id;
	}
	@Column(length=30)
	public String getOpenid() {
		return openid;
	}
	@Column(length=200)
	public void setOpenid(String openid) {
		this.openid = openid;
	}
	public String getFaceback_text() {
		return faceback_text;
	}
	public void setFaceback_text(String faceback_text) {
		this.faceback_text = faceback_text;
	}
	@Column(length=30)
	public long getFaceback_time() {
		return faceback_time;
	}
	public void setFaceback_time(long faceback_time) {
		this.faceback_time = faceback_time;
	}
	@Column(length=20)
	public String getFaceback_tel() {
		return faceback_tel;
	}
	public void setFaceback_tel(String faceback_tel) {
		this.faceback_tel = faceback_tel;
	}

	
	
}
