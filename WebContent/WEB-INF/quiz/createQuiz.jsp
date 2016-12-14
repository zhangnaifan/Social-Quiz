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
		var reg1 = new RegExp("^[^&$|~^']{1,40}$");
		var reg2 = new RegExp("^[^&$|~^']{0,18}$");
		$(document).ready(function(){
			$('nav').load('HTML/nav.html');
			$('#myModal').modal({show:true});
			$('#quesBtn').addClass('btn-group-vertical')
						 .css('width','15%')
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

		function addSA() {
			$('#quiz').append(
				'<div class="panel panel-success  question question-SA">\
				    <div class="panel-heading form-inline">\
				        <span class="panel-title no"></span><span class="panel-title">. 简答题</span>\
				        <input type="text" style="width:100px; height:28px; margin-left:20px" class="tag form-control" placeholder="标签" />\
				        <span class="glyphicon glyphicon-remove" onclick="popQues(this)" style="float:right"></span>\
				    </div>\
				    <div class="panel-body">\
				    	<label for="content">问题</label><input id="content" type="text" class="content form-control">\
				        <label for="answer">答案</label>\
				        <div id="answer" class="input-group">\
				        	<input type="text" class="answer-SA form-control">\
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
			$('.score:last').tooltip({title:'设置得分'});
			$('.content:last, .answer-SA:last').blur(function(){
				if (!reg1.test($(this).val())) {
					$(this).addClass('error');
					$(this).css('border','1px solid red');
					$(this).tooltip({title:'不能为空/超过40字符/包含\'！', trigger:'focus hover'});
				} else {
					$(this).removeClass('error');
					$(this).css('border','1px #ccc solid');
					$(this).tooltip('destroy');
				}
			}).addClass('error');
			$('.tag:last').blur(function(){
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
			$('.question:last .content').focus();
		}

		function addMC() {
			$('#quiz').append(
				'<div class="panel panel-info question question-MC">\
				    <div class="panel-heading form-inline">\
				        <span class="panel-title no"></span><span class="panel-title ">. 单选题</span>\
				        <input type="text" style="width:100px; height:28px; margin-left:20px" class="tag form-control" placeholder="标签"/>\
				        <span class="glyphicon glyphicon-remove" onclick="popQues(this)" style="float:right"></span>\
				    </div>\
				    <div class="panel-body">\
				        <label for="content">问题</label><input id="content" type="text" class="content form-control">\
				        <label for="options">选项</label>\
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
						<button type="button" onclick="addItem(this)" class="btn btn-default">增加选项</button>\
				    </div>\
				</div>');
			$('.no:last').text(++quesCount);
			$('.question-MC:last .score').tooltip({title:'设置得分'});
			$('.question:last .option-content, .question:last .content').blur(function(){
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
			$('.tag:last').blur(function(){
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
			$('.question:last .content').focus();
		}

		function addTF() {
			$('#quiz').append(
				'<div class="panel panel-warning question question-TF">\
				    <div class="panel-heading form-inline">\
				        <span class="panel-title no"></span><span class="panel-title ">. 判断题</span>\
				        <input type="text" style="width:100px; height:28px; margin-left:20px" class="tag form-control" placeholder="tag"/>\
				        <span class="glyphicon glyphicon-remove" onclick="popQues(this)" style="float:right"></span>\
				    </div>\
				    <div class="panel-body">\
				        <div class="input-group">\
							<input type="text" class="content form-control" placeholder="题面">\
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
			$('.score:last').tooltip({title:'设置得分'});
			$(':checkbox:last').tooltip({title:'打勾表示答案正确，否则错误'});
			$('.content:last').blur(function(){
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
			$('.tag:last').blur(function(){
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
			$('.question:last .content').focus();
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
			$('.score:last').tooltip({title:'设置得分'});
			$('.option-content:last').blur(function(){
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
			$(thisQues).parents('.question').find('.option-content:last').focus();
		}

		function popQues(thisItem) {
			var thisQues = $(thisItem).parents('.question');
			thisQues.nextAll().each(function() {
				$(this).find('.no').text(parseInt($(this).find('.no').text(), 10) - 1);
			})
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
				$(thisItem).parents('.question').find('.answer').val('T');
			} else {
				$(thisItem).parents('.question').find('.answer').val('F');
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
		
		function quizToString() {
			if ($('.option-content, .content, .answer-SA, .tag').is('.error')) {
				$('#confirm').modal('hide');
				$('#error').modal('show');
				var bad = $('.option-content, .content, .answer-SA').filter('.error');
				$(bad).css('border','1px solid red');
				$(bad).tooltip({title:'不能为空/超过40字符/包含特殊字符！', trigger:'focus hover'});
				var bad2 = $('.tag').filter('.error');
				$(bad2).css('border','1px solid red');
				$(bad2).tooltip({title:'不能超过18字符/只能包含中英文数字！', trigger:'focus hover'});
				return false;	
			}
			/*
				'&' --> '|' --> '$' --> '~' --> '~'
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
							+ $(this).find('.answer-SA').val() + IV
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
			$('#quiz').submit();
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
        	<label for="title">题目</label><input type="text" id="title" class="form-control">
        	<label for="description">描述</label><input type="text" id="description" class="form-control">
        	<label for="type">类型</label><input type="text" id="type" class="form-control">
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
	        <button class="btn btn-danger" onclick="quizToString()">提交吧</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<div class="modal fade" id="error" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog" style="z-index: 10000 !important;">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
	        <h4 class="modal-title" id="myModalLabel">您有未修改的错误或未填写的项目</h4>
	      </div>
	      <div class="modal-footer btn-group">
	      	<button class="btn btn-primary" data-dismiss="modal">知道了</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<div class="container" style="margin-top:4%;">
		<div class="row">
			<div class="col-xs-3 col-md-3">
				<div id="quesBtn">
					<button>单选题</button><button>简答题</button><button>判断题</button>
				</div>
			</div>
			<div class="col-xs-7 col-md-7">
				<div class="form-inline" style="margin-bottom: 5%">
					<button class="btn-primary form-control" data-toggle="modal" data-target="#myModal" style="width:49%">更改测试概述</button>
					<button data-toggle="modal" data-target="#confirm" class="btn-warning form-control" style="width: 49%">提交</button>	
				</div>
				<form id='quiz' class="form-group" action="createQuiz" method="post" style="border:1px solid #ccc; padding:3%">
					<div id="para" style="display:none"></div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>