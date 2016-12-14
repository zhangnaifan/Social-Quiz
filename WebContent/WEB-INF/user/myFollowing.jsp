<%@ page import="com.db.Dao, com.model.*, java.util.Vector" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>
	<script src="http://cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<link href="css/navbar.css" rel="stylesheet" type="text/css" />
	
	<title>我的关注</title>
	
	<%-- java --%>
	<%
		Dao dao = new Dao();
		User user = (User) session.getAttribute("user");
		Vector<User> followings = new Vector<User>();
		for (int i : user.getFollowings()) {
			followings.add(dao.getUserBasis(i));
		}
	%>
	
	<!-- js -->
	<script type="text/javascript">
	$(document).ready(function(){
		$('nav').load('HTML/nav.html');
		
		<%	if (followings.isEmpty()) {%>
		$('#myFollowings').append('<div class="alert alert-warning" role="alert">您暂时还没有关注的用户哦！去\
				左上角搜搜看吧！</div>');
		$('#searchBox').focus();
		<%}%>
		
	<%	for (int i=0; i<followings.size(); ++i) {%>
		$('#myFollowings').append(
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
		$('.no:last').text('<%=i+1%>');
		$('.nickname:last').text('<%=followings.elementAt(i).getNickName()%>');
		$('.email:last').text('<%=followings.elementAt(i).getEmail()%>');
		$('.membersince:last').text('<%=followings.elementAt(i).getMemberSince()%>');
		$('.intro:last').text('<%=followings.elementAt(i).getIntro()%>');
		$('a:last').attr('href','user?id='+'<%=followings.elementAt(i).getId()%>');
		<%}%>
		
	});
	
	</script>
	
</head>
<body>
	<nav class="navbar navbar-default" role="navigation"></nav>
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-md-offset-2 col-xs-10 col-xs-offset-1">
				<h2 style="margin-bottom:4%;">我的关注</h2>
				<div id="myFollowings"></div>
			</div>
		</div>
	</div>

</body>
</html>
