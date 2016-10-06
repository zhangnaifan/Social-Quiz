package com.model;

import java.sql.Date;
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

	//functions
	private Vector<Integer> publishedQuiz;
	
	private Vector<Integer> todoQuiz;
	
	private Vector<Integer> friends;

	private Vector<Integer> groups;
	
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


	public Vector<Integer> getFriends() {
		return friends;
	}

	public void setFriends(Vector<Integer> friends) {
		this.friends = friends;
	}

	public Vector<Integer> getPublishedQuiz() {
		return publishedQuiz;
	}

	public void setPublishedQuiz(Vector<Integer> publishedQuiz) {
		this.publishedQuiz = publishedQuiz;
	}

	public Vector<Integer> getTodoQuiz() {
		return todoQuiz;
	}

	public void setTodoQuiz(Vector<Integer> todoQuiz) {
		this.todoQuiz = todoQuiz;
	}

	public Vector<Integer> getGroups() {
		return groups;
	}

	public void setGroups(Vector<Integer> groups) {
		this.groups = groups;
	}
	
	
}
