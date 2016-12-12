<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<link href="//netdna.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet">
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<!-- JS -->
	<script>msg = '${msg}';</script>
	<script src="JS/alert.js"></script>
	<style type="text/css">
		.login-form{
	 		 padding:0px 25px;
	 		 margin: auto auto;
		}
		h1, h2 {
			margin-top: 10px;
			font-size: 38px;
		    font-weight: 100;
		    color: white;
		    line-height: 50px;
		}
		
		h3 {
			font-size: 22px;
		    font-weight: 300;
		    color: #555;
		    line-height: 30px;
		}
		input {
			margin-bottom: 3px;
		}
		
		body{
			font-family: 'Roboto', sans-serif;
			background:url("image/1.jpg") no-repeat;
			margin-top:100px;
			height:100%;
			width:100%;
			background-size:cover; 
		    font-size: 16px;
		    font-weight: 300;
		    line-height: 30px;
		    text-align: center;
		}
		#center {
			text-align:center;
			margin-left:auto;
			margin-right:auto;
			background-color:white;
			height:250px;
			width:400px;
			vertical-align:middle;	
			line-height:200px;
		}
		
		/* Top-content */
		
		.inner-bg {
		    padding: 100px 0 170px 0;
		}
		.top-content .text {
			color: #fff;
		}
		
		.top-content .text h1 { color: #fff; }
		
		.top-content .description {
			margin: 20px 0 10px 0;
		}
		.top-content .description p { opacity: 0.8; }
		
		.form-box {
			margin-top: 35px;
		}
		.form-top {
			overflow: hidden;
			padding: 0 25px 15px 25px;
			background: #fff;
			-moz-border-radius: 4px 4px 0 0; -webkit-border-radius: 4px 4px 0 0; border-radius: 4px 4px 0 0;
			text-align: left;
		}
		.form-top-left {
			float: left;
			width: 75%;
			padding-top: 25px;
		}
		
		.form-top-left h3 { margin-top: 0; }
		
		.form-top-right {
			float: left;
			width: 25%;
			padding-top: 5px;
			font-size: 66px;
			color: #ddd;
			line-height: 100px;
			text-align: right;
		}
		.form-bottom {
			padding: 25px 25px 30px 25px;
			background: #eee;
			-moz-border-radius: 0 0 4px 4px; -webkit-border-radius: 0 0 4px 4px; border-radius: 0 0 4px 4px;
			text-align: left;
		}
		.form-bottom form textarea {
			height: 100px;
		}
		
		.form-bottom form button.btn {
			width: 100%;
		}
		
		.form-bottom form .input-error {
			border-color: #4aaf51;
		}
	</style>
	<title>Welcome to Staples!</title>
</head>
<body>

	<%
    if(request.getSession().getAttribute("user") != null) {
        response.sendRedirect("home");
    }
	%>
	
		<div class="container"  >
			<div class="row" >
				<div class="col-sm-8 col-sm-offset-2 text">
					<h1><strong>Questionnaire</strong></h1>
					<div class="description">
						<p style="color:white">一个社交性的测试网站</p>
					</div>
				</div>
			</div>
			<div class="row" >
				<div class="col-sm-6 col-md-offset-3 form-box" >
					<div class="form-top">
						<div class="form-top-left">
							<h3>登录我们的网站</h3>
						<p style="color:#555">请输入用户名和密码：</p>
						</div>
						<div class="form-top-right">
							<i class="fa fa-key"></i>
						</div>
					</div>
					<div class="form-bottom">
						<form action="logIn" method="post" class="login-form" role="form" style="width:100%;">
							<div class="form-group">
								<input type="text" class="form-control" placeholder="User Name" name="username">
							</div>
							<div class="form-group">
								<input type="password" class="form-control" placeholder="Password" name="password">
							</div>
							<button class="btn btn-lg btn-success btn-block" type="submit">登录</button>
						</form>
					
						<a href="findpass.jsp" style="float:left">忘记密码?</a>
						<a href=toSignUp style="float:right">注册</a>

					</div>
				</div>
			</div>
			
		</div>
	

	
</body>
</html>