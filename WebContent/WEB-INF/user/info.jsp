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
		var intro = new RegExp("^[\u4e00-\u9fa5_a-zA-Z0-9,，.。!！?？@#%*（()） ]{0,40}$");
		var nickname = new RegExp("^[\u4e00-\u9fa5_a-zA-Z0-9 ]{3,20}$");
		var password = new RegExp(".{6,20}$");
		var email = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/ ;
		var mobile = new RegExp("^1[3|4|5|7|8][0-9]\d{8}$");
		$(document).ready(function(){
			$('nav').load('HTML/nav.html');
			$('input').addClass('form-control');
			$(':radio').removeClass('form-control');
			if ('${user.gender}' == "M") {
				$('#M').attr('checked','checked');
			} else if ('${user.gender}' == "F"){
				$('#F').attr('checked','checked');
			}
			
			$('#intro').blur(function(){
				var val = $('#intro').val();
				if (!intro.test(val)) {
					$(this).css('border', '1px solid red');
					$(this).tooltip({title:'不超过40字符且不包含特殊字符',trigger:'hover focus'});
					$(this).addClass('error');
				} else {
					$(this).css('border', '1px solid #ccc');
					$(this).tooltip('destroy');
					$(this).removeClass('error');
				}
			});
			
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
			});
			
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
			});
			
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
			
			$('#email').blur(function(){
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
			});
		});
		
		
		function checkAll() {
			if ($('#intro, #nickname, #password, #email, #mobile').is('.error')) {
				$('#intro, #nickname, #password, #email, #mobile')
					.filter('.error')
					.css('border', '1px solid red')
					.tooltip({title:'请完善此项内容！',trigger:'hover focus'});
			} else {
				$('#confirm').modal('show');
			}
		}
	</script>
</head>
<body>
	<nav class="navbar navbar-default" role="navigation" style="margin-bottom: 0px;"></nav>
	
	<div class="container">
		<div class="row">
			<div class="col-xl-6 col-md-6 col-md-offset-3">
				<form action="info" method="post" id="info">
					<h2>完善我的信息</h2><hr/>
					
					<div class="form-group" style="margin-top: 3%">
						<p>简介</p>
						<input type="text" value="${user.intro} " name="intro" id="intro">
					</div>
					<div class="form-group">
						<p>昵称</p>
						<input type="text" value="${user.nickName}" name="nickName" id="nickname">
					</div>
					<div class="form-group">
						<p>密码</p>
						<input type="password" value="${user.password}" name="password" id="password">
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
						<input name="email" value="${user.email }" type="email" id="email"/>
					</div>
					<div class="form-group">
						<p>手机</p>
						<input value="${ user.phoneNum}" name="phoneNum" type="text" id="mobile"/>
					</div>
				</form>
				<button class="btn btn-lg btn-primary btn-block" onclick="checkAll()">保存</button>  
			</div>
		</div>
	</div>

	<div class="modal fade" id="confirm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog" style="z-index: 10000 !important;">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
	        <h4 class="modal-title" id="myModalLabel">保存成功！</h4>
	      </div>
	      <div class="modal-footer btn-group">
	        <button class="btn btn-primary" onclick="$('#info').submit()">好的，去主页看看</button>
	      </div>
	    </div>
	  </div>
	</div>
</body>
</html>