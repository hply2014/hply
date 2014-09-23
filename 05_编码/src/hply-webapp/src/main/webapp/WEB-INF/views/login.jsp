<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="hply.core.*"%>
<%@ page isELIgnored="false"%>
<%@ page trimDirectiveWhitespaces="true"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="<s:url value='/assets/favicon.png' />">
<title>登录 - 工程项目核算系统</title>

<!-- Bootstrap -->
<link href="<s:url value="/assets/bootstrap/css/bootstrap.min.css" />" rel="stylesheet" media="screen">
<style type="text/css">
body {
	padding-top: 140px;
	padding-bottom: 40px;
	background-color: #f5f5f5;
}

.jumbotron, h3 {
	width: 550px;
	margin: 0 auto;
}

h3 {
	padding-bottom: 30px;
	font-family: 微软雅黑, 黑体;
	font-weight: bold;
	text-align: center;
}

.bs-example {
	position: absolute;
	top: 15px;
	left: 15px;
}

.form-control {
	width: 80%;
}

.login-group {
	padding-left: 80px;
}

#footer a{
    font-size: 12px;
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

    <c:if test="${not empty message}">
        <div class="bs-example">
            <div class="alert alert-warning alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert">
                    <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                </button>
                <strong>${message}</strong>
            </div>
        </div>
        <!-- /example -->
    </c:if>
    <div class="container">
        <h3>工程项目核算系统</h3>
        <div class="jumbotron form-horizontal">
            <sf:form>
                <div class="form-group">
                    <label for="loginName" class="col-sm-2 control-label">用户</label>
                    <div class="col-sm-10">
                        <input id="loginName" type="text" class="form-control" name="loginName" value="${loginName}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="col-sm-2 control-label">密码</label>
                    <div class="col-sm-10">
                        <input id="password" type="password" class="form-control" name="password">
                    </div>
                </div>
                <div class="login-group">
                    <button class="btn btn-primary" type="submit" role="button">登 录 &raquo;</button>
                </div>
            </sf:form>
        </div>
    </div>
    <!-- /container -->
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="<s:url value="/assets/jquery.min.js" />"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<s:url value="/assets/bootstrap/js/bootstrap.min.js" />"></script>
    <script type="text/javascript">
					$(function() {
						if ($("#loginName").val() != "") {
							$("#password").focus().select();
						} else {
							$("#loginName").focus();
						}
					});
				</script>
    <div id="footer" class="navbar-fixed-bottom">
        <div class="pull-right"><a target="_blank" href="<s:url value='/assets/about.html' />" class="btn btn-link">Version 1.3.20140914</a></div>
    </div>
<div style="display:none">
<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?31adb78aa26ff9cfbbcef455ce2cac5e";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script></div>
</body>
</html>