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
				href="<s:url value="/partybilling/detail/${partyBilling.id }" />">
					${partyBilling.id }</a></strong> ，${message}
		</div>
	</c:if>
	<c:if test="${not empty delMessage}">
		<div
			class="alert alert-warning alert-dismissible col-md-offset-2 affix"
			role="alert">
			<button type="button" class="close" data-dismiss="alert">
				<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
			</button>
			<strong>${partyBilling.id }</strong> ，${delMessage}
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
					<a href="<c:url value="/partybilling/create" />"
						class="btn btn-info"><span class="glyphicon glyphicon-plus"></span>
						新 建 </a>
				</div>
			</div>

			<table class="table table-hover">
				<thead>
					<tr>
						<th>#</th>
						<th>项目ID</th>
						<th>发票票号</th>
						<th>发票金额</th>
						<th>开票时间</th>
						<th>税率</th>
						<th>应收税金</th>
						<th>审核意见</th>
						<th>审核人</th>
						<th>审核时间</th>
						<th>流程状态</th>
						<th>备注</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<%
						int i = 0;
					%>
					<c:forEach items="${list}" var="partyBilling">
						<tr>
							<td><%=++i%></td>
							<td><a
								href="<s:url value="/partybilling/detail/{id}"><s:param name="id" value="${partyBilling.id }" /></s:url>"><c:out
										value="${partyBilling.projectId}" /></a></td>
							<td><c:out value="${partyBilling.invoiceCode}" /></td>
							<td><c:out value="${partyBilling.amount}" /></td>
							<td><fmt:formatDate value="${partyBilling.trice}"
									pattern="yyyy-MM-dd" /></td>
							<td><c:out value="${partyBilling.taxRate}" /></td>
							<td><c:out value="${partyBilling.taxAmount}" /></td>
							<td><c:out value="${partyBilling.step1Idea}" /></td>
							<td><c:out value="${partyBilling.step1User}" /></td>
							<td><fmt:formatDate value="${partyBilling.step1Time}"
									pattern="yyyy-MM-dd" /></td>
							<td><c:out value="${partyBilling.stepStatus}" /></td>
							<td><c:out value="${partyBilling.description}" /></td>
							<td><c:if test="${project.status == 1 }">
									<shiro:hasPermission name="`sysuser_modify`"></shiro:hasPermission>
								</c:if> <c:if test="${project.status != 1 }">
									<shiro:hasPermission name="`sysuser_create`"></shiro:hasPermission>
								</c:if> <shiro:hasPermission name="`sysuser_delete`"></shiro:hasPermission>


								<a
								href="<s:url value="/partybilling/modify/{id}"><s:param name="id" value="${partyBilling.id }" /></s:url>">修改</a>
								| <a class="delete"
								data-confirm-message="删除后不可恢复，您确认要删除【<c:out value="${partyBilling.id}" />】么？"
								href="<s:url value="/partybilling/delete/{id}"><s:param name="id" value="${partyBilling.id }" /></s:url>">删除</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
<%@ include file="bottom.jsp"%>
