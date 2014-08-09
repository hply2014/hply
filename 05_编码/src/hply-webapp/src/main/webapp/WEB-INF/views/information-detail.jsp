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
  <a href="<s:url value="/information" />" class="btn btn-info"><span class="glyphicon glyphicon-share-alt"></span> 返 回  </a>
</div>
<shiro:hasPermission name="`information_modify`">
				<div class="btn-group">
					<a
						href="<s:url value="/information/modify/{id}"><s:param name="id" value="${information.id }" /></s:url>"
						class="btn btn-info"><span class="glyphicon glyphicon-pencil"></span>
						修 改 </a>
				</div></shiro:hasPermission>
                <shiro:hasPermission name="`information_delete`">
				<div class="btn-group">
					<a
						data-confirm-message="信息登记数据：<c:out value="${information.id}" />，将被永久删除，操作不可撤销，是否确认？"
						href="<s:url value="/information/delete/{id}"><s:param name="id" value="${information.id }" /></s:url>"
						class="btn btn-info delete"><span
						class="glyphicon glyphicon-trash"></span> 删 除 </a>
				</div></shiro:hasPermission>
</div>

<sf:form modelAttribute="information" cssClass="form-horizontal"
	role="form">
	<div class="form-group">
		<sf:label path="organizationId" cssClass="col-sm-2 control-label">所在部门</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${information.organizationId}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="projectName" cssClass="col-sm-2 control-label">项目名称</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${information.projectName}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="address" cssClass="col-sm-2 control-label">地址</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${information.address}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="developer" cssClass="col-sm-2 control-label">开发商</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${information.developer}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="epcCorporation" cssClass="col-sm-2 control-label">总包单位</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${information.epcCorporation}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="variety" cssClass="col-sm-2 control-label">品种</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${information.variety}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="totalArea" cssClass="col-sm-2 control-label">总面积</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${information.totalArea}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="realName" cssClass="col-sm-2 control-label">姓名</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${information.realName}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="identification" cssClass="col-sm-2 control-label">身份证号</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${information.identification}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="contact" cssClass="col-sm-2 control-label">联系方式</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${information.contact}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="subscriber" cssClass="col-sm-2 control-label">登记人</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${information.subscriber}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="trice" cssClass="col-sm-2 control-label">登记时间</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatDate value="${information.trice}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="createTime" cssClass="col-sm-2 control-label">创建时间</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatDate value="${information.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="createUser" cssClass="col-sm-2 control-label">创建用户</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${information.createUser}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="updateTime" cssClass="col-sm-2 control-label">修改时间</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatDate value="${information.updateTime}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="updateUser" cssClass="col-sm-2 control-label">修改用户</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${information.updateUser}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="description" cssClass="col-sm-2 control-label">备注</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${information.description}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="status" cssClass="col-sm-2 control-label">数据状态，0：草稿/1：正式</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${information.status}" /></p>
		</div>
	</div>
</sf:form>
  </div>
</div></div>
<%@ include file="bottom.jsp"%>
