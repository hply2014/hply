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
	text-align: center
}

.amount {
	text-align: right;
}
</style>
</head>
<body>
    <h4>
        <strong>项目汇总</strong>（ 共
        <c:out value="${list.size()}" />
        行 ）
        <c:if test='${not empty orglist}'>
            <select id="orgSelect">
                <c:forEach items="${orglist}" var="org">
                    <option ${org.id == orgId ? 'selected' : '' } value="${org.id}">${org.organizationName}</option>
                </c:forEach>
            </select>&nbsp; </c:if>
        <select id="monthsSelect">
            <c:forEach items="${months}" var="str">
                <option ${pharse == str ? 'selected' : '' } value="${str}">${str }</option>
            </c:forEach>
        </select>&nbsp;<span id="offsetMonths">${dateRange }</span>
        
        <a href="<c:url value="/projectsummary/export?orgid=${orgId}&pharse=${pharse}" />" class="btn btn-info"><span
                        class="glyphicon glyphicon-floppy-save"></span>导出到Excel . . . </a>
    </h4>
    <table class="table table-hover table-striped table-bordered">
        <thead>
            <tr>
                <th rowspan="2">#</th>
                <th rowspan="2">时间</th>
                <th rowspan="2">摘要</th>
                <th colspan="6">项目信息</th>
                <th colspan="5">管理费情况</th>
                <th colspan="2">甲方开票情况</th>
                <th colspan="3">收款情况</th>
                <th colspan="2">客户开票情况</th>
                <th colspan="3">支付工程款情况</th>
                <th colspan="5">税金情况</th>
                <th rowspan="2">垫付资金</th>
                <th colspan="2">型材（吨）</th>
            </tr>
            <tr>
                <th>项目编号</th>
                <th>项目名称</th>
                <th>合同金额</th>
                <th>合同调增额</th>
                <th>累计调增额</th>
                <th>合同结算额</th>
                <th data-alias="管理费率">比率</th>
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
                <th data-alias="工程款">支付金额</th>
                <th data-alias="累计支付工程款">累计</th>
                <th>工程余额</th>
                <th data-alias="税率">比率</th>
                <th>应缴税金</th>
                <th>已缴税金</th>
                <th>累计已缴税金</th>
                <th>尚欠税金</th>
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
                    <td class="nowrap"><fmt:formatDate value="${projectSummary.trice}" pattern="yyyy-MM-dd" /></td>
                    <td><c:if test="${not empty projectSummary.description}">
                            <span data-toggle="tooltip" title="${projectSummary.description}"
                                class="glyphicon glyphicon-comment"></span>
                        </c:if></td>
                    <td class="nowrap"><c:out value="${projectSummary.projectCode}" /></td>
                    <td class="nowrap"><c:out value="${projectSummary.projectName}" /></td>
                    <td class="amount"><fmt:formatNumber value="${projectSummary.contractAmount}"
                            pattern="###,###,###,###,##0.00" /></td>
                    <td class="amount"><fmt:formatNumber value="${projectSummary.changeAmount}"
                            pattern="###,###,###,###,##0.00" /></td>
                    <td class="amount"><fmt:formatNumber value="${projectSummary.changeTotalAmount}"
                            pattern="###,###,###,###,##0.00" /></td>
                    <td class="amount"><fmt:formatNumber value="${projectSummary.settlementAmount}"
                            pattern="###,###,###,###,##0.00" /></td>
                    <td class="amount"><fmt:formatNumber value="${projectSummary.managementRate}" pattern="0.00" />%</td>
                    <td class="amount"><fmt:formatNumber value="${projectSummary.managementPlanAmount}"
                            pattern="###,###,###,###,##0.00" /></td>
                    <td class="amount"><fmt:formatNumber value="${projectSummary.managementRealAmount}"
                            pattern="###,###,###,###,##0.00" /></td>
                    <td class="amount"><fmt:formatNumber value="${projectSummary.managementTotalAmount}"
                            pattern="###,###,###,###,##0.00" /></td>
                    <td class="amount"><fmt:formatNumber value="${projectSummary.managementOweAmount}"
                            pattern="###,###,###,###,##0.00" /></td>
                    <td class="amount"><fmt:formatNumber value="${projectSummary.partyBillingAmount}"
                            pattern="###,###,###,###,##0.00" /></td>
                    <td class="amount"><fmt:formatNumber value="${projectSummary.partyBillingTotalAmount}"
                            pattern="###,###,###,###,##0.00" /></td>
                    <td class="amount"><fmt:formatNumber value="${projectSummary.collectionsAmount}"
                            pattern="###,###,###,###,##0.00" /></td>
                    <td class="amount"><fmt:formatNumber value="${projectSummary.collectionsTotalAmount}"
                            pattern="###,###,###,###,##0.00" /></td>
                    <td class="amount"><fmt:formatNumber value="${projectSummary.collectionsRate}" pattern="0.00" />%</td>
                    <td class="amount"><fmt:formatNumber value="${projectSummary.customerBillingAmount}"
                            pattern="###,###,###,###,##0.00" /></td>
                    <td class="amount"><fmt:formatNumber value="${projectSummary.customerBillingTotalAmount}"
                            pattern="###,###,###,###,##0.00" /></td>
                    <td class="amount"><fmt:formatNumber value="${projectSummary.paymentAmount}"
                            pattern="###,###,###,###,##0.00" /></td>
                    <td class="amount"><fmt:formatNumber value="${projectSummary.paymentTotalAmount}"
                            pattern="###,###,###,###,##0.00" /></td>
                    <td class="amount"><fmt:formatNumber
                            value="${projectSummary.collectionsTotalAmount - projectSummary.paymentTotalAmount}"
                            pattern="###,###,###,###,##0.00" /></td>
                    <td class="amount"><fmt:formatNumber value="${projectSummary.taxRate}" pattern="0.00" />%</td>
                    <td class="amount"><fmt:formatNumber value="${projectSummary.taxPlanAmount}"
                            pattern="###,###,###,###,##0.00" /></td>
                    <td class="amount"><fmt:formatNumber value="${projectSummary.taxRealAmount}"
                            pattern="###,###,###,###,##0.00" /></td>
                    <td class="amount"><fmt:formatNumber value="${projectSummary.taxTotalAmount}"
                            pattern="###,###,###,###,##0.00" /></td>
                    <td class="amount"><fmt:formatNumber value="${projectSummary.taxOweAmount}"
                            pattern="###,###,###,###,##0.00" /></td>
                    <td class="amount"><fmt:formatNumber value="${projectSummary.arrearsAmount}"
                            pattern="###,###,###,###,##0.00" /></td>
                    <td class="amount"><fmt:formatNumber value="${projectSummary.expectedValue}"
                            pattern="###,###,###,###,##0.00" /></td>
                    <td><c:out value="${projectSummary.profilePoint}" /></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <script type="text/javascript">
					$(function() {
						$("select").change(function() {
									//alert($("#orgSelect").val() + "," + $("#monthsSelect").val());
									self.location = "<s:url value='/projectsummary/full' />" + "?orgid=" + $("#orgSelect").val()
											+ "&pharse=" + $("#monthsSelect").val();

						});

						$("td.amount").hover(
								  function () {
									    var tds = $(this).parents("tr").children("td");
										var title = "[" + tds.eq(3).html() + "]" + tds.eq(4).html();
								    	$(this).wrapInner("<span title='" + title + "'></span>");
								    	$(this).children().popover('show');
								  },function () {
									  	$(this).children().popover('hide')
						});

					});
				</script>

    <%@ include file="bottom.jsp"%>