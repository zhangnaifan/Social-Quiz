
package com.service;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class PassGroupId extends ActionSupport{
	private static final long serialVersionUID = -4389204253355813749L;
	private String groupId;
	public String execute() {
		ActionContext.getContext().getSession().put("groupId", groupId);
		return SUCCESS;
	}
	public String getGroupId() {
		return groupId;
	}
	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}
}
