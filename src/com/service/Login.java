package com.service;

import java.sql.SQLException;
import java.util.Map;

import com.db.Dao;
import com.model.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class Login extends ActionSupport{
	private static final long serialVersionUID = -8183503233837289498L;
	private String msg;
	private String password;
	private String username;
	public String login() throws SQLException, ClassNotFoundException{	
		Dao dao = new Dao();
		User user = dao.getUser(username);
		if (user == null) {
			setMsg("User Not Found.");
			return "INDEX";
		} else if (!user.getPassword().equals(password)) {
			setMsg("Wrong Password.");
			return "INDEX";
		} 
		
		//put user's information into session
		Map<String, Object> session = ActionContext.getContext().getSession();
		session.put("user", user);
		
		msg = null;
		return SUCCESS;
	}
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

}
