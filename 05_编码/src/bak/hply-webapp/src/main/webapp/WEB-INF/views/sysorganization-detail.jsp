<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="container main"><div class="panel panel-default">
  <div class="panel-heading"><strong>${page_title}</strong></div>
  <div class="panel-body">
<div class="btn-toolbar" role="toolbar">
  <div class="btn-group">
  <a href="<s:url value="/sysorganization" />" class="btn btn-info"><span class="glyphicon glyphicon-share-alt"></span> 返 回  </a>
</div>
<shiro:hasPermission name="`sysorganization_modify`">
				<div class="btn-group">
					<a
						href="<s:url value="/sysorganization/modify/{id}"><s:param name="id" value="${sysOrganization.id }" /></s:url>"
						class="btn btn-info"><span class="glyphicon glyphicon-pencil"></span>
						修 改 </a>
				</div></shiro:hasPermission>
                <shiro:hasPermission name="`sysorganization_delete`">
				<div class="btn-group">
					<a
						data-confirm-message="组织机构数据：<c:out value="${sysOrganization.id}" />，将被永久删除，操作不可撤销，是否确认？"
						href="<s:url value="/sysorganization/delete/{id}"><s:param name="id" value="${sysOrganization.id }" /></s:url>"
						class="btn btn-info delete"><span
						class="glyphicon glyphicon-trash"></span> 删 除 </a>
				</div></shiro:hasPermission>
</div>

<sf:form modelAttribute="sysOrganization" cssClass="form-horizontal"
	role="form">
	<div class="form-group">
		<sf:label path="organizationName" cssClass="col-sm-2 control-label">机构名称</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${sysOrganization.organizationName}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="createTime" cssClass="col-sm-2 control-label">创建时间</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatDate value="${sysOrganization.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="description" cssClass="col-sm-2 control-label">备注</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${sysOrganization.description}" /></p>
		</div>
	</div>
</sf:form>
  </div>
</div></div>
<%@ include file="bottom.jsp"%>
