package com.service;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;

import com.db.Dao;
import com.model.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class Follow extends ActionSupport {
	private static final long serialVersionUID = -1268164502982236395L;
	private int id;
	private InputStream msg;
	public String execute() throws SQLException, ClassNotFoundException, UnsupportedEncodingException {
		User user = (User)ActionContext.getContext().getSession().get("user");
		if (!user.getFollowers().contains(id)) {
			user.addFollowing(id);
			Dao dao = new Dao();
			dao.addUserFollowing(user.getId(), id);
			dao.addUserFollower(id, user.getId());
			setMsg(new ByteArrayInputStream("¹Ø×¢³É¹¦£¡".getBytes("utf-8")));
			ActionContext.getContext().getSession().replace("user", user);
		}
		return SUCCESS;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public InputStream getMsg() {
		return msg;
	}
	public void setMsg(InputStream msg) {
		this.msg = msg;
	}
}
