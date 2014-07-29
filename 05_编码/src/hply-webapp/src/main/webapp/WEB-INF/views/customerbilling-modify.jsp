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
		<sf:form modelAttribute="customerBilling" cssClass="form-horizontal"
			role="form">
	<div class="form-group">
		<sf:label path="projectId" cssClass="col-sm-2 control-label">项目ID</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="projectId" placeholder="请输入文字..." />
            <sf:errors path="projectId" cssClass="error" />
		</div>
	</div>

	<div class="form-group">
		<sf:label path="invoiceCode" cssClass="col-sm-2 control-label">发票票号</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="invoiceCode" placeholder="请输入文字..." />
            <sf:errors path="invoiceCode" cssClass="error" />
		</div>
	</div>

	<div class="form-group">
		<sf:label path="invoiceType" cssClass="col-sm-2 control-label">发票类别</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="invoiceType" placeholder="请输入文字..." />
            <sf:errors path="invoiceType" cssClass="error" />
		</div>
	</div>

	<div class="form-group">
		<sf:label path="amount" cssClass="col-sm-2 control-label">发票金额</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="amount" placeholder="请输入数字，可以带小数..." />
            <sf:errors path="amount" cssClass="error" />
		</div>
	</div>

	<div class="form-group">
		<sf:label path="trice" cssClass="col-sm-2 control-label">开票时间</sf:label>
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
		<sf:label path="createTime" cssClass="col-sm-2 control-label">创建时间</sf:label>
		<div class="col-sm-10">
					<div class="input-group date">
						<sf:input cssClass="form-control" path="createTime"
							data-date-format="yyyy-mm-dd" />
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-calendar"></i></span>
					</div>
            <sf:errors path="createTime" cssClass="error" />
		</div>
	</div>

	<div class="form-group">
		<sf:label path="createUser" cssClass="col-sm-2 control-label">创建用户</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="createUser" placeholder="请输入文字..." />
            <sf:errors path="createUser" cssClass="error" />
		</div>
	</div>

	<div class="form-group">
		<sf:label path="updateTime" cssClass="col-sm-2 control-label">修改时间</sf:label>
		<div class="col-sm-10">
					<div class="input-group date">
						<sf:input cssClass="form-control" path="updateTime"
							data-date-format="yyyy-mm-dd" />
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-calendar"></i></span>
					</div>
            <sf:errors path="updateTime" cssClass="error" />
		</div>
	</div>

	<div class="form-group">
		<sf:label path="updateUser" cssClass="col-sm-2 control-label">修改用户</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="updateUser" placeholder="请输入文字..." />
            <sf:errors path="updateUser" cssClass="error" />
		</div>
	</div>

	<div class="form-group">
		<sf:label path="description" cssClass="col-sm-2 control-label">备注</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="description" placeholder="请输入文字..." />
            <sf:errors path="description" cssClass="error" />
		</div>
	</div>
			<div>
				<div class="col-sm-5 control-label">
					<button type="submit" class="btn btn-primary">
						<span class="glyphicon glyphicon-ok"></span> 提 交
					</button>
				</div>
				<div class="col-sm-1 control-label">
					<a href='<s:url value="/customerbilling" />' class="btn btn-default"><span
						class="glyphicon glyphicon-share-alt"></span> 返 回 </a>
				</div>
			</div>

		</sf:form>
	</div>
</div>

<%@ include file="bottom.jsp"%>