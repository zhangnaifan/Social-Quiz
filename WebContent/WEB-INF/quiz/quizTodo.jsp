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
<%@ page language="java" import="com.db.Dao, com.model.*, com.service.MessageFilter, java.util.*" pageEncoding="UTF-8"%>
<%
	Dao dao = new Dao();
	User user = (User)request.getSession().getAttribute("user");
	MessageFilter msgFlt = new MessageFilter();
	ArrayList<Message> messages = msgFlt.getMessagesOfType(user, 4);
	Vector<User> users = new Vector<User>();
	Vector<Quiz> quizzes = new Vector<Quiz>();
	for (Message msg : messages) {
		users.add(dao.getUserBasis((int)msg.getFromid()));
		quizzes.add(dao.getQuizBasis(msg.getTmpId()));
	}
%>


<!-- js -->
<script type="text/javascript">
$(document).ready(function(){
	$('nav').load('HTML/nav.html');
	
<%	for (int i=0; i<quizzes.size(); ++i) {%>
	$('#myQuiz').append(
	'<div class="panel panel-primary inform">\
		<div class="panel-heading">\
			<div class="panel-title">\
				<span class="no"></span><span>. </span>\
				<a class="userId"></a> 在<span class="date"></span> 创建了新的测试\
				<span style="float:right">\
					<a class="quizId" style="color:white">去看看！</a>\
					<span class="glyphicon glyphicon-remove" onclick="popMsg(this)">\
						<input class="msgId" type="text" style="display:none">\
					</span>\
				</span>\
			</div>\
		</div>\
		<div class="panel-body">\
			<div class="quiz panel panel-success">\
				<div class="panel-heading">\
					<a class="quizId"><span class="panel-title title"></span></a>\
					<span class="label label-success type" style="margin-left: 3%"></span>\
				</div>\
				<div class="panel-body">\
					<p class="description" style="color:gray"></p>\
				</div>\
			</div>\
		</div>\
	</div>');
	$('.no:last').text('<%=i+1%>');
	$('.title:last').text('<%=quizzes.elementAt(i).getTitle()%>');
	$('.type:last').text('<%=quizzes.elementAt(i).getType()%>');
	$('.userId:last').attr('href','user?id='+'<%=users.elementAt(i).getId()%>');
	$('.userId:last').text('<%=users.elementAt(i).getNickName()%>');
	$('.date:last').text('<%=quizzes.elementAt(i).getCreateDate()%>');
	$('.msgId:last').val('<%=messages.get(i).getId()%>');
	$('.description:last').text('<%=quizzes.elementAt(i).getDescription()%>');
	$('.inform:last .quizId').attr('href','quiz?id=' + '<%=quizzes.elementAt(i).getId()%>');
	<%}%>
	
	function popMsg(thisItem) {
		var msgId = $(thisItem).parents('.inform')
								.find('.msgId')
								.first()
								.val();
		$.post('processRegisterGroup',
				{
					msgId : msgId,
					accept : 'false'
				});
		$(thisItem).parents('.inform').remove();
	}
	
});

</script>

</head>
<body>
	<nav class="navbar navbar-default" role="navigation"></nav>
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-md-offset-2 col-xs-10 col-xs-offset-1">
				<h2 style="margin-bottom:4%;">未完成的测试</h2>
				<div id="myQuiz"></div>
			</div>
		</div>
	</div>

</body>
</html>