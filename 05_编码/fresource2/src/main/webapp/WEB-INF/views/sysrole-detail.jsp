﻿<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="container main"><div class="panel panel-default">
  <div class="panel-heading"><strong>${page_title}</strong></div>
  <div class="panel-body">
<div class="btn-toolbar" role="toolbar">
  <div class="btn-group">
  <a href="<s:url value="/sysrole" />" class="btn btn-info"><span class="glyphicon glyphicon-share-alt"></span> 返 回  </a>
</div>
<shiro:hasPermission name="`sysrole_modify`">
				<div class="btn-group">
					<a
						href="<s:url value="/sysrole/modify/{id}"><s:param name="id" value="${sysRole.id }" /></s:url>"
						class="btn btn-info"><span class="glyphicon glyphicon-pencil"></span>
						修 改 </a>
				</div></shiro:hasPermission>
                <shiro:hasPermission name="`sysrole_delete`">
				<div class="btn-group">
					<a
						data-confirm-message="系统角色表数据：<c:out value="${sysRole.id}" />，将被永久删除，操作不可撤销，是否确认？"
						href="<s:url value="/sysrole/delete/{id}"><s:param name="id" value="${sysRole.id }" /></s:url>"
						class="btn btn-info delete"><span
						class="glyphicon glyphicon-trash"></span> 删 除 </a>
				</div></shiro:hasPermission>
</div>

<sf:form modelAttribute="sysRole" cssClass="form-horizontal"
	role="form">
	<div class="form-group">
		<sf:label path="roleCode" cssClass="col-sm-2 control-label"></sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${sysRole.roleCode}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="name" cssClass="col-sm-2 control-label">角色名称</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${sysRole.name}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="isDefault" cssClass="col-sm-2 control-label">是否是默认角色</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${sysRole.isDefault}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="description" cssClass="col-sm-2 control-label">描述</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${sysRole.description}" /></p>
		</div>
	</div>
</sf:form>
  </div>
</div></div>
<%@ include file="bottom.jsp"%>
