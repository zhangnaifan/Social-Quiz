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
User user = (User)session.getAttribute("user");
Vector<group> groups = new Vector<group>();
Dao dao = new Dao();
for (int id : user.getGroups()) {
	groups.add(dao.getGrpById(id));
}
%>


<!-- js -->
<script type="text/javascript">
$(document).ready(function(){
	$('nav').load('HTML/nav.html');
	
<%	for (int i=0; i<groups.size(); ++i) {%>
	$('#myGroups').append(
	'<div class="group panel panel-info">\
		<div class="panel-heading">\
			<a><span class="panel-title no"></span><span>. </span>\
			<span class="panel-title groupname"></span></a>\
			(<span class="groupid"></span>)\
			<span class="panel-title " style="float: right">\
				成员人数：<span class="tot"></span>&nbsp&nbsp\
				创建日期：<span class="createDate"></span>\
			</span>\
		</div>\
		<div class="panel-body">\
			<p class="description" style="color:gray"></p>\
		</div>\
	</div>');
	$('.no:last').text('<%=i+1%>');
	$('.groupname:last').text('<%=groups.elementAt(i).getGroupName()%>');
	$('.groupid:last').text('<%=groups.elementAt(i).getGroupId()%>');
	$('.tot:last').text('<%=groups.elementAt(i).getTotMembers()%>');
	$('.createDate:last').text('<%=groups.elementAt(i).getCreateDate()%>');
	$('.description:last').text('<%=groups.elementAt(i).getInfo()%>');
	$('a:last').attr('href','groupInfo?groupId='+'<%=groups.elementAt(i).getGroupId()%>');
	<%}
%>
	
});

</script>

</head>
<body>
	<nav class="navbar navbar-default" role="navigation"></nav>
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-md-offset-2 col-xs-10 col-xs-offset-1">
				<h2 style="margin-bottom:4%;">我的群</h2>
				<div id="myGroups"></div>
			</div>
		</div>
	</div>

</body>
</html>