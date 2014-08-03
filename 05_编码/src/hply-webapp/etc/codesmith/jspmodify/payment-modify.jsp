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
		<sf:form modelAttribute="payment" cssClass="form-horizontal"
			role="form">
	<div class="form-group">
		<sf:label path="projectId" cssClass="col-sm-2 control-label">项目ID</sf:label>
		<div class="col-sm-4">
			<sf:input cssClass="form-control" path="projectId" placeholder="请输入文字..." />
            <sf:errors path="projectId" cssClass="error" />
		</div>
        <div class="col-sm-4"></div>
	</div>

	<div class="form-group">
		<sf:label path="ticketCode" cssClass="col-sm-2 control-label">凭证号</sf:label>
		<div class="col-sm-4">
			<sf:input cssClass="form-control" path="ticketCode" placeholder="请输入文字..." />
            <sf:errors path="ticketCode" cssClass="error" />
		</div>
        <div class="col-sm-4"></div>
	</div>

	<div class="form-group">
		<sf:label path="payType" cssClass="col-sm-2 control-label">支付方式</sf:label>
		<div class="col-sm-4">
			<sf:input cssClass="form-control" path="payType" placeholder="请输入文字..." />
            <sf:errors path="payType" cssClass="error" />
		</div>
        <div class="col-sm-4"></div>
	</div>

	<div class="form-group">
		<sf:label path="paymentItemId" cssClass="col-sm-2 control-label">付款科目ID</sf:label>
		<div class="col-sm-4">
			<sf:input cssClass="form-control" path="paymentItemId" placeholder="请输入文字..." />
            <sf:errors path="paymentItemId" cssClass="error" />
		</div>
        <div class="col-sm-4"></div>
	</div>

	<div class="form-group">
		<sf:label path="amount" cssClass="col-sm-2 control-label">付款金额</sf:label>
		<div class="col-sm-4">
			<sf:input cssClass="form-control" path="amount" placeholder="请输入数字，可以带小数..." />
            <sf:errors path="amount" cssClass="error" />
		</div>
        <div class="col-sm-4"></div>
	</div>

	<div class="form-group">
		<sf:label path="bankAccount" cssClass="col-sm-2 control-label">银行账号</sf:label>
		<div class="col-sm-4">
			<sf:input cssClass="form-control" path="bankAccount" placeholder="请输入文字..." />
            <sf:errors path="bankAccount" cssClass="error" />
		</div>
        <div class="col-sm-4"></div>
	</div>

	<div class="form-group">
		<sf:label path="bankName" cssClass="col-sm-2 control-label">开户行名称</sf:label>
		<div class="col-sm-4">
			<sf:input cssClass="form-control" path="bankName" placeholder="请输入文字..." />
            <sf:errors path="bankName" cssClass="error" />
		</div>
        <div class="col-sm-4"></div>
	</div>

	<div class="form-group">
		<sf:label path="trice" cssClass="col-sm-2 control-label">付款时间</sf:label>
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
			<div>
				<div class="col-sm-4 control-label">
					<button type="submit" class="btn btn-primary">
						<span class="glyphicon glyphicon-ok"></span> 提 交
					</button>
				</div>
				<div class="col-sm-1 control-label">
					<a href='<s:url value="/payment" />' class="btn btn-default"><span
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
                projectId : {
                }, 
                ticketCode : {
                }, 
                payType : {
                }, 
                paymentItemId : {
                }, 
                amount : {
                }, 
                bankAccount : {
                }, 
                bankName : {
                }, 
                trice : {
                }, 
                description : {
                }, 
                status : {
                }, 
			}
		});
	});
</script>
<%@ include file="bottom.jsp"%>
