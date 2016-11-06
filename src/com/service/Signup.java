package com.service;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

import com.db.Dao;
import com.model.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class Signup extends ActionSupport {
	
	private static final long serialVersionUID = 2900475154263002788L;
	
	private String msg;
	
	private User user;
	
	public String signup() throws ClassNotFoundException, SQLException{
		
		user.setAccountLevel(3);
		user.setMemberSince(new Date(System.currentTimeMillis()));
		Dao dao = new Dao();
		
		//check if there exists a same username
		ResultSet rs = dao.executeQuery("SELECT * FROM user WHERE username = '"
				+ user.getUsername()
				+ "';");
		if (rs.next()){
			setMsg("Username already exsits. Please Choose another one.");
			return "SIGNUP";
		}
		
		//get userID
		rs = dao.executeQuery("SELECT COUNT(*) FROM user;");
		if (rs.next()){
			user.setId(rs.getInt(1)+1);
		}else{
			throw new SQLException();
		}
		
		//store into user
		dao.execute("INSERT INTO user(id,username,password,nickname,membersince,accountlevel,"
				+ "email,phonenum,gender,birthday,pubQuiz,quizDone) VALUES("
				+ user.getId()
				+ ", '"
				+ user.getUsername()
				+ "', '"
				+ user.getPassword()
				+ "', '"
				+ user.getNickName()
				+ "', '"
				+ user.getMemberSince()
				+ "', "
				+ user.getAccountLevel()
				+ ", '"
				+ user.getEmail()
				+ "', '"
				+ user.getPhoneNum()
				+ "', '"
				+ user.getGender()
				+ "', '"
				+ user.getBirthday()
				+ "','','');");
		
		//put user's information into session
		ActionContext actionContext = ActionContext.getContext();   //取到struts容器
	    Map<String, Object> session = actionContext.getSession();    //取得session
	    session.put("user", user);       //把用户数据放入session
		
		return SUCCESS;
	}

	
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
}
