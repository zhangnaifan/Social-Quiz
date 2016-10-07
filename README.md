# Project Status
by augus at 2016.10.7

Done: 
	1.Dao(to interact with database)
		(REMEMBER to modify the username, password if under local db test)
	2.Login/ SignUp/ LogOut
	3.pages of home, login, signUp and error

TODO action class:
	1.Search.java (to return the search results of users, groups and quizzes)
	2.CreateQuiz.java (to build a new quiz, which also includes building a new question)
	3.CreateGroup.java (to build a new group)
	
TODO .jsp pages:
	1.search.jsp
	2.createQuiz.jsp
	3.createGroup.jsp
	
Database:
	Name: staples
	Table Name: user
	Table Info:
		Field			Type		Null	Key
		---------------------------------------
		id				int(11)		NO		PRI
		username		varchar(45)	NO		UNI
		password		varchar(45)	NO	
		nickname		varchar(45)	NO	
		membersince		date		NO	
		accountlevel	int(11)		NO	
		email			varchar(45)	YES	
		phonenum		varchar(45)	YES	
		gender			varchar(45)	YES	
		birthday		date		YES	
	(* friends, groups, quizzes are not considered yet)

Get user' information:
	In any action class, use "Private User user;" and its getters/setters
	to get the user's information (if logged in).

******************************************************
******************************************************

# project-staples


# Models  
1.1 cunstom  
1.2 group  
2.1 problem  
2.2 questionnaire  

*deadline -- 10.9*  

# Service

# Dao
