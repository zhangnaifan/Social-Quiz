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
	<title>我的群</title>
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
			margin-top: 10%;
		}
		h2 {
			margin-top:20px;
			margin-bottom:20px;
		}
		#customers
		{
			font-family:"Trebuchet MS", Arial, Helvetica, sans-serif;
			width:100%;
			border-collapse:collapse;
		}
		#customers td, #customers th 
		{
			font-size:1em;
			border:1px solid black;
			padding:3px 7px 2px 7px;
		}
		#customers th 
		{
			font-size:1.1em;
			text-align:left;
			padding-top:5px;
			padding-bottom:4px;
			background-color:#585858;
			color:#ffffff;
		}
		#customers tr.alt td 
		{
			color:#000000;
			background-color:#EAF2D3;
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
						<caption style="color:black;font-size:28px;margin-bottom:3%;"><strong>我的群</strong></caption>
						<thead>
							<tr>
								<th>群名称</th>
								<th>群号码</th>
								<th>群成员</th>
								<th>查看详细信息</th>
							</tr>
						</thead>
						<tbody>
							<s:iterator value="groups" var="li">
								<tr class="alt">
									<td><s:property value='#li.groupName'></s:property></td>
									<td><s:property value='#li.groupId'></s:property></td>
									<td><s:property value='#li.totMembers'></s:property></td>
									<td><a href="groupInfo?groupId=<s:property value='#li.groupId'></s:property>"> 更多 </a></td>
								</tr>
							</s:iterator>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>
 	<%-- <div class="container">
		<div class="row">
			<div class="col-xl-6 col-md-8 col-center-block">
					<h2>我的群</h2>
					
					<table id="customers" class="table">
						<tr>
							<th>群名称</th>
							<th>群号码</th>
							<th>群成员</th>
							<th>查看详细信息</th>
						</tr>
						
						<s:iterator value="groups" var="li">
							<tr class="alt">
								<td><s:property value='#li.groupName'></s:property></td>
								<td><s:property value='#li.groupId'></s:property></td>
								<td><s:property value='#li.totMembers'></s:property></td>
								<td><a href="groupInfo?groupId=<s:property value='#li.groupId'></s:property>"> 更多 </a></td>
							</tr>
						</s:iterator>
					</table>	
			</div>
		</div>
	</div>
	 --%>
</body>
</html>























