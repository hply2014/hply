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
  <a href="<s:url value="/sysuser" />" class="btn btn-info"><span class="glyphicon glyphicon-share-alt"></span> 返 回  </a>
</div>
  <div class="btn-group">
  <a href="<s:url value="/sysuser/modify/{id}"><s:param name="id" value="${sysUser.id }" /></s:url>" class="btn btn-info"><span class="glyphicon glyphicon-pencil"></span> 修 改  </a>
</div>
  <div class="btn-group">
  <a data-confirm-message="删除后不可恢复，您确认要删除【<c:out value="${sysUser.id}" />】么？" href="<s:url value="/sysuser/delete/{id}"><s:param name="id" value="${sysUser.id }" /></s:url>" class="btn btn-info delete"><span class="glyphicon glyphicon-trash"></span> 删 除  </a>
</div>
</div>

<sf:form modelAttribute="sysUser" cssClass="form-horizontal"
	role="form">
	<div class="form-group">
		<sf:label path="loginName" cssClass="col-sm-2 control-label">登陆名</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${sysUser.loginName}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="realName" cssClass="col-sm-2 control-label">姓名</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${sysUser.realName}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="organizationId" cssClass="col-sm-2 control-label">所在部门</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${sysUser.organizationId}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="password" cssClass="col-sm-2 control-label">密码</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${sysUser.password}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="lastLoginIp" cssClass="col-sm-2 control-label">最后登陆IP</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${sysUser.lastLoginIp}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="lastLoginTime" cssClass="col-sm-2 control-label">最后登陆时间</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatDate value="${sysUser.lastLoginTime}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="fails" cssClass="col-sm-2 control-label">连续登录失败次数</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${sysUser.fails}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="logined" cssClass="col-sm-2 control-label">登陆总次数</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${sysUser.logined}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="position" cssClass="col-sm-2 control-label">职务</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${sysUser.position}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="enabled" cssClass="col-sm-2 control-label">是否禁用</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${sysUser.enabled}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="orderBy" cssClass="col-sm-2 control-label">顺序号</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${sysUser.orderBy}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="createTime" cssClass="col-sm-2 control-label">创建时间</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatDate value="${sysUser.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="createUser" cssClass="col-sm-2 control-label">创建用户</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${sysUser.createUser}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="updateTime" cssClass="col-sm-2 control-label">修改时间</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatDate value="${sysUser.updateTime}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="updateUser" cssClass="col-sm-2 control-label">修改用户</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${sysUser.updateUser}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="description" cssClass="col-sm-2 control-label">备注</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${sysUser.description}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="mustChangePassword" cssClass="col-sm-2 control-label">下次登录是否必须修改密码</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${sysUser.mustChangePassword}" /></p>
		</div>
	</div>
</sf:form>
  </div>
</div>
<%@ include file="bottom.jsp"%>
