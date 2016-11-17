<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<!--jQuery-->
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<!--bootstrap-->
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<link href="css/navbar.css" rel="stylesheet" type="text/css" />
	<script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>
	<script src="http://cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js"></script><title>群资料</title>
	<style type="text/css">
		.input{
			width : 100%;
			border-color: #000;
			border-width: 2px;
			border-style: solid;
		}
		.col-center-block {
			float:none;
			display:block;
			margin-left: auto;
			margin-right: auto;
			margin-top: 5%;
		}
		h2 {
			margin-top:20px;
			margin-bottom:20px;
		}
		
	</style>
	
<%@ page language="java" import="com.db.Dao, com.model.*, java.util.*"%>
<%
	User user = (User)session.getAttribute("user");
	ArrayList<Quiz> quizzes = new ArrayList<Quiz>();
	Dao dao = new Dao();
	group grp = dao.getGrpById(Integer.parseInt(request.getParameter("groupId")));
	for (int userId : grp.getMemberIds()) {
		for (int id : dao.getUser(userId).getPublishedQuiz()) {
			quizzes.add(dao.getQuiz(id));
		}
	}
	Collections.sort(quizzes, new Comparator<Quiz>(){
		public int compare(Quiz i, Quiz j) {
			return j.getCreateDate().after(i.getCreateDate())?1:-1;
		}
	});
%>
	
	
	<!-- js -->
	<script type="text/javascript">
	$(document).ready(function(){
		$('nav').load('HTML/nav.html');
	<%	for (int i=0; i<quizzes.size(); ++i) {%>
		$('#quiz').append(
		'<div class="quiz panel panel-success">\
			<div class="panel-heading">\
				<a><span class="panel-title no"></span><span>. </span>\
				<span class="panel-title title"></span></a>\
				<span class="label label-success type" style="margin-left: 3%"></span>\
				<span class="panel-title" style="float:right">\
					创建日期：<span class="createDate">\
				</span>\
			</div>\
			<div class="panel-body">\
				<p class="description" style="color:gray"></p>\
			</div>\
		</div>');
		$('.no:last').text('<%=i+1%>');
		$('.title:last').text('<%=quizzes.get(i).getTitle()%>');
		$('.type:last').text('<%=quizzes.get(i).getType()%>');
		$('.createDate:last').text('<%=quizzes.get(i).getCreateDate()%>');
		$('.description:last').text('<%=quizzes.get(i).getDescription()%>');
		$('a:last').attr('href','quiz?id='+'<%=quizzes.get(i).getId()%>');
		<%}
	%>
		
	});
	
	function doRegister() {
		var groupId = $('#groupId').val();
		$.post('registerGroup',
				{groupId : groupId});
		$('#inform').modal({show:true});
	}
	
	</script>
</head>
<body>
	<nav class="navbar navbar-default" role="navigation" style="margin-bottom: 3%;"></nav>
 	<div class="container">
		<div class="row">
			<div class="col-xs-offset-1 col-md-offset-1 col-xs-3 col-md-3">
				<form action="registerGroup">
					<table class="table table-hover">
						<caption style="color:black; font-size:40px;">${grp.groupName }</caption>
						<thead>
							<tr>
								<th>群简介</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>名称</td>
								<td>${grp.groupName }</td>
							</tr>
							<tr>
								<td>创建日期</td>
								<td>${grp.createDate }</td>
							</tr>
							<tr>
								<td>成员人数</td>
								<td>${grp.totMembers }</td>						
							</tr>
						</tbody>
					</table>	
					<table class="table table-hover">
						<caption style="color:black;">群管理员</caption>
						<thead>
							<tr>
								<th>昵称</th>
								<th>号码</th>
								<th>个人信息</th>
							</tr>
						</thead>
						<tbody>
							<s:iterator value="managers" var="li">
								<tr>
									<td><s:property value="#li.nickName"></s:property></td>
									<td><s:property value="#li.id"></s:property></td>
									<td><a href="user?id=<s:property value='#li.id'></s:property>">Link</a></td>
								</tr>
							</s:iterator>
						</tbody>
					</table>
					<table class="table table-hover">
						<caption style="color:black;">群成员</caption>
						<thead>
							<tr>
								<th>昵称</th>
								<th>号码</th>
								<th>个人信息</th>
							</tr>
						</thead>
						<tbody>
							<s:iterator value="members" var="li">
								<tr>
									<td><s:property value="#li.nickName"></s:property></td>
									<td><s:property value="#li.id"></s:property></td>
									<td><a href="user?id=<s:property value='#li.id'></s:property>">Link</a></td>
								</tr>
							</s:iterator>
						</tbody>
					</table>
					<input id="groupId" type="hidden" name="groupId" value="${grp.groupId }" readonly="readonly">
				</form>
				<%if (!user.isInGroup((int)grp.getGroupId())) {%>
					<button class="btn btn-lg btn-default btn-block" onclick="doRegister()">加入该群</button>
				<%} else if (grp.getManagerIds().contains(user.getId())) {%>
					<form action="toCreateGroupQuiz">
						<input name="groupId" type="text" style="display:none" value="<%=grp.getGroupId()%>">
						<button class="btn btn-lg btn-primary btn-block">创建共有测试</button>
					</form>
				<%} %>
			</div>
			<div id="quiz" class="col-xs-offset-1 col-md-offset-1 col-xs-6 col-md-6">
				<h1>测试清单</h1><hr/>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="inform" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog" style="z-index: 10000 !important;">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
	        <h4 class="modal-title" id="myModalLabel">请等待管理员接收您的申请！</h4>
	      </div>
	      <div class="modal-footer btn-group">
	        <button class="btn btn-primary" data-dismiss="modal">好的，知道了</button>
	      </div>
	    </div>
	  </div>
	</div>
</body>
</html>





















