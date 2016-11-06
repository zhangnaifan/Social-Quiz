<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<title>Sign Up For Staples</title>
	<style type="text/css">
		.navbar .container-fluid{
  			position: relative;
		}
		.navbar-default {
			 background: linear-gradient(to right, #3399CC, #33CC99);
			 border-color: #e7e7e7;
		}	
		.navbar-default .navbar-brand {
			color: #FFFFFF;
		}
		.col-center-block {
			float:none;
			display:block;
			margin-left: auto;
			margin-right: auto;
		}
		h2 {
			margin-top:20px;
			margin-bottom:20px;
		}
	</style>

</head>
<body>
	<nav class="navbar navbar-default" role="navigation">
		<div class="container-fluid">
	  		<div>
	      		<a class="navbar-brand" href="#">Questionnaire</a>
	      		<ul class="nav navbar-nav navbar-right" >
		      		<li><a style='color:white' href=index >Have an account?Log in</a></li>
		  		</ul>
	    	</div>
		    
		</div>
	</nav>
	<div class="container">
		<div class="row">
			<div class="col-xl-6 col-md-4 col-center-block">
				<form action="signUp" method="post">
					<h2>Create an account</h2>
					
					<div class="form-group">
						<p>User Name</p>
						<input type="text" class="form-control" placeholder="Used for logging in" name="username">
					</div>
					<div class="form-group">
						<p>Nick Name</p>
						<input type="text" class="form-control" placeholder="To be shown in websites" name="user.nickName">
					</div>
					<div class="form-group">
						<p>Password</p>
						<input type="password" class="form-control" placeholder="Password" name="password">
					</div>
					<div class="form-group">
						<p>Gender</p>
						<div class="form-control">
							<input name="user.gender" type="radio" value="M" />Male <input name="user.gender" type="radio" value="F"/>Female
						</div>
					</div>
					<div class="form-group">
						<p>Birthday</p>
						<input type="date" class="form-control" name="user.birthday" value="1990/06/01" pattern="^\d{4}-\d{1,2}-\d{1,2}">
					</div>
					<div class="form-group">
						<p>E-mail</p>
						<input class="form-control" placeholder="your e-mail address" name="user.email" type="email"/>
					</div>
					<div class="form-group">
						<p>Mobile</p>
						<input class="form-control" placeholder="your e-mail address" name="user.phoneNum" type="text"/>
					</div>
					<button class="btn btn-lg btn-primary btn-block" type="submit">Sign Up</button>  
				</form>
			</div>
		</div>
	</div>


</body>
</html>