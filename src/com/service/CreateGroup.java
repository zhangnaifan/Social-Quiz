package com.service;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.db.Dao;
import com.model.User;
import com.model.group;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CreateGroup extends ActionSupport {

	private static final long serialVersionUID = 1669220020440254039L;

	private String groupname;
	private String info;
	private User user;
	private group grp;
	private int newGroupId;
	
	public User getUser() {
		return user;
	}

	public int getNewGroupId() {
		return newGroupId;
	}

	public void setNewGroupId(int newGroupId) {
		this.newGroupId = newGroupId;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public group getGrp() {
		return grp;
	}

	public void setGrp(group grp) {
		this.grp = grp;
	}

	public String getGroupname() {
		return groupname;
	}

	public void setGroupname(String groupname) {
		this.groupname = groupname;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String execute() throws ClassNotFoundException, SQLException {
		Dao dao = new Dao();
		user = (User) ActionContext.getContext().getSession().get("user");

		ResultSet rs = dao.executeQuery(String.format(
				"select * from group_db where groupname='%s'", groupname));
		
		System.out.println(user.getNickName());
		if (rs.next()) {
			// group name exist
			System.out.println("group name exist");
			return "fail";
		}
		rs.close();
		grp = new group(groupname, user.getId(), info);		
		newGroupId = dao.insertGroup(grp);
		
		System.out.println("newGroupId = "+newGroupId);
		
		dao.close();
		return "success";
	}
}
