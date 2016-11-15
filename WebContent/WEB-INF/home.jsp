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
	<title>个人主页</title>
	<style type="text/css">
		img{ 
			width:100px; 
			height:100px; 
			border-radius:50px; 
			display:inline;
		}
		.clear{
			clear:both;
		}
		
		ul.fff {
			list-style-type:circle;
		}
		ul.fff a{
			text-decoration:none;
			font-size: 20px;
		}
		dl {
			float:left;
		}
		h5{
		    margin-bottom:15px;
		    font-size:25px;
		}
		dl h5 a{
		    margin:0 auto;
		    text-decoration:none;
		}
		
		dl.data dd{
		    font-size:16px;
		    float:left;
		    text-indent:2em;/*首行缩进*/
		}
	</style>
	
	<%-- java --%>
	<%@ page language="java" import="com.db.Dao, com.model.*, java.util.*" pageEncoding="UTF-8"%>
	<%
	User user = (User)request.getSession().getAttribute("user");
	Vector<Quiz> quizzes = new Vector<Quiz>();
	Dao dao = new Dao();
	for (int id : user.getPublishedQuiz()) {
		quizzes.add(dao.getQuiz(id));
	}
	Vector<User> followings = new Vector<User>();
	for (int i : user.getFollowings()) {
		followings.add(dao.getUserBasis(i));
	}
	%>
	
<!-- js -->
<script type="text/javascript">
$(document).ready(function(){
	$('nav').load('HTML/nav.html');
	
<%	for (int i=0; i<quizzes.size(); ++i) {%>
	$('#myQuiz').append(
	'<div class="quiz panel panel-success">\
		<div class="panel-heading">\
			<a><span class="panel-title no"></span><span>. </span>\
			<span class="panel-title title"></span></a>\
			<span class="label label-success type" style="margin-left: 3%"></span>\
			<span class="panel-title times" style="float: right;"></span>\
		</div>\
		<div class="panel-body">\
			<p class="description" style="color:gray"></p>\
		</div>\
	</div>');
	$('.no:last').text('<%=i+1%>');
	$('.title:last').text('<%=quizzes.elementAt(i).getTitle()%>');
	$('.type:last').text('<%=quizzes.elementAt(i).getType()%>');
	$('.description:last').text('<%=quizzes.elementAt(i).getDescription()%>');
	$('#myQuiz a:last').attr('href','quiz?id='+'<%=quizzes.elementAt(i).getId()%>');
	<%}
%>
<%	for (int i=0; i<followings.size(); ++i) {%>
		$('#myFollowings').append(
			'<li class="list-group-item list-group-item-warning">\
			    <span class="badge"></span>\
			    <a class="following"><span class="nickname"></span></a>\
			 </li>');
		$('#myFollowings .following:last').attr('href','user?id='+'<%=followings.elementAt(i).getId()%>');
		$('#myFollowings .nickname:last').text('<%=followings.elementAt(i).getNickName()%>');
<%	}%>	
});

	
	</script>
</head>
<body>
	<nav class="navbar navbar-default" role="navigation" style="margin-bottom: 0px;"></nav>
	
	<div class="container">
		<div class="row">
			<div class="col-6-xs">
				<div id="introduce">
					<img src="image/cat.jpg">
					<a href="user?id=${user.id }" style="font-size: 30px;">${user.nickName }</a>
				</div>
			</div>
		</div>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="col-md-3 col-xs-2">
				<div class="data">
					<h5><a href=toInfo>关于我</a></h5>
					<hr/>
					<h5><%=user.getIntro() %> </h5>
					<h6>
						<span class="glyphicon glyphicon-envelope"></span>
						<span><%=user.getEmail() %></span>
					</h6>
					<h6>
						<span class="glyphicon glyphicon-calendar"></span>
						<span><%=user.getMemberSince() %></span>
					</h6>
				</div>
			</div>
			<div class="col-md-6 col-xs-8">
				<h5><a>最新动态</a></h5>
				<hr>
				<div id="myQuiz" style="cursor:pointer;"></div>
				
			</div>
			<div class="col-md-3 col-xs-2">
				<h5><a href=myFollowing>关注列表</a></h5>
				<hr>
				<ul id="myFollowings" class="list-group">
				</ul>
			</div>
		</div>
	</div>

	
	
</body>
</html>