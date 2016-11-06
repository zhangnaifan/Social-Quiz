<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<link href="//netdna.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet">
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<!--jQuery-->
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<title>个人主页</title>
	<style type="text/css">
		body
		{
			background-color:white;
		}
		.navbar .container-fluid{
  			position: relative;
		}
		.navbar-default {
			 background: black;
			 border-color: #e7e7e7;
		}
		.navbar-default .navbar-brand {
			color: #FFFFFF;
		}
		.btn-group {
			position: absolute;
		    right: 0;
		    top: 0;
		}
		#introduce *{
			display:inline-block;
			vertical-align:middle; /* 居中对齐， */ 
			font-size:14px;
			margin-top: 50px;
		}
		.dropbtn {
		    background-color: black;
		    color: white;
		    padding: 16px;
		    font-size: 16px;
		    border: none;
		    cursor: pointer;
		}
		
		.dropdown {
		    position: relative;
		    display: inline-block;
		}
		
		.dropdown-content {
		    display: none;
		    position: absolute;
		    background-color: #f9f9f9;
		    min-width: 160px;
		    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
		}
		
		.dropdown-content a {
		    color: black;
		    padding: 12px 16px;
		    text-decoration: none;
		    display: block;
		}
		
		.dropdown-content a:hover {background-color: #f1f1f1}
		
		.dropdown:hover .dropdown-content {
		    display: block;
		}
		.dropdown:hover .dropbtn {
		    background-color: black;
		}
		img{ 
			width:100px; 
			height:100px; 
			border-radius:50px; 
			display:inline;
		}
		。clear{
			clear:both;
		}
		#main{
			padding:10px 10px;
			margin:auto auto;
		}
		#main .container{
		    width:1300px;
		    float:left;
		    padding-left: 50px;
		}
		#main .container dl{
		    width:300px;
		    float:left;
		}
		#main .container dl h5{
		    border-bottom:1px solid #000;
		    margin-bottom:15px;
		    font-size:25px;
		}
		#main .container dl h5 a{
		    margin:0 auto;
		    text-decoration:none;
		}
		#main .container dl dt{
		    float:left;
		    width:150px;
		}
		#main .container dl.data{
		    margin-right:100px;
		}
		#main .container dl.data dd{
		    font-size:16px;
		    margin-left:25px;
		    float:left;
		    width:240px;
		    text-indent:2em;/*首行缩进*/
		}
		#main .container dl.quiz{
		    margin-right:60px;
		}
		#main .container  dl.quiz dd{
			width:500px;
		    height:22px;
		    background:none;
		}
		#main .container  dl.friendlist dd{
			font-size:16px;
		    margin-left:25px;
			width:200px;
		    height:22px;
		    background:none;
		}
		ul.fff {
			list-style-type:circle;
		}
		ul.fff a{
			text-decoration:none;
			font-size: 20px;
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
	%>
	
	
	<!-- js -->
	<script type="text/javascript">
	$(document).ready(function(){
	<%	for (int i=0; i<quizzes.size(); ++i) {%>
		$('#myQuiz').append(
		'<div class="quiz panel panel-success">\
			<div class="panel-heading">\
				<a><span class="panel-title no"></span>\
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
		$('a:last').attr('href','quiz.action?id='+'<%=quizzes.elementAt(i).getId()%>');
		<%}
	%>
		
	});
	
	</script>
</head>
<body>
	<nav class="navbar navbar-default" role="navigation" style="margin-bottom: 0px;">
		<div class="container-fluid">
	  		<div class="navbar-header">
	  			<button type="button" class="navbar-left navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
	  				<span class="sr-only">Toggle navigation</span>
	  				<span class="icon-bar"></span>
	  				<span class="icon-bar"></span>
	  				<span class="icon-bar"></span>
	  			</button>
	      		<a class="navbar-brand" href="#">Questionnaire</a>
	      		<form class="navbar-form navbar-right" role="search">
				<div class="form-group">
					<input type="text" class="grom-control" placeholder="Search">
				</div>
				<button type="submit" class="btn btn-default">search</button>
			</form>
	    	</div>
	    	<div class="collapse navbar-collapse">
	    		<div class="dropdown">
	    			<button class="dropbtn">我的问卷</button>
	    			<div class="dropdown-content">
	    				<a href="#">已创建的问卷</a>
						<a href="#">待回答的问卷</a>
					    <a href="#">已回答的问卷</a>
	    			</div>
	    		</div>
	    		<div class="dropdown">
	    			<button class="dropbtn">查看排行榜</button>
	    			<div class="dropdown-content">
	    				<a href="#">积分排行榜</a>
						<a href="#">问卷排行榜</a>
	    			</div>
	    		</div>
	    		<div class="dropdown">
	    			<button class="dropbtn">我的小组</button>
	    			<div class="dropdown-content">
	    				<a href="#">小组1</a>
						<a href="#">小组2</a>
	    			</div>
	    		</div>
	    		<div class="dropdown">
	    			<button class="dropbtn">我的好友</button>
	    			<div class="dropdown-content">
	    				<a href="#">好友1</a>
						<a href="#">好友2</a>
	    			</div>
	    		</div>
	    	</div>
	    	
		</div>
		
		<div class="btn-group pull-right">
			
			<button type="button" class="btn btn-default btn-lg navbar-btn dropdown-toggle" data-toggle="dropdown">
				<span class="glyphicon glyphicon-user">${user.nickName }</span>
			</button>
			<ul class="dropdown-menu" role="menu">
				<li><a href="#">my information</a></li>
				<li><a href="#">my message</a></li>
				<li><a href="#">my friends</a></li>
				<li class="divider"></li>
				<li><a href=home>exit</a></li>
			</ul>
		</div>
	</nav>
	<div class="container">
		<div class="row">
			<div class="col-6-xs">
				<div id="introduce">
					<img src="image/cat.jpg">
					<a style="font-size: 30px;">${user.nickName }</a>
				</div>
			</div>
		</div>
	</div>
	<div id="main" class="clear">
		<div class="container">
			<div>
				<dl class="data">
					<h5><a href="#">关于我</a></h5>
					<dd>来自HIT，天道酬勤，按实际还不成熟爆粗口加白醋以撒成绩看不出口技刷卡好烦 </dd>
				</dl>
				<dl class="quiz" style="width: 500px;">
					<h5><a href="#">待回答的问卷</a></h5>
					<dd>
						<div id="myQuiz" style="cursor:pointer;"></div>
					</dd>
				</dl>
				<dl style="width:200px;">
					<h5><a href="#">好友列表</a></h5>
					<dd>
						<ul class="fff">
							<li><a href=toUserHP>DZY-HP</a></li>
							<li><a href="quiz?id=1">DZY</a></li>
			                <li><a href="quiz?id=2">000</a></li>
			                <li><a href="quiz?id=3">text</a></li>
			                <li><a href="quiz?id=4">who</a></li>
						</ul>
					</dd>
				</dl>
			</div>
		</div>
		
	</div>
	
	
	
</body>
</html>