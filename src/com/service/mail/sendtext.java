package com.service.mail;

import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class sendtext {
	
	String to = ""; //收件人
	String from = ""; //发件人
	String host = "localhost"; //smtp主机
	String username = ""; 
	String password = "";
	String subject = ""; //邮件主题
	String content = ""; //邮件内容

	public static void main(String[] args) {
		// 收件人电子邮箱
	    String to = "616947459@qq.com";
	    // 发件人电子邮箱
	    String from = "616947459@qq.com";
	    // 指定发送邮件的主机为 localhost
	    String host = "localhost";
		//构造session
		Properties prop = System.getProperties(); //获取系统属性
		prop.setProperty("smtp.sohu.com", host);
		Session session = Session.getDefaultInstance(prop);
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(from));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			//subject = tranferChinese(subject);
			message.setSubject("找回密码");
			//构造Multipart
			Multipart mp = new MimeMultipart();
			MimeBodyPart mbpContent = new MimeBodyPart();
			//content = "findpassword";
			mbpContent.setContent("findpassword!!!!!!!!!!!","text/html;charset=utf-8");
			mp.addBodyPart(mbpContent);
			message.setContent(mp);
			message.setSentDate(new Date());
			Transport.send(message);
			System.out.println("Sent message successfully....");
			
		} catch(MessagingException e) {
			e.printStackTrace();
		}
		
	}
}
