package com.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

import org.apache.commons.lang3.StringEscapeUtils;

import javassist.compiler.ast.Keyword;

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
	private String tag;

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

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
		// name not null or empty
		if (groupname == null || groupname.length() < 1) {
			System.err.println("create group error : empty name");
			return "fail";
		}
		
		Dao dao = new Dao();
		user = (User) ActionContext.getContext().getSession().get("user");
		ResultSet rs = dao.executeQuery(String.format(
				"select * from group_db where groupname='%s'", groupname));
		if (rs.next()) {
			// group name exist
			System.err.println("group name exist");
			rs.close();
			return "fail";
		}
		grp = new group(groupname, user.getId(), info, tag);
		newGroupId = dao.insertGroup(grp);
		Map<String, Object> session = ActionContext.getContext().getSession();
		if (session.containsKey("newGroupId")) {
			session.replace("newGroupId", newGroupId);
		} else {
			session.put("newGroupId", newGroupId);
		}
		System.out.println(String.format(
				"create group with Groupid=%d, groupName='%s'", newGroupId,
				groupname));
		
		//update user and database
		user.addGroup(newGroupId);
		ActionContext.getContext().getSession().replace("user", user);
		dao.addUserGroup(user.getId(), newGroupId);
		
		dao.close();
		return "success";
	}
}
