<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
	<title>Sign Up For Staples</title>
</head>
<body>

	<form action="signup" method="post">
		<fieldset>
			<legend>Your Account Information</legend>
			<table>
				<tr>
					<td>User Name:</td>
					<td><input type="text" placeholder="Used for logging in"/></td>
				</tr>
				<tr>
					<td>Nick Name:</td>
					<td><input type="text" placeholder="To be shown in websites"/></td>
				</tr>
				<tr>
					<td>Password:</td>
					<td><input type="password" /></td>
				</tr>
			</table>
		</fieldset>
		
		<fieldset>
			<legend>Your General Details</legend>
			<table>
				<tr>
					<td>Gender:</td>
					<td><input type="radio"/>Male<input type="radio"/>Female</td>
				</tr>
				<tr>
					<td>Date of Birth:</td>
					<td><input type="date" value="1990/06/01"/></td>
				</tr>
			</table>
		</fieldset>
		
		<fieldset>
			<legend>Your Contact Information</legend>
			<table>
				<tr>
					<td>E-mail:</td>
					<td><input type="email"/></td>
				</tr>
				<tr>
					<td>Mobile:</td>
					<td><input type="text"/></td>
				</tr>
			</table>
		</fieldset>	
		
		<input type="submit" value="Sign Up!" />
	</form>
	
</body>
</html>