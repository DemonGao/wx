package com.wxkf.Action;

import java.util.HashMap;
import java.util.Map;

import com.wxkf.Do.BaseHibernateDAO;
import com.wxkf.Po.FaceBack;

public class FaceBackAction extends SuperAction{

	BaseHibernateDAO basedao = new BaseHibernateDAO();
	
	private static final long serialVersionUID = 1L;

	private Map<String, Object> dataMap;
	private FaceBack faceback;
	
	public FaceBack getFaceback() {
		return faceback;
	}

	public void setFaceback(FaceBack faceback) {
		this.faceback = faceback;
	}

	public Map<String, Object> getDataMap() {
		return dataMap;
	}

	public void setDataMap(Map<String, Object> dataMap) {
		this.dataMap = dataMap;
	}
	
	public String add(){
		dataMap = new HashMap<String, Object>();
		try {
			faceback.setFaceback_time(System.currentTimeMillis());
			basedao.add(faceback);
			dataMap.put("result", true);
			dataMap.put("msg","意见反馈成功,感恩有你!");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			dataMap.put("result", false);
			dataMap.put("msg","抱歉！服务器开了个小差，请稍候再试！");
		}
		return SUCCESS;
		
	}
	public String querys() throws Exception{
		dataMap = new HashMap<String, Object>();
		
		dataMap.put("result", true);
		return SUCCESS;
	}
}
