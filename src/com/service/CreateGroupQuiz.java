
package com.service;

import java.sql.Date;
import java.sql.SQLException;
import java.util.Vector;

import com.db.Dao;
import com.model.Quiz;
import com.model.User;
import com.model.group;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CreateGroupQuiz extends ActionSupport {
	private static final long serialVersionUID = 8735918582027775646L;
	private String title;
	private String description;
	private String type;
	private String quesListStr;
	private int groupId;
	
	public String execute() throws SQLException, ClassNotFoundException {
		//Set Quiz basis
		Dao dao = new Dao();
		Quiz quiz = new Quiz();
		quiz.setId(dao.count("quiz")+1);
		quiz.setOwnerID(groupId);
		quiz.setCreateDate(new Date(System.currentTimeMillis()));
		
		//Set quiz' title, description, tag
		quiz.setTitle(title);
		quiz.setType(description);
		quiz.setDescription(type);
		
		//Set quiz and questions
		Vector<Integer> questionID = new Vector<Integer>(); 
		String[] I = quesListStr.split("&", -1);
		for (int i=0; i<I.length; ++i) {
			questionID.add(Integer.parseInt(I[i]));
		}
		quiz.setQuestions(questionID);
		
		group grp = dao.getGrpById(groupId);
		
		//update group's published quizzes
		grp.addQuiz(quiz.getId());
		
		
		//write to quiz, question and update user
		dao.addQuiz(quiz);
		dao.addGroupQuiz(groupId, quiz.getId());

		//pass quizId
		ActionContext.getContext().getSession().put("quizId", quiz.getId());
		
		User user = (User)ActionContext.getContext().getSession().get("user");
		
		//send messages to creator's followers
		SendOutMessage msg = new SendOutMessage();
		msg.sendoutFromGroup(user.getId(), groupId, quiz.getId());
		return SUCCESS;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getQuesListStr() {
		return quesListStr;
	}
	public void setQuesListStr(String quesListStr) {
		this.quesListStr = quesListStr;
	}
	public int getGroupId() {
		return groupId;
	}
	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}
}
