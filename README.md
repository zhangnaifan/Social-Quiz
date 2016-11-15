Update on 2016/11/13 by augus  
   
NOTICE:  
1. database changes again, go to me when merging  
2. Dao has more members like getUserBasis() as a supplement of getUser() and so on...  

TODO:  
1. Message    
2. Message  
3. Message  

Done:
1. changed file system  
2. finally we can say goodbye to home template V0.1  
3. a lot of functions done  

==========================================================  

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
=======  
Author: augus    
Update 2016/10/31    
Done: create quiz, view published quizzes.    
NOTICE: data structure and DB both changed.    
TODO: Do quizzes; Friends; Groups.    

# Project Status  
created by augus at 2016.10.7	
updated by poore at 2016.10.31	
update log:
> add group (database for group)  

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
	4.error template page  
	
Database:  

	Name: staples  
	Table Name: user  
	Table Info:  
		Field			Type			Null	Key  
		-------------------------------------------  
		id				int(11)			NO		PRI
		username		varchar(45)		NO		UNI
		password		varchar(45)		NO	
		nickname		varchar(45)		NO	
		membersince		date			NO	
		accountlevel	int(11)			NO	
		email			varchar(45)		YES	 
		phonenum		varchar(45)		YES	 
		gender			varchar(45)		YES	 
		birthday		date			YES	 
		
>	(* friends, groups, quizzes are not considered yet)  
	
	Get user' information:
	In any action class, use "Private User user;" and its getters/setters  
	to get the user's information (if logged in). 


	Table Name: group_db  
	Table Info:  
		Field			Type			Null	Key		Extra  
		-----------------------------------------------------
		groupid			int(11)			NO		PRI	 	auto_inc  
		groupname		varchar(45)		NO		UNI  
		manager			varchar(100) 	NO  
		createdate		date			NO	 
		info 			varchar(1024)	YES  
		members			varchar(1100) 	NO  
		tag 			varchar(100)	NO  
> 	(* info include group discription and basic infomations)


	Table Name: message  
	Table Info:  
		Field			Type			Null	Key		Extra  
		-----------------------------------------------------
		id				int(11)			NO		PRI	 	auto_inc  
		fromid			int(45)			NO		UNI  
		toid			int(100) 		NO  
		msg				varchar(1020)	NO	 
		

		
		Type	
		---------------------  
		1		groupRegister   
		3		normal  
		4		invite to Quiz
		
	
Database:
	Name: staples
	Table Name: user
	Table Info:
		Field			Type		Null	Key
		---------------------------------------
		id			int(11)		NO		PRI
		username		varchar(45)	NO		UNI
		password		varchar(45)	NO	
    昵称	nickname		varchar(45)	NO	
    注册时间	membersince		date		NO	
    用户等级	accountlevel	int(11)		NO	
		email			varchar(45)	YES	
		phonenum		varchar(45)	YES	
		gender			varchar(45)	YES	
		birthday		date		YES	
	(* friends, groups, quizzes are not considered yet)

Get user' information:
	In any action class, use "Private User user;" and its getters/setters
	to get the user's information (if logged in).
=======


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



# TODO groups :
> ## group  
> 1.update group infomation  
> 2.delete group(by creater)	
> 3.invite usertogroups(by manager)  