package com.service;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.db.Dao;
import com.model.User;
import com.opensymphony.xwork2.ActionSupport;

public class Login extends ActionSupport{
	
	private static final long serialVersionUID = -8183503233837289498L;

	private String msg;
	
	private User user;
	
	public String execute() throws SQLException, ClassNotFoundException{
		
		Dao dao = new Dao();
		ResultSet rs = dao.executeQuery("SELECT * FROM user WHERE username = '"
				+ user.getUsername() 
				+ "' and password = '"
				+ user.getPassword()
				+ "';");
		if (rs.next()){
			//TODO build user's information from rs
			//TODO put user's information into session
			
			msg = null;
			return SUCCESS;
		}
		setMsg("Please comfirm your username or password.");
		return "INDEX";
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
