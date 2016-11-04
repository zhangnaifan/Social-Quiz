package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Vector;

import com.model.Message;
import com.model.Question;
import com.model.Quiz;
import com.model.User;
import com.model.group;

public class Dao {
	Connection con = null;
	Statement stat = null;
	ResultSet rs = null;

	public Dao() throws ClassNotFoundException, SQLException {
		String driver = "com.mysql.jdbc.Driver";
		String username = "root";
		String password = "root";
		String dbUrl = String.format("jdbc:mysql://%s:%s/%s", new Object[] {
				"localhost", "3306", "staples" });

		Class.forName(driver);
		this.con = DriverManager.getConnection(dbUrl, username, password);
		this.stat = this.con.createStatement();
	}

	public void close() throws SQLException {
		if (this.con != null) {
			this.con.close();
		}
	}

	public boolean execute(String sql) throws SQLException {
		return this.stat.execute(sql);
	}

	public ResultSet executeQuery(String sql) throws SQLException {
		return this.stat.executeQuery(sql);
	}

	public void executeUpdate(String sql) throws SQLException {
		this.stat.executeUpdate(sql);
	}

	public int count(String target) throws ClassNotFoundException, SQLException {
		ResultSet rs = executeQuery("SELECT count(*) FROM " + target + ";");
		if (rs.next()) {
			return rs.getInt(1);
		}
		return -1;
	}

	public void addUser(User user) {
		// TODO from Signup.java
	}

	public void addQuiz(Quiz quiz) throws SQLException {
		StringBuffer questions = new StringBuffer();
		for (int id : quiz.getQuestions()) {
			questions.append(" " + id);
		}
		execute("INSERT INTO quiz(id,type,ownerID,createDate,questions,title,description)VALUES("
				+ quiz.getId()
				+ ",'"
				+ quiz.getType()
				+ "',"
				+ quiz.getOwnerID()
				+ ",'"
				+ quiz.getCreateDate()
				+ "','"
				+ questions.substring(0, questions.length() == 0 ? 0
						: questions.length())
				+ "','"
				+ quiz.getTitle()
				+ "','"
				+ quiz.getDescription() + "');");
	}

	public void addQuestion(Question ques) throws SQLException {
		execute("INSERT INTO question(id,type,tag,ownerID,content,answer)VALUES("
				+ ques.getId()
				+ ",'"
				+ ques.getType()
				+ "','"
				+ ques.getTag()
				+ "',"
				+ ques.getOwnerID()
				+ ",'"
				+ ques.getContent()
				+ "','"
				+ ques.getAnswer() + "');");
	}

	public void addUserPubQuiz(User user, int quizId) throws SQLException {
		ResultSet rs = executeQuery("SELECT pubQuiz from user WHERE id="
				+ user.getId() + ";");
		StringBuffer newQuiz = new StringBuffer();
		if (rs.next()) {
			String exsited = rs.getString(1);
			if (exsited != "NULL")
				newQuiz.append(exsited);
		}
		newQuiz.append(" " + quizId);
		executeUpdate("UPDATE user SET pubQuiz='" + newQuiz.toString()
				+ "' WHERE id=" + user.getId() + ";");
	}

	public Quiz getQuiz(int quizId) throws SQLException {
		Quiz quiz = new Quiz();
		ResultSet rs = executeQuery("SELECT * FROM quiz WHERE id=" + quizId
				+ ";");
		if (rs.next()) {
			quiz.setId(rs.getInt("id"));
			quiz.setType(rs.getString("type"));
			quiz.setOwnerID(rs.getInt("ownerID"));
			quiz.setCreateDate(rs.getDate("createDate"));
			quiz.setTitle(rs.getString("title"));
			quiz.setDescription(rs.getString("description"));
			String[] ids = rs.getString("questions").split(" ", -1);
			Vector<Integer> questions = new Vector<Integer>();
			for (int i = 1; i < ids.length; ++i) {
				questions.add(Integer.parseInt(ids[i]));
			}
			quiz.setQuestions(questions);
		}
		return quiz;
	}

	public Question getQuestion(int quesId) throws SQLException {
		Question ques = new Question();
		ResultSet rs = executeQuery("SELECT * FROM question WHERE id=" + quesId
				+ ";");
		if (rs.next()) {
			ques.setId(rs.getInt("id"));
			ques.setTag(rs.getString("tag"));
			ques.setType(rs.getString("type").charAt(0));
			ques.setOwnerID(rs.getInt("ownerID"));
			ques.setContent(rs.getString("content"));
			ques.setAnswer(rs.getString("answer"));
		}
		return ques;
	}

	public User getUser(String username) throws SQLException {
		User user = null;
		ResultSet rs = executeQuery("SELECT * FROM user WHERE username='"
				+ username + "';");
		if (rs.next()) {
			user = new User();
			user.setAccountLevel(rs.getInt("accountlevel"));
			user.setBirthday(rs.getDate("birthday"));
			user.setEmail(rs.getString("email"));
			user.setGender(rs.getString("gender"));
			user.setId(rs.getInt("id"));
			user.setMemberSince(rs.getDate("membersince"));
			user.setNickName(rs.getString("nickname"));
			user.setPhoneNum("phonenum");
			user.setUsername(rs.getString("username"));
			user.setPassword(rs.getString("password"));
			Vector<Integer> pubQuiz = new Vector<Integer>();
			String[] quizStr = rs.getString("pubQuiz").split(" ", -1);
			for (int i = 1; i < quizStr.length; ++i) {
				pubQuiz.add(Integer.parseInt(quizStr[i]));
			}
			user.setPublishedQuiz(pubQuiz);
		}
		return user;
	}

	public User getUser(int userId) throws SQLException {
		User user = null;
		ResultSet rs = executeQuery("SELECT * FROM user WHERE id=" + userId
				+ ";");
		if (rs.next()) {
			user = new User();
			user.setAccountLevel(rs.getInt("accountlevel"));
			user.setBirthday(rs.getDate("birthday"));
			user.setEmail(rs.getString("email"));
			user.setGender(rs.getString("gender"));
			user.setId(rs.getInt("id"));
			user.setMemberSince(rs.getDate("membersince"));
			user.setNickName(rs.getString("nickname"));
			user.setPhoneNum("phonenum");
			user.setUsername(rs.getString("username"));
			user.setPassword(rs.getString("password"));
			Vector<Integer> pubQuiz = new Vector<Integer>();
			String[] quizStr = rs.getString("pubQuiz").split(" ", -1);
			for (int i = 1; i < quizStr.length; ++i) {
				pubQuiz.add(Integer.parseInt(quizStr[i]));
			}
			user.setPublishedQuiz(pubQuiz);
		}
		return user;
	}

	public int insertGroup(group grp) throws SQLException {
		// TODO Auto-generated method stub
		String tmp = String.format("insert into group_db values(null,'%s','%s',NOW(),'%s','%s');", grp.getGroupName(),grp.getGroupManager(),grp.getInfo(),grp.getGroupMember());
		this.execute(tmp);
		ResultSet rs = this.executeQuery("select last_insert_id()");
		System.out.println("233");
		rs.next();
		return rs.getInt("last_insert_id()");
	}

	public group getGrpById(Integer groupId) throws SQLException {
		
		ResultSet rs = this.executeQuery(String.format("select * from group_db where groupid=%d", groupId));
		if (rs.next()) {
			group grp = new group();
			grp.setGroupId(new Integer(groupId));
			grp.setGroupName(rs.getString("groupname"));
			grp.setManagerIds(toList(rs.getString("managerid")));
			grp.setMemberIds(toList(rs.getString("member")));
			grp.setCreateDate(rs.getDate("createdate"));
			grp.setInfo(rs.getString("info"));
			grp.setTotMembers(grp.getMemberIds().size());
			return grp;
		}
		return null;
	}
	private ArrayList<Integer> toList(String string) {
		// TODO Auto-generated method stub
		String[] str = string.split(" ");
		ArrayList<Integer> ret = new ArrayList<Integer>();
		for (int i = 0; i < str.length; i++)
			ret.add(Integer.valueOf(str[i]));
		return ret;
	}
	public void addRegisterGroupMsg(int id, long groupId) throws SQLException {
		this.execute("insert into message "+Message.formRegisterGroup(id, groupId));
	}
}
