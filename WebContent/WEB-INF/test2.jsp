<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet">
<title>Insert title here</title>
<style>
	#login img{
	  margin: 10px 0;
	}
	#login .center {
	  text-align: center;
	}
	
	#login .login {
	  max-width: 300px;
		margin: 35px auto;
	}
	
	#login .login-form{
	  padding:0px 25px;
	}
</style>
</head>
<body>

	
	<div id="login" class="container">
	  <div class="row-fluid">
	    <div class="span12">
	      <div class="login well well-small">
	        <div class="center">
	          <img src="http://placehold.it/250x100&text=Logo" alt="logo"> 
	        </div>
	        <form action="/users/login" style="" class="login-form" id="UserLoginForm" method="post" accept-charset="utf-8">
	          <div class="control-group">
	            <div class="input-prepend">
	              <span class="add-on"><i class="icon-user"></i></span>
	              <input name="data[User][username]" required="required" placeholder="Username" maxlength="255" type="text" id="UserUsername"> 
	            </div>
	          </div>
	          <div class="control-group">
	            <div class="input-prepend">
	              <span class="add-on"><i class="icon-lock"></i></span>
	              <input name="data[User][password]" required="required" placeholder="Password" type="password" id="UserPassword"> 
	            </div>
	          </div>
	          <div class="control-group">
	            <label id="remember-me">
	              <input type="checkbox" name="data[User][remember_me]" value="1" id="UserRememberMe"> Remember Me?</label>
	          </div>
	          <div class="control-group">
	            <input class="btn btn-primary btn-large btn-block" type="submit" value="Sign in"> 
	          </div>
	        </form>
	      </div><!--/.login-->
	    </div><!--/.span12-->
	  </div><!--/.row-fluid-->
	</div><!--/.container-->

</body>

</html>
