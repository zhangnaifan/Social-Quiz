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
<link href="css/navbar.css" rel="stylesheet" type="text/css" />

<%-- java prepare data --%>
<%@ page language="java" import="com.db.Dao, com.model.*, java.util.*, javafx.util.Pair" pageEncoding="UTF-8"%>
<%
	//PREPARE DATA FOR THE PAGE
	//connect to database
	Dao dao = new Dao();
	//get current viewer's information
	User user = (User)session.getAttribute("user");
	//get quiz
	Quiz quiz;
	if (request.getParameter("id")!=null){
		quiz = dao.getQuiz(Integer.parseInt(request.getParameter("id")));
	} else {
		quiz = dao.getQuiz((Integer)session.getAttribute("quizId"));
	}
	//get quiz's creator's information
	User owner = dao.getUser(quiz.getOwnerID());
	//get quiz's questions
	Vector<Question> questions = new Vector<Question>();
	for (int i : quiz.getQuestions()) {
		questions.add(dao.getQuestion(i));
	}
%>

<!-- javascript generate the web page -->
<script type="text/javascript">
	$(document).ready(function(){		
		$('#quizId').val('<%=quiz.getId()%>');
		$('#title').text('<%=quiz.getTitle()%>');
		$('#owner').text('<%=owner.getNickName()%>');
		$('#type').text('<%=quiz.getType()%>');
		$('#description').text('<%=quiz.getDescription()%>');
	<%! int no = 1;%>
	<%-- Vector<String> options = new Vector<String>();--%>
	<% 	for (int i=0; i<questions.size(); ++i) {
			Question ques = questions.elementAt(i);
			switch (ques.getType()) {
			//Short Answer
			case 'S':%>
			$('#quiz').append(
		'<div class="question question-SA">\
			<div class="question-basis">\
				<span class="no"></span><span>.</span>\
				<span class="user-score"></span>\
				<span class="content"></span>\
				<span class="tag"></span>\
			</div>\
			<div class="question-answer">\
				<div class="not-done">\
					<input type="text" class="answer form-control"/>\
				</div>\
				<div class="input-group done">\
					<input type="text" class="answer-user form-control" readonly="readonly"/>\
					<span class="input-group-addon user-star"></span>\
				</div>\
				<div class="input-group owner">\
					<input type="text" class="answer-correct form-control" readonly="readonly">\
					<span class="input-group-addon star"></span>\
				</div>\
				<input type="text" class="score" style="display:none">\
			</div>\
		</div>');
			<%
			String[] SA_splits = ques.getAnswer().split("\\^",-1);
			String SA_answer = SA_splits[0];
			int SA_score = Integer.parseInt(SA_splits[1]);
			%>
			$('.answer-correct:last').val('<%=SA_answer%>');
			$('.score:last').val('<%=SA_score%>');
			$('.question:last').addClass('panel panel-success');
			$('.tag:last').addClass('label label-success').css('margin-left','3%');
			<%for (int j=1; j<=SA_score; ++j){%>
				$('.star:last').append('<span class="glyphicon glyphicon-star"></span>');
			<%}
			break;
			//Multiple Choices
			case 'M':
			Vector<String> contents = ques.getMC().getKey();
			Vector<Integer> scores = ques.getMC().getValue();
			%>
			$('#quiz').append(
		'<div class="question question-MC">\
			<div class="question-basis">\
				<span class="no"></span><span>.</span>\
				<span class="user-score"></span>\
				<span class="content"></span>\
				<span class="tag"></span>\
			</div>\
			<div class="question-answer"></div>\
		</div>');
			<%//add options
			int mark = 65;
			for (int j=0; j<contents.size(); ++j){%>
				$('.question-answer:last').append(
				'<div class="input-group MC-option">\
					<span class="input-group-addon mark"></span>\
					<span class="option-content form-control"></span>\
					<span class="input-group-addon not-done">\
						<input type="radio" name="options<%=i%>">\
						<input class="score" type="text" style="display:none" >\
					</span>\
					<span class="input-group-addon done star"></span>\
					<span class="input-group-addon owner star"></span>\
				</div>');
				$('.mark:last').text('<%=(char)mark++%>');
				$('.option-content:last').text('<%=contents.elementAt(j)%>');
				$('.question:last .score:last').val('<%=scores.elementAt(j)%>');
				<%for (int k=1; k<=scores.elementAt(j);++k){%>
					$('.star:last').append('<span class="glyphicon glyphicon-star"></span>');
				<%}%>
			<%}%>
			$('.question:last').addClass('panel panel-info');
			$('.tag:last').addClass('label label-success');
			<%
				break;
			default:
			//True or False%>
			$('#quiz').append(
		'<div class="question question-TF">\
			<div class="question-basis">\
				<span class="no"></span><span>.</span>\
				<span class="user-score"></span>\
				<span class="content"></span>\
				<span class="tag"></span>\
				<span class="not-done">\
					<input type="checkbox" style="float:right">\
					<input type="text" class="answer" value="F" style="display:none">\
				</span>\
				<span class="done">\
					<input type="checkbox" class="answer-user" disabled="disabled" >\
					<span class="star-user" style="float:right"></span>\
				</span>\
				<span class="owner">\
					<input type="text" class="answer-correct" style="display:none">\
					<input type="checkbox" disabled="disabled">\
					<span class="star" style="float:right"></span>\
				</span>\
				<input type="text" class="score" style="display:none">\
			</div>\
		</div>');
			<%String[] TFSplits = ques.getAnswer().split("\\^",-1);
			String TF_answer = TFSplits[0];
			int TF_score = Integer.parseInt(TFSplits[1]);%>
			$('.answer-correct:last').val('<%=TF_answer%>');
			$('.score:last').val('<%=TF_score%>');
			$('.question:last').addClass('panel panel-warning');
			$('.tag:last').addClass('label label-warning');
			<%if(TF_answer.equals("T")){%>
				$('.answer-correct:last').next().attr('checked','checked');
			<%}
			for (int j=1; j<=TF_score; ++j) {%>
				$('.star:last').append('<span class="glyphicon glyphicon-star"></span>');
			<%}
			}%>
			$('.no:last').append('<%=no%>');
			$('.content:last').append('<%=ques.getContent()%>');
			$('.tag:last').append('<%=ques.getTag()%>');
			<%no++;
		}%>
		$('.question-basis').addClass('panel-heading');
		$('.question-answer').addClass('panel-body');
		$('.content,.no').addClass('panel-title');
		$('.tag').css('margin-left','3%');
		$('[type="checkbox"]').change(function(){setSelVal(this);});
		<%no=1;
		if (user.getId() == owner.getId()) {//creator' perspective %>
			$('.done,.not-done').css('display','none');
			$('#basis').append('<a style="margin-bottom:3%;margin-top:3%;" class="btn-primary form-control" href="rank?id='+ '<%=quiz.getId()%>' +'">查看排行榜</a>');
			$('#quizID').val('<%=quiz.getId()%>');
		<%} else if (user.getQuizDone().indexOf(quiz.getId())==-1) {//quiz doer's perspective %>
			$('.owner,.done').css('display','none');
			$('#frame').append('<button data-toggle="modal" data-target="#confirm" class="form-control btn-primary">提交</button>');
		<%} else {//quiz doner's perspective %>
			$('#basis').append('<a style="margin-bottom:3%;margin-top:3%" class="btn-danger form-control" href="rank?id='+ '<%=quiz.getId()%>' +'">查看排行榜</a>');
			$('#quizID').val('<%=quiz.getId()%>');
			$('.owner,.not-done').css('display','none');
		<% 	
			Vector<Pair<String, Integer>> rec = quiz.getRecord(user.getId()); 
			int finalScore = 0;
			for (int k=0; k<rec.size(); ++k) {
				finalScore += rec.elementAt(k).getValue();
			} %>
			$('#quiz').prepend('<h3>最终得分是 <span class="score-final">' + '<%=finalScore%>' + '</span></h3>');
		<%	String answer_user;
			int score_user;
			for (int count = 0; count<rec.size(); ++count) {%>
				var q = $('.question:eq(' + '<%=count%>' + ')');
				<%
				answer_user = rec.elementAt(count).getKey();
				score_user = rec.elementAt(count).getValue();
				%>
				q.find('.user-score').text('+'+'<%=score_user%>');
				if (q.is('.question-SA')) {
					q.find('.answer-user').val('<%=answer_user%>');
					<%if (score_user==0) {%>
						q.find('.done').removeClass('input-group');
						q.find('.user-star').remove();
					<%} else {
						for (int j=0; j<score_user; ++j) {%>
							q.find('.user-star').append('<span class="glyphicon glyphicon-star"></span>');
					<%}
					} %>
				} else if (q.is('.question-MC')) {
					q.find('.mark').each(function(){
						if ($(this).is('.mark:contains("' + '<%=answer_user%>' + '")')){
							<%for (int j=0; j<score_user; ++j) {%>
							$(this).next().next().next()
									.append('<span class="glyphicon glyphicon-star"></span>');
							<%}%>
						} else {
							$(this).next().next().next().remove();
						}
					});
				} else {
					<%if(answer_user.equals("T")){%>
					q.find('.answer-user').attr('checked', 'checked');
					<%}
					if (score_user==0){%>
						q.find('.star-user').remove();
					<%} else
						for (int j=1; j<=score_user; ++j) {%>
							q.find('.star-user').append('<span class="glyphicon glyphicon-star"></span>');
						<%}%>
				}
			<%}
		}%>
		$('.score-final').css('color','red').css('font-size','larger')
		$('.user-score').addClass('panel-title').css('color','red');
		$('.glyphicon-star').css('color','orange');
		$('nav').load('HTML/nav.html');

	});

	function setSelVal(thisSel) {
		if ($(thisSel).is(':checked')) {
			$(thisSel).next().val('T');
		} else {
			$(thisSel).next().val('F');
		}
	}
	
	function calculate() {
		var rec = "";
		var total = 0;
		$('.question').each(function(){
			rec += '$';
			if ($(this).is('.question-SA') || $(this).is('.question-TF')) {
				if ($(this).is('.question-SA')) {
					rec += 'S';
				} else {
					rec += 'T';
				}
				var answer = $(this).find('.answer').val();
				var correctAnswer = $(this).find('.answer-correct').val();
				var score = $(this).find('.score').val();
				rec += '~' + answer;
				if (answer == correctAnswer) {
					rec += '~' + score;
					total += Number(score);
				} else {
					rec += '~0';
				}
			} else {
				rec += 'M';
				var found = false;
				$(this).find('[type="radio"]').each(function(){
					if ($(this).is(':checked')) {
						found = true;
						rec += '~' + $(this).parents('.MC-option').find('.mark').text();
						var score = $(this).parents('.MC-option').find('.score').val();
						rec += '~' + score;
						total += Number(score);
					}
				});
				if (found==false){
					rec += '~~0';
				}
			}
		});
		$('#record').val(rec + '|' + total + '|' + '<%=user.getId()%>');
		$('#quizId').val('<%=quiz.getId()%>');
		$('#quiz').submit();
	}
</script>

</head>
<body>
	<nav class="navbar navbar-default" role="navigation"></nav>

	<div class="container">
		<div class="row">
			<div class="col-md-8 col-md-offset-2 col-xs-10 col-xs-offset-1">
				<!-- share -->
				<div class="bdsharebuttonbox" style="float:right"><a href="#" class="bds_more" data-cmd="more"></a><a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a><a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a><a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a></div>
					<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"Staples——你的专属社交问答平台\nRaise your questions, answer your interests","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"24"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
				</div>
				<!-- share -->
			</div>
		
			<div id="frame" class="col-md-8 col-md-offset-2 col-xs-10 col-xs-offset-1" style="border:1px solid #ccc; padding:3%">
				<div id="basis" class="page-header">
					<h1 id="title" ></h1>
					<h3 id="owner" style="color: blue; text-align: right"></h3>
					<span id="type" class="label label-info" style="font-size: 15px"></span> 
					<span id="description" style="color:gray; font-size: 20px"></span>	
				</div>
				<form id="quiz" action="doQuiz" method="post">
					<div style="display:none">
						<input type="text" name="record" id="record">
						<input type="text" name="quizId" id="quizId">
					</div>
				</form>
			</div>
		</div>
	</div>

	<div class="modal fade" id="confirm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog" style="z-index: 10000 !important;">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
	        <h4 class="modal-title" id="myModalLabel">确定要提交吗？</h4>
	      </div>
	      <div class="modal-footer btn-group">
	      	<button class="btn btn-primary" data-dismiss="modal">再看看</button>
	        <button class="btn btn-danger" onclick="calculate()">提交吧</button>
	      </div>
	    </div>
	  </div>
	</div>
</body>
</html>