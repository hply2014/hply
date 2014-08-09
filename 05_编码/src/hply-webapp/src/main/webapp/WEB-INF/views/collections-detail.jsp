<%@ page isELIgnored="false"%><%@ 
taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ 
taglib
	uri="http://www.springframework.org/tags" prefix="s"%><%@ 
taglib
	uri="http://www.springframework.org/tags/form" prefix="sf"%><%@ 
taglib
	uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%><%@ 
	taglib
	prefix="shiro" uri="http://shiro.apache.org/tags"%><%@ 
page
	language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%><%@ include file="header.jsp"%>
<div class="container main"><div class="panel panel-default">
  <div class="panel-heading"><strong>${page_title}</strong></div>
  <div class="panel-body">
<div class="btn-toolbar" role="toolbar">
  <div class="btn-group">
  <a href="<s:url value="/collections" />" class="btn btn-info"><span class="glyphicon glyphicon-share-alt"></span> 返 回  </a>
</div>
<shiro:hasPermission name="`collections_modify`">
				<div class="btn-group">
					<a
						href="<s:url value="/collections/modify/{id}"><s:param name="id" value="${collections.id }" /></s:url>"
						class="btn btn-info"><span class="glyphicon glyphicon-pencil"></span>
						修 改 </a>
				</div></shiro:hasPermission>
                <shiro:hasPermission name="`collections_delete`">
				<div class="btn-group">
					<a
						data-confirm-message="收款情况数据：<c:out value="${collections.id}" />，将被永久删除，操作不可撤销，是否确认？"
						href="<s:url value="/collections/delete/{id}"><s:param name="id" value="${collections.id }" /></s:url>"
						class="btn btn-info delete"><span
						class="glyphicon glyphicon-trash"></span> 删 除 </a>
				</div></shiro:hasPermission>
</div>

<sf:form modelAttribute="collections" cssClass="form-horizontal"
	role="form">
	<div class="form-group">
		<sf:label path="projectId" cssClass="col-sm-2 control-label">项目ID</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${collections.projectId}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="ticketCode" cssClass="col-sm-2 control-label">凭证号</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${collections.ticketCode}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="sourceOf" cssClass="col-sm-2 control-label">款项来源</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${collections.sourceOf}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="paymentType" cssClass="col-sm-2 control-label">收款方式</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${collections.paymentType}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="amount" cssClass="col-sm-2 control-label">收款金额</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatNumber pattern="#,##0.00" value="${collections.amount}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="bankAccount" cssClass="col-sm-2 control-label">银行账号</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${collections.bankAccount}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="bankName" cssClass="col-sm-2 control-label">开户行名称</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${collections.bankName}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="trice" cssClass="col-sm-2 control-label">收款时间</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatDate value="${collections.trice}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="createTime" cssClass="col-sm-2 control-label">创建时间</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatDate value="${collections.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="createUser" cssClass="col-sm-2 control-label">创建用户</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${collections.createUser}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="updateTime" cssClass="col-sm-2 control-label">修改时间</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatDate value="${collections.updateTime}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="updateUser" cssClass="col-sm-2 control-label">修改用户</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${collections.updateUser}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="description" cssClass="col-sm-2 control-label">备注</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${collections.description}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="status" cssClass="col-sm-2 control-label">数据状态，0：草稿/1：正式</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${collections.status}" /></p>
		</div>
	</div>
</sf:form>
  </div>
</div></div>
<%@ include file="bottom.jsp"%>
