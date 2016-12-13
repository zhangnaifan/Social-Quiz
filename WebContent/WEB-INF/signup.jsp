<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<title>注册</title>
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
	<script type="text/javascript">
		var usernameExpr = new RegExp("^[_a-zA-Z0-9]{4,20}$");
		var nickname = new RegExp("^[\u4e00-\u9fa5_a-zA-Z0-9 ]{3,20}$");
		var password = new RegExp("^.{6,20}$");
		var email = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/ ;
		var mobile = new RegExp("^1[3|4|5|7|8][0-9]\d{8}$");
		$(document).ready(function(){
			$('#username').blur(function(){
				var val = $('#username').val();
				if (!usernameExpr.test(val)) {
					$(this).css('border', '1px solid red');
					$(this).tooltip({title:'用户名长度4-20，由英文数字下划线构成！'});
					$(this).addClass('error');
				} else {
					$(this).css('border', '1px solid #ccc');
					$(this).tooltip('destroy');
					$(this).removeClass('error');
				}
			}).addClass('error');
			
			$('#nickname').blur(function(){
				var val = $('#nickname').val();
				if (!nickname.test(val)) {
					$(this).css('border', '1px solid red');
					$(this).tooltip({title:'长度3-20，中英文数字下划线构成！',trigger:'hover focus'});
					$(this).addClass('error');
				} else {
					$(this).css('border', '1px solid #ccc');
					$(this).tooltip('destroy');
					$(this).removeClass('error');
				}
			}).addClass('error');
			
			$('#password').blur(function(){
				var val = $('#password').val();
				if (!password.test(val)) {
					$(this).css('border', '1px solid red');
					$(this).tooltip({title:'密码长度6-20',trigger:'hover focus'});
					$(this).addClass('error');
				} else {
					$(this).css('border', '1px solid #ccc');
					$(this).tooltip('destroy');
					$(this).removeClass('error');
				}
			}).addClass('error');
			
			$('#mobile').blur(function(){
				var val = $('#mobile').val();
				if (val != "" && !mobile.test(val)) {
					$(this).css('border', '1px solid red');
					$(this).tooltip({title:'请输入正确的手机号码！',trigger:'hover focus'});
					$(this).addClass('error');
				} else {
					$(this).css('border', '1px solid #ccc');
					$(this).tooltip('destroy');
					$(this).removeClass('error');
				}
			});
			
			/* $('#email').blur(function(){
				var val = $('#email').val();
				if (val != "" && !email.test(val)) {
					$(this).css('border', '1px solid red');
					$(this).tooltip({title:'请输入正确的email！',trigger:'hover focus'});
					$(this).addClass('error');
				} else {
					$(this).css('border', '1px solid #ccc');
					$(this).tooltip('destroy');
					$(this).removeClass('error');
				}
			}); */
		});
		
		function checkAll() {
			if ($('#username, #nickname, #password, #email, #mobile').is('.error')) {
				$('#username, #nickname, #password, #email, #mobile')
					.filter('.error')
					.css('border', '1px solid red')
					.tooltip({title:'请完善此项内容！',trigger:'hover focus'});
			} else {
				$('#signupForm').submit();
			}
		}
	</script>
</head>
<body>
	<nav class="navbar navbar-default" role="navigation">
		<div class="container-fluid">
	  		<div>
	      		<a class="navbar-brand" href="#">Staples</a>
	      		<ul class="nav navbar-nav navbar-right" >
		      		<li><a style='color:white' href=index >已有账号？登录</a></li>
		  		</ul>
	    	</div>
		    
		</div>
	</nav>
	<div class="container">
		<div class="row">
			<div class="col-xs-6 col-md-4 col-center-block">
				<form action="signUp" method="post" id="signupForm">
					<h2>创建账号</h2>
					
					<div class="form-group">
						<p>用户名</p>
						<input id="username" type="text" class="form-control" placeholder="用于网站登录" name="user.username">
					</div>
					<div class="form-group">
						<p>昵称</p>
						<input  id="nickname"  type="text" class="form-control" placeholder="用于网站内显示" name="user.nickName">
					</div>
					<div class="form-group">
						<p>密码</p>
						<input  id="password"  type="password" class="form-control" placeholder="密码" name="user.password">
					</div>
					<div class="form-group">
						<p>性别</p>
						<div class="form-control">
							<input name="user.gender" type="radio" value="M" />Male <input name="user.gender" type="radio" value="F"/>Female
						</div>
					</div>
					<div class="form-group">
						<p>出生日期</p>
						<input type="date" class="form-control" name="user.birthday" value="1990-06-01" pattern="^\d{4}-\d{1,2}-\d{1,2}">
					</div>
					<div class="form-group">
						<p>邮箱</p>
						<input  id="email" class="form-control" placeholder="邮箱地址" name="user.email" type="email"/>
					</div>
					<div class="form-group">
						<p>手机</p>
						<input id="mobile" class="form-control" placeholder="手机号码" name="user.phoneNum" type="text"/>
					</div>
				</form>
					<button class="btn btn-lg btn-primary btn-block" onclick="checkAll()">注册</button>  
			</div>
		</div>
	</div>
	<h1></h1>
</body>
</html>