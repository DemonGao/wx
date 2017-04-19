package com.pc.Action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.wxkf.Do.BaseHibernateDAO;
import com.wxkf.Do.IBaseHibernateDAO;

public class JobtypeAction extends SuperAction{

	BaseHibernateDAO basedao = new BaseHibernateDAO(); 
	private static final long serialVersionUID = 1L;

	private Map<String, Object> dataMap;
	
	
	public Map<String, Object> getDataMap() {
		return dataMap;
	}


	public void setDataMap(Map<String, Object> dataMap) {
		this.dataMap = dataMap;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	public String querys() throws Exception{
		dataMap = new HashMap<String, Object>();
		List list = basedao.findByHQL("from JobType");
		System.out.println(list.size());
		dataMap.put("result", true);
		dataMap.put("list", list);
		
		return SUCCESS;
	}
}
