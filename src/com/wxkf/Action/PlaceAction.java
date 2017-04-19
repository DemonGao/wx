package com.wxkf.Action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.wxkf.Do.BaseHibernateDAO;

public class PlaceAction extends SuperAction{

	BaseHibernateDAO basedao = new BaseHibernateDAO();
	
	private static final long serialVersionUID = 1L;

	private Map<String, Object> dataMap;
	
	
	public Map<String, Object> getDataMap() {
		return dataMap;
	}


	public void setDataMap(Map<String, Object> dataMap) {
		this.dataMap = dataMap;
	}



	public String querys() throws Exception{
		dataMap = new HashMap<String, Object>();
		boolean result=true;
		String hql="from Place";
		List list=basedao.findByHQL(hql);
				if(list.size()==0){
					 result=false;
				}
		dataMap.put("list",list);
		dataMap.put("result", result);
		return SUCCESS;
	}
}
