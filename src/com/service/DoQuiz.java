/**
 * 
 */
package com.service;

import java.sql.SQLException;

import com.db.Dao;
import com.model.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @author zhang.nf
 *
 */
public class DoQuiz extends ActionSupport {
	private static final long serialVersionUID = 7626899198826380653L;
	private String record;
	private int quizId;
	public String execute() throws ClassNotFoundException, SQLException {
		//get user
		User user = (User) ActionContext.getContext().getSession().get("user");
		//update DB
		Dao dao = new Dao();
		dao.addQuizRecord(quizId, record);
		dao.addUserQuizDone(user.getId(), quizId);
		//update user
		user.addQuizDone(quizId);
		ActionContext.getContext().getSession().replace("user", user);
		ActionContext.getContext().getSession().put("quizId", quizId);
		return SUCCESS;
	}

	public String getRecord() {
		return record;
	}

	public void setRecord(String record) {
		this.record = record;
	}

	public int getQuizId() {
		return quizId;
	}

	public void setQuizId(int quizId) {
		this.quizId = quizId;
	}
}
