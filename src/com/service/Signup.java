package com.service;

import java.io.File;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;


import com.db.Dao;
import com.model.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class Signup extends ActionSupport {
	
	private static final long serialVersionUID = 2900475154263002788L;
	
	private String msg;
	
	private User user;
	
	public String signup() throws ClassNotFoundException, SQLException, NoSuchAlgorithmException, IOException{
		
		user.setAccountLevel(3);
		user.setMemberSince(new Date(System.currentTimeMillis()));
		Dao dao = new Dao();
		user.setPassword(MD5.MD5password(user.getPassword()));
		System.out.println(user.getPassword());
		//check if there exists a same username
		ResultSet rs = dao.executeQuery("SELECT * FROM user WHERE username = '"
				+ user.getUsername()
				+ "';");
		if (rs.next()){
			setMsg("Username already exsits. Please Choose another one.");
			return "SIGNUP";
		}
		
		//store into user
		dao.addUser(user);
		
		//get id
		rs = dao.executeQuery("SELECT id FROM user WHERE username='"+user.getUsername()+"';");
		if (rs.next()) {
			user.setId(rs.getInt("id"));
		}
		
		//store default icon
		File file = new File(getClass().getClassLoader().getResource("cat.jpg").getPath());
		FileUploadService fuservice=new FileUploadService();
		fuservice.fileUpload(file, user.getId());
		
		//put user's information into session
		ActionContext actionContext = ActionContext.getContext();   //取到struts容器
	    Map<String, Object> session = actionContext.getSession();    //取得session
	    session.put("user", user);       //把用户数据放入session
		
		return SUCCESS;
	}

	
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
}
