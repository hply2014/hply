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
				href="<s:url value="/paymentitem/detail/${paymentItem.id }" />">
					${paymentItem.id }</a></strong> ，${message}
		</div>
	</c:if>
	<c:if test="${not empty delMessage}">
		<div
			class="alert alert-warning alert-dismissible col-md-offset-2 affix"
			role="alert">
			<button type="button" class="close" data-dismiss="alert">
				<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
			</button>
			<strong>${paymentItem.id }</strong> ，${delMessage}
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
					<shiro:hasPermission name="`project_create`"></shiro:hasPermission>
					<a href="<c:url value="/paymentitem/create" />"
						class="btn btn-info"><span class="glyphicon glyphicon-plus"></span>
						新 建 </a>
				</div>
			</div>

			<table class="table table-hover">
				<thead>
					<tr>
						<th>#</th>
						<th>付款科目名称</th>
						<th>报销比例上限</th>
						<th>备注</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<%
						int i = 0;
					%>
					<c:forEach items="${list}" var="paymentItem">
						<tr>
							<td><%=++i%></td>
							<td><a
								href="<s:url value="/paymentitem/detail/{id}"><s:param name="id" value="${paymentItem.id }" /></s:url>"><c:out
										value="${paymentItem.itemName}" /></a></td>
							<td><c:out value="${paymentItem.reimbursementCap}" /></td>
							<td><c:out value="${paymentItem.description}" /></td>
							<td><c:if test="${project.status == 1 }">
									<shiro:hasPermission name="`sysuser_modify`"></shiro:hasPermission>
								</c:if> <c:if test="${project.status != 1 }">
									<shiro:hasPermission name="`sysuser_create`"></shiro:hasPermission>
								</c:if> <shiro:hasPermission name="`sysuser_delete`"></shiro:hasPermission>


								<a
								href="<s:url value="/paymentitem/modify/{id}"><s:param name="id" value="${paymentItem.id }" /></s:url>">修改</a>
								| <a class="delete"
								data-confirm-message="删除后不可恢复，您确认要删除【<c:out value="${paymentItem.id}" />】么？"
								href="<s:url value="/paymentitem/delete/{id}"><s:param name="id" value="${paymentItem.id }" /></s:url>">删除</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
<%@ include file="bottom.jsp"%>
