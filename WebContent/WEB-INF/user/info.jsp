<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link href="css/navbar.css" rel="stylesheet" type="text/css" />
	<title>我的信息</title>
	<script type="text/javascript">
		$(document).ready(function(){
			$('nav').load('HTML/nav.html');
			$('input').addClass('form-control');
			$(':radio').removeClass('form-control');
			if ('${user.gender}' == "M") {
				$('#M').attr('checked','checked');
			} else if ('${user.gender}' == "F"){
				$('#F').attr('checked','checked');
			}
		});
	</script>
</head>
<body>
	<nav class="navbar navbar-default" role="navigation" style="margin-bottom: 0px;"></nav>
	
	<div class="container">
		<div class="row">
			<div class="col-xl-6 col-md-6 col-md-offset-3">
				<form action="info" method="post">
					<h2>更新用户信息</h2><hr/>
					
					<div class="form-group" style="margin-top: 3%">
						<p>简介</p>
						<input type="text" value="${user.intro} " name="intro">
					</div>
					<div class="form-group">
						<p>昵称</p>
						<input type="text" value="${user.nickName}" name="nickName">
					</div>
					<div class="form-group">
						<p>密码</p>
						<input type="password" value="${user.password}" name="password">
					</div>
					<div class="form-group">
						<p>性别</p>
						<div class="form-control">
							<input id="M" name="gender" type="radio" value="M" />Male 
							<input id="F" name="gender" type="radio" value="F"/>Female
						</div>
					</div>
					<div class="form-group">
						<p>出生日期</p>
						<input type="date" value="${user.birthday }" name="birthday">
					</div>
					<div class="form-group">
						<p>邮箱</p>
						<input name="email" value="${user.email }" type="email"/>
					</div>
					<div class="form-group">
						<p>手机</p>
						<input value="${ user.phoneNum}" name="phoneNum" type="text"/>
					</div>
					<button class="btn btn-lg btn-primary btn-block" type="submit">保存</button>  
				</form>
			</div>
		</div>
	</div>
<h1>${msg }</h1>

</body>
</html>