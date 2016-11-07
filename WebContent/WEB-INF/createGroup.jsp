<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>Create Group</title>
<style type="text/css">
.input{
	width : 100%;
	border-color: #000;
	border-width: 2px;
	border-style: solid;
}
</style>
</head>
<body>
	<em>
		tag is not available!
	</em>
	<fieldset style="margin-top: 100px">
		<legend>Create A Group!</legend>
		<s:form action="createGroup">
			<s:textfield name="groupname" label="group name"></s:textfield>
			<s:textfield name="info" label="Description"></s:textfield>
			<s:textfield name="tag" label="tag"></s:textfield>
			<s:submit value="create" align="left"></s:submit>
		</s:form>
	</fieldset>
</body>
</html>