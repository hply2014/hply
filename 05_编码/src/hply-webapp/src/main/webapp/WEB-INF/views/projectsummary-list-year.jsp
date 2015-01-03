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

<script src="<s:url value="/assets/jquery.min.js" />"></script>
<script src="<s:url value="/assets/jquery-ui.min.js" />"></script>
<script src="<s:url value="/assets/bootstrap/js/bootstrap.min.js" />"></script>
<!--[if lt IE 9]>
      <script src="<s:url value="/assets/html5shiv.js" />"></script>
      <script src="<s:url value="/assets/respond.min.js" />"></script>
    <![endif]-->

<style type="text/css">
body {
	padding: 10px;
	margin: 10px;
}

strong, h1, h2, h3, h4 {
	font-family: 微软雅黑, 黑体;
}

th, .nowrap {
	word-break: keep-all;
	white-space: nowrap;
}

th {
	text-align: center;
}

.amount {
	text-align: right;
}
</style>
</head>
<body>
    <h4>
        <strong>年度汇总报表</strong>（ 共
        <c:out value="${list.size()}" />
        行 ）
        <c:if test='${not empty orglist}'>
            <select id="orgSelect">
                <c:forEach items="${orglist}" var="org">
                    <option ${org.id == orgId ? 'selected' : '' } value="${org.id}">${org.organizationName}</option>
                </c:forEach>
            </select></c:if>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <a href="<c:url value="/projectsummary/export-year?orgid=${orgId}" />" class="btn btn-info"><span
                        class="glyphicon glyphicon-floppy-save"></span>导出到Excel . . . </a>
    </h4>
    <table class="table table-hover table-striped table-bordered">
        <thead>
            <tr>
                <th rowspan="2">年份</th>
                <th rowspan="2">工程数</th>
                <th rowspan="2">累计合同金额</th>
                <th rowspan="2">累计调增额</th>
                <th rowspan="2">合同结算额</th>
                <th rowspan="2">累计甲方开票</th>
                <th rowspan="2">累计收款</th>
                <th rowspan="2">累计客户开票</th>
                <th rowspan="2">累计支付工程款</th>
                <th rowspan="2">累计已缴税金</th>
                <th colspan="4">管理费及其他收入情况</th>
                <th rowspan="2">垫付资金</th>
                <th rowspan="2">型材（吨）</th>
            </tr>
            <tr>
                <th>应收管理费</th>
                <th>累计收管理费</th>
                <th>其他收入</th>
                <th>管理费及其他收入累计</th>
            </tr>
            <tr class="hidden">
                <th>年份</th>
                <th>工程数</th>
                <th>累计合同金额</th>
                <th>累计调增额</th>
                <th>合同结算额</th>
                <th>累计甲方开票</th>
                <th>累计收款</th>
                <th>累计客户开票</th>
                <th>累计支付工程款</th>
                <th>累计已缴税金</th>
                <th>应收管理费</th>
                <th>累计收管理费</th>
                <th>其他收入</th>
                <th>管理费及其他收入累计</th>
                <th>垫付资金</th>
                <th>型材（吨）</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${list}" var="projectSummary">
                <tr>
                <td class="nowrap">${projectSummary.field01}</td>
                <td class="amount">${projectSummary.field04}</td>
                    <td class="amount"><fmt:formatNumber value="${projectSummary.contractAmount}"
                            pattern="###,###,###,###,##0.00" /></td>
                    <td class="amount"><fmt:formatNumber value="${projectSummary.changeAmount}"
                            pattern="###,###,###,###,##0.00" /></td>
                    <td class="amount"><fmt:formatNumber value="${projectSummary.settlementAmount}"
                            pattern="###,###,###,###,##0.00" /></td>
                    <td class="amount"><fmt:formatNumber value="${projectSummary.partyBillingAmount}"
                            pattern="###,###,###,###,##0.00" /></td>
                    <td class="amount"><fmt:formatNumber value="${projectSummary.collectionsAmount}"
                            pattern="###,###,###,###,##0.00" /></td>
                    <td class="amount"><fmt:formatNumber value="${projectSummary.customerBillingAmount}"
                            pattern="###,###,###,###,##0.00" /></td>
                    <td class="amount"><fmt:formatNumber value="${projectSummary.paymentAmount}"
                            pattern="###,###,###,###,##0.00" /></td>
                    <td class="amount"><fmt:formatNumber value="${projectSummary.taxRealAmount}"
                            pattern="###,###,###,###,##0.00" /></td>
                    <td class="amount"><fmt:formatNumber value="${projectSummary.managementPlanAmount}"
                            pattern="###,###,###,###,##0.00" /></td>
                    <td class="amount"><fmt:formatNumber value="${projectSummary.managementRealAmount}"
                            pattern="###,###,###,###,##0.00" /></td>
                    <td class="amount"><fmt:formatNumber value="${projectSummary.field02}"
                            pattern="###,###,###,###,##0.00" /></td>
                    <td class="amount"><fmt:formatNumber value="${projectSummary.field03}"
                            pattern="###,###,###,###,##0.00" /></td>
                    <td class="amount"><fmt:formatNumber value="${projectSummary.arrearsAmount}"
                            pattern="###,###,###,###,##0.00" /></td>
                    <td class="amount"><fmt:formatNumber value="${projectSummary.expectedValue}"
                            pattern="###,###,###,###,##0.00" /></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <script type="text/javascript">
					$(function() {
						$("select").change(function() {
							var orgid = $("#orgSelect").val() || "${orgId}";
							///alert(orgid + "," + $("#monthsSelect").val());
							self.location = "<s:url value='/projectsummary/year' />" + "?orgid=" + orgid;

						});
					});
	</script>

    <%@ include file="bottom.jsp"%>