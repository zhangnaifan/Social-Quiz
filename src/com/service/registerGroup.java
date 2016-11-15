package com.service;

import com.db.Dao;
import com.model.User;
import com.model.group;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

public class registerGroup implements Action {

	private User user;
	private group grp;
	private Integer groupId;
	private String msg;

	public User getUser() {
		return user;
	}

	public group getGrp() {
		return grp;
	}

	public Integer getGroupId() {
		return groupId;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void setGrp(group grp) {
		this.grp = grp;
	}

	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
	}

	@Override
	public String execute() throws Exception {

		Dao dao = new Dao();
		user = (User) ActionContext.getContext().getSession().get("user");

		if (groupId == null) {
			setMsg("empty groupId");
			return "fail";
		}

		grp = dao.getGrpById(groupId);
		if (grp == null) {
			setMsg("no such group");
		}
			
		if (grp.hasUser(user.getId())) {
			setMsg("您已注册该群！");
			return "fail";
		} else {
			//update user and database
			user.addGroup(groupId);
			ActionContext.getContext().getSession().replace("user", user);
			dao.addUserGroup(user.getId(), groupId);
			
			for (int i = 0; i < grp.getManagerIds().size(); i++) {
				dao.addRegisterGroupMsg(user.getId(), grp.getManagerIds().get(i), (int)grp.getGroupId(), grp.getGroupName());
			}
		}
		dao.close();
		setMsg("请等待管理员接收您的加入请求！");
		return "success";
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
}
