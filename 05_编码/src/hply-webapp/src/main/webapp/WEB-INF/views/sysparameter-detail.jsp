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
  <a href="<s:url value="/sysparameter" />" class="btn btn-info"><span class="glyphicon glyphicon-share-alt"></span> 返 回  </a>
</div>
<shiro:hasPermission name="`sysparameter_modify`">
				<div class="btn-group">
					<a
						href="<s:url value="/sysparameter/modify/{id}"><s:param name="id" value="${sysParameter.id }" /></s:url>"
						class="btn btn-info"><span class="glyphicon glyphicon-pencil"></span>
						修 改 </a>
				</div></shiro:hasPermission>
                <shiro:hasPermission name="`sysparameter_delete`">
				<div class="btn-group">
					<a
						data-confirm-message="系统参数数据：<c:out value="${sysParameter.id}" />，将被永久删除，操作不可撤销，是否确认？"
						href="<s:url value="/sysparameter/delete/{id}"><s:param name="id" value="${sysParameter.id }" /></s:url>"
						class="btn btn-info delete"><span
						class="glyphicon glyphicon-trash"></span> 删 除 </a>
				</div></shiro:hasPermission>
</div>

<sf:form modelAttribute="sysParameter" cssClass="form-horizontal"
	role="form">
	<div class="form-group">
		<sf:label path="enName" cssClass="col-sm-2 control-label">参数英文名称</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${sysParameter.enName}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="cnName" cssClass="col-sm-2 control-label">参数中文名称</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${sysParameter.cnName}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="paramValue" cssClass="col-sm-2 control-label">参数值</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${sysParameter.paramValue}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="defaultValue" cssClass="col-sm-2 control-label">默认值</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${sysParameter.defaultValue}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="isInner" cssClass="col-sm-2 control-label">是否系统内置</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${sysParameter.isInner}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="createTime" cssClass="col-sm-2 control-label">创建时间</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatDate value="${sysParameter.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="createUser" cssClass="col-sm-2 control-label">创建用户</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${sysParameter.createUser}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="updateTime" cssClass="col-sm-2 control-label">修改时间</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatDate value="${sysParameter.updateTime}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="updateUser" cssClass="col-sm-2 control-label">修改用户</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${sysParameter.updateUser}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="description" cssClass="col-sm-2 control-label">备注</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${sysParameter.description}" /></p>
		</div>
	</div>
</sf:form>
  </div>
</div></div>
<%@ include file="bottom.jsp"%>
