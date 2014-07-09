<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%><!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登录 - 工程项目核算系统</title>

    <!-- Bootstrap -->
    <link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <style type="text/css">
      body {
        padding-top: 140px;
        padding-bottom: 40px;
        background-color: #f5f5f5;
      }
	  .jumbotron, h3 {
		width: 550px;
		margin:0 auto; 
	  }
	  
	  h3{
		padding-bottom:30px;
		font-family:微软雅黑,黑体;
		font-weight:bold;
		// text-align:center;
	  }
	  
	  .form-control{
		width:80%;
	  }
	  .login-group{
		padding-left:80px;
	  }
	  

    </style>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="assets/html5shiv.js"></script>
      <script src="assets/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
    <div class="container">
		  <h3>工程项目核算系统</h3>
		<div class="jumbotron form-horizontal">
		  <div class="form-group">
			<label for="usrnm" class="col-sm-2 control-label">用户名</label>
			<div class="col-sm-10">
			  <input type="text" class="form-control" id="usrnm" placeholder="在这里输入用户登录名">
			</div>
		  </div>
		  <div class="form-group">
			<label for="psswrd" class="col-sm-2 control-label">密码</label>
			<div class="col-sm-10">
			  <input type="password" class="form-control" id="psswrd" placeholder="在这里输入密码">
			</div>
		  </div>
		  <div class="login-group"><a class="btn btn-primary" onclick="login()" role="button">登　录 &raquo;</a></div>
		</div>
    </div> <!-- /container -->
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="assets/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="assets/js/bootstrap.min.js"></script>
	<script>
		function login(){
			self.location = "index.html";
		}
	</script>
  </body>
</html>