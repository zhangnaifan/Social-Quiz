package com.model;

public class Message {
	private int id;
	private long fromid;
	private long toid;
	private String msg;
	public int getId() {
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
	public void setId(int id) {
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
	public static String formRegisterGroup(int id2, long groupId) {
		return String.format("values(null, %d, %d, '%s')", id2, groupId, "");
	}
}
