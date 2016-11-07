package com.model;

public class Message {
	private long id;
	private int type;
	private long fromid;
	private long toid;
	private String msg;
	private User fromUser;
	private int toGroupId;
	
	
	public int getToGroupId() {
		return toGroupId;
	}

	public void setToGroupId(int toGroupId) {
		this.toGroupId = toGroupId;
	}

	public User getFromUser() {
		return fromUser;
	}

	public void setFromUser(User fromUser) {
		this.fromUser = fromUser;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public Message(long id, int type, long fromid, long toid, String msg) {
		super();
		this.id = id;
		this.type = type;
		this.fromid = fromid;
		this.toid = toid;
		if (type==1) {
			this.msg = null;
			this.toGroupId = Integer.valueOf(msg.split("###")[0]);
		}
		else {
			this.msg = msg;
		}
	}

	public long getId() {
		return id;
	}

	public long getFromid() {
		return fromid;
	}

	public long getToid() {
		return toid;
	}

	public String getMsg() {
		return msg;
	}

	public void setId(long id) {
		this.id = id;
	}

	public void setFromid(long fromid) {
		this.fromid = fromid;
	}

	public void setToid(long toid) {
		this.toid = toid;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public static String formRegisterGroup(int id2, int toId, int groupId) {
		return String.format("values(null, %d, %d, '%d###%s', 1)", id2, toId, groupId, "");
	}
}
