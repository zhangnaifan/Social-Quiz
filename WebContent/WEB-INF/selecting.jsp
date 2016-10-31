<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"> 
	<title>创建问卷</title>
	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<style type="text/css">
		body{
		  padding-top: 50px;
		}
	</style>
</head>
<body>
<div class="container">
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
		<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">返回</a>
		</div>
		<div>
			<ul class="nav nav-pills">
			<li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#">
					问卷库<span class="caret"></span>
				</a>	
				<ul class="dropdown-menu">
					<li><a href="#">问卷库</a>
					<li class="divider"></li>
					<li><a href="#">问卷库</a></li>
				</ul>
			</li>
			<li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#">
					查看积分排行榜<span class="caret"></span>
				</a>	
				<ul class="dropdown-menu">
					<li><a href="#">排行榜</a>
					<li class="divider"></li>
					<li><a href="#">排行榜</a></li>
				</ul>
			</li>
			<li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#">
					推荐陌生用户<span class="caret"></span>
				</a>	
				<ul class="dropdown-menu">
					<li><a href="#">用户1</a>
					<li class="divider"></li>
					<li><a href="#">用户2</a></li>
				</ul>
			</li>
		</ul>
		</div>
		</div>
	</nav>
	
	<form role="form">
		<div class="form-group">
			<label for="name">问卷名称</label>
			<input type="text" class="form-control" id="name" placeholder="请输入你要创建的问卷名称">
		</div>
		<div class="form-group">
			<label for="name">请选择你要创建的试题类型</label>
			<select class="form-control">
				<option>问卷</option>
				<option>测试</option>
			</select>
		</div>
		<div class="form-group">
			<label for="name">请选择你要创建的问卷类型</label>
			<select class="form-control">
				<option>星座</option>
				<option>IT</option>
				<option>男生</option>
				<option>女生</option>
				<option>情感</option>
				<option>XX</option>
			</select>
		</div>
	</form>
	<form action="createQuestion" method="post">
		<input type="submit" value="确认"/>
	</form>
</div>


</body>
</html>





