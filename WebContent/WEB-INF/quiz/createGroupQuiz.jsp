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

<!-- js -->

<script type="text/javascript">
var quesList = new Array();
var last = 0;
var reg1 = new RegExp("^[\u4e00-\u9fa5_a-zA-Z0-9,，.。!！?？@#%*（()） ]{1,40}$");
var reg2 = new RegExp("^[\u4e00-\u9fa5_a-zA-Z0-9]{1,18}$");

$(document).ready(function(){
	$('nav').load('HTML/nav.html');
	$('#myModal').modal({show:true});
	$('#searchResult').on('click','.question',function(){
		addQues(this);
	});
	
	$('#title, #description').blur(function(){
		if (!reg1.test($(this).val())) {
			$(this).addClass('error');
			$(this).css('border','1px solid red');
			$(this).tooltip({title:'不能为空/超过40字符/包含特殊字符！', trigger:'focus hover'});
		} else {
			$(this).removeClass('error');
			$(this).css('border','1px #ccc solid');
			$(this).tooltip('destroy');
		}
	}).addClass('error');
	$('#type').blur(function(){
		if (reg2.test($(this).val()) || $(this).val()=="") {
			$(this).removeClass('error');
			$(this).css('border','1px #ccc solid');
			$(this).tooltip('destroy');
		} else {
			$(this).addClass('error');
			$(this).css('border','1px solid red');
			$(this).tooltip({title:'不能超过18字符，只能包含中英文数字！', trigger:'focus hover'});
		}
	});
});

function search() {
	$.post('searchQuestions',
			{ 
				keyword : $('#keyword').val(),
				groupId : <%=session.getAttribute("groupId")%>
			},
			function(data){
				$('#searchResult').empty().append(data);
			});
}

function addQues(thisItem) {
	var quesId = $(thisItem).find('.quesId').val();
	quesList[last++] = quesId;
	$(thisItem).appendTo('#quiz');
	$('#quiz .question:last .ques-remove')
	.append("<span class='glyphicon glyphicon-remove' style='margin-right:8px' onclick='removeQues(this)'></span>");
}

function removeQues(thisItem) {
	var thisQues = $(thisItem).parents('.question');
	var quesId = thisQues.find('.quesId').val();
	for (var i = 0; i<last; ++i) {
		if (quesList[i] == quesId) {
			quesList[i] = -1;
			break;
		}
	}
	thisQues.remove();
}

function beforeSubmit() {
	var arr = new Array();
	var j = 0;
	for (var i = 0; i < last; ++i) {
		if (quesList[i]>=0) {
			arr[j++] = quesList[i];
		}
	}
	$('#quesListStr').val(arr.join('&'));
	
	if ($('#title, #description, #type').is('.error')) {
		var bad = $('#title, #description').filter('.error');
		$(bad).css('border','1px solid red');
		$(bad).tooltip({title:'不能为空/超过40字符/包含特殊字符！', trigger:'focus hover'});
		var bad2 = $('#type').filter('.error');
		$(bad2).css('border','1px solid red');
		$(bad2).tooltip({title:'不能超过18字符/只能包含中英文数字！', trigger:'focus hover'});
		$('#confirm').modal('hide');
		$('#myModal').modal('show');
	} else {
		$('#quizInfo').submit();
	}
}

function checkBasis() {
	if ($('#title, #description, #type').is('.error')) {
		var bad = $('#title, #description').filter('.error');
		$(bad).css('border','1px solid red');
		$(bad).tooltip({title:'不能为空/超过40字符/包含特殊字符！', trigger:'focus hover'});
		var bad2 = $('#type').filter('.error');
		$(bad2).css('border','1px solid red');
		$(bad2).tooltip({title:'不能超过18字符/只能包含中英文数字！', trigger:'focus hover'});
	} else {
		$('#myModal').modal('hide');
	}
}
 
</script>


</head>
<body>
	<nav class="navbar navbar-default" role="navigation"></nav>
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-xs-6">
				<h2 style="margin-bottom:4%;">问题搜索</h2><hr>
				<input id="keyword" oninput="search()" type="text" class="form-control">
				<hr>
			</div>
			<div class="col-md-6 col-xs-6">
				<h2 style="margin-bottom:4%;">小组测试</h2><hr>
				<div class="form-inline" style="margin-bottom: 5%">
					<button class="btn-primary form-control" data-toggle="modal" data-target="#myModal" style="width:49%">更改测试概述</button>
					<button data-toggle="modal" data-target="#confirm" class="btn-warning form-control" style="width: 49%">提交</button>	
				</div>
				<hr>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6 col-xs-6">
				<div id="searchResult"></div>
			</div>
			<div class="col-md-6 col-xs-6">
				<div id="quiz"></div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog" style="z-index: 10000 !important;">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
	        <h4 class="modal-title" id="myModalLabel">测试概述</h4>
	      </div>
	      <div class="modal-body">
	      	<form id="quizInfo" action="createGroupQuiz" method="post">
	      		<input type="text" style="display:none" name="quesListStr" id="quesListStr">
	      		<input type="text" style="display:none" name="groupId" id="groupId" value="<%=session.getAttribute("groupId") %>">
	      		<label for="title">题目</label><input type="text" name="title" id="title" class="form-control">
        		<label for="description">描述</label><input type="text" name="description" id="description" class="form-control">
        		<label for="type">类型</label><input type="text" name="type" id="type" class="form-control">
	      	</form>
          </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" onclick="checkBasis()">保存并关闭</button>
	      </div>
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
	        <button class="btn btn-danger" onclick="beforeSubmit()">提交吧</button>
	      </div>
	    </div>
	  </div>
	</div>z

</body>
</html>