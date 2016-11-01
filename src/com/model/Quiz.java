package com.model;

import java.util.Date;
import java.util.Vector;

public class Quiz {
	
	private int id;
	private String type;
	private int ownerID;
	private Date createDate;
	private Vector<Integer> questions;
	private String title;
	private String description;
	
	public Quiz() {}
	
	public Quiz(int id, String type, int ownerID, Date createDate, Vector<Integer> questions) {
		super();
		this.id = id;
		this.type = type;
		this.ownerID = ownerID;
		this.createDate = createDate;
		this.questions = questions;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getOwnerID() {
		return ownerID;
	}

	public void setOwnerID(int ownerID) {
		this.ownerID = ownerID;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Vector<Integer> getQuestions() {
		return questions;
	}

	public void setQuestions(Vector<Integer> questions) {
		this.questions = questions;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
}
