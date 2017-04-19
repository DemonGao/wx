package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DBUtil {
	
	private static String url = "jdbc:mysql://localhost:3306/wx?useUnicode=true&characterEncoding=UTF-8";
	private static String user  ="root";
	private static String password = "root";
//	private static String password = "demon";
	private static String driverName = "com.mysql.jdbc.Driver";
	static{
		try {
			Class.forName(driverName);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	private static Connection getConnection(){
		Connection connection =  null;
		try {
			connection = DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return connection;
	}
	
	
	public static Object querry(String sql){
		Connection connection = getConnection();
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		Object rs=null;
		try{
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			rs=resultSet.next();
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			if(resultSet != null){
				try {
					resultSet.close();
					resultSet = null;
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			if(preparedStatement != null){
				try {
					preparedStatement.close();
					preparedStatement = null;
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			if(connection != null){
				try {
					connection.close();
					connection = null;
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
		}
		return driverName;
		
	}
	
	public static List<Map<String,Object>> query(String sql){
		Connection connection = getConnection();
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		List<Map<String,Object>> list = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			list = dataWrap(resultSet);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			if(resultSet != null){
				try {
					resultSet.close();
					resultSet = null;
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			if(preparedStatement != null){
				try {
					preparedStatement.close();
					preparedStatement = null;
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			if(connection != null){
				try {
					connection.close();
					connection = null;
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
		}
		return list;
	}
	
	private static List<Map<String,Object>> dataWrap(ResultSet resultSet){
		List<Map<String,Object>> list = null;
		Map<String,Object> map = null;
		if(resultSet != null){
			list = new ArrayList<Map<String,Object>>();
			try {
				ResultSetMetaData resultSetMetaData = resultSet.getMetaData();
				int columnCount = resultSetMetaData.getColumnCount();
				while(resultSet.next()){
					map = new HashMap<String,Object>();
					for(int i = 0;i < columnCount;i++){
						String labelName = resultSetMetaData.getColumnLabel(i + 1);
						String value = resultSet.getString(labelName);
						map.put(labelName.toUpperCase(), value);
					}
					list.add(map);
					
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	public static Boolean update(String sql){
		Connection connection = getConnection();
		PreparedStatement preparedStatement = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}finally{
			if(preparedStatement != null){
				try {
					preparedStatement.close();
					preparedStatement = null;
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			if(connection != null){
				try {
					connection.close();
					connection = null;
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
	}
	
	public static String strToDate(String strDate) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-HH:mm");
		String date=sdf.format(Long.parseLong(strDate));
		return date;
	}
	public static String strToDate(String strDate1,String strDate2) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-HH:mm");
		String date=sdf.format(Long.parseLong(strDate1)+Long.parseLong(strDate2));
		return date;
	}
	
//	public static void main(String[] args) {
//		List<Map<String,Object>> list = DBUtil.query(" SELECT * FROM USER ");
//		if(list != null && list.size() > 0){
//			for(Map<String,Object> map : list){
//				String username = map.get("USERNAME").toString();
//				String pwd = map.get("PASSWORD").toString();
//				System.out.println(username +"   " + pwd);
//			}
//		}
//		System.out.println(strToDate("1449338281101"));
//	}
}