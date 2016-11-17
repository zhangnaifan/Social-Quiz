package com.service;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;

import org.apache.commons.lang3.StringEscapeUtils;

import com.db.Dao;
import com.model.Question;
import com.model.group;
import com.opensymphony.xwork2.ActionSupport;

public class SearchQuestions extends ActionSupport {
	private static final long serialVersionUID = 2916245793171318765L;

	private String keyword;
	private InputStream result;
	private int groupId;
	
	private String shortAnser = 
			"<div class='question question-SA panel panel-success'>"
			+	"<input value='%d' type='text' style='display:none' class='quesId'>"
				+"<div class='question-basis panel-heading'>"
					+"<span class='content panel-title'>%s</span>"
					+"<span class='tag label label-success' style='margin-left:8px'>%s</span>"
					+"<span class='ques-remove' style='float:right'></span>"
				+"</div>"
				+"<div class='question-answer panel-body'>"
					+"<input type='text' class='answer form-control' readonly='readonly' />"
				+"</div>"
			+"</div>";
	
	private String multipleChoices = 
			"<div class='question question-MC panel panel-info'>"
			+	"<input value='%d' type='text' style='display:none' class='quesId'>"
				+"<div class='question-basis panel-heading'>"
				+	"<span class='content panel-title'>%s</span>"
				+	"<span class='tag label label-success' style='margin-left:8px'>%s</span>"
				+	"<span class='ques-remove' style='float:right'></span>"
			+	"</div>"
			+	"<div class='question-answer panel-body'>"
			+		"%s"
			+	"</div>"
			+"</div>";
	
	private String trueFalse = 
			"<div class='question question-TF panel panel-warning'>"
			+	"<input value='%d' type='text' style='display:none' class='quesId'>"
			+	"<div class='question-basis panel-heading'>"
			+		"<span class='content panel-title'>%s</span>"
			+		"<span class='tag label label-success' style='margin-left:8px'>%s</span>"
					+"<span class='ques-remove' style='float:right'>"
					+		"<input type='checkbox' readonly='readonly' style='margin-right:8px'>"		
					+"</span>"
			+	"</div>"
			+"</div>";
	
	private String option = 
			"<div class='input-group MC-option'>"
			+	"<span class='input-group-addon mark'>%c</span>"
			+	"<span class='option-content form-control'>%s</span>"
			+	"<span class='input-group-addon not-done'>"
			+		"<input type='radio' readonly='readonly'>"
			+	"</span>"
			+"</div>";
	
	
	public String execute() throws SQLException, ClassNotFoundException, UnsupportedEncodingException {
		//keyword = new String(keyword.getBytes("ISO-8859-1"),"UTF-8");
		keyword = StringEscapeUtils.unescapeEcmaScript(keyword);
		Dao dao = new Dao();
		group grp = dao.getGrpById(groupId);
		Dao dao2 = new Dao();
		ArrayList<Question> questions = new ArrayList<Question>();
		ResultSet rs = dao.executeQuery(
				"SELECT id FROM question WHERE tag LIKE '%"
				+ keyword
				+ "%' OR content LIKE '%"
				+ keyword
				+ "%';");
		while (rs.next()) {
			questions.add(dao2.getQuestion(rs.getInt(1)));
		}
		StringBuffer sb = new StringBuffer();
		for (Question ques : questions) 
		if (grp.getMemberIds().contains((ques.getOwnerID())))
		{
			switch(ques.getType()) {
			case 'S':
				sb.append(String.format(shortAnser, 
						ques.getId(), ques.getContent(), ques.getTag()));
				break;
			case 'M':
				Vector<String> options = ques.getMC().getKey();
				StringBuffer optSb = new StringBuffer();
				for (int i=0; i<options.size(); ++i) {
					optSb.append(String.format(option, (char)(i+65), options.get(i)));
				}
				sb.append(String.format(multipleChoices, 
						ques.getId(), ques.getContent(), ques.getTag(), optSb.toString()));
				break;
			default:
				sb.append(String.format(trueFalse, 
						ques.getId(), ques.getContent(), ques.getTag()));
			}
		}
		setResult(new ByteArrayInputStream(sb.toString().getBytes("utf-8")));
		return SUCCESS;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public InputStream getResult() {
		return result;
	}
	public void setResult(InputStream result) {
		this.result = result;
	}
	public int getGroupId() {
		return groupId;
	}
	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}
}
