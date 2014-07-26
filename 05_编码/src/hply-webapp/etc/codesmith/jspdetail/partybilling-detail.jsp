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
  <a href="<s:url value="/partybilling" />" class="btn btn-info"><span class="glyphicon glyphicon-share-alt"></span> 返 回  </a>
</div>
  <div class="btn-group">
  <a href="<s:url value="/partybilling/modify/{id}"><s:param name="id" value="${partyBilling.id }" /></s:url>" class="btn btn-info"><span class="glyphicon glyphicon-pencil"></span> 修 改  </a>
</div>
  <div class="btn-group">
  <a data-confirm-message="删除后不可恢复，您确认要删除【<c:out value="${partyBilling.id}" />】么？" href="<s:url value="/partybilling/delete/{id}"><s:param name="id" value="${partyBilling.id }" /></s:url>" class="btn btn-info delete"><span class="glyphicon glyphicon-trash"></span> 删 除  </a>
</div>
</div>

<sf:form modelAttribute="partyBilling" cssClass="form-horizontal"
	role="form">
	<div class="form-group">
		<sf:label path="projectId" cssClass="col-sm-2 control-label">项目ID</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${partyBilling.projectId}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="invoiceCode" cssClass="col-sm-2 control-label">发票票号</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${partyBilling.invoiceCode}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="amount" cssClass="col-sm-2 control-label">发票金额</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatNumber pattern="#,##0.00" value="${partyBilling.amount}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="trice" cssClass="col-sm-2 control-label">开票时间</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatDate value="${partyBilling.trice}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="taxRate" cssClass="col-sm-2 control-label">税率</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatNumber pattern="#,##0.00" value="${partyBilling.taxRate}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="taxAmount" cssClass="col-sm-2 control-label">应收税金</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatNumber pattern="#,##0.00" value="${partyBilling.taxAmount}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="step1Idea" cssClass="col-sm-2 control-label">审核意见</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${partyBilling.step1Idea}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="step1User" cssClass="col-sm-2 control-label">审核人</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${partyBilling.step1User}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="step1Time" cssClass="col-sm-2 control-label">审核时间</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatDate value="${partyBilling.step1Time}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="stepStatus" cssClass="col-sm-2 control-label">流程状态</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${partyBilling.stepStatus}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="createTime" cssClass="col-sm-2 control-label">创建时间</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatDate value="${partyBilling.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="createUser" cssClass="col-sm-2 control-label">创建用户</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${partyBilling.createUser}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="updateTime" cssClass="col-sm-2 control-label">修改时间</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatDate value="${partyBilling.updateTime}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="updateUser" cssClass="col-sm-2 control-label">修改用户</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${partyBilling.updateUser}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="description" cssClass="col-sm-2 control-label">备注</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${partyBilling.description}" /></p>
		</div>
	</div>
</sf:form>
  </div>
</div>
<%@ include file="bottom.jsp"%>
