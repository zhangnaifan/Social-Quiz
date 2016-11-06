<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
.msgblock{
	width: 60%;
	margin: 0 auto;
	border-width: 2px;
	border-color: #000;
	background-color: #0f0;
}
</style>

</head>
<body>
	<p> user name: </p>
	<p>  ${user.username } </p>
	
	<s:iterator value="msgs" var="li">
		<div class="msgblock" >
			<ul>
				<s:property value="#li.fromUser.username"/>
			</ul>
			<ul>
				<s:property value="#li.msg"/>
			</ul>
			<a href='processRegisterGroup?msgId=<s:property value="#li.id"/>&accept=true' > accept </a><br/>
			<a href='processRegisterGroup?msgId=<s:property value="#li.id"/>&accept=false' > refuse </a><br/>
		</div>
	</s:iterator>
	
</body>
</html>