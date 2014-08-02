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
				href="<s:url value="/information/detail/${information.id }" />">
					${information.id }</a></strong> ，${message}
		</div>
	</c:if>
	<c:if test="${not empty delMessage}">
		<div
			class="alert alert-warning alert-dismissible col-md-offset-2 affix"
			role="alert">
			<button type="button" class="close" data-dismiss="alert">
				<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
			</button>
			<strong>${information.id }</strong> ，${delMessage}
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
					<a href="<c:url value="/information/create" />"
						class="btn btn-info"><span class="glyphicon glyphicon-plus"></span>
						新 建 </a>
				</div>
			</div>

			<table class="table table-hover">
				<thead>
					<tr>
						<th>#</th>
						<th>所在部门</th>
						<th>项目名称</th>
						<th>地址</th>
						<th>开发商</th>
						<th>总包单位</th>
						<th>品种</th>
						<th>总面积</th>
						<th>姓名</th>
						<th>身份证号</th>
						<th>联系方式</th>
						<th>登记人</th>
						<th>登记时间</th>
						<th>备注</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<%
						int i = 0;
					%>
					<c:forEach items="${list}" var="information">
						<tr>
							<td><%=++i%></td>
							<td><a
								href="<s:url value="/information/detail/{id}"><s:param name="id" value="${information.id }" /></s:url>"><c:out
										value="${information.organizationId}" /></a></td>
							<td><c:out value="${information.projectName}" /></td>
							<td><c:out value="${information.address}" /></td>
							<td><c:out value="${information.developer}" /></td>
							<td><c:out value="${information.epcCorporation}" /></td>
							<td><c:out value="${information.variety}" /></td>
							<td><c:out value="${information.totalArea}" /></td>
							<td><c:out value="${information.realName}" /></td>
							<td><c:out value="${information.identification}" /></td>
							<td><c:out value="${information.contact}" /></td>
							<td><c:out value="${information.subscriber}" /></td>
							<td><fmt:formatDate value="${information.trice}"
									pattern="yyyy-MM-dd" /></td>
							<td><c:out value="${information.description}" /></td>
							<td><a
								href="<s:url value="/information/modify/{id}"><s:param name="id" value="${information.id }" /></s:url>">修改</a>
								| <a class="delete"
								data-confirm-message="删除后不可恢复，您确认要删除【<c:out value="${information.id}" />】么？"
								href="<s:url value="/information/delete/{id}"><s:param name="id" value="${information.id }" /></s:url>">删除</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
<%@ include file="bottom.jsp"%>
