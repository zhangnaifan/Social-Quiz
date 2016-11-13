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
	Vector<User> users = (Vector<User>)session.getAttribute("users");
	Vector<Quiz> quizzes = (Vector<Quiz>)session.getAttribute("quizzes");
	Vector<group> groups = (Vector<group>)session.getAttribute("groups");
%>


<!-- js -->
<script type="text/javascript">
$(document).ready(function(){
	$('nav').load('HTML/nav.html');
	
	<%if (!users.isEmpty()) {%>
		$('#user').append('<h4>用户有：</h4>')
	<%}%>
	<%for (int i=0; i<users.size(); ++i) {%>
	$('#user').append(
	'<div class="quiz panel panel-warning">\
		<div class="panel-heading">\
			<a><span class="panel-title no"></span><span>. </span>\
			<span class="panel-title nickname"></span></a>\
			<span class="email" style="margin-left: 3%"></span>\
			<span style="float: right;">\
			<span class="panel-title">加入时间:</span>\
			<span class="panel-title membersince"></span>\
			</span>\
		</div>\
		<div class="panel-body">\
			<p class="intro" style="color:gray"></p>\
		</div>\
	</div>');
	$('.no:last').text('<%=i+1%>');
	$('.nickname:last').text('<%=users.elementAt(i).getNickName()%>');
	$('.email:last').text('<%=users.elementAt(i).getEmail()%>');
	$('.membersince:last').text('<%=users.elementAt(i).getMemberSince()%>');
	$('.intro:last').text('<%=users.elementAt(i).getIntro()%>');
	$('a:last').attr('href','user?id='+'<%=users.elementAt(i).getId()%>');
	<%}%>
	<%if (!users.isEmpty()) {%>
		$('#user').append('<hr>');
	<%}%>
	
	<%if (!quizzes.isEmpty()) {%>
		$('#quiz').append('<h4>测试有：</h4>')
	<%}%>
	<%for (int i=0; i<quizzes.size(); ++i) {%>
	$('#quiz').append(
	'<div class="quiz panel panel-success">\
		<div class="panel-heading">\
			<a><span class="panel-title no"></span><span>. </span>\
			<span class="panel-title title"></span></a>\
			<span class="label label-success type" style="margin-left: 3%"></span>\
			<span class="panel-title createDate" style="float: right"></span>\
		</div>\
		<div class="panel-body">\
			<p class="description" style="color:gray"></p>\
		</div>\
	</div>');
	$('.no:last').text('<%=i+1%>');
	$('.title:last').text('<%=quizzes.elementAt(i).getTitle()%>');
	$('.type:last').text('<%=quizzes.elementAt(i).getType()%>');
	$('.createDate:last').text('<%=quizzes.elementAt(i).getType()%>');
	$('.description:last').text('<%=quizzes.elementAt(i).getDescription()%>');
	$('a:last').attr('href','quiz?id='+'<%=quizzes.elementAt(i).getId()%>');
	<%}
	if (!quizzes.isEmpty()){%>
		$('#quiz').append('<hr>');
	<%}%>
	
	<%if (!groups.isEmpty()) {%>
		$('#group').append('<h4>群有：</h4>')
	<%}%>
	<%for (int i=0; i<groups.size(); ++i) {%>
		$('#group').append(
			'<div class="panel panel-info">\
				<div class="panel-heading">\
					<span class="panel-title" style="font-size:20px">\
						<a class="groupname"></a>\
					</span>\
					<span style="margin-left: 3%">(<span class="groupid"></span>)</span>\
					<span style="float: right;">\
					<span class="panel-title">成员总数:</span>\
					<span class="panel-title"><span class="tot"></span></span>\
					</span>\
				</div>\
			</div>');
		$('.groupname:last').text('<%=groups.elementAt(i).getGroupName()%>');
		$('.groupid:last').text('<%=groups.elementAt(i).getGroupId()%>');
		$('.tot:last').text('<%=groups.elementAt(i).getTotMembers()%>');
		$('.groupname:last').attr('href','groupInfo?groupId='+'<%=groups.elementAt(i).getGroupId()%>');
	<%}%>
	
	<%if (users.isEmpty() && groups.isEmpty() && quizzes.isEmpty()) {%>
		$('#user').append('<h4>很遗憾，没有搜索到任何结果。</h4>');
	<%}%>
	
});

</script>

</head>
<body>
	<nav class="navbar navbar-default" role="navigation"></nav>
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-md-offset-2 col-xs-10 col-xs-offset-1">
				<h2 style="margin-bottom:4%;">搜索结果</h2>
				<div id="user"></div>
				<div id="quiz"></div>
				<div id="group"></div>
			</div>
		</div>
	</div>

</body>
</html>