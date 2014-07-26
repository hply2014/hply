﻿<%@ page isELIgnored="false"%><%@ 
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
  <a href="<s:url value="/profile" />" class="btn btn-info"><span class="glyphicon glyphicon-share-alt"></span> 返 回  </a>
</div>
  <div class="btn-group">
  <a href="<s:url value="/profile/modify/{id}"><s:param name="id" value="${profile.id }" /></s:url>" class="btn btn-info"><span class="glyphicon glyphicon-pencil"></span> 修 改  </a>
</div>
  <div class="btn-group">
  <a data-confirm-message="删除后不可恢复，您确认要删除【<c:out value="${profile.id}" />】么？" href="<s:url value="/profile/delete/{id}"><s:param name="id" value="${profile.id }" /></s:url>" class="btn btn-info delete"><span class="glyphicon glyphicon-trash"></span> 删 除  </a>
</div>
</div>

<sf:form modelAttribute="profile" cssClass="form-horizontal"
	role="form">
	<div class="form-group">
		<sf:label path="projectId" cssClass="col-sm-2 control-label">项目ID</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${profile.projectId}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="expectedValue" cssClass="col-sm-2 control-label">预计用量</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatNumber pattern="#,##0.00" value="${profile.expectedValue}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="profilePoint" cssClass="col-sm-2 control-label">型材点</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${profile.profilePoint}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="trice" cssClass="col-sm-2 control-label">登记时间</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatDate value="${profile.trice}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="createTime" cssClass="col-sm-2 control-label">创建时间</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatDate value="${profile.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="createUser" cssClass="col-sm-2 control-label">创建用户</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${profile.createUser}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="updateTime" cssClass="col-sm-2 control-label">修改时间</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatDate value="${profile.updateTime}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="updateUser" cssClass="col-sm-2 control-label">修改用户</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${profile.updateUser}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="description" cssClass="col-sm-2 control-label">备注</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${profile.description}" /></p>
		</div>
	</div>
</sf:form>
  </div>
</div>
<%@ include file="bottom.jsp"%>
