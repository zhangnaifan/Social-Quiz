package com.service.mail;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

import com.model.User;
import com.service.mail.Mail;;


public class send extends Mail{
	
	private User user;
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void finalsend(String email, String url) throws AddressException,MessagingException {
		Mail post = new Mail();
		StringBuffer sb = new StringBuffer();
		sb.append("亲爱的用户" + user.getUsername()+"：您好！<br><br>");
		sb.append("        您收到这封这封电子邮件是因为您 (也可能是某人冒充您的名义) 申请了一个新的密码。假如这不是您本人所申请, 请不用理会<br>这封电子邮件, 但是如果您持续收到这类的信件骚扰, 请您尽快联络管理员。<br><br>");
		sb.append("        要使用新的密码, 请使用以下链接启用密码。<br><br>");
		sb.append("" + url);
		
		String strm[] = email.split("@");
		post.setTo("616947459@qq.com");
		post.setFrom("dzymt6627@163.com");
		post.setHost("smtp.163.com");
		post.setUsername(user.getUsername());
		post.setPassword(user.getPassword());
		post.setSubject("[Staple]找回账户密码");
		post.setContent(sb.toString());
		if(post.sendMail()) {
			System.out.println("申请提交成功，请查看你的" + strm[strm.length - 1] + "邮箱");
		} else {
			System.out.println("操作失败，稍后再试");
		}
	}

	public static void main(String []args) {
		Mail pos = new Mail();
		if(pos.sendMail()) {
			System.out.println("successful sending");
		}
	}
	
	
}




