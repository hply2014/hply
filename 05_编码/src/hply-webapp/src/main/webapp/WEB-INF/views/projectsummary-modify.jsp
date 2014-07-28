<%@ page isELIgnored="false"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib
	uri="http://www.springframework.org/tags" prefix="s"%><%@ taglib
	uri="http://www.springframework.org/tags/form" prefix="sf"%><%@ page
	language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%><%@ include file="header.jsp"%>
<div class="panel panel-default">
	<div class="panel-heading">
		<strong>${page_title}</strong>
	</div>
	<div class="panel-body">
		<sf:form modelAttribute="projectSummary" cssClass="form-horizontal"
			role="form">
	<div class="form-group">
		<sf:label path="trice" cssClass="col-sm-2 control-label">时间</sf:label>
		<div class="col-sm-10">
					<div class="input-group date">
						<sf:input cssClass="form-control" path="trice"
							data-date-format="yyyy-mm-dd" />
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-calendar"></i></span>
					</div>
            <sf:errors path="trice" cssClass="error" />
		</div>
	</div>

	<div class="form-group">
		<sf:label path="description" cssClass="col-sm-2 control-label">摘要</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="description" placeholder="请输入文字..." />
            <sf:errors path="description" cssClass="error" />
		</div>
	</div>

	<div class="form-group">
		<sf:label path="projectId" cssClass="col-sm-2 control-label">项目ID</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="projectId" placeholder="请输入文字..." />
            <sf:errors path="projectId" cssClass="error" />
		</div>
	</div>

	<div class="form-group">
		<sf:label path="organizationId" cssClass="col-sm-2 control-label">所在部门</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="organizationId" placeholder="请输入文字..." />
            <sf:errors path="organizationId" cssClass="error" />
		</div>
	</div>

	<div class="form-group">
		<sf:label path="projectCode" cssClass="col-sm-2 control-label">项目编号</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="projectCode" placeholder="请输入文字..." />
            <sf:errors path="projectCode" cssClass="error" />
		</div>
	</div>

	<div class="form-group">
		<sf:label path="projectName" cssClass="col-sm-2 control-label">项目名称</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="projectName" placeholder="请输入文字..." />
            <sf:errors path="projectName" cssClass="error" />
		</div>
	</div>

	<div class="form-group">
		<sf:label path="contractAmount" cssClass="col-sm-2 control-label">合同金额</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="contractAmount" placeholder="请输入数字，可以带小数..." />
            <sf:errors path="contractAmount" cssClass="error" />
		</div>
	</div>

	<div class="form-group">
		<sf:label path="changeAmount" cssClass="col-sm-2 control-label">合同调增额</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="changeAmount" placeholder="请输入数字，可以带小数..." />
            <sf:errors path="changeAmount" cssClass="error" />
		</div>
	</div>

	<div class="form-group">
		<sf:label path="settlementAmount" cssClass="col-sm-2 control-label">合同结算额</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="settlementAmount" placeholder="请输入数字，可以带小数..." />
            <sf:errors path="settlementAmount" cssClass="error" />
		</div>
	</div>

	<div class="form-group">
		<sf:label path="managementRate" cssClass="col-sm-2 control-label">比率</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="managementRate" placeholder="请输入数字，可以带小数..." />
            <sf:errors path="managementRate" cssClass="error" />
		</div>
	</div>

	<div class="form-group">
		<sf:label path="managementPlanAmount" cssClass="col-sm-2 control-label">应收管理费</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="managementPlanAmount" placeholder="请输入数字，可以带小数..." />
            <sf:errors path="managementPlanAmount" cssClass="error" />
		</div>
	</div>

	<div class="form-group">
		<sf:label path="managementRealAmount" cssClass="col-sm-2 control-label">实收管理费</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="managementRealAmount" placeholder="请输入数字，可以带小数..." />
            <sf:errors path="managementRealAmount" cssClass="error" />
		</div>
	</div>

	<div class="form-group">
		<sf:label path="managementTotalAmount" cssClass="col-sm-2 control-label">累计收管理费</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="managementTotalAmount" placeholder="请输入数字，可以带小数..." />
            <sf:errors path="managementTotalAmount" cssClass="error" />
		</div>
	</div>

	<div class="form-group">
		<sf:label path="managementOweAmount" cssClass="col-sm-2 control-label">尚欠管理费</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="managementOweAmount" placeholder="请输入数字，可以带小数..." />
            <sf:errors path="managementOweAmount" cssClass="error" />
		</div>
	</div>

	<div class="form-group">
		<sf:label path="partyBillingAmount" cssClass="col-sm-2 control-label">发票金额</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="partyBillingAmount" placeholder="请输入数字，可以带小数..." />
            <sf:errors path="partyBillingAmount" cssClass="error" />
		</div>
	</div>

	<div class="form-group">
		<sf:label path="partyBillingTotalAmount" cssClass="col-sm-2 control-label">累计开票</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="partyBillingTotalAmount" placeholder="请输入数字，可以带小数..." />
            <sf:errors path="partyBillingTotalAmount" cssClass="error" />
		</div>
	</div>

	<div class="form-group">
		<sf:label path="collectionsAmount" cssClass="col-sm-2 control-label">收款金额</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="collectionsAmount" placeholder="请输入数字，可以带小数..." />
            <sf:errors path="collectionsAmount" cssClass="error" />
		</div>
	</div>

	<div class="form-group">
		<sf:label path="collectionsTotalAmount" cssClass="col-sm-2 control-label">累计收款</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="collectionsTotalAmount" placeholder="请输入数字，可以带小数..." />
            <sf:errors path="collectionsTotalAmount" cssClass="error" />
		</div>
	</div>

	<div class="form-group">
		<sf:label path="collectionsRate" cssClass="col-sm-2 control-label">回收率</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="collectionsRate" placeholder="请输入数字，可以带小数..." />
            <sf:errors path="collectionsRate" cssClass="error" />
		</div>
	</div>

	<div class="form-group">
		<sf:label path="customerBillingAmount" cssClass="col-sm-2 control-label">发票金额</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="customerBillingAmount" placeholder="请输入数字，可以带小数..." />
            <sf:errors path="customerBillingAmount" cssClass="error" />
		</div>
	</div>

	<div class="form-group">
		<sf:label path="customerBillingTotalAmount" cssClass="col-sm-2 control-label">累计开票</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="customerBillingTotalAmount" placeholder="请输入数字，可以带小数..." />
            <sf:errors path="customerBillingTotalAmount" cssClass="error" />
		</div>
	</div>

	<div class="form-group">
		<sf:label path="paymentAmount" cssClass="col-sm-2 control-label">支付金额</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="paymentAmount" placeholder="请输入数字，可以带小数..." />
            <sf:errors path="paymentAmount" cssClass="error" />
		</div>
	</div>

	<div class="form-group">
		<sf:label path="paymentTotalAmount" cssClass="col-sm-2 control-label">累计</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="paymentTotalAmount" placeholder="请输入数字，可以带小数..." />
            <sf:errors path="paymentTotalAmount" cssClass="error" />
		</div>
	</div>

	<div class="form-group">
		<sf:label path="taxRate" cssClass="col-sm-2 control-label">比率</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="taxRate" placeholder="请输入数字，可以带小数..." />
            <sf:errors path="taxRate" cssClass="error" />
		</div>
	</div>

	<div class="form-group">
		<sf:label path="taxPlanAmount" cssClass="col-sm-2 control-label">应缴税金</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="taxPlanAmount" placeholder="请输入数字，可以带小数..." />
            <sf:errors path="taxPlanAmount" cssClass="error" />
		</div>
	</div>

	<div class="form-group">
		<sf:label path="taxRealAmount" cssClass="col-sm-2 control-label">已缴税金</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="taxRealAmount" placeholder="请输入数字，可以带小数..." />
            <sf:errors path="taxRealAmount" cssClass="error" />
		</div>
	</div>

	<div class="form-group">
		<sf:label path="taxTotalAmount" cssClass="col-sm-2 control-label">累计已缴税金</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="taxTotalAmount" placeholder="请输入数字，可以带小数..." />
            <sf:errors path="taxTotalAmount" cssClass="error" />
		</div>
	</div>

	<div class="form-group">
		<sf:label path="taxOweAmount" cssClass="col-sm-2 control-label">尚欠税金</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="taxOweAmount" placeholder="请输入数字，可以带小数..." />
            <sf:errors path="taxOweAmount" cssClass="error" />
		</div>
	</div>

	<div class="form-group">
		<sf:label path="arrearsAmount" cssClass="col-sm-2 control-label">金额</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="arrearsAmount" placeholder="请输入数字，可以带小数..." />
            <sf:errors path="arrearsAmount" cssClass="error" />
		</div>
	</div>

	<div class="form-group">
		<sf:label path="expectedValue" cssClass="col-sm-2 control-label">预计用量</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="expectedValue" placeholder="请输入数字，可以带小数..." />
            <sf:errors path="expectedValue" cssClass="error" />
		</div>
	</div>

	<div class="form-group">
		<sf:label path="profilePoint" cssClass="col-sm-2 control-label">型材点</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="profilePoint" placeholder="请输入文字..." />
            <sf:errors path="profilePoint" cssClass="error" />
		</div>
	</div>
			<div>
				<div class="col-sm-5 control-label">
					<button type="submit" class="btn btn-primary">
						<span class="glyphicon glyphicon-ok"></span> 提 交
					</button>
				</div>
				<div class="col-sm-1 control-label">
					<a href='<s:url value="/projectsummary" />' class="btn btn-default"><span
						class="glyphicon glyphicon-share-alt"></span> 返 回 </a>
				</div>
			</div>

		</sf:form>
	</div>
</div>

<%@ include file="bottom.jsp"%>
