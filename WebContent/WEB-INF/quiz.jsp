<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>Quiz</title>
<!--jQuery-->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!--bootstrap-->
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.4/css/bootstrap.min.css">
<script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<%-- java --%>
<%@ page language="java" import="com.db.Dao, com.model.*, java.util.*" pageEncoding="UTF-8"%>
<% 
	Dao dao = new Dao();
	Quiz quiz = dao.getQuiz(Integer.parseInt(request.getParameter("id")));
	String ownerName = dao.getUser(quiz.getOwnerID()).getNickName();
	Vector<Question> questions = new Vector<Question>();
	for (int i : quiz.getQuestions()) {
		questions.add(dao.getQuestion(i));
	}
%>
<!-- javascript -->
<script type="text/javascript">
$(document).ready(function(){
$('#title').text('<%=quiz.getTitle()%>');
$('#owner').text('<%=ownerName%>');
$('#type').text('<%=quiz.getType()%>');
$('#description').text('<%=quiz.getDescription()%>');
<%! int no = 1; int mark = 'A';%>
<%! Vector<String> options = new Vector<String>();%>
<% 	for (Question ques:questions) {
		switch (ques.getType()) {
		case 'S':%>
		$('#quiz').append(
	'<div class="panel panel-success">\
		<div class="panel-heading">\
			<span class="panel-title no">'+ '<%=no%>' +'</span><span class="panel-title content">. '+ '<%=ques.getContent()%>' +'</span>\
			<span class="label label-success tag" style="margin-left: 3%">'+ '<%=ques.getTag()%>' +'</span>\
		</div>\
		<div class="panel-body">\
			<input type="text" class="form-control answer"/>\
		</div>\
	</div>');
		<%
			break;
		case 'M':
		//initial mark, options
		mark = 'A';
		options.clear();
		//generate options
		String[] optStr = ques.getAnswer().split("~", -1);
		for (int i=1; i<optStr.length; ++i) {
			String[] inside = optStr[i].split("\\^", -1); 
			options.add(inside[1]);
		}
		%>
		$('#quiz').append(
	'<div class="panel panel-info">\
		<div class="panel-heading no">\
			<span class="panel-title no">'+ '<%=no%>' +'</span><span class="panel-title content">. '+ '<%=ques.getContent()%>' +'</span>\
			<span class="label label-info tag" style="margin-left: 3%">'+ '<%=ques.getTag()%>' +'</span>\
		</div>\
		<div class="panel-body">\
			<select class="form-control answer">'
			<%for (int i=0; i<options.size(); ++i) {%>
				+'<option>'+'<%=options.elementAt(i)%>'+'</option>'
			<%}%>
			+'</select>\
		</div>\
	</div>');
		<%
			break;
		default:%>
		$('#quiz').append(
	'<div class="panel panel-warning">\
		<div class="panel-heading">\
			<span class="panel-title no">'+ '<%=no%>' +'</span><span class="panel-title content">. ' + '<%=ques.getContent()%>' +'</span>\
			<span class="label label-warning tag" style="margin-left: 3%">'+ '<%=ques.getTag()%>' + '</span>\
			<span class="panel-title answer"><input type="checkbox" style="float: right; width: 18px; height: 18px"></span>\
		</div>\
	</div>');
		<%	
		}
		no++;
	}
	no=1;
%>
});
</script>

</head>
<body>

<div class="container">
<div class="row">
<div class="col-md-8 col-md-offset-2 col-xs-10 col-xs-offset-1">
<div id="basis" class="page-header">
	<h1 id="title"></h1>
	<h3 id="owner" style="color: blue; text-align: right"></h3>
	<span id="type" class="label label-info" style="font-size: 15px"></span> 
	<span id="description" style="color:gray; font-size: 20px"></span>
</div>
<div id="quiz">
</div>
</div>
</div>
</div>

</body>
</html>