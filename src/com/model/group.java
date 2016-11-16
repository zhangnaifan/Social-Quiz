package com.model;

import java.sql.Date;
import java.util.ArrayList;

import com.db.Dao;

public class group {
	private long groupId;
	private String groupName;
	private ArrayList<Integer> managerIds;
	private ArrayList<Integer> memberIds;
	private String groupManager;
	private String groupMember;
	private Date createDate;
	private String info;
	private long totMembers;
	private String tagStr;
	
	public group(String groupname, Integer creater, String info, String tag) {
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
		this.tagStr = tag;
	}
	public group(int groupId, String groupname, String members, String managers, String inf, String tag, Date createDate) {
		this.groupId = groupId;
		this.groupName = groupname;
		this.groupMember = members;
		this.groupManager = managers;
		this.info = inf;
		this.tagStr = tag;
		this.createDate = createDate;
		this.memberIds = Dao.toList(this.groupMember);
		this.managerIds = Dao.toList(this.groupManager);
		this.totMembers = this.memberIds.size();
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

	public String getTagStr() {
		return tagStr;
	}

	public void setTagStr(String tagStr) {
		this.tagStr = tagStr;
	}

	public boolean hasUser(int id) {
		for (int i = 0; i < memberIds.size(); i++)
			if (memberIds.get(i) == id)
				return true;
		return false;
	}

	
	public void updateStr() {
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < this.getMemberIds().size(); i++){
			sb.append(String.valueOf(this.getMemberIds().get(i))+" ");
		}
		this.setGroupMember(sb.toString());
	}

}
