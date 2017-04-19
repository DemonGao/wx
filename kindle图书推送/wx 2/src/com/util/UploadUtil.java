package com.util;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Random;

import javax.servlet.ServletException;

import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

public class UploadUtil {
	public String Upload() throws IOException, ServletException{
		Random rd = new Random();   
		Calendar time = Calendar.getInstance(); 
		//第一步:新建一个对象
		SmartUpload su = new SmartUpload();   
		//初始化上传   
		//su.initialize(pageContext);  
		//定义允许上传文件类型    
		su.setAllowedFilesList("gif,jpg,pdf,txt");   
		//不允许上传文件类型   
		try {
			su.setDeniedFilesList("jsp,asp,php,aspx,html.htm");
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			//文件类型不符合!
		}   
		//单个文件最大限制   
		su.setMaxFileSize(1024000);   
		//总共上传文件限制   
		su.setTotalMaxFileSize(5000000);   
		//开始上传,如果超过限制或者为不允许类型，抛出异常提示   
		su.setContentDisposition(null);   
		try {   
		su.upload();   
		} catch (Exception e) {   
		//out.println("你选择的文件不允许上传或者文件过大，请返回检查！");   
		}   
		//得到单个上传文件的信息   
		for (int i = 0; i < su.getFiles().getCount(); i++) {   
		com.jspsmart.upload.File file = su.getFiles().getFile(i);   
		if (file.isMissing()) continue;   
		//定义上传后另存为的文件名   
		String filename = String.valueOf(time.get(Calendar.YEAR))   
		+ String.valueOf(time.get(Calendar.MONTH))   
		+ String.valueOf(time.get(Calendar.DAY_OF_MONTH))   
		+ String.valueOf(time.get(Calendar.HOUR_OF_DAY))   
		+ String.valueOf(time.get(Calendar.MINUTE))   
		+ String.valueOf(time.get(Calendar.SECOND))   
		+ String.valueOf(rd.nextInt(100)) + "."   
		+ file.getFileExt();   
		//文件另存为   
		try {
			file.saveAs("/upload/"+filename);
		} catch (SmartUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			//文件夹不错在
		}   
		//out.println("上传后的文件名为:" + filename);   
		}   
		return null;
		
	}
}
