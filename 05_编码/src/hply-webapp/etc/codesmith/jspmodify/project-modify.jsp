<%@ page isELIgnored="false"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib
	uri="http://www.springframework.org/tags" prefix="s"%><%@ taglib
	uri="http://www.springframework.org/tags/form" prefix="sf"%><%@ page
	language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%><%@ include file="header.jsp"%>
<div class="container main"><div class="panel panel-default">
	<div class="panel-heading">
		<strong>${page_title}</strong>
	</div>
	<div class="panel-body">
		<sf:form modelAttribute="project" cssClass="form-horizontal"
			role="form">
	<div class="form-group">
		<sf:label path="projectCode" cssClass="col-sm-2 control-label">项目编号</sf:label>
		<div class="col-sm-4">
			<sf:input cssClass="form-control" path="projectCode" placeholder="请输入文字..." />
            <sf:errors path="projectCode" cssClass="error" />
		</div>
        <div class="col-sm-4"></div>
	</div>

	<div class="form-group">
		<sf:label path="projectName" cssClass="col-sm-2 control-label">项目名称</sf:label>
		<div class="col-sm-4">
			<sf:input cssClass="form-control" path="projectName" placeholder="请输入文字..." />
            <sf:errors path="projectName" cssClass="error" />
		</div>
        <div class="col-sm-4"></div>
	</div>

	<div class="form-group">
		<sf:label path="organizationId" cssClass="col-sm-2 control-label">所在部门</sf:label>
		<div class="col-sm-4">
			<sf:input cssClass="form-control" path="organizationId" placeholder="请输入文字..." />
            <sf:errors path="organizationId" cssClass="error" />
		</div>
        <div class="col-sm-4"></div>
	</div>

	<div class="form-group">
		<sf:label path="partyName" cssClass="col-sm-2 control-label">甲方名称</sf:label>
		<div class="col-sm-4">
			<sf:input cssClass="form-control" path="partyName" placeholder="请输入文字..." />
            <sf:errors path="partyName" cssClass="error" />
		</div>
        <div class="col-sm-4"></div>
	</div>

	<div class="form-group">
		<sf:label path="partyAddress" cssClass="col-sm-2 control-label">甲方地址</sf:label>
		<div class="col-sm-4">
			<sf:input cssClass="form-control" path="partyAddress" placeholder="请输入文字..." />
            <sf:errors path="partyAddress" cssClass="error" />
		</div>
        <div class="col-sm-4"></div>
	</div>

	<div class="form-group">
		<sf:label path="manager" cssClass="col-sm-2 control-label">项目经理</sf:label>
		<div class="col-sm-4">
			<sf:input cssClass="form-control" path="manager" placeholder="请输入文字..." />
            <sf:errors path="manager" cssClass="error" />
		</div>
        <div class="col-sm-4"></div>
	</div>

	<div class="form-group">
		<sf:label path="contractCode" cssClass="col-sm-2 control-label">合同号</sf:label>
		<div class="col-sm-4">
			<sf:input cssClass="form-control" path="contractCode" placeholder="请输入文字..." />
            <sf:errors path="contractCode" cssClass="error" />
		</div>
        <div class="col-sm-4"></div>
	</div>

	<div class="form-group">
		<sf:label path="corperation" cssClass="col-sm-2 control-label">合作单位</sf:label>
		<div class="col-sm-4">
			<sf:input cssClass="form-control" path="corperation" placeholder="请输入文字..." />
            <sf:errors path="corperation" cssClass="error" />
		</div>
        <div class="col-sm-4"></div>
	</div>

	<div class="form-group">
		<sf:label path="legalAssignee" cssClass="col-sm-2 control-label">法人代表</sf:label>
		<div class="col-sm-4">
			<sf:input cssClass="form-control" path="legalAssignee" placeholder="请输入文字..." />
            <sf:errors path="legalAssignee" cssClass="error" />
		</div>
        <div class="col-sm-4"></div>
	</div>

	<div class="form-group">
		<sf:label path="isWithholdingOffsite" cssClass="col-sm-2 control-label">异地代扣代缴</sf:label>
		<div class="col-sm-4">
			<sf:input cssClass="form-control" path="isWithholdingOffsite" placeholder="请输入文字..." />
            <sf:errors path="isWithholdingOffsite" cssClass="error" />
		</div>
        <div class="col-sm-4"></div>
	</div>

	<div class="form-group">
		<sf:label path="managementRate" cssClass="col-sm-2 control-label">管理费率</sf:label>
		<div class="col-sm-4">
			<sf:input cssClass="form-control" path="managementRate" placeholder="请输入数字，可以带小数..." />
            <sf:errors path="managementRate" cssClass="error" />
		</div>
        <div class="col-sm-4"></div>
	</div>

	<div class="form-group">
		<sf:label path="taxRate" cssClass="col-sm-2 control-label">税金比率</sf:label>
		<div class="col-sm-4">
			<sf:input cssClass="form-control" path="taxRate" placeholder="请输入数字，可以带小数..." />
            <sf:errors path="taxRate" cssClass="error" />
		</div>
        <div class="col-sm-4"></div>
	</div>

	<div class="form-group">
		<sf:label path="contractAmount" cssClass="col-sm-2 control-label">合同金额</sf:label>
		<div class="col-sm-4">
			<sf:input cssClass="form-control" path="contractAmount" placeholder="请输入数字，可以带小数..." />
            <sf:errors path="contractAmount" cssClass="error" />
		</div>
        <div class="col-sm-4"></div>
	</div>

	<div class="form-group">
		<sf:label path="settlementAmount" cssClass="col-sm-2 control-label">结算金额</sf:label>
		<div class="col-sm-4">
			<sf:input cssClass="form-control" path="settlementAmount" placeholder="请输入数字，可以带小数..." />
            <sf:errors path="settlementAmount" cssClass="error" />
		</div>
        <div class="col-sm-4"></div>
	</div>

	<div class="form-group">
		<sf:label path="dutyPaidTime" cssClass="col-sm-2 control-label">印花税上交时间</sf:label>
		<div class="col-sm-4">
					<div class="input-group date">
						<sf:input cssClass="form-control" path="dutyPaidTime"
							data-date-format="yyyy-mm-dd" />
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-calendar"></i></span>
					</div>
            <sf:errors path="dutyPaidTime" cssClass="error" />
		</div>
        <div class="col-sm-4"></div>
	</div>

	<div class="form-group">
		<sf:label path="dutyPaidAmount" cssClass="col-sm-2 control-label">印花税上交金额</sf:label>
		<div class="col-sm-4">
			<sf:input cssClass="form-control" path="dutyPaidAmount" placeholder="请输入数字，可以带小数..." />
            <sf:errors path="dutyPaidAmount" cssClass="error" />
		</div>
        <div class="col-sm-4"></div>
	</div>

	<div class="form-group">
		<sf:label path="dutyPaidCode" cssClass="col-sm-2 control-label">印花税收据编号</sf:label>
		<div class="col-sm-4">
			<sf:input cssClass="form-control" path="dutyPaidCode" placeholder="请输入文字..." />
            <sf:errors path="dutyPaidCode" cssClass="error" />
		</div>
        <div class="col-sm-4"></div>
	</div>

	<div class="form-group">
		<sf:label path="capitalOccupied" cssClass="col-sm-2 control-label">占用资金情况</sf:label>
		<div class="col-sm-4">
			<sf:input cssClass="form-control" path="capitalOccupied" placeholder="请输入数字，可以带小数..." />
            <sf:errors path="capitalOccupied" cssClass="error" />
		</div>
        <div class="col-sm-4"></div>
	</div>

	<div class="form-group">
		<sf:label path="projectStatus" cssClass="col-sm-2 control-label">项目状态</sf:label>
		<div class="col-sm-4">
			<sf:input cssClass="form-control" path="projectStatus" placeholder="请输入文字..." />
            <sf:errors path="projectStatus" cssClass="error" />
		</div>
        <div class="col-sm-4"></div>
	</div>

	<div class="form-group">
		<sf:label path="trice" cssClass="col-sm-2 control-label">登记时间</sf:label>
		<div class="col-sm-4">
					<div class="input-group date">
						<sf:input cssClass="form-control" path="trice"
							data-date-format="yyyy-mm-dd" />
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-calendar"></i></span>
					</div>
            <sf:errors path="trice" cssClass="error" />
		</div>
        <div class="col-sm-4"></div>
	</div>

	<div class="form-group">
		<sf:label path="description" cssClass="col-sm-2 control-label">备注</sf:label>
		<div class="col-sm-4">
			<sf:input cssClass="form-control" path="description" placeholder="请输入文字..." />
            <sf:errors path="description" cssClass="error" />
		</div>
        <div class="col-sm-4"></div>
	</div>

	<div class="form-group">
		<sf:label path="status" cssClass="col-sm-2 control-label">数据状态，0：草稿/1：正式</sf:label>
		<div class="col-sm-4">
			<sf:input cssClass="form-control" path="status" placeholder="请输入文字..." />
            <sf:errors path="status" cssClass="error" />
		</div>
        <div class="col-sm-4"></div>
	</div>

	<div class="form-group">
		<sf:label path="managementPlanAmount" cssClass="col-sm-2 control-label">应收管理费</sf:label>
		<div class="col-sm-4">
			<sf:input cssClass="form-control" path="managementPlanAmount" placeholder="请输入数字，可以带小数..." />
            <sf:errors path="managementPlanAmount" cssClass="error" />
		</div>
        <div class="col-sm-4"></div>
	</div>

	<div class="form-group">
		<sf:label path="taxPlanAmount" cssClass="col-sm-2 control-label">应缴税金</sf:label>
		<div class="col-sm-4">
			<sf:input cssClass="form-control" path="taxPlanAmount" placeholder="请输入数字，可以带小数..." />
            <sf:errors path="taxPlanAmount" cssClass="error" />
		</div>
        <div class="col-sm-4"></div>
	</div>
			<div>
				<div class="col-sm-4 control-label">
					<button type="submit" class="btn btn-primary">
						<span class="glyphicon glyphicon-ok"></span> 提 交
					</button>
				</div>
				<div class="col-sm-1 control-label">
					<a href='<s:url value="/project" />' class="btn btn-default"><span
						class="glyphicon glyphicon-share-alt"></span> 返 回 </a>
				</div>
			</div>

		</sf:form>
	</div>
</div></div>
<script type="text/javascript">
	$(function() {
		$("form").validate({
			errorElement : "p",
			success: function(label) {
				label.text("　").addClass("success");
			},
			errorPlacement: function(error, element) {
				error.appendTo(element.parent("div").next("div"));
			},
			rules : { 	
                projectCode : {
                }, 
                projectName : {
                }, 
                organizationId : {
                }, 
                partyName : {
                }, 
                partyAddress : {
                }, 
                manager : {
                }, 
                contractCode : {
                }, 
                corperation : {
                }, 
                legalAssignee : {
                }, 
                isWithholdingOffsite : {
                }, 
                managementRate : {
                }, 
                taxRate : {
                }, 
                contractAmount : {
                }, 
                settlementAmount : {
                }, 
                dutyPaidTime : {
                }, 
                dutyPaidAmount : {
                }, 
                dutyPaidCode : {
                }, 
                capitalOccupied : {
                }, 
                projectStatus : {
                }, 
                trice : {
                }, 
                description : {
                }, 
                status : {
                }, 
                managementPlanAmount : {
                }, 
                taxPlanAmount : {
                }, 
			}
		});
	});
</script>
<%@ include file="bottom.jsp"%>
