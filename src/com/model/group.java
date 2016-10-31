package com.model;

import java.sql.Date;
import java.util.ArrayList;

public class group {
	long groupid;
	String groupname;
	ArrayList<Integer> managerIds;
	String groupmanager;
	Date createdate;
	String info;
	long totmembers;
	
	public long getTotmembers() {
		return totmembers;
	}

	public void setTotmembers(long totmembers) {
		this.totmembers = totmembers;
	}

	public long getGroupid() {
		return groupid;
	}

	public void setGroupid(long groupid) {
		this.groupid = groupid;
	}

	public String getGroupname() {
		return groupname;
	}

	public void setGroupname(String groupname) {
		this.groupname = groupname;
	}

	public ArrayList<Integer> getManagerIds() {
		return managerIds;
	}

	public void setManagerIds(ArrayList<Integer> managerIds) {
		this.managerIds = managerIds;
	}

	public String getGroupmanager() {
		return groupmanager;
	}

	public void setGroupmanager(String groupmanager) {
		this.groupmanager = groupmanager;
	}

	public Date getCreatedate() {
		return createdate;
	}

	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}
}
