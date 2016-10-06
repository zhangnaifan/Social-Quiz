<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
	<title>Welcome to Staples!</title>
	<style>
		td{
			border:2px solid blue;
			width:200px;
			height:150px;
		}
		table{
			margin:150 auto;
			border:5px solid blue;
			border-collapse:collapse;
		}
		input{
			height:30px;
			margin:5px;
		}
	</style>
</head>
<body>

	<%
    if(request.getSession().getAttribute("user") != null) {
        response.sendRedirect("home.action");
    }
	%>
	
	<h1>Welcome to our test.</h1>
	
	<h3><em>${msg } </em></h3>
	
	<table>
		<tr>
			<td>
				<h3>Log in</h3>
				
				<form action="logIn" method="post">
					<input type="text" placeholder="User Name" name="user.username"/>
					<input type="password" placeholder="Password" name="user.password"/>
					<input type="submit" value="Log in"/>
				</form>
				
				<h4><em>${msg }</em></h4>
			</td>
			<td>
				<h3>Sign up</h3>
				<form action="toSignUp" method="post">
					<input type="submit" value="Sign up"/>
				</form>
			</td>
		</tr>
	</table>
	
</body>
</html>