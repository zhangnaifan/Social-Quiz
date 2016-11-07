<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<fieldset>
		<legend>All Groups</legend>
		
		<table border="1">
		
		<tr>
			<th>Group Name</th>
			<th>Group Id</th>
			<th>Group members</th>
			<th>more info</th>
		</tr>
		
		<s:iterator value="groups" var="li">
			<tr>
				<td><s:property value='#li.groupName'></s:property></td>
				<td><s:property value='#li.groupId'></s:property></td>
				<td><s:property value='#li.totMembers'></s:property></td>
				<td><a href="groupInfo?groupId=<s:property value='#li.groupId'></s:property>"> Link </a></td>
			</tr>
		</s:iterator>
		</table>
	</fieldset>
</body>
</html>