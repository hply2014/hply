<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"
%><!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${page_title} - 工程项目核算系统</title>
    <!-- Bootstrap -->
    <link href="<s:url value="/assets/bootstrap/css/bootstrap.min.css" />" rel="stylesheet">
    <link href="<s:url value="/assets/bootstrap-datepicker/css/datepicker3.css" />" rel="stylesheet">
    <style type="text/css">  
		body{
			padding-top:50px;
			padding-bottom:20px;
		}
		.bs-docs-nav {
		  text-shadow: 0 -1px 0 rgba(0,0,0,.15);
		  border-color: #463265;
		  box-shadow: 0 1px 0 rgba(255,255,255,.1);
		}
		.bs-docs-nav .navbar-collapse {
		  border-color: #463265;
		}
		.bs-docs-nav .navbar-brand {
		  color: #fff;
		}
		.bs-docs-nav .navbar-nav > li > a {
		  color: #cdbfe3;
		}
		.bs-docs-nav .navbar-nav > li > a:hover {
		  color: #83b7e0;
		  text-decoration: underline;
		}
		.bs-docs-nav .navbar-nav > .active > a,
		.bs-docs-nav .navbar-nav > .active > a:hover {
		  color: #fff;
		  background-color: #555;
		}
		.bs-docs-nav .navbar-toggle {
		  border-color: #563d7c;
		}
		.bs-docs-nav .navbar-toggle:hover {
		  background-color: #463265;
		  border-color: #463265;
		}
		
		.main{
			width:100%;
			padding:10px;
		}
		.main form{
			width:600px;
		}
    </style>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="<s:url value="/assets/html5shiv.js" />"></script>
      <script src="<s:url value="/assets/respond.min.js" />"></script>
    <![endif]-->
  </head>
  <body> 
    <div class="navbar navbar-inverse navbar-fixed-top bs-docs-nav">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand hidden-sm">工程项目核算系统</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="#">工程核算</a></li>
            <li><a href="#">盖章管理</a></li>
            <li><a href="#">信息平台</a></li>
            <li><a href="#">系统管理</a></li>
          </ul>
		  <div class="navbar-form navbar-left">
			  <div class="form-group">
				<input type="text" class="form-control" placeholder="输入项目信息">
			  </div>
			  <button type="button" class="btn btn-warning">
				<span class="glyphicon glyphicon-search"></span>搜索</button>
		  </div>	
		  <div class="navbar-form pull-right">
			<div class="btn-group">
			  <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" title="在0000/00/00 00:00登录的">
				张梦　<span class="caret"></span>
			  </button>
			  <ul class="dropdown-menu pull-right" role="menu">
				<li><a href="#">锁定</a></li>
				<li><a href="<s:url value="/change-password.html" />"><i class="icon-tags"></i> 修改密码</a></li>
				<li class="divider"></li> 	
				<li><a href="#">问题反馈</a></li>
				<li><a href="#">关于</a></li>
				<li class="divider"></li>
				<li><a href="<s:url value="/logout.html" />"><i class=" icon-off">
					</i>注销</a></li>
			  </ul>
			</div>
		  </div>	<!-- pull-righ -->		
        </div>
      </div>
    </div>
	<div class="container main">
