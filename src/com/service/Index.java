package com.service;

import com.opensymphony.xwork2.ActionSupport;

public class Index extends ActionSupport {

	private static final long serialVersionUID = 9075016911412088138L;
	
	private String from;
	
	public String execute(){
		//TODO jump to different pages according to session's status (Is user logged in?) and from
		
		return "INDEX";
	}

	public String getFrom() {
		return from;
	}

	public void setFrom(String from) {
		this.from = from;
	}
}
