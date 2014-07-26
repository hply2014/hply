<%@ page isELIgnored="false"%><%@ 
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
	pageEncoding="utf-8"%><%@ include file="header.jsp"%>
<div class="panel panel-default">
  <div class="panel-heading"><strong>${page_title}</strong></div>
  <div class="panel-body">
<div class="btn-toolbar" role="toolbar">
  <div class="btn-group">
  <a href="<s:url value="/projectsummary" />" class="btn btn-info"><span class="glyphicon glyphicon-share-alt"></span> 返 回  </a>
</div>
  <div class="btn-group">
  <a href="<s:url value="/projectsummary/modify/{id}"><s:param name="id" value="${projectSummary.id }" /></s:url>" class="btn btn-info"><span class="glyphicon glyphicon-pencil"></span> 修 改  </a>
</div>
  <div class="btn-group">
  <a data-confirm-message="删除后不可恢复，您确认要删除【<c:out value="${projectSummary.id}" />】么？" href="<s:url value="/projectsummary/delete/{id}"><s:param name="id" value="${projectSummary.id }" /></s:url>" class="btn btn-info delete"><span class="glyphicon glyphicon-trash"></span> 删 除  </a>
</div>
</div>

<sf:form modelAttribute="projectSummary" cssClass="form-horizontal"
	role="form">
	<div class="form-group">
		<sf:label path="trice" cssClass="col-sm-2 control-label">时间</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatDate value="${projectSummary.trice}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="description" cssClass="col-sm-2 control-label">摘要</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${projectSummary.description}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="projectId" cssClass="col-sm-2 control-label">项目ID</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${projectSummary.projectId}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="organizationId" cssClass="col-sm-2 control-label">所在部门</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${projectSummary.organizationId}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="projectCode" cssClass="col-sm-2 control-label">项目编号</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${projectSummary.projectCode}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="projectName" cssClass="col-sm-2 control-label">项目名称</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${projectSummary.projectName}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="contractAmount" cssClass="col-sm-2 control-label">合同金额</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatNumber pattern="#,##0.00" value="${projectSummary.contractAmount}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="changeAmount" cssClass="col-sm-2 control-label">合同调增额</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatNumber pattern="#,##0.00" value="${projectSummary.changeAmount}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="settlementAmount" cssClass="col-sm-2 control-label">合同结算额</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatNumber pattern="#,##0.00" value="${projectSummary.settlementAmount}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="managementRate" cssClass="col-sm-2 control-label">比率</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatNumber pattern="#,##0.00" value="${projectSummary.managementRate}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="managementPlanAmount" cssClass="col-sm-2 control-label">应收管理费</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatNumber pattern="#,##0.00" value="${projectSummary.managementPlanAmount}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="managementRealAmount" cssClass="col-sm-2 control-label">实收管理费</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatNumber pattern="#,##0.00" value="${projectSummary.managementRealAmount}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="managementTotalAmount" cssClass="col-sm-2 control-label">累计收管理费</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatNumber pattern="#,##0.00" value="${projectSummary.managementTotalAmount}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="managementOweAmount" cssClass="col-sm-2 control-label">尚欠管理费</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatNumber pattern="#,##0.00" value="${projectSummary.managementOweAmount}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="partyBillingAmount" cssClass="col-sm-2 control-label">发票金额</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatNumber pattern="#,##0.00" value="${projectSummary.partyBillingAmount}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="partyBillingTotalAmount" cssClass="col-sm-2 control-label">累计开票</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatNumber pattern="#,##0.00" value="${projectSummary.partyBillingTotalAmount}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="collectionsAmount" cssClass="col-sm-2 control-label">收款金额</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatNumber pattern="#,##0.00" value="${projectSummary.collectionsAmount}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="collectionsTotalAmount" cssClass="col-sm-2 control-label">累计收款</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatNumber pattern="#,##0.00" value="${projectSummary.collectionsTotalAmount}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="collectionsRate" cssClass="col-sm-2 control-label">回收率</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatNumber pattern="#,##0.00" value="${projectSummary.collectionsRate}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="customerBillingAmount" cssClass="col-sm-2 control-label">发票金额</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatNumber pattern="#,##0.00" value="${projectSummary.customerBillingAmount}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="customerBillingTotalAmount" cssClass="col-sm-2 control-label">累计开票</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatNumber pattern="#,##0.00" value="${projectSummary.customerBillingTotalAmount}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="paymentAmount" cssClass="col-sm-2 control-label">支付金额</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatNumber pattern="#,##0.00" value="${projectSummary.paymentAmount}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="paymentTotalAmount" cssClass="col-sm-2 control-label">累计</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatNumber pattern="#,##0.00" value="${projectSummary.paymentTotalAmount}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="taxRate" cssClass="col-sm-2 control-label">比率</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatNumber pattern="#,##0.00" value="${projectSummary.taxRate}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="taxPlanAmount" cssClass="col-sm-2 control-label">应缴税金</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatNumber pattern="#,##0.00" value="${projectSummary.taxPlanAmount}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="taxRealAmount" cssClass="col-sm-2 control-label">已缴税金</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatNumber pattern="#,##0.00" value="${projectSummary.taxRealAmount}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="taxTotalAmount" cssClass="col-sm-2 control-label">累计已缴税金</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatNumber pattern="#,##0.00" value="${projectSummary.taxTotalAmount}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="taxOweAmount" cssClass="col-sm-2 control-label">尚欠税金</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatNumber pattern="#,##0.00" value="${projectSummary.taxOweAmount}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="arrearsAmount" cssClass="col-sm-2 control-label">金额</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatNumber pattern="#,##0.00" value="${projectSummary.arrearsAmount}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="expectedValue" cssClass="col-sm-2 control-label">预计用量</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatNumber pattern="#,##0.00" value="${projectSummary.expectedValue}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="profilePoint" cssClass="col-sm-2 control-label">型材点</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${projectSummary.profilePoint}" /></p>
		</div>
	</div>
</sf:form>
  </div>
</div>
<%@ include file="bottom.jsp"%>
