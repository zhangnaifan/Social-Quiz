package com.model;

import java.sql.Date;
import java.util.ArrayList;

public class group {
	long groupId;
	String groupName;
	ArrayList<Integer> managerIds;
	ArrayList<Integer> memberIds;
	String groupManager;
	String groupMember;
	Date createDate;
	String info;
	long totMembers;
	
	public group(String groupname, Integer creater, String info) {
		this.groupId = new Integer(0);
		this.groupName = groupname;
		this.managerIds = new ArrayList<Integer>();
		this.managerIds.add(creater);
		this.memberIds = new ArrayList<Integer>();
		this.memberIds.add(creater);
		this.groupManager = String.valueOf(creater)+" ";
		this.groupMember = String.valueOf(creater)+" ";
		this.info = info;
		this.totMembers = new Integer(1);
	}
	/*
	public group(long groupid, String groupname, ArrayList<Integer> managerIds,
			String groupmanager, Date createdate, String info, long totmembers) {
		super();
		this.groupId = groupid;
		this.groupName = groupname;
		this.managerIds = managerIds;
		this.groupManager = groupmanager;
		this.createDate = createdate;
		this.info = info;
		this.totMembers = totmembers;
	}
	*/

	public group() {
		// TODO Auto-generated constructor stub
	}

	public long getGroupId() {
		return groupId;
	}

	public String getGroupName() {
		return groupName;
	}

	public ArrayList<Integer> getManagerIds() {
		return managerIds;
	}

	public ArrayList<Integer> getMemberIds() {
		return memberIds;
	}

	public String getGroupManager() {
		return groupManager;
	}

	public String getGroupMember() {
		return groupMember;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public String getInfo() {
		return info;
	}

	public long getTotMembers() {
		return totMembers;
	}

	public void setGroupId(long groupId) {
		this.groupId = groupId;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public void setManagerIds(ArrayList<Integer> managerIds) {
		this.managerIds = managerIds;
	}

	public void setMemberIds(ArrayList<Integer> memberIds) {
		this.memberIds = memberIds;
	}

	public void setGroupManager(String groupManager) {
		this.groupManager = groupManager;
	}

	public void setGroupMember(String groupMember) {
		this.groupMember = groupMember;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public void setTotMembers(long totMembers) {
		this.totMembers = totMembers;
	}

}
