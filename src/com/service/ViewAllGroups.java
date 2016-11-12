package com.service;

import java.util.ArrayList;

import com.db.Dao;
import com.model.group;
import com.opensymphony.xwork2.Action;

public class ViewAllGroups implements Action {

	private ArrayList<group> groups;

	public ArrayList<group> getGroups() {
		return groups;
	}

	public void setGroups(ArrayList<group> groups) {
		this.groups = groups;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		Dao dao = new Dao();
			
		groups = dao.getAllGroups();
		
		dao.close();
		return "success";
	}

}
