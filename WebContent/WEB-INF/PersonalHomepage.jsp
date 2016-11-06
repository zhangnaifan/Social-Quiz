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
	<title>Sign Up For Staples</title>
	<style type="text/css">
		body
		{
			background-color:white;
		}
		.navbar .container-fluid{
  			position: relative;
		}
		.navbar-default {
			 background: linear-gradient(to right, #3399CC, #33CC99);
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
		#introduce{
			background:#F0F0F0;
			padding:15px;
		}
		.Menu{
		    width:300px;
		    margin:10px 0px;
		}
		.Menu ul li{
		    border-bottom:1px solid #d4d4d4;
		    background:#f1f1f1;
		    list-style:none;
		}
		.Menu ul li a{
		    display:block;
		    text-align:center;
		    color:#000;
		    text-decoration:none;
		    background:none;
		    height:50px;
		    line-height:50px;
		    font-size:26px;
		}
		.Menu ul li a span{
		    display:block;
		    text-align:center;
		    color:#000;
		    text-decoration:none;
		    background:none;
		    height:50px;
		    line-height:50px;
		    font-size:26px;
		}
		.Menu ul li a:hover{
		    color:#177cb7;
		    background:none;
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
	    		<ul class="nav navbar-nav">
	    			<li><a href="#" style="color: #FFFFFF;">问卷库</a></li>
	    			<li><a href="#" style="color: #FFFFFF;">查看排行榜</a></li>
	    			<li><a href="#" style="color: #FFFFFF;">我的好友</a></li>
	    			<li><a href="#" style="color: #FFFFFF;">关于</a></li>
	    		</ul>
	    	</div>
	    	
		</div>
		
		<div class="btn-group pull-right">
			
			<button type="button" class="btn btn-default btn-lg navbar-btn dropdown-toggle" data-toggle="dropdown">
				<span class="glyphicon glyphicon-user">User</span>
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
	
	<div id="introduce">
		<h2>Nice to see you, ${user.nickName }</h2>
		<p class="lead">show the introduction</p>
	</div>
	<div class="Menu">
            <ul>
                <li><a href="#"><font class="icon_pre ficomoon icon-search"> 已创建的问卷</font></a></li>
                <li><a href="#"><span class="am-icon-file-o"> 待回答的问卷</span></a></li>
                <li><a href="#"><span class="am-icon-file-text-o"> 已回答的问卷</span></a></li>
                <li><a href="#"><span class="am-icon-file-o"> 邀请好友</span></a></li>
            </ul>
    </div>
	
	
</body>
</html>