<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<title>我的测试</title>
<!--jQuery-->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!--bootstrap-->
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.4/css/bootstrap.min.css">
<script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<link href="css/navbar.css" rel="stylesheet" type="text/css" />
<%-- java --%>
<%@ page language="java" import="com.db.Dao, com.model.*, java.util.*" pageEncoding="UTF-8"%>
<%
	User user = (User)session.getAttribute("user");
	Vector<Quiz> quizzes = new Vector<Quiz>();
	Dao dao = new Dao();
	for (int id : user.getQuizDone()) {
		quizzes.add(dao.getQuiz(id));
	}
%>


<!-- js -->
<script type="text/javascript">
$(document).ready(function(){
	$('nav').load('HTML/nav.html');
	
	<%	if (quizzes.isEmpty()) {%>
	$('#myQuiz').append('<div class="alert alert-warning" role="alert">您暂时还没有做过测试哦！去\
			<b><a href=myFollowing>看看好友</a></b>或者<b>点击左上角搜搜看</b>吧！</div>');
	<%}%>

	
<%	for (int i=0; i<quizzes.size(); ++i) {%>
	$('#myQuiz').append(
	'<div class="quiz panel panel-success">\
		<div class="panel-heading">\
			<a><span class="panel-title no"></span><span>. </span>\
			<span class="panel-title title"></span></a>\
			<span class="label label-success type" style="margin-left: 3%"></span>\
			<span class="panel-title" style="float: right;">\
				创建日期：<span class="createDate"></span>\
			</span>\
		</div>\
		<div class="panel-body">\
			<p class="description" style="color:gray"></p>\
		</div>\
	</div>');
	$('.no:last').text('<%=i+1%>');
	$('.title:last').text('<%=quizzes.elementAt(i).getTitle()%>');
	$('.type:last').text('<%=quizzes.elementAt(i).getType()%>');
	$('.description:last').text('<%=quizzes.elementAt(i).getDescription()%>');
	$('.createDate:last').text('<%=quizzes.elementAt(i).getCreateDate()%>');
	$('a:last').attr('href','quiz?id='+'<%=quizzes.elementAt(i).getId()%>');
	<%}
%>
	
});

</script>

</head>
<body>
	<nav class="navbar navbar-default" role="navigation"></nav>
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-md-offset-2 col-xs-10 col-xs-offset-1">
				<h2 style="margin-bottom:4%;">我的测试</h2>
				<div id="myQuiz"></div>
			</div>
		</div>
	</div>

</body>
</html>