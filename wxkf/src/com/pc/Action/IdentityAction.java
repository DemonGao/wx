package com.pc.Action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.util.DBUtil;
import com.wxkf.Do.BaseHibernateDAO;

public class IdentityAction extends SuperAction{

	BaseHibernateDAO basedao = new BaseHibernateDAO();
	
	private static final long serialVersionUID = 1L;

	private Map<String, Object> dataMap;
	
	
	public Map<String, Object> getDataMap() {
		return dataMap;
	}


	public void setDataMap(Map<String, Object> dataMap) {
		this.dataMap = dataMap;
	}


//判断是学生还是公司身份
	public String query() throws Exception{
		dataMap = new HashMap<String, Object>();
		String openid=request.getParameter("openid");
		String sql="select type from user where openid='"+openid+"'";

		List<Map<String,Object>> list =DBUtil.query(sql);
		if(list!=null&&list.size()!=0){
			int type = Integer.parseInt(list.get(0).get("TYPE").toString());
			if(type==1){
				dataMap.put("result", false);
				return SUCCESS;
			}
		}
		dataMap.put("result", true);
		return SUCCESS;
	}
}
