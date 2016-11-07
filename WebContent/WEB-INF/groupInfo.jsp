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

	<h1>The information of the groups ${grp.groupName }</h1>

	<fieldset>
		<legend> group Info </legend>

		<table border="1">
			<tr>
				<td>Group name</td>
				<td>${grp.groupName }</td>
			</tr>
			<tr>
				<td>Created date</td>
				<td>${grp.createDate }</td>
			</tr>
			<tr>
				<td>Total members</td>
				<td>${grp.totMembers }</td>
			</tr>
		</table>

	</fieldset>

	<fieldset>
		<legend>Group Members</legend>
		<table border="1">
			<tr>
				<th>User Name</th>
				<th>Nick Name</th>
				<th>User Id</th>
								<th>User info Link</th>
			</tr>
			<s:iterator value="members" var="li">
				<tr>
					<td><s:property value="#li.username"></s:property></td>
					<td><s:property value="#li.nickName"></s:property></td>
					<td><s:property value="#li.id"></s:property></td>
					<td><a href="#<s:property value='#li.id'></s:property>">Link</a></td>
				</tr>
			</s:iterator>
		</table>
	</fieldset>

	<fieldset>
		<legend>Group Managers</legend>
		<table border="1">
			<tr>
				<th>User Name</th>
				<th>Nick Name</th>
				<th>User Id</th>
				<th>User info Link</th>
			</tr>
			<s:iterator value="managers" var="li">
				<tr>
					<td><s:property value="#li.username"></s:property></td>
					<td><s:property value="#li.nickName"></s:property></td>
					<td><s:property value="#li.id"></s:property></td>
					<td><a href="#">Link</a></td>
				</tr>
			</s:iterator>
		</table>
	</fieldset>

	<fieldset>
		<legend>Register for this group</legend>
		<form action="registerGroup">
			<input type="hidden" name="groupId" value="${grp.groupId }" readonly="readonly">
			<input type="submit" value="Register for this Group"/>
		</form>
	</fieldset>
</body>
</html>