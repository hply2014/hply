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
	pageEncoding="utf-8"%>
<%@ include file="header.jsp"%><div class="container main">
	<c:if test="${not empty message}">
		<div></div>
		<div
			class="alert alert-success alert-dismissible col-md-offset-2 affix"
			role="alert">
			<button type="button" class="close" data-dismiss="alert">
				<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
			</button>
			<strong><a
				href="<s:url value="/sysresource/detail/${sysResource.id }" />">
					${sysResource.id }</a></strong> ，${message}
		</div>
	</c:if>
	<c:if test="${not empty delMessage}">
		<div
			class="alert alert-warning alert-dismissible col-md-offset-2 affix"
			role="alert">
			<button type="button" class="close" data-dismiss="alert">
				<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
			</button>
			<strong>${sysResource.id }</strong> ，${delMessage}
		</div>
	</c:if>
	<div class="panel panel-default">
		<div class="panel-heading">
			<strong>${page_title}</strong>（
			<c:out value="${list.size()}" />
			条数据）
		</div>
		<div class="panel-body">
			<div class="btn-toolbar" role="toolbar">
				<div class="btn-group">
					<a href="<c:url value="/sysresource/create" />"
						class="btn btn-info"><span class="glyphicon glyphicon-plus"></span>
						新 建 </a>
				</div>
			</div>

			<table class="table table-hover">
				<thead>
					<tr>
						<th>#</th>
						<th>资源编码</th>
						<th>图标路径</th>
						<th>资源名称</th>
						<th>URL地址</th>
						<th>资源类型</th>
						<th>顺序号</th>
						<th>备注</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<%
						int i = 0;
					%>
					<c:forEach items="${list}" var="sysResource">
						<tr>
							<td><%=++i%></td>
							<td><a
								href="<s:url value="/sysresource/detail/{id}"><s:param name="id" value="${sysResource.id }" /></s:url>"><c:out
										value="${sysResource.resCode}" /></a></td>
							<td><c:out value="${sysResource.resName}" /></td>
							<td><c:out value="${sysResource.icon}" /></td>
							<td><c:out value="${sysResource.resUrl}" /></td>
							<td><c:out value="${sysResource.resType}" /></td>
							<td><c:out value="${sysResource.orderBy}" /></td>
							<td><c:out value="${sysResource.description}" /></td>
							<td><a
								href="<s:url value="/sysresource/modify/{id}"><s:param name="id" value="${sysResource.id }" /></s:url>">修改</a>
								| <a class="delete"
								data-confirm-message="删除后不可恢复，您确认要删除【<c:out value="${sysResource.id}" />】么？"
								href="<s:url value="/sysresource/delete/{id}"><s:param name="id" value="${sysResource.id }" /></s:url>">删除</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
<%@ include file="bottom.jsp"%>
