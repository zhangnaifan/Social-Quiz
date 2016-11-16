package com.service;

import com.db.Dao;
import com.model.Message;
import com.opensymphony.xwork2.Action;

public class SendMessage implements Action {

	private int fromid;
	private int toid;
	private int type;
	private String msg;
	
	public int getFromid() {
		return fromid;
	}

	public int getToid() {
		return toid;
	}

	public int getType() {
		return type;
	}

	public String getMsg() {
		return msg;
	}

	public void setFromid(int fromid) {
		this.fromid = fromid;
	}

	public void setToid(int toid) {
		this.toid = toid;
	}

	public void setType(int type) {
		this.type = type;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	@Override
	public String execute() throws Exception {
		
		Dao dao = new Dao();
		Message newMsg = new Message(0, type, fromid, toid, msg);
		newMsg.adjust();
		dao.insertNewMsg(newMsg);
		dao.close();
		return "success";
	}

}
