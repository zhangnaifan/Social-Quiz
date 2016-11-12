<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	
	<title>我的消息</title>
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
			margin-top: 8%;
		}
		.box {
			-moz-box-sizing:border-box; /* Firefox */
			width:40%;
			float:left;
		}
		img{ 
			width:100px; 
			height:100px; 
			border-radius:50px; 
			display:inline;
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
				<div class="box">
					<img src="image/cat.jpg">
				</div>
				<div class="box">
					<h2>${user.username } </h2>
					<p class="lead" style="padding-left: 15%;">${user.nickName }</p>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-xl-6 col-md-6 col-center-block" style="margin-top:3%;">
				<table class="table table-hover">
						<caption style="color:black;font-size:26px;padding-bottom: 10%;">我的消息</caption>
						<thead>
							<tr>
								<th>消息来源</th>
								<th>消息去向</th>
								<th>消息内容</th>
								<th>消息类型</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<s:iterator value="msgs" var="li">
								<tr>
									<td><s:property value="#li.fromUser.username" /></td>
									<td><s:property value="#li.toid" /></td>
									<td><s:property value="#li.msg" /></td>
									<td><s:property value="#li.type" /></td>
									<td><a
										href='processRegisterGroup?msgId=<s:property value="#li.id"/>&accept=true'>
											接受 </a> <a
										href='processRegisterGroup?msgId=<s:property value="#li.id"/>&accept=false'>
											拒绝 </a></td>
								</tr>
							</s:iterator>
						</tbody>
				</table>
				
			</div>
		</div>
	</div>
	

</body>
</html>