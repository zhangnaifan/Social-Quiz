package com.model;

public class Question {
	private int id;
	private int type;
	private int ownerID;
	private String content;
	private String answer;
	
	public Question(int id, int type, int ownerID, String content, String answer) {
		super();
		this.id = id;
		this.type = type;
		this.ownerID = ownerID;
		this.content = content;
		this.answer = answer;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getOwnerID() {
		return ownerID;
	}
	public void setOwnerID(int ownerID) {
		this.ownerID = ownerID;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
}	
