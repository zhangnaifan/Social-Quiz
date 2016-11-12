<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
	<title>Rank</title>
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>
	<script src="http://cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<link href="css/navbar.css" rel="stylesheet" type="text/css" />
  	<%@ page language="java" import="javafx.util.Pair, com.db.Dao, com.model.*, com.opensymphony.xwork2.ActionContext,java.util.*" pageEncoding="UTF-8"%>
<%-- java --%>
<%
	Dao dao = new Dao();
	Quiz quiz = dao.getQuiz(Integer.parseInt(request.getParameter("id")));
	ArrayList<Pair<Integer, Integer>> rank = quiz.getRank();
	int count=1;
%>
<!-- js -->
<script type="text/javascript">
$(document).ready(function(){
	$('nav').load('HTML/nav.html');
});
</script>
</head>
<body>
<nav class="navbar navbar-default" role="navigation"></nav>
<div class="container" style="margin-top:5%;">
	<div class="row">
		<div class="col-xs-10 col-md-8 col-xs-offset-1 col-md-offset-2">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<div class="panel-title"><span style="font-size:30px;color:yellow;margin-left:1%"><%=quiz.getTitle() %> </span>的排行榜 
						<span class="label label-info"> <%=quiz.getType()%></span>
					</div>
				</div>
				<div class="panel-body" style="color:gray"><%=quiz.getDescription() %></div>
				<table class="table">
					<tr>
						<th>#</th>
						<th>用户</th>
						<th>分数</th>
					</tr>
					<%for (Pair<Integer, Integer> entry : rank) { %>
						<tr>
							<td><%=count %></td>
							<td><%=dao.getUser(entry.getValue()).getNickName() %></td>
							<td><%=entry.getKey() %></td>
						</tr>
					<%
						count++;
					}
					count=1;
					%>
				</table>
			</div>
		</div>
	</div>
</div>

</body>
</html>