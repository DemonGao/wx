package com.wx.util.javaMail;
import java.util.Properties;

import javax.mail.Message;  
import javax.mail.MessagingException;
import javax.mail.Session;  
import javax.mail.Transport;  
import javax.mail.internet.MimeMessage;  
/**  
 * 邮件发送程序  
 * @author haolloyin  
 */ 
public class MessageSender {  
 
    /**  
     * 创建Session对象，此时需要配置传输的协议，是否身份认证  
     */ 
    public Session createSession(String protocol) {  
        Properties property = new Properties();  
        property.setProperty("mail.transport.protocol", protocol);  
        property.setProperty("mail.smtp.auth", "true");  
//        property.setProperty("mail.smtp.connectiontimeout", "120000");
        property.setProperty("mail.smtp.timeout","250000");//超时时间
        Session session = Session.getInstance(property);  
          
        // 启动JavaMail调试功能，可以返回与SMTP服务器交互的命令信息  
        // 可以从控制台中看一下服务器的响应信息  
//        session.setDebug(true);   
        session.setDebug(false);//关闭调试功能
        return session;  
    }  
 
    /**  
     * 传入Session、MimeMessage对象，创建 Transport 对象发送邮件  
     */ 
    public void sendMail(Session session, MimeMessage msg) {  
          
        // 设置发件人使用的SMTP服务器、用户名、密码   
    	String smtpServer = "smtp.163.com";  //163 服务器
        String user = "17853593651@163.com";  //发送人163邮箱张浩
        String pwd = "zxfgsc10141024";  //设置的授权码
 
        Transport transport = null;
        try {
        	// 由 Session 对象获得 Transport 对象  
            transport = session.getTransport();  
            // 发送用户名、密码连接到指定的 smtp 服务器  
			transport.connect(smtpServer, user, pwd);
			transport.sendMessage(msg, msg.getRecipients(Message.RecipientType.TO));
			transport.close();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
//        transport.addConnectionListener(l); 
    }
    /**
     * 最终发送邮件
     * @param path
     * @param email
     * @throws Exception
     */
    public void sendEMail(String path,String email,String head,String container) throws Exception{
    	 MessageSender sender = new MessageSender();  
         
         // 指定使用SMTP协议来创建Session对象  
         Session session = sender.createSession("smtp");  
         // 使用前面文章所完成的邮件创建类获得 Message 对象  
         MimeMessage mail = new WithAttachmentMessage().createMessage(session,path,email,head,container);  
         sender.sendMail(session, mail);  
    }
    // 测试：发送邮件 
    public static void main(String[] args) throws Exception {  
        MessageSender sender = new MessageSender();  
          
        // 指定使用SMTP协议来创建Session对象 
        
        Session session = sender.createSession("smtp");  
        // 使用前面文章所完成的邮件创建类获得 Message 对象  
        MimeMessage mail = new WithAttachmentMessage().createMessage(session,"f://盗墓笔记.txt","750229099@qq.com","标题","高世超");
//        		createMessage(session,"盗墓笔记.txt","750229099@qq.com");  
        sender.sendMail(session, mail);  
    }  
} 