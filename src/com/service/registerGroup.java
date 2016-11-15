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
			return "fail";
		}

		grp = dao.getGrpById(groupId);
		if (grp == null) {
			return "fail";
		}
			
		if (grp.hasUser(user.getId())) {
			return "fail";
		} else {
			for (int i = 0; i < grp.getManagerIds().size(); i++) {
				dao.addRegisterGroupMsg(user.getId(), grp.getManagerIds().get(i), (int)grp.getGroupId(), grp.getGroupName());
			}
		}
		dao.close();
		return "success";
	}
}
