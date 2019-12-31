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
        <strong>信息汇总</strong>（ 共
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
        <a href="<c:url value="/information/export?orgid=${orgId}&p1=${p1}&p2=${p2}" />" class="btn btn-danger"><span
                        class="glyphicon glyphicon-floppy-save"></span>导出到Excel . . . </a>
    </h4>
    <table class="table table-hover table-striped table-bordered">
        <thead>
            <tr>
                <th rowspan="2">#</th>
                <th rowspan="2">登记日期</th>
                <th rowspan="2">所属部门</th>
                <th rowspan="2">加盟客户名称</th>
                <th rowspan="2">工程名称</th>
                <th rowspan="2">工程地点</th>
                <th rowspan="2">建设单位</th>
                <th rowspan="2">总包方</th>
                <th rowspan="2" class="amount">综合服务费</th>
                <th colspan="6">证书收费情况</th>
            </tr>
            <tr>
                <th>证书类别</th>
                <th>证书使用人员姓名</th>
                <th>使用起止时间</th>
                <th class="amount">应收证书费</th>
                <th class="amount">已收证书费</th>
                <!-- <th class="amount">尚欠证书费</th> -->
            </tr>
        </thead>
        <tbody>
            <%
            	int i = 0;
            %>
            <c:forEach items="${list}" var="info">
                <tr>
                	<td <c:if test='${info.childSize > 0}'>rowspan="${info.childSize }"</c:if>><%=++i%></td>
                    <td <c:if test='${info.childSize > 0}'>rowspan="${info.childSize }"</c:if>>${info.trice }</td>
                    <td <c:if test='${info.childSize > 0}'>rowspan="${info.childSize }"</c:if>>${info.organizationName }</td>
                    <td <c:if test='${info.childSize > 0}'>rowspan="${info.childSize }"</c:if>>${info.joinRealName }</td>
                    <td <c:if test='${info.childSize > 0}'>rowspan="${info.childSize }"</c:if>>${info.projectName }</td>
                    <td <c:if test='${info.childSize > 0}'>rowspan="${info.childSize }"</c:if>>${info.address }</td>
                    <td <c:if test='${info.childSize > 0}'>rowspan="${info.childSize }"</c:if>>${info.constructionCompany }</td>
                    <td <c:if test='${info.childSize > 0}'>rowspan="${info.childSize }"</c:if>>${info.generalContractor }</td>
                    <td <c:if test='${info.childSize > 0}'>rowspan="${info.childSize }"</c:if> class="amount"><fmt:formatNumber value="${info.serviceAmount}" pattern="###,###,###,###,##0.00" /></td>
                    <c:choose>
                		<c:when test="${info.childSize > 0 }">
                         	<c:forEach items="${info.listAmount}" var="amount">
			                    	<td>${amount.type }</td>
				                    <td>${amount.realName }</td>
				                    <td><fmt:formatDate value="${amount.beginTime}" pattern="yyyy-MM-dd" />至<fmt:formatDate value="${amount.endTime}" pattern="yyyy-MM-dd" /></td>
				                    <td class="amount"><fmt:formatNumber value="${amount.planAmount}" pattern="###,###,###,###,##0.00" /></td>
				                    <td class="amount"><fmt:formatNumber value="${amount.realAmount}" pattern="###,###,###,###,##0.00" /></td>
				                    <td class="amount"><fmt:formatNumber value="${amount.oweAmount}" pattern="###,###,###,###,##0.00" /></td>
			                    </tr>
			                    <tr>
	                    	</c:forEach>
	                    	<td colspan="3" style="text-align: right; font-weight:bold;">${info.subtotal.title }</td>
		                    <td class="amount"><fmt:formatNumber value="${info.subtotal.planAmount}" pattern="###,###,###,###,##0.00" /></td>
		                    <td class="amount"><fmt:formatNumber value="${info.subtotal.realAmount}" pattern="###,###,###,###,##0.00" /></td>
		                    <%-- <td class="amount"><fmt:formatNumber value="${info.subtotal.oweAmount}" pattern="###,###,###,###,##0.00" /></td> --%>
				    	</c:when>
                        <c:otherwise>
                         	<td></td>
		                    <td></td>
                         	<td></td>
		                    <td></td>
                         	<td></td>
		                    <!-- <td></td> -->
 						</c:otherwise>
					</c:choose>
                </tr>
            </c:forEach>
            <tr class="total">
                 <th colspan="8" style="text-align: right"><c:out value="${total.title}" /></th>
                 <td class="amount"><fmt:formatNumber value="${total.serviceAmount}" pattern="###,###,###,###,##0.00" /></td>
                 <td colspan="3"></td>
                 <td class="amount"><fmt:formatNumber value="${total.planAmount}" pattern="###,###,###,###,##0.00" /></td>
                 <td class="amount"><fmt:formatNumber value="${total.realAmount}" pattern="###,###,###,###,##0.00" /></td>
                 <td class="amount"><fmt:formatNumber value="${total.oweAmount}" pattern="###,###,###,###,##0.00" /></td>
             </tr>
        </tbody>
    </table>
    <script type="text/javascript">
		$(function() {
			$("select").change(function() {
				var orgid = $("#orgSelect").val() || "${orgId}";
				///alert(orgid + "," + $("#monthsSelect").val());
				self.location = "<s:url value='/information/full' />" + "?orgid=" + orgid + "&p1=" + $("#monthsSelect1").val() + "&p2=" + $("#monthsSelect2").val();
			});
		});
	</script>
    <%@ include file="bottom.jsp"%>