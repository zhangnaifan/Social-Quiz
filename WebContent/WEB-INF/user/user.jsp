<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!--jQuery-->
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<!--bootstrap-->
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<link href="css/navbar.css" rel="stylesheet" type="text/css" />
	<script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>
	<script src="http://cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<title>主页</title>
	<style type="text/css">
		body
		{
			background-color:white;
		}
		
		img{ 
			width:150px; 
			height:150px; 
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
		quizzes.add(dao.getQuizBasis(id));
	}
	Vector<Quiz> quizDone = new Vector<Quiz>();
	for (int id : owner.getQuizDone()) {
		quizDone.add(dao.getQuizBasis(id));
	}
	Vector<User> followers = new Vector<User>();
	for (int id : owner.getFollowers()) {
		followers.add(dao.getUserBasis(id));
	}
	Vector<User> followings = new Vector<User>();
	for (int id : owner.getFollowings()) {
		followings.add(dao.getUserBasis(id));
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
		$('a:last').attr('href','quiz?id='+'<%=quizzes.elementAt(i).getId()%>');
	<%}%>
	
	<%	for (int i=0; i<followings.size(); ++i) {%>
	$('#followings').append(
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
	$('#followings .no:last').text('<%=i+1%>');
	$('#followings .nickname:last').text('<%=followings.elementAt(i).getNickName()%>');
	$('#followings .email:last').text('<%=followings.elementAt(i).getEmail()%>');
	$('#followings .membersince:last').text('<%=followings.elementAt(i).getMemberSince()%>');
	$('#followings .intro:last').text('<%=followings.elementAt(i).getIntro()%>');
	$('#followings a:last').attr('href','user?id='+'<%=followings.elementAt(i).getId()%>');
	<%}%>
	
	<%	for (int i=0; i<followers.size(); ++i) {%>
	$('#followers').append(
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
	$('#followers .no:last').text('<%=i+1%>');
	$('#followers .nickname:last').text('<%=followers.elementAt(i).getNickName()%>');
	$('#followers .email:last').text('<%=followers.elementAt(i).getEmail()%>');
	$('#followers .membersince:last').text('<%=followers.elementAt(i).getMemberSince()%>');
	$('#followers .intro:last').text('<%=followers.elementAt(i).getIntro()%>');
	$('#followers a:last').attr('href','user?id='+'<%=followers.elementAt(i).getId()%>');
	<%}%>
	
	<%	for (int i=0; i<quizDone.size(); ++i) {%>
	$('#quizDone').append(
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
	$('#quizDone .no:last').text('<%=i+1%>');
	$('#quizDone .title:last').text('<%=quizDone.elementAt(i).getTitle()%>');
	$('#quizDone .type:last').text('<%=quizDone.elementAt(i).getType()%>');
	$('#quizDone .description:last').text('<%=quizDone.elementAt(i).getDescription()%>');
	$('#quizDone a:last').attr('href','quiz?id='+'<%=quizDone.elementAt(i).getId()%>');
	<%}
%>
	
		<%if (user.getId() == owner.getId()) {%>
			$('#follow').css('display','none');
			$('#unfollow').css('display','none');
			$('#sendMsg').css('display','none');
		<%} else if (user.getFollowings().indexOf(owner.getId()) != -1){%>
			$('#follow').css('display','none');
		<%} else {%>
			$('#unfollow').css('display','none');
		<%}
	%>	
	});
	function follow() {
		$.post('follow',{id:'<%=owner.getId()%>'},function(data){
			$('#confirm #myModalLabel').text('已关注！');
			$('#confirm').modal({show:true});
			$('#follow').css('display','none');
			$('#unfollow').css('display','');
		});
	}
	function unfollow() {
		$.post('unfollow',{id:'<%=owner.getId()%>'},function(data){
			$('#confirm #myModalLabel').text('已取消关注！');
			$('#confirm').modal({show:true});
			$('#unfollow').css('display','none');
			$('#follow').css('display','');
		});
	}
	
	function popSend() {
		$('#footer').append('<button id="send-btn" onclick="send()" class="btn btn-primary">发送</button>');
		$('#success').remove();
		$('#message #content').removeAttr('readonly').val('');
		$('#message').modal({show:true});
	}
	
	function send() {
		var fromid = '<%=user.getId()%>';
		var toid = '<%=owner.getId()%>';
		var msg = $('#message #content').val();
		$.post('sendMessage',
				{
					fromid : fromid,
					toid : toid,
					msg : msg,
					type : 3
				});
		$('#message #content').attr('readonly','readonly');
		$('#send-btn').remove();
		$('#footer').append('<em id="success">您的消息已发送！</em>');
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
	<%String ta = owner.getGender().equals("M")?"他":owner.getGender().equals("F")?"她":"TA"; %>
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-xs-3">
				<div class="data">
					<h5><a>关于<%=ta %></a></h5>
					<hr/>
					<h5><%=owner.getIntro() %> </h5>
					<h6>
						<span class="glyphicon glyphicon-envelope"></span>
						<span><%=owner.getEmail() %></span>
					</h6>
					<h6>
						<span class="glyphicon glyphicon-calendar"></span>
						<span><%=owner.getMemberSince() %></span>
					</h6>
					<div id="follow">
						 <button onclick="follow()" class="form-control btn-info" style="width:60%">关注<%=ta %></button>
					</div>
					<div id="unfollow">
						<button onclick="unfollow()" class="form-control btn-info" style="width:60%">取消关注</button>
					</div>
					<div id="sendMsg" style="margin-top:3%">
						<button onclick="popSend()" class="form-control btn-warning" style="width:60%">发消息</button>
					</div>
				</div>
			</div>
			<div class="col-md-7 col-xs-9">
				<%-- <h5><a><%=owner.getGender().equals("M")?"他":owner.getGender().equals("F")?"她":"TA" %>的测试</a></h5>
				<hr>
				<div id="myQuiz" style="cursor:pointer;"></div> --%>
				
				<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist">
				  <li role="presentation" class="active">
				  	<a style="font-size:22px; color:#337ab7;" href="#myQuiz" role="tab" data-toggle="tab"><%=ta %>的测试</a></li>
				  <li role="presentation"><a href="#quizDone" style="font-size:22px; color:#337ab7;" role="tab" data-toggle="tab">做过的测试</a></li>
				  <li role="presentation"><a href="#followings" style="font-size:22px; color:#337ab7;" role="tab" data-toggle="tab"><%=ta %>的关注</a></li>
				  <li role="presentation"><a href="#followers" style="font-size:22px; color:#337ab7;" role="tab" data-toggle="tab">关注<%=ta %>的</a></li>
				</ul>
				
				<!-- Tab panes -->
				<div class="tab-content" style="margin-top:4%">
				  <div role="tabpanel" class="tab-pane active" id="myQuiz"></div>
				  <div role="tabpanel" class="tab-pane" id="quizDone"></div>
				  <div role="tabpanel" class="tab-pane" id="followings"></div>
				  <div role="tabpanel" class="tab-pane" id="followers"></div>
				</div>
				
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
	        	<label for="toUser">收件人</label><input value="<%=owner.getNickName() %>" readonly type="text" id="toUser" class="form-control">
	        	<label for="content">内容</label><textarea rows="8" id="content" class="form-control"></textarea>
	        </div>
	      </div>
	      <div class="modal-footer" id="footer"></div>
	    </div>
	  </div>
	</div>
	
	<div class="modal fade" id="confirm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog" style="z-index: 10000 !important;">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
	        <h4 class="modal-title" id="myModalLabel"></h4>
	      </div>
	      <div class="modal-footer btn-group">
	        <button class="btn btn-primary" data-dismiss="modal">好的，知道了</button>
	      </div>
	    </div>
	  </div>
	</div>
</body>
</html>