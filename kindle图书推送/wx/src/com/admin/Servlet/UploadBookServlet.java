package com.admin.Servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
import com.util.ChineseToEnglish;
import com.util.DBUtil;
public class UploadBookServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//上传文件的保存路径  
    protected String configPath = "upload/widget";  
  
    protected String dirTemp = "upload/widget/temp";  
      
    protected String dirName = "file";  
       
    
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session=request.getSession();
		request.setCharacterEncoding("UTF-8");  
        response.setContentType("text/html; charset=UTF-8");  
        PrintWriter out = response.getWriter();  
        
        String uploadPic="";
        //文件保存目录路径  
//        String savePath = "E:/";  
//        String savePath = this.getServletContext().getRealPath("/") + configPath;  
        String savePath = "c:/kindlebook/" +configPath;
        // 临时文件目录   
//        String tempPath = this.getServletContext().getRealPath("/") + dirTemp; 
        String tempPath = "c:/kindlebook/" + dirTemp;
          
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");  
        String ymd = sdf.format(new Date());  
        savePath += "/" + ymd + "/";  
        //创建文件夹  
        File dirFile = new File(savePath);  
        if (!dirFile.exists()) {  
            dirFile.mkdirs();  
        }  
          
        tempPath += "/" + ymd + "/";  
        //创建临时文件夹  
        File dirTempFile = new File(tempPath);  
        if (!dirTempFile.exists()) {  
            dirTempFile.mkdirs();  
        }  
          
        DiskFileItemFactory  factory = new DiskFileItemFactory();  
        factory.setSizeThreshold(5 * 1024 * 1024); //设定使用内存超过5M时，将产生临时文件并存储于临时目录中。     
        factory.setRepository(new File(tempPath)); //设定存储临时文件的目录。     
        ServletFileUpload upload = new ServletFileUpload(factory);  
        upload.setHeaderEncoding("UTF-8");  
        
        
        /*用SmartUpload方法处理request*/
        SmartUpload su = new  SmartUpload();
        String BOOK_TYPE = session.getAttribute("uploadbook_booktype").toString();
        System.out.println(BOOK_TYPE);
        
        try {  
            List items = upload.parseRequest(request);  
            System.out.println("items = " + items);  
            Iterator itr = items.iterator();  
              
            while (itr.hasNext())   
            {  
                FileItem item = (FileItem) itr.next();  
                String fileName = item.getName();  
                long fileSize = item.getSize();  
                if (!item.isFormField()) {  
                    String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();  
//                    SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");  
//                    String newFileName = df.format(new Date()) + "_" + new Random().nextInt(1000) + "." + fileExt; 
                    String newFileName = fileName.substring(0, fileName.lastIndexOf(".")) + "_" + new Random().nextInt(1000) + "." + fileExt;  
                    try{  
                        File uploadedFile = new File(savePath, newFileName);  
                        
                        OutputStream os = new FileOutputStream(uploadedFile);  
                        InputStream is = item.getInputStream();  
                        byte buf[] = new byte[2048];//可以修改 1024 以提高读取速度  
                        int length = 0;    
                        while( (length = is.read(buf)) > 0 ){    
                            os.write(buf, 0, length);    
                        }    
                        //关闭流    
                        os.flush();  
                        os.close();    
                        is.close();    
                        
                        System.out.println("上传成功！路径："+savePath+newFileName);  
//                        out.print(savePath+"/"+newFileName);
//                        System.out.println("session="+session.getAttribute("files"));
//                        if(session.getAttribute("files")!=null)
//                        {
                        	
//                        	session.setAttribute("files", session.getAttribute("files")+ymd+"/"+newFileName+",");
//                        }else{
//                        	session.setAttribute("files",newFileName+":" );
//                        	session.setAttribute("files",ymd+"/"+newFileName+",");
//                        }
                        String BOOK_NAME = fileName.substring(0,fileName.lastIndexOf("."));
                        String BOOK_NAMESERCH =BOOK_NAME+ChineseToEnglish.getFullSpell(BOOK_NAME);
//                        String BOOK_URL = configPath+"/"+ymd+"/"+newFileName;
                        String BOOK_URL = savePath+newFileName;
                        String BOOK_UPTIME = DBUtil.strToDate(System.currentTimeMillis()+"");
                        String BOOK_SIZE = DBUtil.byteToKBorMB(fileSize);
                        System.out.println("名称:"+BOOK_NAME);
                        System.out.println("路径:"+BOOK_URL);
                        System.out.println("上传时间:"+BOOK_UPTIME);
                        System.out.println("模糊查询:"+BOOK_NAMESERCH);
                        System.out.println("文件大小"+DBUtil.byteToKBorMB(fileSize));
                        String sql = "insert into book(BOOK_NAME,BOOK_NAMESERCH,BOOK_URL,BOOK_UPTIME,BOOK_TYPE,BOOK_SIZE) value("+
                        					"'"+BOOK_NAME+"','"+BOOK_NAMESERCH+"',+'"+BOOK_URL+"','"+BOOK_UPTIME+"','"+BOOK_TYPE+"','"+BOOK_SIZE+"')";
                        DBUtil.update(sql);
                    }catch(Exception e){  
                        e.printStackTrace();  
                    }  
                }else {  
                    String filedName = item.getFieldName();  
                    System.out.println("===============");   
                    System.out.println(new String(item.getString().getBytes("iso-8859-1"),"utf-8"));  
                    System.out.println("FieldName："+filedName);  
                    // 获得裁剪部分的坐标和宽高
                    System.out.println("String："+item.getString());  
                }             
            }   
              
        } catch (FileUploadException e) {  
            // TODO Auto-generated catch block  
            e.printStackTrace();  
        }  
        out.flush();  
        out.close(); 
//		long Sid=System.currentTimeMillis();
//		String Spic=filenames;
//		
//		String sql="INSERT INTO shop(Sid,Spic) VALUES('"+Sid+"','"+Spic+"')";
		
		//2015年11月27日14:51:08
//		HttpSession session = request.getSession(); 
//		String Stitle=(String) session.getAttribute("Stitle");
//		String Stype=(String) session.getAttribute("Stype") ;
//		String Sprice=(String) session.getAttribute("Sprice") ;
//		String Sbargain=(String) session.getAttribute("Sbargain") ;
//		String UserPhoneNumber=(String) session.getAttribute("UserPhoneNumber") ;
//		String Smessage=(String) session.getAttribute("Smessage") ;
		//String sql="INSERT INTO shop(Sid,Stitle,Stype,Sprice,Sbargain,UserPhoneNumber,Spic,Smessage) VALUES('"+Sid+"','"+Stitle+"','"+Stype+"','"+Sprice+"','"+Sbargain+"','"+UserPhoneNumber+"','"+Spic+"','"+Smessage+"')";
//		if(DBUtil.update(sql))
//		{
//        	HttpSession session=request.getSession();
//        	session.setAttribute("uploadPic", uploadPic);
//			response.sendRedirect("/imarket/imarket/page/showunusedmessage.jsp");
//		}else{
//			response.sendRedirect("/imarket/imarket/page/loginfail.jsp");
//		}
        
	}


}
