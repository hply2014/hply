<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%><!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>项目信息 - 工程项目核算系统</title>

    <!-- Bootstrap -->
    <link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">  
		body{
			padding-top:60px;
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
				<li><a href="change-password.html"><i class="icon-tags"></i> 修改密码</a></li>
				<li class="divider"></li> 	
				<li><a href="#">问题反馈</a></li>
				<li><a href="#">关于</a></li>
				<li class="divider"></li>
				<li><a href="logout.html"><i class=" icon-off">
					</i>注销</a></li>
			  </ul>
			</div>
		  </div>	<!-- pull-righ -->		
        </div>
      </div>
    </div>
	<div class="container main">
	<button type="button" class="btn btn-success"> 新建项目 </button>
		<table class="table">
				<thead>
				  <tr>
					<th>序号</th>
					<th>时间</th>
					<th>项目信息</th>
					<th>合同金额</th>
					<th>结算金额</th>
					<th>管理费情况</th>
					<th>给甲方开发票情况</th>
					<th>从甲方收款情况</th>
					<th>工程发票情况</th>
					<th>支付工程款情况</th>
					<th>税金情况</th>
					<th>垫付资金情况</th>
					<th>型材（吨） </th>
				  </tr>
				</thead>
				<tbody>
				  <tr class="active">
					<td>1</td>
					<td>2014/4/25 23:40</td>
					<td>项目编号：00000<br/>项目名称：................<br/>合作单位：..............<br/>法人：....</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
				  </tr>
				  <tr>
					<td>2</td>
					<td>2014/4/25 23:40</td>
					<td>项目编号：00000<br/>项目名称：................<br/>合作单位：..............<br/>法人：....</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
				  </tr>
				  <tr class="success">
					<td>3</td>
					<td>2014/4/25 23:40</td>
					<td>项目编号：00000<br/>项目名称：................<br/>合作单位：..............<br/>法人：....</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
				  </tr>
				  <tr>
					<td>4</td>
					<td>2014/4/25 23:40</td>
					<td>项目编号：00000<br/>项目名称：................<br/>合作单位：..............<br/>法人：....</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
				  </tr>
				  <tr class="warning">
					<td>5</td>
					<td>2014/4/25 23:40</td>
					<td>项目编号：00000<br/>项目名称：................<br/>合作单位：..............<br/>法人：....</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
				  </tr>
				  <tr>
					<td>6</td>
					<td>2014/4/25 23:40</td>
					<td>项目编号：00000<br/>项目名称：................<br/>合作单位：..............<br/>法人：....</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
				  </tr>
				  <tr class="danger">
					<td>7</td>
					<td>2014/4/25 23:40</td>
					<td>项目编号：00000<br/>项目名称：................<br/>合作单位：..............<br/>法人：....</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
					<td>Column content</td>
				  </tr>
				</tbody>
			  </table>
		</div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="assets/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>