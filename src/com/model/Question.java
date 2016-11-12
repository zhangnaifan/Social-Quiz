package com.model;

import java.util.Vector;

import javafx.util.Pair;

public class Question {
	private int id;
	private char type;
	private String tag;
	private int ownerID;
	private String content;
	private String answer;
	
	public Question() {}
	
	public Question(int id, char type, int ownerID, String content, String answer) {
		super();
		this.id = id;
		this.type = type;
		this.ownerID = ownerID;
		this.content = content;
		this.answer = answer;
	}
	
	public Pair<Vector<String>, Vector<Integer>> getMC() {
		Vector<Integer> scores = new Vector<Integer>();
		Vector<String> options = new Vector<String>();
		String[] optStr = answer.split("~", -1);
		for (int i=1; i<optStr.length; ++i) {
			String[] inside = optStr[i].split("\\^", -1); 
			options.add(inside[1]);
			scores.add(Integer.parseInt(inside[2]));
		}
		return new Pair<Vector<String>, Vector<Integer>>(options, scores);
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public char getType() {
		return type;
	}
	public void setType(char type) {
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

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}
}	
