package com.pc.Action;

import java.util.HashMap;
import java.util.Map;

import com.wxkf.Do.BaseHibernateDAO;

public class Action extends SuperAction{

	BaseHibernateDAO basedao = new BaseHibernateDAO();
	
	private static final long serialVersionUID = 1L;

	private Map<String, Object> dataMap;
	
	
	public Map<String, Object> getDataMap() {
		return dataMap;
	}


	public void setDataMap(Map<String, Object> dataMap) {
		this.dataMap = dataMap;
	}



	public String querys(){
		dataMap = new HashMap<String, Object>();
		
		dataMap.put("result", true);
		return SUCCESS;
	}
}
