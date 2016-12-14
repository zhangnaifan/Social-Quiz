<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<link href="//netdna.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet">
	<link href="css/navbar.css" rel="stylesheet" type="text/css" />
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<!--jQuery-->
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<title>创建群</title>
	<style type="text/css">
		.input{
			width : 100%;
			border-color: #000;
			border-width: 2px;
			border-style: solid;
		}
		.col-center-block {
			float:none;
			display:block;
			margin-left: auto;
			margin-right: auto;
			margin-top: 10%;
		}
		h2 {
			margin-top:20px;
			margin-bottom:20px;
		}
	</style>
	
	<!-- js -->
	<script type="text/javascript">
	$(document).ready(function(){
		$('nav').load('HTML/nav.html');
	});
	</script>
</head>
<body>
	<nav class="navbar navbar-default" role="navigation" style="margin-bottom: 0px;"></nav>
	<div class="container">
		<div class="row">
			<div class="col-xl-6 col-md-4 col-center-block">
				<form action="createGroup" method="post">
					<h2>创建群</h2>
					
					<div class="form-group">
						<p>群名称</p>

						<input required oninvalid="this.setCustomValidity(this.willValidate?'':'只能包含中文、数字、英文字母，且长度不超过10个汉字或20个字符.');" type="text" class="form-control" placeholder="给群一个响亮的名字" name="groupname" pattern="^[\u4e00-\u9fa5_a-zA-Z0-9]{1,20}$">
					</div>
					<div class="form-group">
						<p>群描述</p>
						<input required oninvalid="this.setCustomValidity(this.willValidate?'':'只能包含中文、数字、英文字母，且长度不超过50个汉字或100个字符.');" type="text" class="form-control" placeholder="一句话介绍你的群" name="info" pattern="^[\u4e00-\u9fa5_a-zA-Z0-9]{1,100}$">
					</div>
					<div class="form-group">
						<p>群标签</p>
						<input required oninvalid="this.setCustomValidity(this.willValidate?'':'只能包含中文、数字、英文字母，且长度不超过10个汉字或20个字符.');" type="text" class="form-control" placeholder="给群一个标签吧" name="tag" pattern="^[\u4e00-\u9fa5_a-zA-Z0-9]{1,20}$">

					</div>
					<button class="btn btn-lg btn-primary btn-block" type="submit">创建</button>  
				</form>
			</div>
		</div>
	</div>

</body>
</html>