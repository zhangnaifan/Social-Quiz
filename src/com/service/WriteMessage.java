package com.service;

import com.model.User;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

public class WriteMessage implements Action {
	private int toid;
	private int fromid;

	public int getFromid() {
		return fromid;
	}

	public int getToid() {
		return toid;
	}

	public void setToid(int toid) {
		this.toid = toid;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		User user = (User) ActionContext.getContext().getSession().get("user");
		fromid = user.getId();
		
		/***
		 * 
		 * sample of auto sending message
		 * sendout(User fromUser, int QuizId);
		 * 
		SendOutMessage somsg = new SendOutMessage();
		somsg.sendout(user, 233);
		
		***/
		
		return "success";
	}

}
