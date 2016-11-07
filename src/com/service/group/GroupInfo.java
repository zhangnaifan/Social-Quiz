package com.service.group;

import java.util.ArrayList;

import com.db.Dao;
import com.model.User;
import com.model.group;
import com.opensymphony.xwork2.Action;

public class GroupInfo implements Action {
	private Integer groupId;
	private ArrayList<User> members;
	private ArrayList<User> managers;
	private group grp;

	public ArrayList<User> getManagers() {
		return managers;
	}

	public void setManagers(ArrayList<User> managers) {
		this.managers = managers;
	}

	public Integer getGroupId() {
		return groupId;
	}

	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
	}

	public ArrayList<User> getMembers() {
		return members;
	}

	public void setMembers(ArrayList<User> members) {
		this.members = members;
	}

	public group getGrp() {
		return grp;
	}

	public void setGrp(group grp) {
		this.grp = grp;
	}

	public String execute() throws Exception {
		if (groupId == null) {
			System.err.println("group info error : empty groupId");
			return "fail";
		}
		Dao dao = new Dao();
		grp = dao.getGrpById(groupId);
		if (grp == null) {
			System.err.println("group info error : no such groupId");
			return "fail";
		}
		members = new ArrayList<User>();
		managers = new ArrayList<User>();
		for (int i = 0; i < grp.getMemberIds().size(); i++) {
			members.add(dao.getUser(grp.getMemberIds().get(i)));
		}
		for (int i = 0; i < grp.getManagerIds().size(); i++) {
			managers.add(dao.getUser(grp.getManagerIds().get(i)));
		}
		return "success";
	}

/*	private ArrayList<Integer> toList(String string) {
		// TODO Auto-generated method stub
		String[] str = string.split(" ");
		ArrayList<Integer> ret = new ArrayList<Integer>();
		for (int i = 0; i < str.length; i++)
			ret.add(Integer.valueOf(str[i]));
		return ret;
	}*/
}
