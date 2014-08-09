<%@page import="hply.core.*"%><%@ page isELIgnored="false"%><%@ 
taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ 
taglib
	uri="http://www.springframework.org/tags" prefix="s"%><%@ 
taglib
	uri="http://www.springframework.org/tags/form" prefix="sf"%><%@ 
taglib
	uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%><%@ 
page
	language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%><!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${page_title} - 工程项目核算系统</title>
<link rel="stylesheet" href="<s:url value="/assets/bootstrap/css/bootstrap.min.css" />">
<link rel="stylesheet" href="<s:url value="/assets/bootstrap-datepicker/css/datepicker3.css" />" >
<link rel="stylesheet" href="<s:url value="/assets/ui.fancytree.css" />">
<link rel="stylesheet" href="<s:url value="/assets/bootstrap-select/css/bootstrap-select.css" />">
<link rel="stylesheet" href="<s:url value="/assets/bootstrap-icheck/skins/all.css" />">
<script src="<s:url value="/assets/jquery.min.js" />"></script>
<script src="<s:url value="/assets/bootstrap/js/bootstrap.min.js" />"></script>
<script src="<s:url value="/assets/jquery-ui.min.js" />"></script>

<!--[if lt IE 9]>
      <script src="<s:url value="/assets/html5shiv.js" />"></script>
      <script src="<s:url value="/assets/respond.min.js" />"></script>
    <![endif]-->

<style type="text/css">
body {
	padding-top: 50px;
	padding-bottom: 20px;
}

.bs-docs-nav .navbar-collapse {
	border-color: #463265;
}

.bs-docs-nav .navbar-brand {
	color: #fff;
}

.bs-docs-nav .navbar-nav>li>a {
	color: #cdbfe3;
}

.bs-docs-nav .navbar-nav>li>a:hover {
	color: #83b7e0;
}

.bs-docs-nav .navbar-nav>.active>a, .bs-docs-nav .navbar-nav>.active>a:hover
	{
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

strong {
	font-family: 微软雅黑, 黑体;
}

.main {
	width: 100%;
	padding: 10px;
}

.fancytree-selected .fancytree-title {
	font-style: normal;
}

#fancytree1>ul.fancytree-container {
	border: none;
}

#warning {
	display: none;
}
#alert-error {
	position: absolute;
	top:120px;
}

.required-field-block {
    position: relative;   
}

.required-field-block .required-icon {
    position: absolute;
    font-size: 150%;
    margin-left:-15px;
    margin-top:5px;
    color:#a94442
}

.invalid input{
	background-color:#fff0f0
}

.valid input{background-color:#f0fff0;}
</style>
</head>
<body>
	<div class="navbar navbar-inverse navbar-fixed-top bs-docs-nav">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand hidden-sm" href="<s:url value="/" />">工程项目核算系统</a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<%
						request.setAttribute("navigationTree", SessionHelper.getMenuRoot().getChildren());
					%>
					<c:forEach items="${navigationTree}" var="root">
						<c:choose>
							<c:when test="${root.children.size() == 0}">
								<li title="${root.description }"><a
									href="<s:url value="${root.url }" />">${root.title }</a></li>
							</c:when>
							<c:otherwise>
								<li class="dropdown" title="${root.description }"><a
									href="javascript:void();" class="dropdown-toggle"
									data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false"> ${root.title } <span class="caret"></span>
								</a>
									<ul class="dropdown-menu" role="menu" aria-labelledby="drop2">
										<c:forEach items="${root.children}" var="node">
											<li role="presentation" title="${node.description }"><a
												role="menuitem" tabindex="-1"
												href="<s:url value="${node.url }" />">${node.title }</a></li>
										</c:forEach>
									</ul></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</ul>
				<div class="navbar-form navbar-left hidden">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="输入项目信息">
					</div>
					<button type="button" class="btn btn-warning">
						<span class="glyphicon glyphicon-search"></span>搜索
					</button>
				</div>
				<div class="navbar-form pull-right">
					<div class="btn-group">
						<button type="button" class="btn btn-primary dropdown-toggle"
							data-toggle="dropdown" title="在<%=SessionHelper.getLoginTime()%>登录的"><%=SessionHelper.getCurrentRealName()%><span class="caret"></span>
						</button>
						<ul class="dropdown-menu pull-right" role="menu">
							<li><a href="#">锁定</a></li>
							<li><a href="<s:url value="/password" />"><i
									class="icon-tags"></i> 修改密码</a></li>
							<li class="divider"></li>
							<li><a href="#">问题反馈</a></li>
							<li><a href="#">关于</a></li>
							<li class="divider"></li>
							<li><a href="<s:url value="/logout" />"><i
									class=" icon-off"> </i>注销</a></li>
						</ul>
					</div>
				</div>
				<!-- pull-righ -->
			</div>
		</div>
	</div>