package com.service;

import java.sql.Date;
import java.sql.SQLException;
import java.util.Vector;

import com.db.Dao;
import com.model.Question;
import com.model.Quiz;
import com.model.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CreateQuiz extends ActionSupport {
	
	private static final long serialVersionUID = 1669220020440254039L;

	private User user;
	private String quizStr;
	private Quiz quiz;

	private Vector<Question> questions = new Vector<Question>();

	public String execute() throws SQLException, ClassNotFoundException{
		//get user's information
		user = (User) ActionContext.getContext().getSession().get("user");
		
		//Set Quiz basis
		Dao dao = new Dao();
		quiz = new Quiz();
		quiz.setId(dao.count("quiz")+1);
		quiz.setOwnerID(user.getId());
		quiz.setCreateDate(new Date(System.currentTimeMillis()));
		
		//Set quiz' title, description, tag
		String[] O = quizStr.split("&", -1);
		quiz.setTitle(O[0]);
		quiz.setType(O[2]);
		quiz.setDescription(O[1]);
		
		//Set quiz and questions
		Vector<Integer> questionID = new Vector<Integer>(); 
		int quesCount = dao.count("question");
		String[] I = O[3].split("\\|", -1);
		for (int i=1; i<I.length; ++i) {
			questionID.add(++quesCount);
			Question ques = new Question();
			ques.setId(quesCount);
			ques.setOwnerID(quiz.getOwnerID());
			String[] II = I[i].split("\\$", -1);
			ques.setType(II[0].charAt(0));
			ques.setTag(II[2]);
			ques.setContent(II[3]);
			ques.setAnswer(II[4]);
			questions.add(ques);
		}
		quiz.setQuestions(questionID);
		
		//update user's published quizzes
		user.addQuiz(quiz.getId());
		
		//update user's information in session
		ActionContext.getContext().getSession().replace("user", user);
		
		//write to quiz, question and update user
		dao.addQuiz(quiz);
		for (Question q : questions) {
			dao.addQuestion(q);
		}
		dao.addUserPubQuiz(user, quiz.getId());
		return SUCCESS;
	}

	public String getQuizStr() {
		return quizStr;
	}

	public void setQuizStr(String quizStr) {
		this.quizStr = quizStr;
	}

	public Quiz getQuiz() {
		return quiz;
	}

	public void setQuiz(Quiz quiz) {
		this.quiz = quiz;
	}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
}
