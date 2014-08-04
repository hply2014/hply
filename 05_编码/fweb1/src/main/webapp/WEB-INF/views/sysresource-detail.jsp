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
<div class="container main"><div class="panel panel-default">
  <div class="panel-heading"><strong>${page_title}</strong></div>
  <div class="panel-body">
<div class="btn-toolbar" role="toolbar">
  <div class="btn-group">
  <a href="<s:url value="/sysresource" />" class="btn btn-info"><span class="glyphicon glyphicon-share-alt"></span> 返 回  </a>
</div>
  <div class="btn-group">
  <a href="<s:url value="/sysresource/modify/{id}"><s:param name="id" value="${sysResource.id }" /></s:url>" class="btn btn-info"><span class="glyphicon glyphicon-pencil"></span> 修 改  </a>
</div>
  <div class="btn-group">
  <a data-confirm-message="删除后不可恢复，您确认要删除【<c:out value="${sysResource.resourceName}" />】么？" href="<s:url value="/sysresource/delete/{id}"><s:param name="id" value="${sysResource.id }" /></s:url>" class="btn btn-info delete"><span class="glyphicon glyphicon-trash"></span> 删 除  </a>
</div>
</div>

<sf:form modelAttribute="sysResource" cssClass="form-horizontal"
	role="form">
	<div class="form-group">
		<sf:label path="resourceCode" cssClass="col-sm-2 control-label">资源编码</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${sysResource.resourceCode}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="resourceName" cssClass="col-sm-2 control-label">资源名称</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${sysResource.resourceName}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="icon" cssClass="col-sm-2 control-label">图标路径</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${sysResource.icon}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="resourceUri" cssClass="col-sm-2 control-label">URL地址</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${sysResource.resourceUri}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="resourceType" cssClass="col-sm-2 control-label">资源类型</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${sysResource.resourceType}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="orderId" cssClass="col-sm-2 control-label">顺序号</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${sysResource.orderId}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="parentId" cssClass="col-sm-2 control-label">父ID</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${sysResource.parentId}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="enabled" cssClass="col-sm-2 control-label">是否禁用</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${sysResource.enabled}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="description" cssClass="col-sm-2 control-label">备注</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${sysResource.description}" /></p>
		</div>
	</div>
</sf:form>
  </div>
</div></div>
<%@ include file="bottom.jsp"%>
