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
	<%@ page language="java" import="com.service.MessageFilter, com.db.Dao, com.model.*, java.util.*" pageEncoding="UTF-8"%>
	<%
	User user = (User)session.getAttribute("user");
	Dao dao = new Dao();
	Vector<User> followings = new Vector<User>();
	for (int i : user.getFollowings()) {
		followings.add(dao.getUserBasis(i));
	}
	%>
	
	<%
	MessageFilter msgFlt = new MessageFilter();
	ArrayList<Message> messages = msgFlt.getMessagesOfType(user, 4);
	Vector<User> users = new Vector<User>();
	Vector<Quiz> quizzes = new Vector<Quiz>();
	for (int i = messages.size()-1; i >=0; --i) {
		Message msg = messages.get(i);
		users.add(dao.getUserBasis((int)msg.getFromid()));
		quizzes.add(dao.getQuizBasis(msg.getTmpId()));
	}
	
	MessageFilter msgFlt2 = new MessageFilter();
	ArrayList<Message> messages2 = msgFlt2.getMessagesOfType(user, 5);
	Vector<User> users2 = new Vector<User>();
	Vector<Quiz> quizzes2 = new Vector<Quiz>();
	Vector<group> groups = new Vector<group>();
	for (int i = messages2.size()-1; i >=0; --i) {
		Message msg = messages2.get(i);
		users2.add(dao.getUserBasis((int)msg.getFromid()));
		groups.add(dao.getGrpById(msg.getTmpId()));
		quizzes2.add(dao.getQuizBasis(Integer.parseInt(msg.getMsg())));
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
	
	//------------------------
	<%	for (int i=0; i<quizzes2.size(); ++i) {%>
	$('#groups-new').append(
	'<div class="panel panel-primary inform">\
		<div class="panel-heading">\
			<div class="panel-title">\
				<span class="no"></span><span>. </span>\
				<a class="userId"></a> 在<span class="date"></span> 创建了新的小组共有测试\
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
	$('#groups-new .no:last').text('<%=i+1%>');
	$('#groups-new .title:last').text('<%=quizzes2.elementAt(i).getTitle()%>');
	$('#groups-new .type:last').text('<%=quizzes2.elementAt(i).getType()%>');
	$('#groups-new .userId:last').attr('href','user?id='+'<%=users2.elementAt(i).getId()%>');
	$('#groups-new .userId:last').text('<%=users2.elementAt(i).getNickName()%>');
	$('#groups-new .date:last').text('<%=quizzes2.elementAt(i).getCreateDate()%>');
	$('#groups-new .msgId:last').val('<%=messages2.get(i).getId()%>');
	$('#groups-new .description:last').text('<%=quizzes2.elementAt(i).getDescription()%>');
	$('#groups-new .inform:last .quizId').attr('href','groupQuiz?id=' + '<%=quizzes2.elementAt(i).getId()%>');
	<%}%>
	
	//------------------------
	
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
		$(thisItem).parents('.inform').nextAll('.inform').each(function(){
			var preMark = $(this).find('.no').text();
			$(this).find('.no').text(String.fromCharCode(preMark.charCodeAt()-1));
		});
		$(thisItem).parents('.inform').remove();
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
				
				<ul class="nav nav-tabs" role="tablist">
				  <li role="presentation" class="active">
				  	<a style="font-size:22px; color:#337ab7;" href="#myQuiz" role="tab" data-toggle="tab">好友动态</a></li>
				  <li role="presentation"><a href="#groups-new" style="font-size:22px; color:#337ab7;" role="tab" data-toggle="tab">小组动态</a></li>
				</ul>
				
				<!-- Tab panes -->
				<div class="tab-content" style="margin-top:4%">
				  <div role="tabpanel" class="tab-pane active" id="myQuiz"></div>
				  <div role="tabpanel" class="tab-pane" id="groups-new"></div>
				</div>
				
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