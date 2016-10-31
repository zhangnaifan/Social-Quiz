alert('hell');
var quesCount = 0;
$(document).ready(function(){
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
					<span class="input-group-addon"><input type="checkbox" class="TF"></span>\
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

function quizToString() {
	var no = 1;
	var str = "";
	$('.question').each(function(){
		/*
			'|' --> '$' --> '~'
			SA  --> S
			MC  --> M
			TF  --> T
		*/
		var I = '|';
		var II = '$';
		var III = '~';
		if ($(this).is('.question-SA')) {
			str += I + 'S' + II
					+ no++ + II
					+ $(this).find('.tag').val() + II
					+ $(this).find('.content').val() + II
					+ $(this).find('.answer').val() + II
					+ $(this).find('.score').val();
		} else if ($(this).is('.question-MC')) {
			str += I + 'M' + II
					+ no++ + II
					+ $(this).find('.tag').val() + II
					+ $(this).find('.content').val();
			$(this).find('.option').each(function(){
				str += II + $(this).find('.mark').text() + III
						+ $(this).find('.option-content').val() + III
						+ $(this).find('.score').val();
			})
		} else {
			str += I + 'T' + II
					+ no++ + II
					+ $(this).find('.tag').val() + II
					+ $(this).find('.content').val() + II
					+ $(this).find('.TF').val() + II
					+ $(this).find('.score').val();
		}
	});
	$('#para').append('<input name="quizStr" type="text" value="' + str + '">');
	return true;
}
