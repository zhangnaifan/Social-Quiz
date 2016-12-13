<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
	<title>测试排名</title>
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
	Collections.sort(rank, new Comparator<Pair<Integer,Integer>>(){
		public int compare(Pair<Integer,Integer> i, Pair<Integer,Integer> j){
			return j.getKey() - i.getKey();
		}
	}); 
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
		<div class="col-md-8 col-md-offset-2 col-xs-10 col-xs-offset-1">
			<!-- share -->
			<div class="bdsharebuttonbox" style="float:right"><a href="#" class="bds_more" data-cmd="more"></a><a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a><a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a><a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a></div>
				<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"Staples——你的专属社交问答平台\nRaise your questions, answer your interests","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"24"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
			</div>
			<!-- share -->
		</div><br>
	
		<div class="col-xs-10 col-md-8 col-xs-offset-1 col-md-offset-2">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<div class="panel-title">
						<span>
							<a style="font-size:30px;color:yellow;margin-left:1%" href="quiz?id=<%=quiz.getId()%>"><%=quiz.getTitle() %></a> 
						</span>的排行榜 
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
							<td><a href="user?id=<%=entry.getValue()%>"><%=dao.getUser(entry.getValue()).getNickName() %></a></td>
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

</body>
</html>