<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<link href="//netdna.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet">
	<link href="css/navbar.css" rel="stylesheet" type="text/css" />
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<!--jQuery-->
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<title>群资料</title>
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
	
	<!-- js -->
	<script type="text/javascript">
	$(document).ready(function(){
		$('nav').load('HTML/nav.html');
	});
	</script>
</head>
<body>
	<nav class="navbar navbar-default" role="navigation" style="margin-bottom: 0px;"></nav>
 	<div class="container">
		<div class="row">
			<div class="col-xl-6 col-md-6 col-center-block">
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
								<th>用户名</th>
								<th>昵称</th>
								<th>号码</th>
								<th>个人信息</th>
							</tr>
						</thead>
						<tbody>
							<s:iterator value="managers" var="li">
								<tr>
									<td><s:property value="#li.username"></s:property></td>
									<td><s:property value="#li.nickName"></s:property></td>
									<td><s:property value="#li.id"></s:property></td>
									<td><a href="#">Link</a></td>
								</tr>
							</s:iterator>
						</tbody>
					</table>
					<table class="table table-hover">
						<caption style="color:black;">群成员</caption>
						<thead>
							<tr>
								<th>用户名</th>
								<th>昵称</th>
								<th>号码</th>
								<th>个人信息</th>
							</tr>
						</thead>
						<tbody>
							<s:iterator value="members" var="li">
								<tr>
									<td><s:property value="#li.username"></s:property></td>
									<td><s:property value="#li.nickName"></s:property></td>
									<td><s:property value="#li.id"></s:property></td>
									<td><a href="#<s:property value='#li.id'></s:property>">Link</a></td>
								</tr>
							</s:iterator>
						</tbody>
					</table>
					<input type="hidden" name="groupId" value="${grp.groupId }" readonly="readonly">
					<button class="btn btn-lg btn-default btn-block" type="submit">加入该群</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>





















