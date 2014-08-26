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
}

strong, h1, h2, h3, h4 {
	font-family: 微软雅黑, 黑体;
}

th {
	word-break: keep-all;
	white-space: nowrap;
}
</style>
</head>
<body>
	<h4>
		<strong>多项目汇总</strong>（共<c:out value="${rowCount}" />行
            <c:if test="${pageCount > 1 }">，第${pageIndex+1 }页 &nbsp;/&nbsp;共${pageCount }页</c:if>）
	</h4>
	<table class="table table-hover table-striped table-bordered">
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
				int i = Integer.parseInt(request.getAttribute("currentPageStarted").toString());
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
            <c:if test="${pageCount > 1 }">
                <div class="row">
                    <div class="col-sm-2 pager">
                        <span>共<c:out value="${rowCount}" /> 行，第${pageIndex+1 }页 &nbsp;/&nbsp;共${pageCount }页
                        </span>
                    </div>
                    <div class="col-sm-8">
                        <ul class="pager">
                            <li class="${pageIndex <= 0 ? 'disabled' :'' }"><a
                                href="<s:url value='/projectsummary/full?p=${pageIndex - 1}' />">上一页</a></li>
                            <li class="${pageIndex + 1 >= pageCount ? 'disabled' :'' }"><a
                                href="<s:url value='/projectsummary/full?p=${pageIndex + 1}' />">下一页</a></li>
                        </ul>
                    </div>
                    <div class="col-sm-2">&nbsp;</div>
                </div>
            </c:if>
	<%@ include file="bottom.jsp"%>