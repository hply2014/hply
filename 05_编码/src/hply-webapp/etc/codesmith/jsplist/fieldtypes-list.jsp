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
<div class="alert alert-success alert-dismissible col-md-offset-2 affix" role="alert">
  <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
  <strong><a href="<s:url value="/fieldtypes/detail/${fieldTypes.id }" />"> ${fieldTypes.id }</a></strong> ，${message}
</div>
</c:if>
<c:if test="${not empty delMessage}">
<div class="alert alert-warning alert-dismissible col-md-offset-2 affix" role="alert">
  <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
  <strong>${fieldTypes.id }</strong> ，${delMessage}
</div>
</c:if>
<div class="panel panel-default">
  <div class="panel-heading"><strong>${page_title}</strong>（<c:out value="${list.size()}" />条数据）</div>
  <div class="panel-body">
<div class="btn-toolbar" role="toolbar">
  <div class="btn-group">
  <a href="<c:url value="/fieldtypes/create" />" class="btn btn-info"><span class="glyphicon glyphicon-plus"></span> 新 建 </a>
</div>
</div>

<table class="table table-hover">
	<thead>
		<tr>
			<th>#</th>
			<th></th>
			<th></th>
			<th></th>
			<th></th>
			<th></th>
			<th></th>
			<th></th>
			<th></th>
			<th></th>
			<th>数据状态，0：草稿/1：正式</th>
			<th>操作</th>
		</tr>
	</thead>
	<tbody>
		<%
			int i = 0;
		%>
		<c:forEach items="${list}" var="fieldTypes">
			<tr>
				<td><%=++i%></td>
				<td><a
					href="<s:url value="/fieldtypes/detail/{id}"><s:param name="id" value="${fieldTypes.id }" /></s:url>"><c:out
							value="${fieldTypes.fieldT01}" /></a></td>  
				<td><c:out value="${fieldTypes.fieldT02}" /></td>
				<td><c:out value="${fieldTypes.fieldT03}" /></td>
				<td><c:out value="${fieldTypes.fieldT04}" /></td>
				<td><c:out value="${fieldTypes.fieldT05}" /></td>
				<td><fmt:formatDate value="${fieldTypes.fieldT06}"
						pattern="yyyy-MM-dd" /></td>  
				<td><c:out value="${fieldTypes.fieldT07}" /></td>
				<td><c:out value="${fieldTypes.fieldT08}" /></td>
				<td><c:out value="${fieldTypes.fieldT09}" /></td>
				<td><c:out value="${fieldTypes.status}" /></td>
				<td><a
					href="<s:url value="/fieldtypes/modify/{id}"><s:param name="id" value="${fieldTypes.id }" /></s:url>">修改</a>
					| <a class="delete" data-confirm-message="删除后不可恢复，您确认要删除【<c:out value="${fieldTypes.id}" />】么？"
					href="<s:url value="/fieldtypes/delete/{id}"><s:param name="id" value="${fieldTypes.id }" /></s:url>">删除</a></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
  </div>
</div></div>
<%@ include file="bottom.jsp"%>
