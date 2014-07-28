<%@ page isELIgnored="false"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib
	uri="http://www.springframework.org/tags" prefix="s"%><%@ taglib
	uri="http://www.springframework.org/tags/form" prefix="sf"%><%@ page
	language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%><%@ include file="header.jsp"%>
<div class="panel panel-default">
	<div class="panel-heading">
		<strong>${page_title}</strong>
	</div>
	<div class="panel-body">
		<sf:form modelAttribute="sysResource" cssClass="form-horizontal"
			role="form">
	<div class="form-group">
		<sf:label path="resCode" cssClass="col-sm-2 control-label">资源编码</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="resCode" placeholder="请输入文字..." />
            <sf:errors path="resCode" cssClass="error" />
		</div>
	</div>

	<div class="form-group">
		<sf:label path="resName" cssClass="col-sm-2 control-label">图标路径</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="resName" placeholder="请输入文字..." />
            <sf:errors path="resName" cssClass="error" />
		</div>
	</div>

	<div class="form-group">
		<sf:label path="icon" cssClass="col-sm-2 control-label">资源名称</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="icon" placeholder="请输入文字..." />
            <sf:errors path="icon" cssClass="error" />
		</div>
	</div>

	<div class="form-group">
		<sf:label path="resUrl" cssClass="col-sm-2 control-label">URL地址</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="resUrl" placeholder="请输入文字..." />
            <sf:errors path="resUrl" cssClass="error" />
		</div>
	</div>

	<div class="form-group">
		<sf:label path="resType" cssClass="col-sm-2 control-label">资源类型</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="resType" placeholder="请输入文字..." />
            <sf:errors path="resType" cssClass="error" />
		</div>
	</div>

	<div class="form-group">
		<sf:label path="orderBy" cssClass="col-sm-2 control-label">顺序号</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="orderBy" placeholder="请输入文字..." />
            <sf:errors path="orderBy" cssClass="error" />
		</div>
	</div>

	<div class="form-group">
		<sf:label path="parentId" cssClass="col-sm-2 control-label">父ID</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="parentId" placeholder="请输入文字..." />
            <sf:errors path="parentId" cssClass="error" />
		</div>
	</div>

	<div class="form-group">
		<sf:label path="enabled" cssClass="col-sm-2 control-label">是否禁用</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="enabled" placeholder="请输入文字..." />
            <sf:errors path="enabled" cssClass="error" />
		</div>
	</div>

	<div class="form-group">
		<sf:label path="description" cssClass="col-sm-2 control-label">备注</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="description" placeholder="请输入文字..." />
            <sf:errors path="description" cssClass="error" />
		</div>
	</div>
			<div>
				<div class="col-sm-5 control-label">
					<button type="submit" class="btn btn-primary">
						<span class="glyphicon glyphicon-ok"></span> 提 交
					</button>
				</div>
				<div class="col-sm-1 control-label">
					<a href='<s:url value="/sysresource" />' class="btn btn-default"><span
						class="glyphicon glyphicon-share-alt"></span> 返 回 </a>
				</div>
			</div>

		</sf:form>
	</div>
</div>

<%@ include file="bottom.jsp"%>
