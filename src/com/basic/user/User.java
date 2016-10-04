package com.basic.user;

import java.util.Date;
import java.util.Vector;

public class User {
	// for login
	private String email;
	private String phoneNum;
	private String username;
	private String password;

	// personal information
	private String nickName;
	private String gender;
	private String birthday;

	// account info
	private int ID;
	private Date memberSince;

	// account level 0 for supper root
	// account level 1 for manager
	// account level 2 for vip
	// account level 3 for normal
	// account level 4 for tourist
	private int accountLevel;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public Date getMemberSince() {
		return memberSince;
	}

	public void setMemberSince(Date memberSince) {
		this.memberSince = memberSince;
	}

	public int getAccountLevel() {
		return accountLevel;
	}

	public void setAccountLevel(int accountLevel) {
		this.accountLevel = accountLevel;
	}

	public Vector<Integer> getProblem() {
		return problem;
	}

	public void setProblem(Vector<Integer> problem) {
		this.problem = problem;
	}

	private Vector<Integer> problem;

	public User(String username, String password, String nickName, int iD,
			Date memberSince) {
		super();
		this.username = username;
		this.password = password;
		this.nickName = nickName;
		ID = iD;
		this.memberSince = memberSince;
	}

}
