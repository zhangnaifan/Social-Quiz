<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--jQuery-->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!--bootstrap-->
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link href="css/navbar.css" rel="stylesheet" type="text/css" />
<script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

<title>我的消息</title>
<style type="text/css">
.input {
	width: 100%;
	border-color: #000;
	border-width: 2px;
	border-style: solid;
}

.col-center-block {
	float: none;
	display: block;
	margin-left: auto;
	margin-right: auto;
	margin-top: 8%;
}

.box {
	-moz-box-sizing: border-box; /* Firefox */
	width: 40%;
	float: left;
}

img {
	width: 100px;
	height: 100px;
	border-radius: 50px;
	display: inline;
}
</style>

<!-- js -->
<script type="text/javascript">
	$(document).ready(function(){
		$('nav').load('HTML/nav.html');
	});
	
	function showMsg(thisItem) {
		var fromId = $(thisItem)
						.parents('.parentNode')
						.find('.fromId')
						.first()
						.val();
		var fromNickname = $(thisItem)
							.parents('.parentNode')
							.find('.fromNickname')
							.first()
							.val();
		var msgContent = $(thisItem)
							.parents('.parentNode')
							.find('.msgContent')
							.first()
							.val();
		$('#showIt #fromId').attr('href', 'user?id='+fromId);
		$('#showIt #fromId').text(fromNickname);
		$('#showIt #content').val(msgContent);
		$('#showIt').modal({show:true});
	}
	
	</script>
</head>
<body>
	<nav class="navbar navbar-default" role="navigation"
		style="margin-bottom: 0px;"></nav>
	<div class="container">
		<div class="row">
			<div class="col-xl-6 col-md-4 col-center-block">
				<div class="box">
					<img src="image/cat.jpg">
				</div>
				<div class="box">
					<h2>${user.username }</h2>
					<p class="lead" style="padding-left: 15%;">${user.nickName }</p>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-xl-6 col-md-6 col-center-block"
				style="margin-top: 3%;">
				<table class="table table-hover">
					<caption
						style="color: black; font-size: 26px; padding-bottom: 10%;">小组注册消息</caption>
					<thead>
						<tr>
							<th>消息来源</th>
							<th>申请加入组</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="messageGroup" var="li">
							<tr>
								<td><a href="user?id=${ li.fromUser.id}">${ li.fromUser.nickName}</a></td>
								<td><a href="groupInfo?groupId=${li.tmpId }">${li.msg}</a></td>
								<td><a
									href='processRegisterGroup?msgId=<s:property value="#li.id"/>&accept=true'>
										接受 </a> <a
									href='processRegisterGroup?msgId=<s:property value="#li.id"/>&accept=false'>
										拒绝 </a></td>
							</tr>
						</s:iterator>
					</tbody>
				</table>

			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-xl-6 col-md-6 col-center-block"
				style="margin-top: 3%;">
				<table class="table table-hover">
					<caption
						style="color: black; font-size: 26px; padding-bottom: 10%;">我的消息</caption>
					<thead>
						<tr>
							<th>消息来源</th>
							<th>消息内容</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="messageNormal" var="li">
							<tr class="parentNode">
								<td>
									<a href="user?id=${ li.fromUser.id}">${ li.fromUser.nickName}
										<input style="display:none" class="fromId" type="text" value='${ li.fromUser.id}' />
										<input style="display:none" class="fromNickname" type="text" value='${ li.fromUser.nickName}'>
									</a>
								</td>
								<td>
									<a onclick="showMsg(this)">${li.msg }
										<textarea style="display:none" class="msgContent">${li.msg }</textarea>
									</a>
								</td>
								<td><a
									href='processRegisterGroup?msgId=<s:property value="#li.id"/>&accept=false'>
										标记为已读 </a></td>
							</tr>
						</s:iterator>
					</tbody>
				</table>

			</div>
		</div>
	</div>
	
	<div class="modal fade" id="showIt" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog" style="z-index: 10000 !important;">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
	        <h4 class="modal-title" id="myModalLabel">来自 &nbsp &nbsp<a id="fromId"></a></h4>
	      </div>
	      <div class="modal-body">
	        <div>
	        	<textarea style="background-color:white;" readonly rows="8" id="content" class="form-control"></textarea>
	        </div>
	      </div>
	      <div class="modal-footer" id="footer">
	      	<button class="btn btn-primary" data-dismiss="modal">关闭</button>
	      </div>
	    </div>
	  </div>
	</div>

</body>
</html>