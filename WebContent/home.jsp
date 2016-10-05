<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
	<title>Home</title>
</head>
<body>
	
	<h1>Welcome to Home Page Template V0.1</h1>
	
	<fieldset>
		<legend>Friends</legend>
		<a href="#">Friend A</a>
		<form action="addFriend">
			<input type="submit" value="Add A New Friend!"/>
		</form>
	</fieldset>
	
	<fieldset>
		<legend>Groups</legend>
		<a href="#">Group A</a>
		<form action="addGroup">
			<input type="submit" value="Join a Group!"/>
		</form>
		<form action="createGroup">
			<input type="submit" value="Create a New Group"/>
		</form>
	</fieldset>
	
	<fieldset>
		<legend>Published Quizzes</legend>
		<a href="#">Published Quiz 1</a>
		<a href="#">More histories</a>
	</fieldset>
	
	<fieldset>
		<legend>You Have New Quizzes</legend>
		<a href="#">New Quiz 1</a>
	</fieldset>
	
	<fieldset>
		<legend>Create A New Quiz!</legend>
		<form action="createQuiz">
			<input type="submit" value="Go To Create!"/>
		</form>
	</fieldset>
	
</body>
</html>