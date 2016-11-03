<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.showgroup {
	width: 60%;
	height: 220px;
	margin: 50px auto;
	background-color: #0f0;
	border-width: 10px;
	border: solid;
	border-color: #000;
	background-color: #0f0;
	margin: 50px auto;
}

.memberblock {
	width: 60%;
	height: 120px;
	margin: 50px auto;
	background-color: #0f0;
	border-width: 10px;
	border-color: #000;
}

body {
	margin-left: auto;
	margin-right: auto;
}
</style>
</head>
<body>
	<div class="showgroup">
		<div style="width: 100%; height: 50%">Group name:
			${grp.groupName }</div>
		<table border="1px" width="100%" height="40%">
			<tr>
				<td>Group Info:${grp.info }</td>
				<td>Group create at: ${grp.createDate }</td>
				<td>Group members:${grp.totMembers }</td>
			</tr>

		</table>
		<a href="registGroup?groupId=${grp.groupId }">register</a>
	</div>
	<s:iterator value="members" var="li">
		<div class="memberblock" onmouseover="this.style.cursor='pointer'"
			onclick="document.location='#';">
			<s:property value="#li.nickName"></s:property>
			<s:property value="#li.email"></s:property>
		</div>

	</s:iterator>


</body>
</html>