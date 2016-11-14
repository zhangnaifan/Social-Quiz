<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<fieldset>
		<legend>write Message</legend>
		<form action="sendMessage" method="post">
			<input type="hidden" name="fromid" value="${fromid }">
			<input type="hidden" name="toid" value="${toid }">
			<input type="text" name="msg">
			<input type="hidden" name="type" value="3">
			<input type="submit" >
		</form>
	</fieldset>
</body>
</html>