<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
</style>

</head>
<body>
	<fieldset>
		<legend>User Info</legend>
		<table border="1">
			<tr>
				<th>UserName</th>
				<th>NickName</th>
			</tr>
			<tr>
				<td>${user.username }</td>
				<td>${user.nickName }</td>
			</tr>
		</table>
	</fieldset>

	<fieldset>
		<legend>Messages</legend>

		<table border="1">
			<tr>
				<th>From(user name)</th>
				<th>Send to(user id)</th>
				<th>Message</th>
				<th>Type</th>
				<th>operation</th>
			</tr>
			<s:iterator value="msgs" var="li">
				<tr>
					<td><s:property value="#li.fromUser.username" /></td>
					<td><s:property value="#li.toid" /></td>
					<td><s:property value="#li.msg" /></td>
					<td><s:property value="#li.type" /></td>
					<td><a
						href='processRegisterGroup?msgId=<s:property value="#li.id"/>&accept=true'>
							accept </a> <a
						href='processRegisterGroup?msgId=<s:property value="#li.id"/>&accept=false'>
							refuse </a></td>
				</tr>
			</s:iterator>
		</table>
	</fieldset>

</body>
</html>