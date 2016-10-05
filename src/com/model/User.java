package com.model;

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
	private Boolean gender; //true for male, false for female
	private Date birthday;

	// account info
	private int id;
	private Date memberSince;

	// account level 0 for supper root
	// account level 1 for manager
	// account level 2 for vip
	// account level 3 for normal
	// account level 4 for tourist
	private int accountLevel;

	private Vector<Integer> quiz;
	
	private Vector<Integer> friends;

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

	public Boolean getGender() {
		return gender;
	}

	public void setGender(Boolean gender) {
		this.gender = gender;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public Vector<Integer> getQuiz() {
		return quiz;
	}

	public void setQuiz(Vector<Integer> quiz) {
		this.quiz = quiz;
	}

	public Vector<Integer> getFriends() {
		return friends;
	}

	public void setFriends(Vector<Integer> friends) {
		this.friends = friends;
	}
	
	
}
