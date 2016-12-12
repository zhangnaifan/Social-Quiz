package com.service.mail;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.Dao;
import com.model.User;
import com.opensymphony.xwork2.ActionSupport;
import com.service.MD5;
import com.service.mail.send;

import java.sql.Timestamp;

public class PasswordBack extends ActionSupport{

	private String username;
	private String password;
	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	private String email;
	private String method;
	
	
	public String getMethod() {
		return method;
	}


	public void setMethod(String method) {
		this.method = method;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	
	
	
	public String execute() throws Exception {
		Dao dao = new Dao();
		boolean flag = false;
		flag = dao.judgeUserEmail(username,email);			
		if(flag) {
			long currentTime = System.currentTimeMillis() + 120000;
			Date time = new Date(currentTime);
			Timestamp ts = new Timestamp(time.getTime());
			Random random = new Random();
			String key = username + "|" + ts + "|" + random.nextInt();
			String signature = MD5.MD5password(key);
			try {
				int res = dao.insertInfor(username, email, ts, signature);
				if(res == 1) {
					send sendmail = new send();
					String url = "localhost:8080/resetPassword.jsp+?username='" + username + "'&validkey=" + signature;
					sendmail.finalsend(email, url);
				}
				if(dao.isChangePass(username, signature)) {
					dao.updatePasswors(username, password);
					return "success";
				}
				
				
			} catch(SQLException e) {
				e.printStackTrace();
			} catch(AddressException e) {
				e.printStackTrace();
			} catch(MessagingException e) {
				e.printStackTrace();
			}
		}
		else {
			/*request.setAttribute("error", "用户名和邮箱不匹配，请重新输入！");*/
			return "fail";
		}
		return "fail";
	}
}
