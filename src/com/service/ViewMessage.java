package com.service;

import java.util.ArrayList;

import com.db.Dao;
import com.model.Message;
import com.model.User;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

public class ViewMessage implements Action {
	
	private User user;
	private ArrayList<Message> msgs;
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public ArrayList<Message> getMsgs() {
		return msgs;
	}

	public void setMsgs(ArrayList<Message> msgs) {
		this.msgs = msgs;
	}

	@Override
	public String execute() throws Exception {
		Dao dao = new Dao();
		
		user = (User) ActionContext.getContext().getSession().get("user");
		System.out.println(user.getId());
		msgs = dao.getMessages(user.getId());
		
		System.out.println(msgs.size());
		
		dao.close();
		return "success";
	}
}
