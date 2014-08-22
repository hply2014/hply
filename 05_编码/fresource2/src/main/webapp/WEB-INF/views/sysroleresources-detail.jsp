﻿<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="container main"><div class="panel panel-default">
  <div class="panel-heading"><strong>${page_title}</strong></div>
  <div class="panel-body">
<div class="btn-toolbar" role="toolbar">
  <div class="btn-group">
  <a href="<s:url value="/sysroleresources" />" class="btn btn-info"><span class="glyphicon glyphicon-share-alt"></span> 返 回  </a>
</div>
<shiro:hasPermission name="`sysroleresources_modify`">
				<div class="btn-group">
					<a
						href="<s:url value="/sysroleresources/modify/{id}"><s:param name="id" value="${sysRoleResources.id }" /></s:url>"
						class="btn btn-info"><span class="glyphicon glyphicon-pencil"></span>
						修 改 </a>
				</div></shiro:hasPermission>
                <shiro:hasPermission name="`sysroleresources_delete`">
				<div class="btn-group">
					<a
						data-confirm-message="角色与资源的对应表数据：<c:out value="${sysRoleResources.id}" />，将被永久删除，操作不可撤销，是否确认？"
						href="<s:url value="/sysroleresources/delete/{id}"><s:param name="id" value="${sysRoleResources.id }" /></s:url>"
						class="btn btn-info delete"><span
						class="glyphicon glyphicon-trash"></span> 删 除 </a>
				</div></shiro:hasPermission>
</div>

<sf:form modelAttribute="sysRoleResources" cssClass="form-horizontal"
	role="form">
	<div class="form-group">
		<sf:label path="roleId" cssClass="col-sm-2 control-label"></sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${sysRoleResources.roleId}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="resourceId" cssClass="col-sm-2 control-label"></sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${sysRoleResources.resourceId}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="createTime" cssClass="col-sm-2 control-label"></sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatDate value="${sysRoleResources.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="createUser" cssClass="col-sm-2 control-label"></sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${sysRoleResources.createUser}" /></p>
		</div>
	</div>
</sf:form>
  </div>
</div></div>
<%@ include file="bottom.jsp"%>
