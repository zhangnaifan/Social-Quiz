package com.service;

import java.sql.SQLException;

import com.db.Dao;
import com.model.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class Unfollow extends ActionSupport{
	private static final long serialVersionUID = 6568880406479961348L;
	private int id;
	public String execute() throws SQLException, ClassNotFoundException {
		Dao dao = new Dao();
		
		User user = (User) ActionContext.getContext().getSession().get("user");
		int i = user.getFollowings().indexOf(id);
		if (i != -1){
			user.getFollowings().remove(i);
			ActionContext.getContext().getSession().replace("user", user);
			StringBuffer sb = new StringBuffer();
			for (int j : user.getFollowings()) {
				sb.append("&"+j);
			}
			dao.updateUserFollowing(user.getId(), sb.toString());
		}
		
		User followed = dao.getUser(id);
		int j = followed.getFollowers().indexOf(user.getId());
		if (j != -1) {
			followed.getFollowers().remove(j);
			StringBuffer sb = new StringBuffer();
			for (int k : user.getFollowers()) {
				sb.append("&"+k);
			}
			dao.updateUserFollowers(id, sb.toString());
		}
		return SUCCESS;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
}
