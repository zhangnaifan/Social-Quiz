<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>Create Group</title>
<style type="text/css">

</style>
</head>
<body>

	<h1>
		<em>TODO</em>
	</h1>
	<ol>
		<li>New Group Information</li>
		<li>Invite Friends/Users</li>
	</ol>


	<div class="input">
		<s:form action="createGroup">
			<s:textfield name="groupname" label="group name"></s:textfield>
			<s:textfield name="info" label="information"></s:textfield>
			<s:submit value="create"></s:submit>
		</s:form>

	</div>
</body>
</html>