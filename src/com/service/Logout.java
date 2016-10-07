package com.service;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class Logout extends ActionSupport {

	private static final long serialVersionUID = -3815284168230301672L;

	public String execute(){
		Map<String, Object> session = ActionContext.getContext().getSession();
		if (null != session.get("user")){
			session.remove("user");
		}
		return SUCCESS;
	}
}
