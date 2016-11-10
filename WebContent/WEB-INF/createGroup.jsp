<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<link href="//netdna.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet">
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<!--jQuery-->
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<title>Create Group</title>
	<style type="text/css">
		.input{
			width : 100%;
			border-color: #000;
			border-width: 2px;
			border-style: solid;
		}
		.navbar .container-fluid{
  			position: relative;
		}
		.navbar-default {
			 background: black;
			 border-color: #e7e7e7;
		}
		.navbar-default .navbar-brand {
			color: #FFFFFF;
		}
		.btn-group {
			position: absolute;
		    right: 0;
		    top: 0;
		}
		#introduce *{
			display:inline-block;
			vertical-align:middle; /* 居中对齐， */ 
			font-size:14px;
			margin-top: 50px;
		}
		.dropbtn {
		    background-color: black;
		    color: white;
		    padding: 16px;
		    font-size: 16px;
		    border: none;
		    cursor: pointer;
		}
		
		.dropdown {
		    position: relative;
		    display: inline-block;
		}
		
		.dropdown-content {
		    display: none;
		    position: absolute;
		    background-color: #f9f9f9;
		    min-width: 160px;
		    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
		}
		
		.dropdown-content a {
		    color: black;
		    padding: 12px 16px;
		    text-decoration: none;
		    display: block;
		}
		
		.dropdown-content a:hover {background-color: #f1f1f1}
		
		.dropdown:hover .dropdown-content {
		    display: block;
		}
		.dropdown:hover .dropbtn {
		    background-color: black;
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
	</style>
</head>
<body>
	<nav class="navbar navbar-default" role="navigation" style="margin-bottom: 0px;">
		<div class="container-fluid">
	  		<div class="navbar-header">
	  			<button type="button" class="navbar-left navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
	  				<span class="sr-only">Toggle navigation</span>
	  				<span class="icon-bar"></span>
	  				<span class="icon-bar"></span>
	  				<span class="icon-bar"></span>
	  			</button>
	      		<a class="navbar-brand" href="#">Questionnaire</a>
	      		<form class="navbar-form navbar-right" role="search">
				<div class="form-group">
					<input type="text" class="grom-control" placeholder="Search">
				</div>
				<button type="submit" class="btn btn-default">search</button>
			</form>
	    	</div>
	    	<div class="collapse navbar-collapse">
	    		<div class="dropdown">
	    			<button class="dropbtn">我的问卷</button>
	    			<div class="dropdown-content">
	    				<a href="#">已创建的问卷</a>
						<a href="#">待回答的问卷</a>
					    <a href="#">已回答的问卷</a>
	    			</div>
	    		</div>
	    		<div class="dropdown">
	    			<button class="dropbtn">查看排行榜</button>
	    			<div class="dropdown-content">
	    				<a href="#">积分排行榜</a>
						<a href="#">问卷排行榜</a>
	    			</div>
	    		</div>
	    		<div class="dropdown">
	    			<button class="dropbtn">我的小组</button>
	    			<div class="dropdown-content">
	    				<a href="#">小组1</a>
						<a href="#">小组2</a>
	    			</div>
	    		</div>
	    		<div class="dropdown">
	    			<button class="dropbtn">我的好友</button>
	    			<div class="dropdown-content">
	    				<a href="#">好友1</a>
						<a href="#">好友2</a>
	    			</div>
	    		</div>
	    	</div>
	    	
		</div>
		
		<div class="btn-group pull-right">
			
			<button type="button" class="btn btn-default btn-lg navbar-btn dropdown-toggle" data-toggle="dropdown">
				<span class="glyphicon glyphicon-user">${user.nickName }</span>
			</button>
			<ul class="dropdown-menu" role="menu">
				<li><a href="#">my information</a></li>
				<li><a href="#">my message</a></li>
				<li><a href="#">my friends</a></li>
				<li class="divider"></li>
				<li><a href=home>exit</a></li>
			</ul>
		</div>
	</nav>
	<div class="container">
		<div class="row">
			<div class="col-xl-6 col-md-4 col-center-block">
				<form>
					<h2>Create a group</h2>
					
					<div class="form-group">
						<p>group name</p>
						<input type="text" class="form-control" placeholder="named for your group" name="groupname">
					</div>
					<div class="form-group">
						<p>Description</p>
						<input type="text" class="form-control" placeholder="description for your group" name="info">
					</div>
					<div class="form-group">
						<p>tag</p>
						<input type="text" class="form-control" placeholder="set a tag" name="tag">
					</div>
					<button class="btn btn-lg btn-primary btn-block" type="submit">Create</button>  
				</form>
			</div>
		</div>
	</div>
	<em>
		tag is not available!
	</em>
	
</body>
</html>