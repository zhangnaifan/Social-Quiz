package com.basic;

import java.util.ArrayList;
import java.util.Date;

public class Questionare {
	private int ID;
	private ArrayList<Integer> problemID;
	private int onwerID;
	private Date createDate;
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public ArrayList<Integer> getProblemID() {
		return problemID;
	}
	public void setProblemID(ArrayList<Integer> problemID) {
		this.problemID = problemID;
	}
	public int getOnwerID() {
		return onwerID;
	}
	public void setOnwerID(int onwerID) {
		this.onwerID = onwerID;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Questionare(int iD, ArrayList<Integer> problemID, int onwerID,
			Date createDate) {
		super();
		ID = iD;
		this.problemID = problemID;
		this.onwerID = onwerID;
		this.createDate = createDate;
	}	
}
