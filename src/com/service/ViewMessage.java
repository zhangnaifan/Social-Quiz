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
	private ArrayList<Message> messageNormal;
	private ArrayList<Message> messageGroup;

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

	public ArrayList<Message> getMessageNormal() {
		return messageNormal;
	}

	public ArrayList<Message> getMessageGroup() {
		return messageGroup;
	}

	public void setMessageNormal(ArrayList<Message> messageNormal) {
		this.messageNormal = messageNormal;
	}

	public void setMessageGroup(ArrayList<Message> messageGroup) {
		this.messageGroup = messageGroup;
	}

	@Override
	public String execute() throws Exception {
		Dao dao = new Dao();

		user = (User) ActionContext.getContext().getSession().get("user");
		System.out.println(user.getId());
		msgs = dao.getMessages(user.getId());

		messageGroup = new ArrayList<Message>();
		messageNormal = new ArrayList<Message>();
		
		for (int i = 0; i < msgs.size(); i++) {
			if (msgs.get(i).getType() == 1)
				messageGroup.add(msgs.get(i));
			else if (msgs.get(i).getType() == 3)
				messageNormal.add(msgs.get(i));
		}

		dao.close();
		return "success";
	}
}
