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
				href="<s:url value="/collections/detail/${collections.id }" />">
					${collections.id }</a></strong> ，${message}
		</div>
	</c:if>
	<c:if test="${not empty delMessage}">
		<div
			class="alert alert-warning alert-dismissible col-md-offset-2 affix"
			role="alert">
			<button type="button" class="close" data-dismiss="alert">
				<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
			</button>
			<strong>${collections.id }</strong> ，${delMessage}
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
					<shiro:hasPermission name="`collections_create`">
				<div class="btn-group">
					<a href="<c:url value="/collections/create" />"
						class="btn btn-info"><span class="glyphicon glyphicon-plus"></span>
						新 建 </a>
				</div></shiro:hasPermission>
			</div>

			<table class="table table-hover">
				<thead>
					<tr>
						<th>#</th>
						<th>项目ID</th>
						<th>凭证号</th>
						<th>款项来源</th>
						<th>收款方式</th>
						<th>收款金额</th>
						<th>银行账号</th>
						<th>开户行名称</th>
						<th>收款时间</th>
						<th>备注</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<%
						int i = 0;
					%>
					<c:forEach items="${list}" var="collections">
						<tr>
							<td><%=++i%></td>
							<td><a
								href="<s:url value="/collections/detail/{id}"><s:param name="id" value="${collections.id }" /></s:url>"><c:out
										value="${collections.projectId}" /></a></td>
							<td><c:out value="${collections.ticketCode}" /></td>
							<td><c:out value="${collections.sourceOf}" /></td>
							<td><c:out value="${collections.paymentType}" /></td>
							<td><c:out value="${collections.amount}" /></td>
							<td><c:out value="${collections.bankAccount}" /></td>
							<td><c:out value="${collections.bankName}" /></td>
							<td><fmt:formatDate value="${collections.trice}"
									pattern="yyyy-MM-dd" /></td>
							<td><c:out value="${collections.description}" /></td>
							<td><c:if test="${collections.status == 1 }">
									<shiro:hasPermission name="`collections_modify`"></shiro:hasPermission>
								</c:if> <c:if test="${collections.status != 1 }">
									<shiro:hasPermission name="`collections_create`"></shiro:hasPermission>
								</c:if> <shiro:hasPermission name="`collections_delete`"></shiro:hasPermission>

								<a
								href="<s:url value="/collections/modify/{id}"><s:param name="id" value="${collections.id }" /></s:url>">修改</a>
								| <a class="delete"
								data-confirm-message="删除后不可恢复，您确认要删除【<c:out value="${collections.id}" />】么？"
								href="<s:url value="/collections/delete/{id}"><s:param name="id" value="${collections.id }" /></s:url>">删除</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
<%@ include file="bottom.jsp"%>
