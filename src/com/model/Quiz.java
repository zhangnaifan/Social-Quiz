package com.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Vector;

import com.db.Dao;

import javafx.util.Pair;


public class Quiz {
	
	//DB Items
	private int id;
	private String type;
	private int ownerID;
	private Date createDate;
	private Vector<Integer> questions;
	private String title;
	private String description;
	//records
	
	//memory items
	private ArrayList<Pair<Integer, Integer>> rank;
	
	public Quiz() {}
	
	public Quiz(int id, String type, int ownerID, Date createDate, Vector<Integer> questions) {
		super();
		this.id = id;
		this.type = type;
		this.ownerID = ownerID;
		this.createDate = createDate;
		this.questions = questions;
	}
	
	public Vector<Pair<String, Integer>> getRecord(int userId) throws ClassNotFoundException, SQLException {
		String records = "";
		Dao dao = new Dao();
		ResultSet rs = dao.executeQuery("SELECT records FROM quiz WHERE id="+id+";");
		if (rs.next()) {
			records = rs.getString(1);
		}
		Vector<Pair<String,Integer>> ret = new Vector<Pair<String,Integer>>();
		String[] I = records.split("&", -1);
		for (int i=1; i<I.length; ++i) {
			String[] II = I[i].split("\\|", -1);
			if (Integer.parseInt(II[2])==userId) {
				String[] III = II[0].split("\\$",-1);
				for (int j=1; j<III.length; ++j) {
					String[] IV = III[j].split("~",-1);
					ret.add(new Pair<String,Integer>(IV[1],Integer.parseInt(IV[2])));
				}
			}
		}
		return ret;
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

	public ArrayList<Pair<Integer, Integer>> getRank() {
		return rank;
	}

	public void setRank(ArrayList<Pair<Integer, Integer>> rank) {
		this.rank = rank;
	}
}
