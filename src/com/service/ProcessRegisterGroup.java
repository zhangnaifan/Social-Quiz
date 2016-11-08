package com.service;

import com.db.Dao;
import com.opensymphony.xwork2.Action;

public class ProcessRegisterGroup implements Action {

	private boolean accept;
	private int msgId;

	public boolean isAccept() {
		return accept;
	}

	public int getMsgId() {
		return msgId;
	}

	public void setAccept(boolean accept) {
		this.accept = accept;
	}

	public void setMsgId(int msgId) {
		this.msgId = msgId;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		Dao dao = new Dao();
		
		
		if(accept==true) {
			System.out.println("ACACAC");
			dao.processMsg(msgId);
		}
		
		dao.deleteMsg(msgId);
		
		dao.close();
		return "success";
	}

}
