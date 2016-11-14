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
	<title>DZY主页</title>
	<style type="text/css">
		body
		{
			background-color:white;
		}
		
		img{ 
			width:200px; 
			height:200px; 
			border-radius:190px; 
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
	Dao dao = new Dao();
	User owner = dao.getUser(Integer.parseInt(request.getParameter("id")));
	User user = (User)session.getAttribute("user");
	Vector<Quiz> quizzes = new Vector<Quiz>();
	for (int id : owner.getPublishedQuiz()) {
		quizzes.add(dao.getQuiz(id));
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
		if (user.getId() == owner.getId()) {%>
			$('#follow').css('display','none');
			$('#unfollow').css('display','none');
			$('#send').css('display','none');
		<%} else if (user.getFollowings().indexOf(owner.getId()) != -1){%>
			$('#follow').css('display','none');
		<%} else {%>
			$('#unfollow').css('display','none');
		<%}
	%>	
	});
	function follow() {
		$.post('follow',{id:'<%=owner.getId()%>'},function(data){
			alert('已关注！');
			$('#follow').css('display','none');
			$('#unfollow').css('display','');
		});
	}
	function unfollow() {
		$.post('unfollow',{id:'<%=owner.getId()%>'},function(data){
			alert('已取消关注！');
			$('#unfollow').css('display','none');
			$('#follow').css('display','');
		});
	}
	</script>
</head>
<body>
	<nav class="navbar navbar-default" role="navigation" style="margin-bottom: 0px;"></nav>
	<div class="container">
		<div class="row">
			<div class="col-6-xs">
				<div id="introduce">
					<img src="image/cat.jpg">
					<a style="font-size: 30px;"><%=owner.getNickName() %></a>
				</div>
			</div>
		</div>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-xs-3">
				<div class="data">
					<h5><%=owner.getIntro() %> </h5>
					<hr/>
					<h6>
						<span class="glyphicon glyphicon-envelope"></span>
						<span><%=owner.getEmail() %></span>
					</h6>
					<h6>
						<span class="glyphicon glyphicon-calendar"></span>
						<span><%=owner.getMemberSince() %></span>
					</h6>
					<div id="follow">
						 <button onclick="follow()" class="form-control btn-info" style="width:60%">关注</button>
					</div>
					<div id="unfollow">
						<button onclick="unfollow()" class="form-control btn-info" style="width:60%">取消关注</button>
					</div>
					<div id="send">
						<button data-toggle="modal" data-target="#myModal" class="form-control btn-warning" style="width:60%">发消息</button>
					</div>
				</div>
			</div>
			<div class="col-md-7 col-xs-9">
				<h5><a href="#"><%=owner.getGender().equals("M")?"他":owner.getGender().equals("F")?"她":"TA" %>的问卷</a></h5>
				<hr>
				<div id="myQuiz" style="cursor:pointer;"></div>
				
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="message" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog" style="z-index: 10000 !important;">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
	        <h4 class="modal-title" id="myModalLabel">发送消息</h4>
	      </div>
	      <div class="modal-body">
	        <div>
	        	<label for="toUser">收件人</label><input value="<%=owner.getId() %>" readonly type="text" id="toUser" class="form-control">
	        	<label for="title">标题</label><input type="text" id="title" class="form-control">
	        	<label for="content">内容</label><input style="width:40%; height:25%" type="text" id="content" class="form-control">
	        </div>
	      </div>
	      <div class="modal-footer">
	        <button onclick="send()" class="btn btn-primary" data-dismiss="modal">发送</button>
	      </div>
	    </div>
	  </div>
	</div>
	
</body>
</html>