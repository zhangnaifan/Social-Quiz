<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
	<title>Sign Up For Staples</title>
</head>
<body>

	<h2><em>${msg}</em> </h2>

	<form action="signUp" method="post">
		<fieldset>
			<legend>Your Account Information (All Required)</legend>
			<table>
				<tr>
					<td>User Name:</td>
					<td><input required name="user.username" type="text" placeholder="Used for logging in"/></td>
				</tr>
				<tr>
					<td>Nick Name:</td>
					<td><input required name="user.nickName"type="text" placeholder="To be shown in websites"/></td>
				</tr>
				<tr>
					<td>Password:</td>
					<td><input required name="user.password" type="password" /></td>
				</tr>
			</table>
		</fieldset>
		
		<fieldset>
			<legend>Your General Details</legend>
			<table>
				<tr>
					<td>Gender:</td>
					<td><input name="user.gender" type="radio" value="M" />Male<input name="user.gender" type="radio" value="F"/>Female</td>
				</tr>
				<tr>
					<td>Date of Birth:</td>
					<td><input name="user.birthday" type="date" value="1990/06/01" pattern="^\d{4}-\d{1,2}-\d{1,2}"/></td>
				</tr>
			</table>
		</fieldset>
		
		<fieldset>
			<legend>Your Contact Information</legend>
			<table>
				<tr>
					<td>E-mail:</td>
					<td><input name="user.email" type="email"/></td>
				</tr>
				<tr>
					<td>Mobile:</td>
					<td><input name="user.phoneNum" type="text"/></td>
				</tr>
			</table>
		</fieldset>	
		
		<input type="submit" value="Sign Up!" />
	</form>
	
</body>
</html>