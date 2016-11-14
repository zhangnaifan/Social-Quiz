<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
	<title>Create Quiz</title>
	<!--jQuery-->
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<!--bootstrap-->
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<link href="css/navbar.css" rel="stylesheet" type="text/css" />
	<script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>
	<script src="http://cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	
	<script>
		var quesCount = 0;
		$(document).ready(function(){
			$('nav').load('HTML/nav.html');
			$('#myModal').modal({show:true});
			$('#quesBtn').addClass('btn-group-vertical')
						 .css('position', 'fixed')
						 .css('height', '42%');
			$('#quesBtn button').attr('type', 'button')
								.addClass('btn btn-block')
								.css('height', '27%')
								.css('font-size', 'larger')
								.css('color', 'black')
								.fadeTo(0, 0.7);
			$('#quesBtn button:eq(0)').addClass('btn-info')
									  .click(addMC);
			$('#quesBtn button:eq(1)').addClass('btn-success')
									  .click(addSA);
			$('#quesBtn button:eq(2)').addClass('btn-danger')
									  .click(addTF);
		});

		function addSA() {
			$('#quiz').append(
				'<div class="panel panel-success  question question-SA">\
				    <div class="panel-heading form-inline">\
				        <span class="panel-title no"></span><span class="panel-title">. Short Answer</span>\
				        <input type="text" style="width:100px; height:28px; margin-left:20px" class="tag form-control" placeholder="tag"/>\
				        <span class="glyphicon glyphicon-remove" onclick="popQues(this)" style="float:right"></span>\
				    </div>\
				    <div class="panel-body">\
				    	<label for="content">Content</label><input id="content" type="text" class="content form-control">\
				        <label for="answer">Answer</label>\
				        <div id="answer" class="input-group">\
				        	<input type="text" class="answer form-control">\
				        	<span class="input-group-addon">\
		                        <select class="score">\
		                        	<option value="0">0</option>\
		                            <option value="1">1</option>\
		                            <option value="2">2 </option>\
		                            <option value="3">3</option>\
		                            <option value="4">4</option>\
		                            <option value="5">5</option>\
		                        </select>\
	                        </span>\
				        </div>\
				    </div>\
				</div>');
			$('.no:last').text(++quesCount);
		}

		function addMC() {
			$('#quiz').append(
				'<div class="panel panel-info question question-MC">\
				    <div class="panel-heading form-inline">\
				        <span class="panel-title no"></span><span class="panel-title ">. Multiple Choice</span>\
				        <input type="text" style="width:100px; height:28px; margin-left:20px" class="tag form-control" placeholder="tag"/>\
				        <span class="glyphicon glyphicon-remove" onclick="popQues(this)" style="float:right"></span>\
				    </div>\
				    <div class="panel-body">\
				        <label for="content">Content</label><input id="content" type="text" class="content form-control">\
				        <label for="options">Options</label>\
						<ul id="options" class="list-group">\
							<div class="option input-group">\
								<span class="input-group-addon mark">A</span>\
								<input type="text" class="option-content form-control">\
								<span class="input-group-addon">\
			                        <select class="score">\
		                        		<option value="0">0</option>\
			                            <option value="1">1</option>\
			                            <option value="2">2 </option>\
			                            <option value="3">3</option>\
			                            <option value="4">4</option>\
			                            <option value="5">5</option>\
			                        </select>\
			                    </span>\
		                    	<span class="input-group-addon"><span class="glyphicon glyphicon-remove" onclick="popOpt(this)"></span></span>\
							</div>\
							<div class="option input-group">\
								<span class="input-group-addon mark">B</span>\
								<input type="text" class="option-content form-control">\
								<span class="input-group-addon">\
			                        <select class="score">\
		                        		<option value="0">0</option>\
			                            <option value="1">1</option>\
			                            <option value="2">2 </option>\
			                            <option value="3">3</option>\
			                            <option value="4">4</option>\
			                            <option value="5">5</option>\
			                        </select>\
			                    </span>\
		                    	<span class="input-group-addon"><span class="glyphicon glyphicon-remove" onclick="popOpt(this)"></span></span>\
							</div>\
						</ul>\
						<button type="button" onclick="addItem(this)" class="btn btn-default">add option</button>\
				    </div>\
				</div>');
			$('.no:last').text(++quesCount);
		}

		function addTF() {
			$('#quiz').append(
				'<div class="panel panel-warning question question-TF">\
				    <div class="panel-heading form-inline">\
				        <span class="panel-title no"></span><span class="panel-title ">. True or False</span>\
				        <input type="text" style="width:100px; height:28px; margin-left:20px" class="tag form-control" placeholder="tag"/>\
				        <span class="glyphicon glyphicon-remove" onclick="popQues(this)" style="float:right"></span>\
				    </div>\
				    <div class="panel-body">\
				        <div class="input-group">\
							<input type="text" class="content form-control">\
							<span class="input-group-addon">\
								<input type="checkbox" onclick="setVal(this)">\
								<input type="text" style="display:none" value="F" class="answer">\
							</span>\
							<span class="input-group-addon">\
		                        <select class="score">\
		                        	<option value="0">0</option>\
		                            <option value="1">1</option>\
		                            <option value="2">2 </option>\
		                            <option value="3">3</option>\
		                            <option value="4">4</option>\
		                            <option value="5">5</option>\
		                        </select>\
		                    </span>\
						</div>\
				    </div>\
				</div>');
			$('.no:last').text(++quesCount);
		}

		function addItem(thisQues) {
			var mark = $(thisQues).prev().find('.mark').last().text();
			$(thisQues).prev().append(
				'<div class="option input-group">\
					<span class="input-group-addon mark">' + String.fromCharCode(mark.charCodeAt()+1) + '</span>\
					<input type="text" class="form-control option-content">\
					<span class="input-group-addon">\
                        <select class="score">\
                        	<option value="0">0</option>\
                            <option value="1">1</option>\
                            <option value="2">2 </option>\
                            <option value="3">3</option>\
                            <option value="4">4</option>\
                            <option value="5">5</option>\
                        </select>\
                    </span>\
                	<span class="input-group-addon"><span class="glyphicon glyphicon-remove" onclick="popOpt(this)"></span></span>\
				</div>');
		}

		function popQues(thisItem) {
			var thisQues = $(thisItem).parents('.question');
			thisQues.nextAll().each(function() {
				$(this).find('.no').text(parseInt($(this).find('.no').text(), 10) - 1);
			});
			thisQues.remove();
			--quesCount;
		}

		function popOpt(thisItem) {
			var thisOpt = $(thisItem).parents('.option');
			thisOpt.nextAll().each(function() {
				var preMark = $(this).find('.mark').text();
				$(this).find('.mark').text(String.fromCharCode(preMark.charCodeAt()-1));
			});
			thisOpt.remove();
		}

		function setVal(thisItem) {
			if ($(thisItem).is(':checked')) {
				$(thisItem).next().val('T');
			} else {
				$(thisItem).next().val('F');
			}
		}
		
		function quizToString() {
			/*
				'&' --> '|' --> '$' --> '~'
				SA  -->  S
				MC  -->  M
				TF  -->  T
			*/
			var O = '&';
			var I = '|';
			var II = '$';
			var III = '~';
			var IV = '^';

			var no = 1;
			var str = "";

			str = $('#title').val() + O
					+ $('#description').val() + O
					+ $('#type').val() + O;
			
			$('.question').each(function(){
				if ($(this).is('.question-SA')) {
					str += I + 'S' + II
							+ no++ + II
							+ $(this).find('.tag').val() + II
							+ $(this).find('.content').val() + II
							+ $(this).find('.answer').val() + IV
							+ $(this).find('.score').val();
				} else if ($(this).is('.question-MC')) {
					str += I + 'M' + II
							+ no++ + II
							+ $(this).find('.tag').val() + II
							+ $(this).find('.content').val() + II;
					$(this).find('.option').each(function(){
						str += III + $(this).find('.mark').text() + IV
								+ $(this).find('.option-content').val() + IV
								+ $(this).find('.score').val();
					})
				} else {
					str += I + 'T' + II
							+ no++ + II
							+ $(this).find('.tag').val() + II
							+ $(this).find('.content').val() + II
							+ $(this).find('.answer').val() + IV
							+ $(this).find('.score').val();
				}
			});
			$('#para').append('<input name="quizStr" type="text" value="' + str + '">');
			if (confirm('Are you sure to submit?')) {
				return true;
			} 
			return false;
		}

	</script>
</head>
<body>

	
<!-- Modal -->
	<nav class="navbar navbar-default" role="navigation" style="margin-bottom: 0px;"></nav>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog" style="z-index: 10000 !important;">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
	        <h4 class="modal-title" id="myModalLabel">测试概述</h4>
	      </div>
	      <div class="modal-body">
	        <form action="" method="post">
	        	<label for="title">题目</label><input type="text" id="title" class="form-control">
	        	<label for="description">描述</label><input type="text" id="description" class="form-control">
	        	<label for="type">类型</label><input type="text" id="type" class="form-control">
	        </form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" data-dismiss="modal">保存并关闭</button>
	      </div>
	    </div>
	  </div>
	</div>
	<div class="container" style="margin-top:4%;">
		<div class="row">
			<div class="col-xs-2 col-md-2">
				<div id="quesBtn">
					<button>多选题</button><button>简答题</button><button>判断题</button>
				</div>
			</div>
			<div class="col-xs-7 col-xs-offset-1 col-md-7 col-md-offset-1">
				<form id='quiz' class="form-group" action="createQuiz" method="post" onsubmit="return quizToString()">
					<div id="para" style="display:none"></div>
					<div class="form-inline" style="margin-bottom: 5%">
						<input type="button" class="btn-primary form-control" data-toggle="modal" data-target="#myModal" value="更改测试概述" style="width:49%">
						<input type="submit" value="提交" class="btn-warning form-control" style="width: 49%" />	
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>