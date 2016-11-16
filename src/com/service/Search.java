package com.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.db.Dao;
import com.model.Quiz;
import com.model.User;
import com.model.group;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class Search extends ActionSupport {
	private static final long serialVersionUID = 4265188309306528594L;
	private String keyword;
	private Vector<User> users = new Vector<User>();
	private Vector<group> groups = new Vector<group>();
	private Vector<Quiz> quizzes = new Vector<Quiz>();
	public String execute() throws ClassNotFoundException, SQLException {
		Dao dao = new Dao();
		Dao dao2 = new Dao();
		
		ResultSet rs1 = dao.executeQuery("SELECT id FROM user WHERE nickname='"+keyword+"';");
		while (rs1.next()) {
			users.add(dao2.getUserBasis(rs1.getInt(1)));
		}
		
		ResultSet rs2 = dao.executeQuery("SELECT groupid FROM group_db WHERE groupname='"+keyword+"';");
		while (rs2.next()) {
			groups.add(dao2.getGrpById(rs2.getInt(1)));
		}
		
		ResultSet rs3 = dao.executeQuery("SELECT id FROM quiz WHERE title='"+keyword+"' OR type='"+ keyword +"';");
		while (rs3.next()) {
			quizzes.add(dao2.getQuizBasis(rs3.getInt(1)));
		}
		
		ActionContext.getContext().getSession().put("users", users);
		ActionContext.getContext().getSession().put("quizzes", quizzes);
		ActionContext.getContext().getSession().put("groups", groups);
		return SUCCESS;
	}

 	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public Vector<User> getUsers() {
		return users;
	}
	public void setUsers(Vector<User> users) {
		this.users = users;
	}
	public Vector<group> getGroups() {
		return groups;
	}
	public void setGroups(Vector<group> groups) {
		this.groups = groups;
	}
	public Vector<Quiz> getQuizzes() {
		return quizzes;
	}
	public void setQuizzes(Vector<Quiz> quizzes) {
		this.quizzes = quizzes;
	}
}
