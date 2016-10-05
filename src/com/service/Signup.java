package com.service;

import com.model.User;
import com.opensymphony.xwork2.ActionSupport;

public class Signup extends ActionSupport {
	
	private static final long serialVersionUID = 2900475154263002788L;
	
	private User user;
	
	public String execute(){
		//TODO store user's information into user by dao
		//TODO put user's information into session
		
		return SUCCESS;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
}
