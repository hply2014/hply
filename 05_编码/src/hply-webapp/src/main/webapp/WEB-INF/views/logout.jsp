<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%><!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>退出 - 工程项目核算系统</title>

    <!-- Bootstrap -->
    <link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css"> 
      body {
        padding-top: 50px;
      }
	  
	  .navbar-inverse .navbar-brand{
		color: #fff;
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
    <div class="navbar navbar-inverse navbar-fixed-top bs-docs-nav">
      <div class="container-fluid">
        <div class="navbar-header">
          <a class="navbar-brand hidden-sm">工程项目核算系统</a>
        </div>
      </div>
    </div>
    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron">
      <div class="container">
        <h1>退出成功。</h1>
        <p>您的所有操作已经提交，登录会话在服务器端已经完全释放。</p>
        <p><a class="btn btn-primary btn-lg" role="button" href="login.html">重新登录 &raquo;</a></p>
      </div>
    </div>
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