<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@page import="hply.core.*"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${page_title}-工程项目核算系统</title>
<link rel="stylesheet" href="<s:url value="/assets/bootstrap/css/bootstrap.min.css" />">
<link rel="stylesheet" href="<s:url value="/assets/bootstrap/css/bootstrap-theme1.min.css" />">
<link rel="stylesheet" href="<s:url value="/assets/bootstrap-datepicker/css/datepicker3.css" />">
<link rel="stylesheet" href="<s:url value="/assets/ui.fancytree.css" />">
<link rel="stylesheet" href="<s:url value="/assets/bootstrap-select/css/bootstrap-select.css" />">
<link rel="stylesheet" href="<s:url value="/assets/bootstrap-icheck/skins/all.css" />">
<link rel="stylesheet" href="<s:url value="/assets/select2/3.5.1/select2.css" />">
<link rel="stylesheet" href="<s:url value="/assets/select2/3.5.1/select2-bootstrap.css" />">

<script src="<s:url value="/assets/jquery.min.js" />"></script>
<script src="<s:url value="/assets/jquery-ui.min.js" />"></script>
<script src="<s:url value="/assets/bootstrap/js/bootstrap.min.js" />"></script>
<script src="<s:url value="/assets/select2/3.5.1/select2.min.js" />"></script>
<script src="<s:url value="/assets/select2/3.5.1/select2_locale_zh-CN.js" />"></script>
<!--[if lt IE 9]>
      <script src="<s:url value="/assets/html5shiv.js" />"></script>
      <script src="<s:url value="/assets/respond.min.js" />"></script>
    <![endif]-->

<style type="text/css">
body {
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

strong, h1, h2, h3, h4 {
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
	top: 120px;
}

.required-field-block {
	position: relative;
}

.required-field-block .required-icon {
	position: absolute;
	font-size: 150%;
	margin-left: -15px;
	margin-top: 5px;
	color: #a94442
}

.invalid input {
	background-color: #fff0f0
}

.success input {
	background-color: #f0fff0;
}

.bs-callout {
	padding: 20px;
	margin: 20px 0;
	border: 1px solid #eee;
	border-left-width: 5px;
	border-radius: 3px
}

.bs-callout h4 {
	margin-top: 0;
	margin-bottom: 5px
}

.bs-callout p:last-child {
	margin-bottom: 0
}

</style>
</head>
<body>
    <div class="container main">
        <div class="panel panel-info">
            <div class="panel-heading">
                <strong>${page_title}</strong>（
                <c:out value="${list.size()}" />
                条数据）
            </div>
            <div class="panel-body">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>时间</th>
                            <th>摘要</th>
                            <th>所在部门</th>
                            <th>项目编号</th>
                            <th>项目名称</th>
                            <th>合同金额</th>
                            <th>合同调增额</th>
                            <th>累计调增额</th>
                            <th>合同结算额</th>
                            <th>比率</th>
                            <th>应收管理费</th>
                            <th>实收管理费</th>
                            <th>累计收管理费</th>
                            <th>尚欠管理费</th>
                            <th>发票金额</th>
                            <th>累计开票</th>
                            <th>收款金额</th>
                            <th>累计收款</th>
                            <th>回收率</th>
                            <th>发票金额</th>
                            <th>累计开票</th>
                            <th>支付金额</th>
                            <th>累计</th>
                            <th>比率</th>
                            <th>应缴税金</th>
                            <th>已缴税金</th>
                            <th>累计已缴税金</th>
                            <th>尚欠税金</th>
                            <th>金额</th>
                            <th>预计用量</th>
                            <th>型材点</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        	int i = 0;
                        %>
                        <c:forEach items="${list}" var="projectSummary">
                            <tr>
                                <td><%=++i%></td>
                                <td><fmt:formatDate value="${projectSummary.trice}" pattern="yyyy-MM-dd" /></td>
                                <td><c:out value="${projectSummary.description}" /></td>
                                <td><c:out value="${projectSummary.organizationId}" /></td>
                                <td><c:out value="${projectSummary.projectCode}" /></td>
                                <td><c:out value="${projectSummary.projectName}" /></td>
                                <td><c:out value="${projectSummary.contractAmount}" /></td>
                                <td><c:out value="${projectSummary.changeAmount}" /></td>
                                <td><c:out value="${projectSummary.changeTotalAmount}" /></td>
                                <td><c:out value="${projectSummary.settlementAmount}" /></td>
                                <td><c:out value="${projectSummary.managementRate}" /></td>
                                <td><c:out value="${projectSummary.managementPlanAmount}" /></td>
                                <td><c:out value="${projectSummary.managementRealAmount}" /></td>
                                <td><c:out value="${projectSummary.managementTotalAmount}" /></td>
                                <td><c:out value="${projectSummary.managementOweAmount}" /></td>
                                <td><c:out value="${projectSummary.partyBillingAmount}" /></td>
                                <td><c:out value="${projectSummary.partyBillingTotalAmount}" /></td>
                                <td><c:out value="${projectSummary.collectionsAmount}" /></td>
                                <td><c:out value="${projectSummary.collectionsTotalAmount}" /></td>
                                <td><c:out value="${projectSummary.collectionsRate}" /></td>
                                <td><c:out value="${projectSummary.customerBillingAmount}" /></td>
                                <td><c:out value="${projectSummary.customerBillingTotalAmount}" /></td>
                                <td><c:out value="${projectSummary.paymentAmount}" /></td>
                                <td><c:out value="${projectSummary.paymentTotalAmount}" /></td>
                                <td><c:out value="${projectSummary.taxRate}" /></td>
                                <td><c:out value="${projectSummary.taxPlanAmount}" /></td>
                                <td><c:out value="${projectSummary.taxRealAmount}" /></td>
                                <td><c:out value="${projectSummary.taxTotalAmount}" /></td>
                                <td><c:out value="${projectSummary.taxOweAmount}" /></td>
                                <td><c:out value="${projectSummary.arrearsAmount}" /></td>
                                <td><c:out value="${projectSummary.expectedValue}" /></td>
                                <td><c:out value="${projectSummary.profilePoint}" /></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <%@ include file="bottom.jsp"%>