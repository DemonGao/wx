package com.pc.Action;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.util.DBUtil;
import com.wxkf.Do.BaseHibernateDAO;
import com.wxkf.Po.CompanyInfo;
import com.wxkf.Po.Student;
import com.wxkf.Util.Upload;

public class CompanyInfoAction extends SuperAction{

	BaseHibernateDAO basedao = new BaseHibernateDAO();
	
	private static final long serialVersionUID = 1L;

	private Map<String, Object> dataMap;
	
	
	public Map<String, Object> getDataMap() {
		return dataMap;
	}


	public void setDataMap(Map<String, Object> dataMap) {
		this.dataMap = dataMap;
	}
	private CompanyInfo companyinfo;

	public CompanyInfo getCompanyinfo() {
		return companyinfo;
	}


	public void setCompanyinfo(CompanyInfo companyinfo) {
		this.companyinfo = companyinfo;
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

	/*----- gsc -----*/
	public String query() throws Exception{
		dataMap = new HashMap<String, Object>();
		CompanyInfo cinfo = (CompanyInfo) basedao.findById(CompanyInfo.class,companyinfo.getOpenid());
		if (cinfo != null) {
			dataMap.put("result", true);
			dataMap.put("list", cinfo);
			return SUCCESS;
		} else {
			cinfo = new CompanyInfo();
			dataMap.put("list", cinfo);
			dataMap.put("result", false);
		}
		return SUCCESS;
	}
	public String addinfo() throws Exception {
		boolean isadd = true;
		CompanyInfo cin = (CompanyInfo) basedao.findById(CompanyInfo.class,companyinfo.getOpenid());
		if (cin != null) {
			isadd = false;
		} else {
			cin = new CompanyInfo();
			cin.setOpenid(companyinfo.getOpenid());
		}
		cin.setCompanyinfo_name(companyinfo.getCompanyinfo_name());
		cin.setCompanyinfo_address(companyinfo.getCompanyinfo_address());
		cin.setCompanyinfo_about(companyinfo.getCompanyinfo_about());
		cin.setCompanyinfo_nickname(companyinfo.getCompanyinfo_nickname());
		cin.setCompanyinfo_tel(companyinfo.getCompanyinfo_tel());
		cin.setCompanyinfo_email(companyinfo.getCompanyinfo_email());
		cin.setCompanyinfo_city(companyinfo.getCompanyinfo_city());
		cin.setCompanyinfo_uptime(System.currentTimeMillis());
		
		ArrayList list = null;
		if (file != null) {
			Upload upload = new Upload();
			list = upload.upload(file, this.getFileFileName(), "/upload/");
			cin.setCompanyinfo_img(list.get(0).toString());
		}
		if (isadd) {
			basedao.add(cin);

		} else {
			basedao.update(cin);
		}
		return SUCCESS;
	}
	public String addqualification() throws Exception {
		boolean isadd = true;
		CompanyInfo cin = (CompanyInfo) basedao.findById(CompanyInfo.class,companyinfo.getOpenid());
		if (cin != null) {
			isadd = false;
		} else {
			return INPUT;
		}
		cin.setCompanyinfo_url(companyinfo.getCompanyinfo_url());
		cin.setCompanyinfo_type(companyinfo.getCompanyinfo_type());
		cin.setCompanyinfo_size(companyinfo.getCompanyinfo_size());
		cin.setCompanyinfo_legal_person(companyinfo.getCompanyinfo_legal_person());
		cin.setCompanyinfo_uptime(System.currentTimeMillis());
		
		ArrayList list = null;
		if (file != null) {
			Upload upload = new Upload();
			list = upload.upload(file, this.getFileFileName(), "/upload/");
			cin.setCompanyinfo_copy(list.get(0).toString());
			cin.setCompanyinfo_certificates(list.get(1).toString());
		}
		basedao.update(cin);
		return SUCCESS;
	}
	/*-----gsc end -----*/
	public String add2() throws Exception {
		System.out.println("1");
		boolean isadd = true;
		CompanyInfo companyinfonew = (CompanyInfo) basedao.findById(CompanyInfo.class,companyinfo.getOpenid());
		if (companyinfonew != null) {
			isadd = false;
		} else {
			companyinfonew = new CompanyInfo();
			companyinfonew.setOpenid(companyinfo.getOpenid());
		}
		if(companyinfo.getCompanyinfo_city()!=null){
					companyinfonew.setCompanyinfo_city(companyinfo.getCompanyinfo_city());
					companyinfonew.setCompanyinfo_size(companyinfo.getCompanyinfo_size());
					companyinfonew.setCompanyinfo_url(companyinfo.getCompanyinfo_url());
					companyinfonew.setCompanyinfo_type(companyinfo.getCompanyinfo_type());
					//companyinfonew.setCompanyinfo_copy(companyinfo.getCompanyinfo_copy());
					//companyinfonew.setCompanyinfo_certificates(companyinfo.getCompanyinfo_certificates());
					companyinfonew.setCompanyinfo_legal_person(companyinfo.getCompanyinfo_legal_person());
					
					ArrayList list = null;
					if (file != null) {
						Upload upload = new Upload();
						list = upload.upload(file, this.getFileFileName(), "/upload/");
						companyinfonew.setCompanyinfo_copy(list.get(0).toString());
						companyinfonew.setCompanyinfo_certificates(list.get(1).toString());
					}
		}else if(companyinfo.getCompanyinfo_name()!=null){
		    companyinfonew.setCompanyinfo_name(companyinfo.getCompanyinfo_name());
		    companyinfonew.setCompanyinfo_address(companyinfo.getCompanyinfo_address());
		    companyinfonew.setCompanyinfo_about(companyinfo.getCompanyinfo_about());
		    companyinfonew.setCompanyinfo_nickname(companyinfo.getCompanyinfo_nickname());
		    companyinfonew.setCompanyinfo_tel(companyinfo.getCompanyinfo_tel());
		   companyinfonew.setCompanyinfo_email(companyinfo.getCompanyinfo_email());
		    ArrayList list = null;
		    System.out.println("公司基本信息");
			if (file != null) {
				Upload upload = new Upload();
				list = upload.upload(file, this.getFileFileName(), "/upload/");
				companyinfonew.setCompanyinfo_img(list.toString());
			}
        }
		
		companyinfonew.setCompanyinfo_uptime(System.currentTimeMillis());
		if (isadd) {
			basedao.add(companyinfonew);

		} else {
			basedao.update(companyinfonew);
		}
		return SUCCESS;
	}


	//插入公司信息
	public String add1(){
		dataMap=new HashMap<String,Object>();
		try {
			System.out.println(111);
			String sql="";
			CompanyInfo company2=(CompanyInfo) basedao.findById(CompanyInfo.class, companyinfo.getOpenid());
			if(company2!=null){
			//String sql="insert into companyinfo (companyinfo_city,companyinfo_size,companyinfo_url,companyinfo_type,companyinfo_copy,companyinfo_certificates,companyinfo_legal_person) values (companyinfo.companyinfo_city,companyinfo.companyinfo_size,companyinfo.companyinfo_url,companyinfo.companyinfo_type,companyinfo.companyinfo_copy,companyinfo.companyinfo_certificates,companyinfo.companyinfo_legal_person)";
			
				if(companyinfo.getCompanyinfo_city()!=null){
				sql="update companyinfo set companyinfo_city='"+companyinfo.getCompanyinfo_city()+"',companyinfo_size='"+companyinfo.getCompanyinfo_size()+"',companyinfo_url='"+companyinfo.getCompanyinfo_url()+"',companyinfo_type='"+companyinfo.getCompanyinfo_type()+"',companyinfo_copy='"+companyinfo.getCompanyinfo_copy()+"',companyinfo_certificates='"+companyinfo.getCompanyinfo_certificates()+"',companyinfo_legal_person='"+companyinfo.getCompanyinfo_legal_person()+"' where openid='"+companyinfo.getOpenid()+"'";
				}else if(companyinfo.getCompanyinfo_name()!=null){
			    sql="update companyinfo set companyinfo_name='"+companyinfo.getCompanyinfo_name()+"',companyinfo_address='"+companyinfo.getCompanyinfo_address()+"',companyinfo_img='"+companyinfo.getCompanyinfo_img()+"',companyinfo_about='"+companyinfo.getCompanyinfo_about()+"',companyinfo_nickname='"+companyinfo.getCompanyinfo_nickname()+"',companyinfo_tel='"+companyinfo.getCompanyinfo_tel()+"',companyinfo_email='"+companyinfo.getCompanyinfo_email() +"' where openid='"+companyinfo.getOpenid()+"'";
	            }
			    Boolean se=DBUtil.update(sql);
			System.out.println(se);
			if(se==true){
				dataMap.put("result", true);
				return SUCCESS;
			}else{
				dataMap.put("result", false);
				return ERROR;
			}
			
			}else{
			basedao.add(companyinfo);
			}
		} catch (Exception e) {
			dataMap.put("result", false);
			
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ERROR;
	}

	
	
	 //查询公司
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
				case "title" :
					signarg=request.getParameter("signarg").toString();
					hql="from CompanyInfo where case_name like '%"+signarg+"%'";
					break;
				case "id" :
					signarg=request.getParameter("signarg").toString();
					hql="from CompanyInfo where openid='"+signarg+"'";
					break;
				default :
					hql="from CompanyInfo";
					break;
			}
			List<CompanyInfo> list= (List<CompanyInfo>) basedao.findByHQL(hql);
			if(list!=null&&list.size()>0){
				dataMap.put("result",true);
				dataMap.put("total", list.size());
				dataMap.put("pageSize",pageSize);
				dataMap.put("pageNum",pageNum);
				dataMap.put("pageNums", (list.size() -1)/pageSize + 1);
				list= (List<CompanyInfo>) basedao.findByHQL(hql,index,pageSize);
				dataMap.put("list", list);
			}else{
				dataMap.put("result", false);
				dataMap.put("error_msg", "没有查到数据...");
				dataMap.put("total", 0);
			}
			return SUCCESS;
		}
	//修改
	public String update(){
		dataMap= new HashMap<String,Object>();
		try {
			basedao.update(companyinfo);
			dataMap.put("result", true);
		} catch (Exception e) {
			dataMap.put("result", false);
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	//删除信息
//	public String delete(){
//		dataMap= new HashMap<String,Object>();
//		try {
//			basedao.delete(company);
//			dataMap.put("result", true);
//		} catch (Exception e) {
//			dataMap.put("result", false);
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return SUCCESS;
//	}
}
