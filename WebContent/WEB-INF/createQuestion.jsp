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
</head>
<body>

<div class="btn-toolbar" role="toolbar">
		<button type="button" class="btn btn-default">返回</button>
</div>
<div class="btn-group-vertical">
	<button type="button" class="btn btn-default">常用题型</button>
	<button type="button" class="btn btn-default">单选题</button>
	<button type="button" class="btn btn-default">多选题</button>
	<button type="button" class="btn btn-default">填空题</button>
	<button type="button" class="btn btn-default">问答题</button>
</div>
<div class="btn-group">
	<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
		试题类型
		<span class="caret"></span>
	</button>
	<ul class="dropdown-menu">
		<li><a href="#">问卷</a></li>
		<li><a href="#">测试</a></li>
	</ul>
</div>
<div class="btn-group">
	<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
		内容方面
		<span class="caret"></span>
	</button>
	<ul class="dropdown-menu">
		<li><a href="#">星座</a></li>
		<li><a href="#">IT</a></li>
		<li><a href="#">男生</a></li>
		<li><a href="#">女生</a></li>
		<li><a href="#">XXX</a></li>
	</ul>
</div>
</body>
</html>


