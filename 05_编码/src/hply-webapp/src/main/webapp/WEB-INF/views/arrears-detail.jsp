<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="container main"><div class="panel panel-primary">
  <div class="panel-heading"><strong>${page_title}</strong></div>
  <div class="panel-body">
<div class="btn-toolbar" role="toolbar">
  <div class="btn-group">
  <a href="<s:url value="/arrears" />" class="btn btn-info"><span class="glyphicon glyphicon-share-alt"></span> 返 回  </a>
</div>
  <div class="btn-group">
  <a href="<s:url value="/arrears/modify/{id}"><s:param name="id" value="${arrears.id }" /></s:url>" class="btn btn-info"><span class="glyphicon glyphicon-pencil"></span> 修 改  </a>
</div>
  <div class="btn-group">
  <a data-confirm-message="删除后不可恢复，您确认要删除【<c:out value="${arrears.id}" />】么？" href="<s:url value="/arrears/delete/{id}"><s:param name="id" value="${arrears.id }" /></s:url>" class="btn btn-info delete"><span class="glyphicon glyphicon-trash"></span> 删 除  </a>
</div>
</div>

<sf:form modelAttribute="arrears" cssClass="form-horizontal"
	role="form">
	<div class="form-group">
		<sf:label path="projectId" cssClass="col-sm-2 control-label">项目名称</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${arrears.projectId}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="fundsUsing" cssClass="col-sm-2 control-label">资金使用方</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${arrears.fundsUsing}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="arrearsType" cssClass="col-sm-2 control-label">欠款分类</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${arrears.arrearsType}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="payType" cssClass="col-sm-2 control-label">支付方式</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${arrears.payType}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="amount" cssClass="col-sm-2 control-label">金额</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatNumber pattern="#,##0.00" value="${arrears.amount}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="interestAmount" cssClass="col-sm-2 control-label">利息额</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatNumber pattern="#,##0.00" value="${arrears.interestAmount}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="interestRate" cssClass="col-sm-2 control-label">利率</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatNumber pattern="#,##0.00" value="${arrears.interestRate}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="bankAccount" cssClass="col-sm-2 control-label">银行账号</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${arrears.bankAccount}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="bankName" cssClass="col-sm-2 control-label">开户行名称</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${arrears.bankName}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="trice" cssClass="col-sm-2 control-label">登记时间</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatDate value="${arrears.trice}" pattern="yyyy-MM-dd" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="createTime" cssClass="col-sm-2 control-label">创建时间</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatDate value="${arrears.createTime}" pattern="yyyy-MM-dd" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="createUser" cssClass="col-sm-2 control-label">创建用户</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${arrears.createUser}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="updateTime" cssClass="col-sm-2 control-label">修改时间</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatDate value="${arrears.updateTime}" pattern="yyyy-MM-dd" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="updateUser" cssClass="col-sm-2 control-label">修改用户</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${arrears.updateUser}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="description" cssClass="col-sm-2 control-label">备注</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${arrears.description}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="status" cssClass="col-sm-2 control-label">数据状态，0：草稿/1：正式</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${arrears.status}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="arrearsCode" cssClass="col-sm-2 control-label">凭证号</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${arrears.arrearsCode}" /></p>
		</div>
	</div>
</sf:form>
  </div>
</div></div>
<%@ include file="bottom.jsp"%>
