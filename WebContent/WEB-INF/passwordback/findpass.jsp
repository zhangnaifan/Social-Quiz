<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<title>找回密码</title>
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
	<!-- JS -->
	<script>msg = '${msg}';</script>
	<script src="JS/alert.js"></script>
</head>
<body>
	<nav class="navbar navbar-default" role="navigation">
		<div class="container-fluid">
	  		<div>
	      		<a class="navbar-brand" href="#">Questionnaire</a>
	      		<ul class="nav navbar-nav navbar-right" >
		      		<li><a style='color:white' href=index >想起密码？登录</a></li>
		  		</ul>
	    	</div>
		    
		</div>
	</nav>
	<div class="container">
		<div class="row">
			<div class="col-xs-6 col-md-4 col-center-block">
				<form action="signUp" method="post">
					<h2>你的邮箱</h2>
					
					<div class="form-group">
						<p>用户名</p>
						<input required type="text" class="form-control" placeholder="Used for logging in" name="user.username">
					</div>
					<div class="form-group">
						<p>邮箱</p>
						<input class="form-control" placeholder="your e-mail address" name="user.email" type="email"/>
					</div>
					
					<button class="btn btn-lg btn-primary btn-block" type="submit">提交</button>  
				</form>
			</div>
		</div>
	</div>

</body>
</html>