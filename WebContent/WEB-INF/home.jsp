<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
	<title>Home</title>
</head>
<body>
	
	<h1>Welcome to Home Page Template V0.1</h1>
	<h2>Nice to see you, ${user.nickName } </h2>
	
	<form action="logOut" method="post">
		<input type="submit" value="Log out"/>
	</form>
	
	<form action="search" method="post">
		<input type="submit" value="Search Anything!"/>
	</form>
	
	<fieldset>
		<legend>You Have New Messages!</legend>
		
		<em>Maybe the hardest part?</em>
		
		<h3><em>TODO SHOW INVITED QUIZZES/FRIENDS/GROUPS/CHATTERS</em></h3>
		<ol>
			<li><a href="#">Invited quiz</a></li>
			<li><a href="#">Invited friends</a></li>
			<li><a href="#">Invited groups</a></li>
			<li><a href="#">Invited chatters</a></li>
		</ol>
		
	</fieldset>
	
	<fieldset>
		<legend>Friends</legend>
		<h3><em>TODO SHOW FRIENDS</em></h3>
		<ol>
			<li><a href="#">Friend A</a></li>
			<li><a href="#">Friend B</a></li>
			<li><a href="#">Friend C</a></li>
		</ol>
	</fieldset>
	
	<fieldset>
		<legend>Groups</legend>
		
		<h3><em>TODO SHOW GROUPS</em></h3>
		<ol>
			<li><a href="#">Group A</a></li>
			<li><a href="#">Group B</a></li>
			<li><a href="#">Group C</a></li>
		</ol>
		
		<form action="toCreateGroup" method="post">
			<input type="submit" value="Create a New Group"/>
		</form>
	</fieldset>
	
	<fieldset>
		<legend>Published Quizzes</legend>
		
		<h3><em>TODO SHOW PUBLISHED QUIZZES</em></h3>
		<ol>
			<li><a href="#">Quiz A</a></li>
			<li><a href="#">Quiz B</a></li>
			<li><a href="#">Quiz C</a></li>
		</ol>
		
	</fieldset>
	
	<fieldset>
		<legend>Create A New Quiz!</legend>
		<form action="toCreateQuiz" method="post">
			<input type="submit" value="Create A NEW Quiz!"/>
		</form>
	</fieldset>
	
</body>
</html>