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

import javafx.util.Pair;


public class Dao
{
  Connection con = null;
  Statement stat = null;
  ResultSet rs = null;
  
  public Dao() throws ClassNotFoundException, SQLException
  { 
    String driver = "com.mysql.jdbc.Driver";
    String username = "root";
    String password = "113095";
    String dbUrl = String.format("jdbc:mysql://%s:%s/%s", new Object[] {
      "localhost", "3306", "staples" });    
    
	Class.forName(driver);
	this.con = DriverManager.getConnection(dbUrl, username, password);
	this.stat = this.con.createStatement();
  }
  
  public void close() throws SQLException
  {
    if (this.con != null) {
        this.con.close();
    }
  }
  
  public boolean execute(String sql) throws SQLException
  {
    return this.stat.execute(sql);
  }
  
  public ResultSet executeQuery(String sql) throws SQLException
  {
	return this.stat.executeQuery(sql);
  }
  
  public void executeUpdate(String sql) throws SQLException
  {
      this.stat.executeUpdate(sql);
  }
  
  public int count(String target) throws ClassNotFoundException, SQLException {
	ResultSet rs = executeQuery("SELECT count(*) FROM " + target + ";");
	if (rs.next()) {
		return rs.getInt(1);
	}
	return -1;
  }
  
  public void addUser(User user) throws SQLException {
	  execute("INSERT INTO user(username,password,nickname,membersince,accountlevel,"
				+ "email,phonenum,gender,birthday,pubQuiz,quizDone,intro,followings,followers,groups ) VALUES('"
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
				+ "','','','','','','');");
  }

  public void updateUser(User user) throws SQLException {
	  execute("UPDATE user SET username='"
				+ user.getUsername()
				+ "', password='"
				+ user.getPassword()
				+ "', nickname='"
				+ user.getNickName()
				+ "', email='"
				+ user.getEmail()
				+ "', phonenum='"
				+ user.getPhoneNum()
				+ "', gender='"
				+ user.getGender()
				+ "', birthday='"
				+ user.getBirthday()
				+ "', intro='"
				+ user.getIntro()
				+ "' WHERE id ="
				+ user.getId()
				+ ";");
  }
  
  public void updateUserFollowing(int userId, String news) throws SQLException {
	  executeUpdate("UPDATE user SET followings='"
			  			+news
			  			+"' WHERE id="
			  			+userId
			  			+";");
  }
  
  public void updateUserFollowers(int userId, String news) throws SQLException {
	  executeUpdate("UPDATE user SET followers='"
			  			+news
			  			+"' WHERE id="
			  			+userId
			  			+";");
  }
  
  public void addQuiz(Quiz quiz) throws SQLException {
	StringBuffer questions = new StringBuffer();
	for (int id : quiz.getQuestions()) {
		questions.append(" " + id);
	}
	execute("INSERT INTO quiz(id,type,ownerID,createDate,questions,title,description,records)VALUES("
			+ quiz.getId()
			+ ",'" + quiz.getType()
			+ "'," + quiz.getOwnerID()
			+ ",'" + quiz.getCreateDate()
			+ "','" + questions.substring(0, questions.length()==0?0:questions.length()) 
			+ "','" + quiz.getTitle()
			+ "','" + quiz.getDescription()
			+ "','');");
  }
  
  public void addQuestion(Question ques) throws SQLException {
	execute("INSERT INTO question(id,type,tag,ownerID,content,answer)VALUES("
			+ ques.getId()
			+ ",'" + ques.getType()
			+ "','" + ques.getTag()
			+ "'," + ques.getOwnerID()
			+ ",'" + ques.getContent()
			+ "','" + ques.getAnswer() + "');");  
  }
  
  public void addUserPubQuiz(User user, int quizId) throws SQLException{
	  ResultSet rs = executeQuery("SELECT pubQuiz from user WHERE id=" + user.getId() + ";");
	  StringBuffer newQuiz = new StringBuffer();
	  if (rs.next()) {
		  String exsited = rs.getString(1);
		  if (exsited != "NULL" && exsited != "null")
			  newQuiz.append(exsited);
	  }
	  newQuiz.append(" " + quizId);
	  executeUpdate("UPDATE user SET pubQuiz='"
			  		+ newQuiz.toString() 
			  		+ "' WHERE id=" + user.getId()
			  		+ ";");
  }
  
  public void addQuizRecord(int quizId, String rec) throws SQLException {
	  ResultSet rs = executeQuery("SELECT records from quiz WHERE id=" + quizId + ";");
	  StringBuffer newRec = new StringBuffer();
	  if (rs.next()) {
		  String exsited = rs.getString(1);
		  if (exsited != "NULL" && exsited != "null")
			  newRec.append(exsited);
	  }
	  newRec.append("&" + rec);
	  executeUpdate("UPDATE quiz SET records='"
			  		+ newRec.toString() 
			  		+ "' WHERE id=" + quizId
			  		+ ";");
  }
  
  public void addUserQuizDone(int userId, int quizId) throws SQLException {
	  ResultSet rs = executeQuery("SELECT quizDone from user WHERE id=" + userId + ";");
	  StringBuffer newRec = new StringBuffer();
	  if (rs.next()) {
		  String exsited = rs.getString(1);
		  if (exsited != "NULL" && exsited != "null")
			  newRec.append(exsited);
	  }
	  newRec.append("&" + quizId);
	  executeUpdate("UPDATE user SET quizDone='"
			  		+ newRec.toString() 
			  		+ "' WHERE id=" + userId
			  		+ ";");
  }
  
  public void addUserFollowing(int userId, int friendId) throws SQLException {
	  ResultSet rs = executeQuery("SELECT followings FROM user WHERE id=" + userId + ";");
	  StringBuffer newRec = new StringBuffer();
	  if (rs.next()) {
		  String exsited = rs.getString(1);
		  if (exsited != "NULL" && exsited != "null")
			  newRec.append(exsited);
	  }
	  newRec.append("&" + friendId);
	  executeUpdate("UPDATE user SET followings='"
			  		+ newRec.toString() 
			  		+ "' WHERE id=" + userId
			  		+ ";");	  
  }
  
  public void addUserFollower(int userId, int followerId) throws SQLException {
	  ResultSet rs = executeQuery("SELECT followers FROM user WHERE id=" + userId + ";");
	  StringBuffer newRec = new StringBuffer();
	  if (rs.next()) {
		  String exsited = rs.getString(1);
		  if (exsited != "NULL" && exsited != "null")
			  newRec.append(exsited);
	  }
	  newRec.append("&" + followerId);
	  executeUpdate("UPDATE user SET followers='"
			  		+ newRec.toString() 
			  		+ "' WHERE id=" + userId
			  		+ ";");	  
  }
  
  public void addUserGroup(int userId, int groupId) throws SQLException {
	  ResultSet rs = executeQuery("SELECT groups FROM user WHERE id=" + userId + ";");
	  StringBuffer newRec = new StringBuffer();
	  if (rs.next()) {
		  String exsited = rs.getString(1);
		  if (exsited != "NULL" && exsited != "null")
			  newRec.append(exsited);
	  }
	  newRec.append("&" + groupId);
	  executeUpdate("UPDATE user SET groups='"
			  		+ newRec.toString() 
			  		+ "' WHERE id=" + userId
			  		+ ";");	  
  }
  
  public Quiz getQuiz(int quizId) throws SQLException {
	  Quiz quiz = new Quiz();
	  ResultSet rs = executeQuery("SELECT * FROM quiz WHERE id=" + quizId + ";");
	  if (rs.next()) {
		  quiz.setId(rs.getInt("id"));
		  quiz.setType(rs.getString("type"));
		  quiz.setOwnerID(rs.getInt("ownerID"));
		  quiz.setCreateDate(rs.getDate("createDate"));
		  quiz.setTitle(rs.getString("title"));
		  quiz.setDescription(rs.getString("description"));
		  String[] ids = rs.getString("questions").split(" ",-1);
		  Vector<Integer> questions = new Vector<Integer>();
		  for (int i=1; i<ids.length; ++i) {
			  questions.add(Integer.parseInt(ids[i]));
		  }
		  quiz.setQuestions(questions);
		  String records = rs.getString("records");
		  
		  ArrayList<Pair<Integer, Integer>> rank = new ArrayList<Pair<Integer, Integer>>();
		  String[] I = records.split("&", -1);
		  for (int i=1; i<I.length; ++i) {
			  String[] II = I[i].split("\\|", -1);
			  rank.add(new Pair<Integer, Integer>(Integer.parseInt(II[1]), Integer.parseInt(II[2])));
		  }
		  quiz.setRank(rank);
	  }
	  return quiz;
  }
  
  public Quiz getQuizBasis(int quizId) throws SQLException {
	  Quiz quiz = new Quiz();
	  ResultSet rs = executeQuery("SELECT * FROM quiz WHERE id=" + quizId + ";");
	  if (rs.next()) {
		  quiz.setId(rs.getInt("id"));
		  quiz.setType(rs.getString("type"));
		  quiz.setOwnerID(rs.getInt("ownerID"));
		  quiz.setCreateDate(rs.getDate("createDate"));
		  quiz.setTitle(rs.getString("title"));
		  quiz.setDescription(rs.getString("description"));
	  }
	  return quiz;
  }
  
  public Question getQuestion(int quesId) throws SQLException {
	  Question ques = new Question();
	  ResultSet rs = executeQuery("SELECT * FROM question WHERE id=" + quesId + ";");
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
	  ResultSet rs = executeQuery("SELECT * FROM user WHERE username='" + username + "';");
	  if (rs.next()) {
		  user = new User();
		  user.setAccountLevel(rs.getInt("accountlevel"));
		  user.setBirthday(rs.getDate("birthday"));
		  user.setEmail(rs.getString("email"));
		  user.setGender(rs.getString("gender"));
		  user.setId(rs.getInt("id"));
		  user.setMemberSince(rs.getDate("membersince"));
		  user.setNickName(rs.getString("nickname"));
		  user.setPhoneNum(rs.getString("phonenum"));
		  user.setUsername(rs.getString("username"));
		  user.setPassword(rs.getString("password"));
		  String[] quizStr = rs.getString("pubQuiz").split(" ",-1);
		  for (int i=1; i<quizStr.length; ++i) {
			  user.addQuiz(Integer.parseInt(quizStr[i]));
		  }
		  String[] quizzesDone = rs.getString("quizDone").split("&", -1);
		  for (int i=1 ; i<quizzesDone.length; ++i) {
			  user.addQuizDone(Integer.parseInt(quizzesDone[i]));
		  }
		  user.setIntro(rs.getString("intro"));
		  String[] followings = rs.getString("followings").split("&",-1);
		  for (int i=1 ; i<followings.length; ++i) {
			  user.addFollowing(Integer.parseInt(followings[i]));
		  }
		  String[] followers = rs.getString("followers").split("&",-1);
		  for (int i=1 ; i<followers.length; ++i) {
			  user.addFollower(Integer.parseInt(followers[i]));
		  }
		  String[] groups = rs.getString("groups").split("&",-1);
		  for (int i=1 ; i<groups.length; ++i) {
			  user.addGroup(Integer.parseInt(groups[i]));
		  }
 	  }
	  return user;
  }
  
  public User getUser(int userId) throws SQLException {
	  User user = null;
	  ResultSet rs = executeQuery("SELECT * FROM user WHERE id=" + userId + ";");
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
		  String[] quizStr = rs.getString("pubQuiz").split(" ",-1);
		  for (int i=1; i<quizStr.length; ++i) {
			  pubQuiz.add(Integer.parseInt(quizStr[i]));
		  }
		  user.setPublishedQuiz(pubQuiz);
		  String[] quizzesDone = rs.getString("quizDone").split("&", -1);
		  for (int i=1 ; i<quizzesDone.length; ++i) {
			  user.addQuizDone(Integer.parseInt(quizzesDone[i]));
		  }
		  user.setIntro(rs.getString("intro"));
		  String[] followings = rs.getString("followings").split("&",-1);
		  for (int i=1 ; i<followings.length; ++i) {
			  user.addFollowing(Integer.parseInt(followings[i]));
		  }
		  String[] followers = rs.getString("followers").split("&",-1);
		  for (int i=1 ; i<followers.length; ++i) {
			  user.addFollower(Integer.parseInt(followers[i]));
		  }
		  String[] groups = rs.getString("groups").split("&",-1);
		  for (int i=1 ; i<groups.length; ++i) {
			  user.addGroup(Integer.parseInt(groups[i]));
		  }
 	  }
	  return user;
  }
  
  public User getUserBasis(int userId) throws SQLException {
	  User user = null;
	  ResultSet rs = executeQuery("SELECT nickname, membersince, intro, email FROM user WHERE id="
			  						+ userId
			  						+ ";");
	  if (rs.next()) {
		  user = new User();
		  user.setNickName(rs.getString("nickname"));
		  user.setMemberSince(rs.getDate("membersince"));
		  user.setIntro(rs.getString("intro"));
		  user.setEmail(rs.getString("email"));
		  user.setId(userId);
	  }
	  return user;
  }
  
  public int insertGroup(group grp) throws SQLException {
		// TODO Auto-generated method stub
		String tmp = String
				.format("insert into group_db values(null,'%s','%s',NOW(),'%s','%s','%s');",
						grp.getGroupName(), grp.getGroupManager(),
						grp.getInfo(), grp.getGroupMember(), grp.getTagStr());
		;
		this.execute(tmp);
		ResultSet rs = this.executeQuery("select last_insert_id()");
		System.out.println("233");
		rs.next();
		return rs.getInt("last_insert_id()");
	}

	public group getGrpById(Integer groupId) throws SQLException {

		ResultSet rs = this.executeQuery(String.format(
				"select * from group_db where groupid=%d", groupId));
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

	public static ArrayList<Integer> toList(String string) {
		// TODO Auto-generated method stub
		String[] str = string.split(" ");
		ArrayList<Integer> ret = new ArrayList<Integer>();
		for (int i = 0; i < str.length; i++)
			ret.add(Integer.valueOf(str[i]));
		return ret;
	}

	public void addRegisterGroupMsg(int id, int toId, int groupId, String groupName)
			throws SQLException {
		this.execute("insert into message "
				+ Message.formRegisterGroup(id, toId, groupId, groupName));
	}

	public ArrayList<Message> getMessages(int id) throws SQLException {
		ResultSet rs = this.executeQuery("select * from message where toid="
				+ String.valueOf(id));
		ArrayList<Message> ret = new ArrayList<Message>();
		while (rs.next()) {
			ret.add(new Message(rs.getLong("id"), rs.getInt("type"), rs
					.getLong("fromid"), rs.getLong("toid"), rs.getString("msg")));
		}
		for (int i = 0; i < ret.size(); i++)
			ret.get(i).setFromUser(this.getUser((int) ret.get(i).getFromid()));
		return ret;
	}

	public void deleteMsg(int msgId) throws SQLException {
		this.execute("delete from message where id=" + String.valueOf(msgId));
	}

	public Message getMessageById(int msgId) throws SQLException {
		ResultSet rs = this.executeQuery("select * from message where id="
				+ String.valueOf(msgId));
		if (rs.next()) {
			return new Message(rs.getLong("id"), rs.getInt("type"),
					rs.getLong("fromid"), rs.getLong("toid"),
					rs.getString("msg"));
		}
		return null;
	}

	public void processMsg(int msgId) throws SQLException {
		Message msg = getMessageById(msgId);
		int groupId = msg.getToGroupId();
		group grp = this.getGrpById(groupId);

		System.out.println("user: " + msg.getFromid() + "  group: "
				+ grp.getGroupId());

		if (!grp.hasUser((int) msg.getFromid())) {
			grp.getMemberIds().add((int) msg.getFromid());
			grp.updateStr();
			this.executeUpdate(String.format(
					"update group_db set member='%s' where groupid=%d",
					grp.getGroupMember(), grp.getGroupId()));
		}
	}

	public ArrayList<group> getAllGroups() throws SQLException {
		// TODO Auto-generated method stub
		ArrayList<group> ret = new ArrayList<group>();
		ResultSet rs = this.executeQuery("select * from group_db");
		while (rs.next()) {
			ret.add(new group(rs.getInt("groupid"), rs.getString("groupname"),
					rs.getString("member"), rs.getString("managerid"), rs
							.getString("info"), rs.getString("tag"), rs
							.getDate("createdate")));
		}

		return ret;
	}

	public void insertNewMsg(Message newMsg) throws SQLException {
		this.execute(newMsg.tosql());
	}
}
