package com.wxkf.Util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;

public class Upload {
	/*
	 * @file:文件域列表
	 * 
	 * @fileName:上传文件的文件名
	 * 
	 * @path:文件上传的目录，相对目录。 说明：文件上传所存放目录的规则：网站根目录下 files/会员ID/网站类型名称/上传文件分类名称/
	 * 
	 * @返回结果：一个存放上传文件所在位置相对路径的ArrayList
	 */
	public ArrayList upload(List file, List fileName, String path)
			throws IOException {
		String root = ServletActionContext.getRequest().getRealPath(path);
//		String root = ServletActionContext.getServletContext()
//				.getRealPath(path);
//		String root = "c:/dxtapp"+path;
		File dir = new File(root);
		if (dir.exists() == false) {
			dir.mkdirs();
		}
		ArrayList list = new ArrayList();
		for (int i = 0; i < file.size(); ++i) {
			InputStream is = new FileInputStream(file.get(i).toString());
			/*
			 * SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");//
			 * 格式化时间输出 String Rname = sdf.format(new Date());//
			 * 取得当前时间，Date()是java.util包里的，这作为真实名称 name = Rname + name;//
			 * 重命名文件名称,命名规则为：时间+原文件名称
			 */

			String name = (int) (Math.random() * 1000)+ fileName.get(i).toString();// 得到上传文件的原名称
			File destFile = new File(root, name);

			OutputStream os = new FileOutputStream(destFile);

			byte[] buffer = new byte[400];

			int length = 0;

			while ((length = is.read(buffer)) > 0) {
				os.write(buffer, 0, length);
			}
			list.add(path + name);
//			list.add(root + name);
			is.close();
			os.close();
		}
		return list;
	}
}
