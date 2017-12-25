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
<link rel="stylesheet" href="<s:url value="/assets/bootstrap-icheck/skins/all.css" />">
<link rel="stylesheet" href="<s:url value="/assets/select2/3.5.1/select2.css" />">
<link rel="stylesheet" href="<s:url value="/assets/select2/3.5.1/select2-bootstrap.css" />">

<script src="<s:url value="/assets/jquery.min.js" />"></script>
<script src="<s:url value="/assets/jquery-ui.min.js" />"></script>
<script src="<s:url value="/assets/bootstrap/js/bootstrap.min.js" />"></script>
<script src="<s:url value="/assets/select2/3.5.1/select2.min.js" />"></script>
<script src="<s:url value="/assets/select2/3.5.1/select2_locale_zh-CN.js" />"></script>
<script src="<s:url value="/assets/doT.min.js" />"></script>
<script src="<s:url value="/assets/utils.js" />"></script>
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
            <select class="select2" id="orgSelect">
                <c:forEach items="${orglist}" var="org">
                    <option ${org.id == orgId ? 'selected' : '' } value="${org.id}">${org.organizationName}</option>
                </c:forEach>
            </select>&nbsp; </c:if>
        <select class="select2" id="monthsSelect1">
            <c:forEach items="${months}" var="str">
                <option ${p1 == str ? 'selected' : '' } value="${str}">${str }</option>
            </c:forEach>
        </select> 至 <select class="select2" id="monthsSelect2">
            <c:forEach items="${months}" var="str">
                <option ${p2 == str ? 'selected' : '' } value="${str}">${str }</option>
            </c:forEach>
        </select>&nbsp;&nbsp;<span id="offsetMonths">${dateRange }</span>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <a href="<c:url value="/projectsummary/export?orgid=${orgId}&p1=${p1}&p2=${p2}" />" class="btn btn-danger"><span
                        class="glyphicon glyphicon-floppy-save"></span>导出到Excel . . . </a>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <a href="javascript:;" id="btn-setting" class="btn btn-info"><span
                        class="glyphicon glyphicon-cog"></span>设置列</a>
    </h4>
    <c:set var="rowspan" value="1"/>
   	<c:set var="colspanTotal" value="1"/>
   	<c:if test="${empty columns || fn:contains(columns,'trice') || fn:contains(columns,'description')}">
   		<c:if test="${empty columns || fn:contains(columns,'trice') }">
   			<c:set var="colspanTotal" value="${colspanTotal+1 }"/>
   		</c:if>
   		<c:if test="${empty columns || fn:contains(columns,'description') }">
   			<c:set var="colspanTotal" value="${colspanTotal+1 }"/>
   		</c:if>
   	</c:if>
   	<c:set var="colspan1" value="0"/>
   	<c:if test="${empty columns || fn:contains(columns,'projectCode') || fn:contains(columns,'projectName') || fn:contains(columns,'field03') || fn:contains(columns,'contractTaxRate') || fn:contains(columns,'contractAmount') || fn:contains(columns,'contractType') || fn:contains(columns,'contractDate') || fn:contains(columns,'changeTotalAmount') || fn:contains(columns,'settlementAmount')}">
   		<c:set var="rowspan" value="2"/>
   		<c:if test="${empty columns || fn:contains(columns,'projectCode') }">
   			<c:set var="colspanTotal" value="${colspanTotal+1 }"/>
   			<c:set var="colspan1" value="${colspan1+1 }"/>
   		</c:if>
   		<c:if test="${empty columns || fn:contains(columns,'projectName') }">
   			<c:set var="colspanTotal" value="${colspanTotal+1 }"/>
   			<c:set var="colspan1" value="${colspan1+1 }"/>
   		</c:if>
   		<c:if test="${empty columns || fn:contains(columns,'field03') }">
   			<c:set var="colspanTotal" value="${colspanTotal+1 }"/>
   			<c:set var="colspan1" value="${colspan1+1 }"/>
   		</c:if>
   		<c:if test="${empty columns || fn:contains(columns,'contractTaxRate') }">
   			<c:set var="colspanTotal" value="${colspanTotal+1 }"/>
   			<c:set var="colspan1" value="${colspan1+1 }"/>
   		</c:if>
   		<c:if test="${empty columns || fn:contains(columns,'contractAmount') }">
   			<c:set var="colspan1" value="${colspan1+1 }"/>
   		</c:if>
   		<c:if test="${empty columns || fn:contains(columns,'contractType') }">
   			<c:set var="colspan1" value="${colspan1+1 }"/>
   		</c:if>
   		<c:if test="${empty columns || fn:contains(columns,'contractDate') }">
   			<c:set var="colspan1" value="${colspan1+1 }"/>
   		</c:if>
   		<c:if test="${empty columns || fn:contains(columns,'changeTotalAmount') }">
   			<c:set var="colspan1" value="${colspan1+1 }"/>
   		</c:if>
   		<c:if test="${empty columns || fn:contains(columns,'settlementAmount') }">
   			<c:set var="colspan1" value="${colspan1+1 }"/>
   		</c:if>
   	</c:if>
   	<c:set var="colspan2" value="0"/>
   	<c:if test="${empty columns || fn:contains(columns,'partyBillingAmount') || fn:contains(columns,'partyBillingOutputTaxAmount') || fn:contains(columns,'partyBillingTotalAmount')}">
   		<c:set var="rowspan" value="2"/>
   		<c:if test="${empty columns || fn:contains(columns,'partyBillingAmount') }">
   			<c:set var="colspan2" value="${colspan2+1 }"/>
   		</c:if>
   		<c:if test="${empty columns || fn:contains(columns,'partyBillingOutputTaxAmount') }">
   			<c:set var="colspan2" value="${colspan2+1 }"/>
   		</c:if>
   		<c:if test="${empty columns || fn:contains(columns,'partyBillingTotalAmount') }">
   			<c:set var="colspan2" value="${colspan2+1 }"/>
   		</c:if>
   	</c:if>
   	<c:set var="colspan3" value="0"/>
   	<c:if test="${empty columns || fn:contains(columns,'collectionsTotalAmount') || fn:contains(columns,'collectionsRate')}">
   		<c:set var="rowspan" value="2"/>
   		<c:if test="${empty columns || fn:contains(columns,'collectionsTotalAmount') }">
   			<c:set var="colspan3" value="${colspan3+1 }"/>
   		</c:if>
   		<c:if test="${empty columns || fn:contains(columns,'collectionsRate') }">
   			<c:set var="colspan3" value="${colspan3+1 }"/>
   		</c:if>
   	</c:if>
   	<c:set var="colspan4" value="0"/>
   	<c:if test="${empty columns || fn:contains(columns,'customerBillingAmount') || fn:contains(columns,'customerBillingInputTaxAmount') || fn:contains(columns,'customerBillingTotalAmount')}">
   		<c:set var="rowspan" value="2"/>
   		<c:if test="${empty columns || fn:contains(columns,'customerBillingAmount') }">
   			<c:set var="colspan4" value="${colspan4+1 }"/>
   		</c:if>
   		<c:if test="${empty columns || fn:contains(columns,'customerBillingInputTaxAmount') }">
   			<c:set var="colspan4" value="${colspan4+1 }"/>
   		</c:if>
   		<c:if test="${empty columns || fn:contains(columns,'customerBillingTotalAmount') }">
   			<c:set var="colspan4" value="${colspan4+1 }"/>
   		</c:if>
   	</c:if>
   	<c:set var="colspan5" value="0"/>
   	<c:if test="${empty columns || fn:contains(columns,'paymentTotalAmount') || fn:contains(columns,'projectBalance')}">
   		<c:set var="rowspan" value="2"/>
   		<c:if test="${empty columns || fn:contains(columns,'paymentTotalAmount') }">
   			<c:set var="colspan5" value="${colspan5+1 }"/>
   		</c:if>
   		<c:if test="${empty columns || fn:contains(columns,'projectBalance') }">
   			<c:set var="colspan5" value="${colspan5+1 }"/>
   		</c:if>
   	</c:if>
   	<c:set var="colspan6" value="0"/>
   	<c:if test="${empty columns || fn:contains(columns,'taxBearingRate') || fn:contains(columns,'taxBearingAmount') || fn:contains(columns,'taxBearingRealAmount') || fn:contains(columns,'taxBearingTotalRealAmount') || fn:contains(columns,'taxPlanAmount') || fn:contains(columns,'paymentDifferentTaxAmount') || fn:contains(columns,'paymentTotalDifferentTaxAmount')}">
   		<c:set var="rowspan" value="2"/>
   		<c:if test="${empty columns || fn:contains(columns,'taxBearingRate') }">
   			<c:set var="colspan6" value="${colspan6+1 }"/>
   		</c:if>
   		<c:if test="${empty columns || fn:contains(columns,'taxBearingAmount') }">
   			<c:set var="colspan6" value="${colspan6+1 }"/>
   		</c:if>
   		<c:if test="${empty columns || fn:contains(columns,'taxBearingRealAmount') }">
   			<c:set var="colspan6" value="${colspan6+1 }"/>
   		</c:if>
   		<c:if test="${empty columns || fn:contains(columns,'taxBearingTotalRealAmount') }">
   			<c:set var="colspan6" value="${colspan6+1 }"/>
   		</c:if>
   		<c:if test="${empty columns || fn:contains(columns,'taxPlanAmount') }">
   			<c:set var="colspan6" value="${colspan6+1 }"/>
   		</c:if>
   		<c:if test="${empty columns || fn:contains(columns,'paymentDifferentTaxAmount') }">
   			<c:set var="colspan6" value="${colspan6+1 }"/>
   		</c:if>
   		<c:if test="${empty columns || fn:contains(columns,'paymentTotalDifferentTaxAmount') }">
   			<c:set var="colspan6" value="${colspan6+1 }"/>
   		</c:if>
   	</c:if>
   	<c:set var="colspan7" value="0"/>
   	<c:if test="${empty columns || fn:contains(columns,'managementRate') || fn:contains(columns,'managementPlanAmount') || fn:contains(columns,'managementRealAmount') || fn:contains(columns,'managementTotalAmount') || fn:contains(columns,'managementOweAmount') || fn:contains(columns,'field01') || fn:contains(columns,'field02')}">
   		<c:set var="rowspan" value="2"/>
   		<c:if test="${empty columns || fn:contains(columns,'managementRate') }">
   			<c:set var="colspan7" value="${colspan7+1 }"/>
   		</c:if>
   		<c:if test="${empty columns || fn:contains(columns,'managementPlanAmount') }">
   			<c:set var="colspan7" value="${colspan7+1 }"/>
   		</c:if>
   		<c:if test="${empty columns || fn:contains(columns,'managementRealAmount') }">
   			<c:set var="colspan7" value="${colspan7+1 }"/>
   		</c:if>
   		<c:if test="${empty columns || fn:contains(columns,'managementTotalAmount') }">
   			<c:set var="colspan7" value="${colspan7+1 }"/>
   		</c:if>
   		<c:if test="${empty columns || fn:contains(columns,'managementOweAmount') }">
   			<c:set var="colspan7" value="${colspan7+1 }"/>
   		</c:if>
   		<c:if test="${empty columns || fn:contains(columns,'field01') }">
   			<c:set var="colspan7" value="${colspan7+1 }"/>
   		</c:if>
   		<c:if test="${empty columns || fn:contains(columns,'field02') }">
   			<c:set var="colspan7" value="${colspan7+1 }"/>
   		</c:if>
   	</c:if>
   	<c:set var="colspan8" value="0"/>
   	<c:if test="${empty columns || fn:contains(columns,'expectedValueTon') || fn:contains(columns,'expectedValueSquareMeter') || fn:contains(columns,'profilePoint')}">
   		<c:set var="rowspan" value="2"/>
   		<c:if test="${empty columns || fn:contains(columns,'expectedValueTon') }">
   			<c:set var="colspan8" value="${colspan8+1 }"/>
   		</c:if>
   		<c:if test="${empty columns || fn:contains(columns,'expectedValueSquareMeter') }">
   			<c:set var="colspan8" value="${colspan8+1 }"/>
   		</c:if>
   		<c:if test="${empty columns || fn:contains(columns,'profilePoint') }">
   			<c:set var="colspan8" value="${colspan8+1 }"/>
   		</c:if>
   	</c:if>
    <table class="table table-hover table-striped table-bordered">
        <thead>
            <tr>
                <th rowspan="${rowspan }">#</th>
                <c:if test="${empty columns || fn:contains(columns,'trice') }"><th rowspan="${rowspan }">时间</th></c:if>
                <c:if test="${empty columns || fn:contains(columns,'description') }"><th rowspan="${rowspan }">摘要</th></c:if>
                <c:if test="${colspan1 > 0 }"><th colspan="${colspan1 }">项目信息</th></c:if>
                <c:if test="${colspan2 > 0 }"><th colspan="${colspan2 }">甲方开票情况</th></c:if>
                <c:if test="${colspan3 > 0 }"><th colspan="${colspan3 }">收款情况</th></c:if>
                <c:if test="${colspan4 > 0 }"><th colspan="${colspan4 }">客户开票情况</th></c:if>
                <c:if test="${colspan5 > 0 }"><th colspan="${colspan5 }">支付工程款情况</th></c:if>
                <c:if test="${colspan6 > 0 }"><th colspan="${colspan6 }">税金情况</th></c:if>
                <c:if test="${colspan7 > 0 }"><th colspan="${colspan7 }">管理费及其他收入情况</th></c:if>
                <c:if test="${empty columns || fn:contains(columns,'arrearsAmount') }"><th rowspan="${rowspan }">往来欠款</th></c:if>
                <c:if test="${colspan8 > 0 }"><th colspan="${colspan8 }">型材</th></c:if>
            </tr>
            <tr>
            	<c:if test="${colspan1 > 0 }">
                <c:if test="${empty columns || fn:contains(columns,'projectCode') }"><th>项目编号</th></c:if>
                <c:if test="${empty columns || fn:contains(columns,'projectName') }"><th>项目名称</th></c:if>
                <c:if test="${empty columns || fn:contains(columns,'field03') }"><th>项目实施人</th></c:if>
                <c:if test="${empty columns || fn:contains(columns,'contractTaxRate') }"><th>合同税率</th></c:if>
                <c:if test="${empty columns || fn:contains(columns,'contractAmount') }"><th>合同金额</th></c:if>
                <c:if test="${empty columns || fn:contains(columns,'contractType') }"><th>合同分类</th></c:if>
                <c:if test="${empty columns || fn:contains(columns,'contractDate') }"><th>合同签订日期</th></c:if>
                <!-- <th>合同调增额</th>
                <th>累计调增额</th> -->
                <c:if test="${empty columns || fn:contains(columns,'changeTotalAmount') }"><th>合同调增额</th></c:if>
                <c:if test="${empty columns || fn:contains(columns,'settlementAmount') }"><th>合同结算额</th></c:if>
                </c:if>
                <c:if test="${colspan2 > 0 }">
                <c:if test="${empty columns || fn:contains(columns,'partyBillingAmount') }"><th>金额</th></c:if>
                <c:if test="${empty columns || fn:contains(columns,'partyBillingOutputTaxAmount') }"><th>销项税金</th></c:if>
                <c:if test="${empty columns || fn:contains(columns,'partyBillingTotalAmount') }"><th>累计开票</th></c:if>
                </c:if>
                <c:if test="${colspan3 > 0 }">
                <!-- <th>收款金额</th> -->
                <c:if test="${empty columns || fn:contains(columns,'collectionsTotalAmount') }"><th>累计收款</th></c:if>
                <c:if test="${empty columns || fn:contains(columns,'collectionsRate') }"><th>回款率</th></c:if>
                </c:if>
                <c:if test="${colspan4 > 0 }">
                <c:if test="${empty columns || fn:contains(columns,'customerBillingAmount') }"><th>金额</th></c:if>
                <c:if test="${empty columns || fn:contains(columns,'customerBillingInputTaxAmount') }"><th>进项税金</th></c:if>
                <c:if test="${empty columns || fn:contains(columns,'customerBillingTotalAmount') }"><th>累计开票</th></c:if>
                </c:if>
                <c:if test="${colspan5 > 0 }">
                <!-- <th>支付金额</th> -->
                <c:if test="${empty columns || fn:contains(columns,'paymentTotalAmount') }"><th>累计支付金额</th></c:if>
                <c:if test="${empty columns || fn:contains(columns,'projectBalance') }"><th>工程余额</th></c:if>
                </c:if>
                <c:if test="${colspan6 > 0 }">
                <%-- <c:if test="${empty columns || fn:contains(columns,'taxRate') }"><th>实际税负率</th></c:if> --%>
                <c:if test="${empty columns || fn:contains(columns,'taxBearingRate') }"><th>税负率</th></c:if>
                <c:if test="${empty columns || fn:contains(columns,'taxBearingAmount') }"><th>应收税负率税金</th></c:if>
                <c:if test="${empty columns || fn:contains(columns,'taxBearingRealAmount') }"><th>当期已收税负率税金</th></c:if>
                <c:if test="${empty columns || fn:contains(columns,'taxBearingTotalRealAmount') }"><th>累计已收税负率税金</th></c:if>
				<c:if test="${empty columns || fn:contains(columns,'taxPlanAmount') }"><th>应缴税金</th></c:if>
                <c:if test="${empty columns || fn:contains(columns,'paymentDifferentTaxAmount') }"><th>当期异地已缴税金</th></c:if>
                <c:if test="${empty columns || fn:contains(columns,'paymentTotalDifferentTaxAmount') }"><th>累计异地已缴税金</th></c:if>
                <%--
                <th>已缴税金</th>
                <c:if test="${empty columns || fn:contains(columns,'taxTotalAmount') }"><th>累计已缴税金</th></c:if>
                 --%>
                <!-- <th>尚欠税金</th> -->
                </c:if>
                <c:if test="${colspan7 > 0 }">
                <c:if test="${empty columns || fn:contains(columns,'managementRate') }"><th>比率</th></c:if>
                <c:if test="${empty columns || fn:contains(columns,'managementPlanAmount') }"><th>应收管理费</th></c:if>
                <c:if test="${empty columns || fn:contains(columns,'managementRealAmount') }"><th>本期收管理费</th></c:if>
                <c:if test="${empty columns || fn:contains(columns,'managementTotalAmount') }"><th>累计收管理费</th></c:if>
                <c:if test="${empty columns || fn:contains(columns,'managementOweAmount') }"><th>尚欠管理费</th></c:if>
                <c:if test="${empty columns || fn:contains(columns,'field01') }"><th>其他收入</th></c:if>
                <c:if test="${empty columns || fn:contains(columns,'field02') }"><th>总计</th></c:if>
                </c:if>
                <c:if test="${colspan8 > 0 }">
                <c:if test="${empty columns || fn:contains(columns,'expectedValueTon') }"><th>预计用量（吨）</th></c:if>
                <c:if test="${empty columns || fn:contains(columns,'expectedValueSquareMeter') }"><th>预计用量（平米）</th></c:if>
                <c:if test="${empty columns || fn:contains(columns,'profilePoint') }"><th>型材点</th></c:if>
                </c:if>
            </tr>
            <tr class="hidden">
                <th>序号</th>
                <c:if test="${empty columns || fn:contains(columns,'trice') }"><th>时间</th></c:if>
                <c:if test="${empty columns || fn:contains(columns,'description') }"><th>摘要</th></c:if>
                <c:if test="${colspan1 > 0 }">
	                <c:if test="${empty columns || fn:contains(columns,'projectCode') }"><th>项目编号</th></c:if>
	                <c:if test="${empty columns || fn:contains(columns,'projectName') }"><th>项目名称</th></c:if>
	                <c:if test="${empty columns || fn:contains(columns,'field03') }"><th>项目实施人</th></c:if>
	                <c:if test="${empty columns || fn:contains(columns,'contractTaxRate') }"><th>合同税率</th></c:if>
	                <c:if test="${empty columns || fn:contains(columns,'contractAmount') }"><th>合同金额</th></c:if>
	                <c:if test="${empty columns || fn:contains(columns,'contractType') }"><th>合同分类</th></c:if>
	                <c:if test="${empty columns || fn:contains(columns,'contractDate') }"><th>合同签订日期</th></c:if>
	                <!-- <th>合同调增额</th>
	                <th>累计调增额</th> -->
	                <c:if test="${empty columns || fn:contains(columns,'changeTotalAmount') }"><th>合同调增额</th></c:if>
                	<c:if test="${empty columns || fn:contains(columns,'settlementAmount') }"><th>合同结算额</th></c:if>
                </c:if>
                <c:if test="${colspan2 > 0 }">
	                <c:if test="${empty columns || fn:contains(columns,'partyBillingAmount') }"><th>金额</th></c:if>
	                <c:if test="${empty columns || fn:contains(columns,'partyBillingOutputTaxAmount') }"><th>销项税金</th></c:if>
	                <c:if test="${empty columns || fn:contains(columns,'partyBillingTotalAmount') }"><th>累计开票</th></c:if>
                </c:if>
                <c:if test="${colspan3 > 0 }">
	                <!-- <th>收款金额</th> -->
	                <c:if test="${empty columns || fn:contains(columns,'collectionsTotalAmount') }"><th>累计收款</th></c:if>
	                <c:if test="${empty columns || fn:contains(columns,'collectionsRate') }"><th>回款率</th></c:if>
                </c:if>
                <c:if test="${colspan4 > 0 }">
	                <c:if test="${empty columns || fn:contains(columns,'customerBillingAmount') }"><th>金额</th></c:if>
	                <c:if test="${empty columns || fn:contains(columns,'customerBillingInputTaxAmount') }"><th>进项税金</th></c:if>
	                <c:if test="${empty columns || fn:contains(columns,'customerBillingTotalAmount') }"><th>累计开票</th></c:if>
                </c:if>
                <c:if test="${colspan5 > 0 }">
	                <!-- <th>支付金额</th> -->
	                <c:if test="${empty columns || fn:contains(columns,'paymentTotalAmount') }"><th>累计支付金额</th></c:if>
	                <c:if test="${empty columns || fn:contains(columns,'projectBalance') }"><th>工程余额</th></c:if>
                </c:if>
                <c:if test="${colspan6 > 0 }">
	                <%-- <c:if test="${empty columns || fn:contains(columns,'taxRate') }"><th>比率</th></c:if> --%>
	                <c:if test="${empty columns || fn:contains(columns,'taxBearingRate') }"><th>税负率</th></c:if>
	                <c:if test="${empty columns || fn:contains(columns,'taxBearingAmount') }"><th>应收税负率税金</th></c:if>
	                <c:if test="${empty columns || fn:contains(columns,'taxBearingRealAmount') }"><th>当期已收税负率税金</th></c:if>
	                <c:if test="${empty columns || fn:contains(columns,'taxBearingTotalRealAmount') }"><th>累计已收税负率税金</th></c:if>
	                <c:if test="${empty columns || fn:contains(columns,'taxPlanAmount') }"><th>应缴税金</th></c:if>
                	<c:if test="${empty columns || fn:contains(columns,'paymentDifferentTaxAmount') }"><th>当期异地已缴税金</th></c:if>
                	<c:if test="${empty columns || fn:contains(columns,'paymentTotalDifferentTaxAmount') }"><th>累计异地已缴税金</th></c:if>
	                <!-- <th>已缴税金</th>
	                <c:if test="${empty columns || fn:contains(columns,'taxTotalAmount') }"><th>累计已缴税金</th></c:if> -->
	                <!-- <th>尚欠税金</th> -->
                </c:if>
                <c:if test="${colspan7 > 0 }">
	                <c:if test="${empty columns || fn:contains(columns,'managementRate') }"><th>比率</th></c:if>
	                <c:if test="${empty columns || fn:contains(columns,'managementPlanAmount') }"><th>应收管理费</th></c:if>
	                <c:if test="${empty columns || fn:contains(columns,'managementRealAmount') }"><th>本期收管理费</th></c:if>
	                <c:if test="${empty columns || fn:contains(columns,'managementTotalAmount') }"><th>累计收管理费</th></c:if>
	                <c:if test="${empty columns || fn:contains(columns,'managementOweAmount') }"><th>尚欠管理费</th></c:if>
	                <c:if test="${empty columns || fn:contains(columns,'field01') }"><th>其他收入</th></c:if>
	                <c:if test="${empty columns || fn:contains(columns,'field02') }"><th>总计</th></c:if>
                </c:if>
                <c:if test="${colspan8 > 0 }">
	                <c:if test="${empty columns || fn:contains(columns,'expectedValueTon') }"><th>预计用量（吨）</th></c:if>
	                <c:if test="${empty columns || fn:contains(columns,'expectedValueSquareMeter') }"><th>预计用量（平米）</th></c:if>
	                <c:if test="${empty columns || fn:contains(columns,'profilePoint') }"><th>型材点</th></c:if>
                </c:if>
            </tr>
        </thead>
        <tbody>
            <%
            	int i = 0;
            %>
            <c:forEach items="${list}" var="projectSummary">
                <tr>
                    <td><%=++i%></td>
                    <c:if test="${empty columns || fn:contains(columns,'trice') }"><td class="nowrap"><fmt:formatDate value="${projectSummary.trice}" pattern="yyyy-MM-dd" /></td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'description') }"><td><c:if test="${not empty projectSummary.description}">
                            <span data-toggle="tooltip" title="${projectSummary.description}"
                                class="glyphicon glyphicon-comment"></span>
                        </c:if></td></c:if>
            		<c:if test="${colspan1 > 0 }">
                    <c:if test="${empty columns || fn:contains(columns,'projectCode') }"><td class="nowrap"><c:out value="${projectSummary.projectCode}" /></td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'projectName') }"><td class="nowrap" id="projectName"><c:out value="${projectSummary.projectName}" /></td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'field03') }"><td class="nowrap"><c:out value="${projectSummary.field03}" /></td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'contractTaxRate') }"><td class="nowrap"><c:out value="${projectSummary.contractTaxRate}" /></td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'contractAmount') }"><td class="amount"><fmt:formatNumber value="${projectSummary.contractAmount}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'contractType') }"><td class="nowrap"><c:out value="${projectSummary.contractType}" /></td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'contractDate') }"><td class="nowrap"><fmt:formatDate value="${projectSummary.contractDate}" pattern="yyyy-MM-dd" /></td></c:if>
                    <%-- <td class="amount"><fmt:formatNumber value="${projectSummary.changeAmount}"
                            pattern="###,###,###,###,##0.00" /></td>
                    <td class="amount"><fmt:formatNumber value="${projectSummary.changeTotalAmount}"
                            pattern="###,###,###,###,##0.00" /></td> --%>
                    <c:if test="${empty columns || fn:contains(columns,'changeTotalAmount') }"><td class="amount"><fmt:formatNumber value="${projectSummary.changeTotalAmount}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'settlementAmount') }"><td class="amount"><fmt:formatNumber value="${projectSummary.settlementAmount}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    </c:if>
            		<c:if test="${colspan2 > 0 }">
                    <c:if test="${empty columns || fn:contains(columns,'partyBillingAmount') }"><td class="amount"><fmt:formatNumber value="${projectSummary.partyBillingAmount}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'partyBillingOutputTaxAmount') }"><td class="amount"><fmt:formatNumber value="${projectSummary.partyBillingOutputTaxAmount}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'partyBillingTotalAmount') }"><td class="amount"><fmt:formatNumber value="${projectSummary.partyBillingTotalAmount}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    </c:if>
            		<c:if test="${colspan3 > 0 }">
                    <%-- <td class="amount"><fmt:formatNumber value="${projectSummary.collectionsAmount}"
                            pattern="###,###,###,###,##0.00" /></td> --%>
                    <c:if test="${empty columns || fn:contains(columns,'collectionsTotalAmount') }"><td class="amount"><fmt:formatNumber value="${projectSummary.collectionsTotalProjectAmount+projectSummary.collectionsTotalIncomeAmount}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'collectionsRate') }"><td class="amount"><fmt:formatNumber value="${projectSummary.collectionsRate}" pattern="0.00" />%</td></c:if>
                    </c:if>
            		<c:if test="${colspan4 > 0 }">
                    <c:if test="${empty columns || fn:contains(columns,'customerBillingAmount') }"><td class="amount"><fmt:formatNumber value="${projectSummary.customerBillingAmount}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'customerBillingInputTaxAmount') }"><td class="amount"><fmt:formatNumber value="${projectSummary.customerBillingInputTaxAmount}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'customerBillingTotalAmount') }"><td class="amount"><fmt:formatNumber value="${projectSummary.customerBillingTotalAmount}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    </c:if>
            		<c:if test="${colspan5 > 0 }">
                    <%-- <td class="amount"><fmt:formatNumber value="${projectSummary.paymentAmount}"
                            pattern="###,###,###,###,##0.00" /></td> --%>
                    <c:if test="${empty columns || fn:contains(columns,'paymentTotalAmount') }"><td class="amount"><fmt:formatNumber value="${projectSummary.paymentTotalAmount}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'projectBalance') }"><td class="amount"><fmt:formatNumber
                            value="${projectSummary.collectionsTotalProjectAmount+projectSummary.collectionsTotalIncomeAmount - projectSummary.paymentTotalAmount}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    </c:if>
            		<c:if test="${colspan6 > 0 }">
                    <c:if test="${empty columns || fn:contains(columns,'taxBearingRate') }"><td class="amount"><fmt:formatNumber value="${projectSummary.taxBearingRate}" pattern="0.00" />%</td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'taxBearingAmount') }"><td class="amount"><fmt:formatNumber value="${projectSummary.taxBearingAmount}" 
                    		pattern="###,###,###,###,##0.00" /></td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'taxBearingRealAmount') }"><td class="amount"><fmt:formatNumber value="${projectSummary.taxBearingRealAmount}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'taxBearingTotalRealAmount') }"><td class="amount"><fmt:formatNumber value="${projectSummary.taxBearingTotalRealAmount}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'taxPlanAmount') }"><td class="amount"><fmt:formatNumber value="${projectSummary.taxPlanAmount}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'paymentDifferentTaxAmount') }"><td class="amount"><fmt:formatNumber value="${projectSummary.paymentDifferentTaxAmount}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'paymentTotalDifferentTaxAmount') }"><td class="amount"><fmt:formatNumber value="${projectSummary.paymentTotalDifferentTaxAmount}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    <%-- <td class="amount"><fmt:formatNumber value="${projectSummary.taxRealAmount}"
                            pattern="###,###,###,###,##0.00" /></td>
                    <c:if test="${empty columns || fn:contains(columns,'taxTotalAmount') }"><td class="amount"><fmt:formatNumber value="${projectSummary.taxTotalAmount}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    <td class="amount"><fmt:formatNumber value="${projectSummary.taxOweAmount}"
                            pattern="###,###,###,###,##0.00" /></td> --%>
                    </c:if>
            		<c:if test="${colspan7 > 0 }">
                    <c:if test="${empty columns || fn:contains(columns,'managementRate') }"><td class="amount"><fmt:formatNumber value="${projectSummary.managementRate}" pattern="0.00" />%</td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'managementPlanAmount') }"><td class="amount"><fmt:formatNumber value="${projectSummary.managementPlanAmount}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'managementRealAmount') }"><td class="amount"><fmt:formatNumber value="${projectSummary.managementRealAmount}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'managementTotalAmount') }"><td class="amount"><fmt:formatNumber value="${projectSummary.managementTotalAmount}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'managementOweAmount') }"><td class="amount"><fmt:formatNumber value="${projectSummary.managementOweAmount}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'field01') }"><td class="amount"><fmt:formatNumber value="${projectSummary.field01}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'field02') }"><td class="amount"><fmt:formatNumber value="${projectSummary.field02}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    </c:if>
                    <c:if test="${empty columns || fn:contains(columns,'arrearsAmount') }"><td class="amount"><fmt:formatNumber value="${projectSummary.arrearsAmount}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
            		<c:if test="${colspan8 > 0 }">
                    <c:if test="${empty columns || fn:contains(columns,'expectedValueTon') }"><td class="amount"><fmt:formatNumber value="${projectSummary.expectedValueTon}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'expectedValueSquareMeter') }"><td class="amount"><fmt:formatNumber value="${projectSummary.expectedValueSquareMeter}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'profilePoint') }"><td><c:out value="${projectSummary.profilePoint}" /></td></c:if>
                    </c:if>
                </tr>
            </c:forEach><tr class="total">
                    <th colspan="${colspanTotal }" style="text-align: right"><c:out value="${projectSummaryTotal.projectName}" /></th>
                    <c:if test="${colspan1 > 0 }">
                    <c:if test="${empty columns || fn:contains(columns,'contractAmount') }"><td class="amount"><fmt:formatNumber value="${projectSummaryTotal.contractAmount}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'contractType') }"><td></td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'contractDate') }"><td></td></c:if>
                    <%-- <td class="amount"><fmt:formatNumber value="${projectSummaryTotal.changeAmount}"
                            pattern="###,###,###,###,##0.00" /></td> --%>
                    <c:if test="${empty columns || fn:contains(columns,'changeTotalAmount') }"><td class="amount"><fmt:formatNumber value="${projectSummaryTotal.changeTotalAmount}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'settlementAmount') }"><td class="amount"><fmt:formatNumber value="${projectSummaryTotal.settlementAmount}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    </c:if>
            		<c:if test="${colspan2 > 0 }">
                    <c:if test="${empty columns || fn:contains(columns,'partyBillingAmount') }"><td class="amount"><fmt:formatNumber value="${projectSummaryTotal.partyBillingAmount}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'partyBillingOutputTaxAmount') }"><td class="amount"><fmt:formatNumber value="${projectSummaryTotal.partyBillingOutputTaxAmount}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'partyBillingTotalAmount') }"><td class="amount"><fmt:formatNumber value="${projectSummaryTotal.partyBillingTotalAmount}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    </c:if>
            		<c:if test="${colspan3 > 0 }">
                    <%-- <td class="amount"><fmt:formatNumber value="${projectSummaryTotal.collectionsAmount}"
                            pattern="###,###,###,###,##0.00" /></td> --%>
                    <c:if test="${empty columns || fn:contains(columns,'collectionsTotalAmount') }"><td class="amount"><fmt:formatNumber value="${projectSummaryTotal.collectionsTotalProjectAmount+projectSummaryTotal.collectionsTotalIncomeAmount}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'collectionsRate') }"><td class="amount"></td></c:if>
                    </c:if>
            		<c:if test="${colspan4 > 0 }">
                    <c:if test="${empty columns || fn:contains(columns,'customerBillingAmount') }"><td class="amount"><fmt:formatNumber value="${projectSummaryTotal.customerBillingAmount}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'customerBillingInputTaxAmount') }"><td class="amount"><fmt:formatNumber value="${projectSummaryTotal.customerBillingInputTaxAmount}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'customerBillingTotalAmount') }"><td class="amount"><fmt:formatNumber value="${projectSummaryTotal.customerBillingTotalAmount}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    </c:if>
            		<c:if test="${colspan5 > 0 }">
                    <%-- <td class="amount"><fmt:formatNumber value="${projectSummaryTotal.paymentAmount}"
                            pattern="###,###,###,###,##0.00" /></td> --%>
                    <c:if test="${empty columns || fn:contains(columns,'paymentTotalAmount') }"><td class="amount"><fmt:formatNumber value="${projectSummaryTotal.paymentTotalAmount}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'projectBalance') }"><td class="amount"><fmt:formatNumber
                            value="${projectSummaryTotal.collectionsTotalProjectAmount+projectSummaryTotal.collectionsTotalIncomeAmount - projectSummaryTotal.paymentTotalAmount}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    </c:if>
            		<c:if test="${colspan6 > 0 }">
                    <c:if test="${empty columns || fn:contains(columns,'taxBearingRate') }"><td class="amount"></td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'taxBearingAmount') }"><td class="amount"><fmt:formatNumber value="${projectSummaryTotal.taxBearingAmount}" 
                    		pattern="###,###,###,###,##0.00" /></td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'taxBearingRealAmount') }"><td class="amount"><fmt:formatNumber value="${projectSummaryTotal.taxBearingRealAmount}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'taxBearingTotalRealAmount') }"><td class="amount"><fmt:formatNumber value="${projectSummaryTotal.taxBearingTotalRealAmount}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'taxPlanAmount') }"><td class="amount"><fmt:formatNumber value="${projectSummaryTotal.taxPlanAmount}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'paymentDifferentTaxAmount') }"><td class="amount"><fmt:formatNumber value="${projectSummaryTotal.paymentDifferentTaxAmount}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'paymentTotalDifferentTaxAmount') }"><td class="amount"><fmt:formatNumber value="${projectSummaryTotal.paymentTotalDifferentTaxAmount}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    <%-- <td class="amount"><fmt:formatNumber value="${projectSummaryTotal.taxRealAmount}"
                            pattern="###,###,###,###,##0.00" /></td>
                    <c:if test="${empty columns || fn:contains(columns,'taxTotalAmount') }"><td class="amount"><fmt:formatNumber value="${projectSummaryTotal.taxTotalAmount}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    <td class="amount"><fmt:formatNumber value="${projectSummaryTotal.taxOweAmount}"
                            pattern="###,###,###,###,##0.00" /></td> --%>
                    </c:if>
            		<c:if test="${colspan7 > 0 }">
                    <c:if test="${empty columns || fn:contains(columns,'managementRate') }"><td class="amount"></td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'managementPlanAmount') }"><td class="amount"><fmt:formatNumber value="${projectSummaryTotal.managementPlanAmount}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'managementRealAmount') }"><td class="amount"><fmt:formatNumber value="${projectSummaryTotal.managementRealAmount}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'managementTotalAmount') }"><td class="amount"><fmt:formatNumber value="${projectSummaryTotal.managementTotalAmount}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'managementOweAmount') }"><td class="amount"><fmt:formatNumber value="${projectSummaryTotal.managementOweAmount}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'field01') }"><td class="amount"><fmt:formatNumber value="${projectSummaryTotal.field01}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'field02') }"><td class="amount"><fmt:formatNumber value="${projectSummaryTotal.field02}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    </c:if>
                    <c:if test="${empty columns || fn:contains(columns,'arrearsAmount') }"><td class="amount"><fmt:formatNumber value="${projectSummaryTotal.arrearsAmount}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
            		<c:if test="${colspan8 > 0 }">
                    <c:if test="${empty columns || fn:contains(columns,'expectedValueTon') }"><td class="amount"><fmt:formatNumber value="${projectSummaryTotal.expectedValueTon}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'expectedValueSquareMeter') }"><td class="amount"><fmt:formatNumber value="${projectSummaryTotal.expectedValueSquareMeter}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'profilePoint') }"><td></td></c:if>
                    </c:if>
                </tr>
        </tbody>
    </table>
    <script type="text/template" charset="utf-8" id='settingTemplate'>
    	<form class="form-horizontal" role="form">
        	<div class="row">
        		<div class="col-sm-12">
        			<div class="row">
		                <div class="col-sm-6 checkbox">
		                    <input type="checkbox" class="icheckbox" id="selectAll"/>
		                    <label for="selectAll">全选</label>
		                    <p class="help-block" />
		            	</div>
		            </div>
		        	<div class="row">
		                <div class="col-sm-6 checkbox">
		                    <input type="checkbox" class="icheckbox check-item" id="trice" value="时间"/>
		                    <label for="trice">时间</label>
		            	</div>
		                <div class="col-sm-6 checkbox">
		                    <input type="checkbox" class="icheckbox check-item" id="description" value="摘要" />
		                    <label for="description">摘要</label>
		            	</div>
        			</div>
					<div class="panel panel-default" style="margin-top: 10px;margin-bottom: 0px;">
					  	<div class="panel-heading">项目信息</div>
					  	<div class="panel-body">
				        	<div class="row">
				                <div class="col-sm-6 checkbox">
				                    <input type="checkbox" class="icheckbox check-item" id="projectCode" value="项目编号" />
				                    <label for="projectCode">项目编号</label>
				            	</div>
				                <div class="col-sm-6 checkbox">
				                    <input type="checkbox" class="icheckbox check-item" id="projectName" value="项目名称" />
				                    <label for="projectName">项目名称</label>
				            	</div>
		        			</div>
				        	<div class="row">
				                <div class="col-sm-6 checkbox">
				                    <input type="checkbox" class="icheckbox check-item" id="field03" value="项目实施人" />
				                    <label for="field03">项目实施人</label>
				            	</div>
				                <div class="col-sm-6 checkbox">
				                    <input type="checkbox" class="icheckbox check-item" id="contractTaxRate" value="合同税率" />
				                    <label for="contractTaxRate">合同税率</label>
				            	</div>
		        			</div>
				        	<div class="row">
				                <div class="col-sm-6 checkbox">
				                    <input type="checkbox" class="icheckbox check-item" id="contractAmount" value="合同金额" />
				                    <label for="contractAmount">合同金额</label>
				            	</div>
				                <div class="col-sm-6 checkbox">
				                    <input type="checkbox" class="icheckbox check-item" id="contractType" value="合同分类" />
				                    <label for="contractType">合同分类</label>
				            	</div>
		        			</div>
				        	<div class="row">
				                <div class="col-sm-6 checkbox">
				                    <input type="checkbox" class="icheckbox check-item" id="contractDate" value="合同签订日期" />
				                    <label for="contractDate">合同签订日期</label>
				            	</div>
				                <div class="col-sm-6 checkbox">
				                    <input type="checkbox" class="icheckbox check-item" id="changeTotalAmount" value="合同调增额" />
				                    <label for="changeTotalAmount">合同调增额</label>
				            	</div>
		        			</div>
				        	<div class="row">
				                <div class="col-sm-6 checkbox">
				                    <input type="checkbox" class="icheckbox check-item" id="settlementAmount" value="合同结算额" />
				                    <label for="settlementAmount">合同结算额</label>
				            	</div>
		        			</div>
					  	</div>
					</div>
					<div class="panel panel-default" style="margin-top: 10px;margin-bottom: 0px;">
					  	<div class="panel-heading">甲方开票情况</div>
					  	<div class="panel-body">
				        	<div class="row">
				                <div class="col-sm-6 checkbox">
				                    <input type="checkbox" class="icheckbox check-item" id="partyBillingAmount" value="金额" />
				                    <label for="partyBillingAmount">金额</label>
				            	</div>
				                <div class="col-sm-6 checkbox">
				                    <input type="checkbox" class="icheckbox check-item" id="partyBillingOutputTaxAmount" value="销项税金" />
				                    <label for="partyBillingOutputTaxAmount">销项税金</label>
				            	</div>
			            	</div>
				        	<div class="row">
				                <div class="col-sm-6 checkbox">
				                    <input type="checkbox" class="icheckbox check-item" id="partyBillingTotalAmount" value="累计开票" />
				                    <label for="partyBillingTotalAmount">累计开票</label>
				            	</div>
			            	</div>
					  	</div>
					</div>
					<div class="panel panel-default" style="margin-top: 10px;margin-bottom: 0px;">
					  	<div class="panel-heading">收款情况</div>
					  	<div class="panel-body">
				        	<div class="row">
				                <div class="col-sm-6 checkbox">
				                    <input type="checkbox" class="icheckbox check-item" id="collectionsTotalAmount" value="累计收款" />
				                    <label for="collectionsTotalAmount">累计收款</label>
				            	</div>
				                <div class="col-sm-6 checkbox">
				                    <input type="checkbox" class="icheckbox check-item" id="collectionsRate" value="回款率" />
				                    <label for="collectionsRate">回款率</label>
				            	</div>
			            	</div>
					  	</div>
					</div>
					<div class="panel panel-default" style="margin-top: 10px;margin-bottom: 0px;">
					  	<div class="panel-heading">客户开票情况</div>
					  	<div class="panel-body">
				        	<div class="row">
				                <div class="col-sm-6 checkbox">
				                    <input type="checkbox" class="icheckbox check-item" id="customerBillingAmount" value="金额" />
				                    <label for="customerBillingAmount">金额</label>
				            	</div>
				                <div class="col-sm-6 checkbox">
				                    <input type="checkbox" class="icheckbox check-item" id="customerBillingInputTaxAmount" value="进项税金" />
				                    <label for="customerBillingInputTaxAmount">进项税金</label>
				            	</div>
			            	</div>
				        	<div class="row">
				                <div class="col-sm-6 checkbox">
				                    <input type="checkbox" class="icheckbox check-item" id="customerBillingTotalAmount" value="累计开票" />
				                    <label for="customerBillingTotalAmount">累计开票</label>
				            	</div>
			            	</div>
					  	</div>
					</div>
					<div class="panel panel-default" style="margin-top: 10px;margin-bottom: 0px;">
					  	<div class="panel-heading">支付工程款情况</div>
					  	<div class="panel-body">
				        	<div class="row">
				                <div class="col-sm-6 checkbox">
				                    <input type="checkbox" class="icheckbox check-item" id="paymentTotalAmount" value="累计支付金额" />
				                    <label for="paymentTotalAmount">累计支付金额</label>
				            	</div>
				                <div class="col-sm-6 checkbox">
				                    <input type="checkbox" class="icheckbox check-item" id="projectBalance" value="工程余额" />
				                    <label for="projectBalance">工程余额</label>
				            	</div>
			            	</div>
					  	</div>
					</div>
					<div class="panel panel-default" style="margin-top: 10px;margin-bottom: 0px;">
					  	<div class="panel-heading">税金情况</div>
					  	<div class="panel-body">
				        	<div class="row">
				                <div class="col-sm-6 checkbox">
				                    <input type="checkbox" class="icheckbox check-item" id="taxBearingRate" value="税负率" />
				                    <label for="taxBearingRate">税负率</label>
				            	</div>
				                <div class="col-sm-6 checkbox">
				                    <input type="checkbox" class="icheckbox check-item" id="taxBearingAmount" value="应收税负率税金" />
				                    <label for="taxBearingAmount">应收税负率税金</label>
				            	</div>
			            	</div>
				        	<div class="row">
				                <div class="col-sm-6 checkbox">
				                    <input type="checkbox" class="icheckbox check-item" id="taxBearingRealAmount" value="当期已收税负率税金" />
				                    <label for="taxBearingRealAmount">当期已收税负率税金</label>
				            	</div>
				                <div class="col-sm-6 checkbox">
				                    <input type="checkbox" class="icheckbox check-item" id="taxBearingTotalRealAmount" value="累计已收税负率税金" />
				                    <label for="taxBearingTotalRealAmount">累计已收税负率税金</label>
				            	</div>
			            	</div>
				        	<div class="row">
				                <div class="col-sm-6 checkbox">
				                    <input type="checkbox" class="icheckbox check-item" id="taxPlanAmount" value="应缴税金" />
				                    <label for="taxPlanAmount">应缴税金</label>
				            	</div>
				                <div class="col-sm-6 checkbox">
				                    <input type="checkbox" class="icheckbox check-item" id="paymentDifferentTaxAmount" value="当期异地已缴税金" />
				                    <label for="paymentDifferentTaxAmount">当期异地已缴税金</label>
				            	</div>
			            	</div>
				        	<div class="row">
				                <div class="col-sm-6 checkbox">
				                    <input type="checkbox" class="icheckbox check-item" id="paymentTotalDifferentTaxAmount" value="累计异地已缴税金" />
				                    <label for="paymentTotalDifferentTaxAmount">累计异地已缴税金</label>
				            	</div>
			            	</div>
					  	</div>
					</div>
					<div class="panel panel-default" style="margin-top: 10px;margin-bottom: 0px;">
					  	<div class="panel-heading">管理费及其他收入情况</div>
					  	<div class="panel-body">
							<div class="row">
				                <div class="col-sm-6 checkbox">
				                    <input type="checkbox" class="icheckbox check-item" id="managementRate" value="比率" />
				                    <label for="managementRate">比率</label>
				            	</div>
				                <div class="col-sm-6 checkbox">
				                    <input type="checkbox" class="icheckbox check-item" id="managementPlanAmount" value="应收管理费" />
				                    <label for="managementPlanAmount">应收管理费</label>
				            	</div>
		        			</div>
							<div class="row">
				                <div class="col-sm-6 checkbox">
				                    <input type="checkbox" class="icheckbox check-item" id="managementRealAmount" value="本期收管理费" />
				                    <label for="managementRealAmount">本期收管理费</label>
				            	</div>
				                <div class="col-sm-6 checkbox">
				                    <input type="checkbox" class="icheckbox check-item" id="managementTotalAmount" value="累计收管理费" />
				                    <label for="managementTotalAmount">累计收管理费</label>
				            	</div>
		        			</div>
							<div class="row">
				                <div class="col-sm-6 checkbox">
				                    <input type="checkbox" class="icheckbox check-item" id="managementOweAmount" value="尚欠管理费" />
				                    <label for="managementOweAmount">尚欠管理费</label>
				            	</div>
				                <div class="col-sm-6 checkbox">
				                    <input type="checkbox" class="icheckbox check-item" id="field01" value="其他收入" />
				                    <label for="field01">其他收入</label>
				            	</div>
		        			</div>
				        	<div class="row">
				                <div class="col-sm-6 checkbox">
				                    <input type="checkbox" class="icheckbox check-item" id="field02" value="总计" />
				                    <label for="field02">总计</label>
				            	</div>
		        			</div>
					  	</div>
					</div>
		        	<div class="row">
		                <div class="col-sm-6 checkbox">
		                    <input type="checkbox" class="icheckbox check-item" id="arrearsAmount" value="往来欠款" />
		                    <label for="arrearsAmount">往来欠款</label>
		            	</div>
        			</div>
					<div class="panel panel-default" style="margin-top: 10px;margin-bottom: 0px;">
					  	<div class="panel-heading">型材</div>
					  	<div class="panel-body">
				        	<div class="row">
				                <div class="col-sm-6 checkbox">
				                    <input type="checkbox" class="icheckbox check-item" id="expectedValueTon" value="型材（吨）" />
				                    <label for="expectedValueTon">型材（吨）</label>
				            	</div>
				                <div class="col-sm-6 checkbox">
				                    <input type="checkbox" class="icheckbox check-item" id="expectedValueSquareMeter" value="型材（平米）" />
				                    <label for="expectedValueSquareMeter">型材（平米）</label>
				            	</div>
			            	</div>
				        	<div class="row">
				                <div class="col-sm-6 checkbox">
				                    <input type="checkbox" class="icheckbox check-item" id="profilePoint" value="型材点" />
				                    <label for="profilePoint">型材点</label>
				            	</div>
			            	</div>
					  	</div>
					</div>
        		</div>
            </div>
        </form>
    </script>
    <script type="text/javascript">
		$(function() {
			$("select").change(function() {
				var orgid = $("#orgSelect").val() || "${orgId}";
				///alert(orgid + "," + $("#monthsSelect").val());
				self.location = "<s:url value='/projectsummary/full' />" + "?orgid=" + orgid + "&p1=" + $("#monthsSelect1").val() + "&p2=" + $("#monthsSelect2").val();

			});
			var columns = "${columns}";
			$("#btn-setting").click(function(){
				$("#myModal .modal-title").html("设置列");
				$("#myModalContent").html(templateContent("settingTemplate"));
				$("#myModalContent").find(".icheckbox").iCheck({
					checkboxClass : 'icheckbox_minimal',
					radioClass : 'iradio_minimal',
					increaseArea : '20%'
				});
				var ischeck = "check";
				if(columns){
					$("#myModalContent").find(".check-item").each(function(){
						if(columns.indexOf($(this).attr("id")) > -1){
							$(this).iCheck("check");
						}else{
							$(this).iCheck("uncheck");
							ischeck = "uncheck";
						}
					});
				}else{
					$("#myModalContent").find(".check-item").iCheck(ischeck);
				}
				$("#myModalContent").find("#selectAll").iCheck(ischeck);
				$("#myModalContent").find("#selectAll").on('ifChecked', function(){
					$("#myModalContent").find(".check-item").iCheck('check');
				}).on("ifUnchecked",function(){
					$("#myModalContent").find(".check-item").iCheck('uncheck');
				});
				$("#myModal .btn-danger").off("click").on("click",function() {
					var data = {},heads=[],columns=[];
					$("#myModalContent").find('.check-item:checked').each(function(){
						columns.push($(this).attr("id"));
						heads.push($(this).val());
					});
					data.columns = columns.join(",");
					data.heads = heads.join(",");
			    	$.post("<s:url value='/sysuser/setting/full'/>", {setting: JSON.stringify(data)},
		    			function(result) {
		    				//未提交成功，提示错误
		    				if(result.message != "OK"){
		    					alert(result.message);
		    					return;
		    				}
		    				self.location.reload();
		    				return;
		    			}, "json");
					$('#myModal').modal("hide");
				});
				$('#myModal').modal('show');
			});
		});
	</script>

    <%@ include file="bottom.jsp"%>