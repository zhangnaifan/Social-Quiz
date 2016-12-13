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
	<script type="text/javascript">
		function check() {
			var regexp = new RegExp("^[_a-zA-Z0-9]{4,20}$");
			if (!regexp.test($('#username').val())) {
				alert('用户名长度4-20，只能包含英文数字下划线！');
				return;
			}
			$('#login').submit();
		}
	</script>
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
					<h1><strong>Staples</strong></h1>
					<div class="description">
						<p style="color:white">你的专属社交问答平台</p>
					</div>
				</div>
			</div>
			
			<div class="row" >
				<div class="col-sm-6 col-md-offset-3 form-box" >
					<div class="form-top">
						<div class="form-top-left">
							<h3>登录</h3>
						<p style="color:#555">请输入用户名和密码：</p>
						</div>
						<div class="form-top-right">
							<i class="fa fa-key"></i>
						</div>
					</div>
					<div class="form-bottom">
						<form id="login" action="logIn" method="post" class="login-form" role="form" style="width:100%;">
							<div class="form-group">
								<input type="text" class="form-control" placeholder="用户名" name="username" id="username">
							</div>
							<div class="form-group">
								<input type="password" class="form-control" placeholder="密码" name="password" id="password">
							</div>
						</form>
						<button class="btn btn-lg btn-success btn-block" onclick="check()">登录</button>
	
						<a href=toSignUp style="float:right">注册</a>
						
						<div class="bdsharebuttonbox"><a href="#" class="bds_more" data-cmd="more"></a><a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a><a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a><a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a></div>
<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"Staples——你的专属社交问答平台\nRaise your questions, answer your interests","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"24"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
					</div>
				</div>
			</div>
			
		</div>
	

	
</body>
</html>