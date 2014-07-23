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
	pageEncoding="utf-8"%><!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>列表页面</title>
<%@ include file="header.jsp" %>
	<h1>列表页面</h1>
	<div>
	<a href="<c:url value="/fieldtypes/create" />">新建</a>
	</div>
	<table border="1" width="100%">
		<thead>
			<tr>
				<th>#</th>
				<th>FieldT01</th>
				<th>FieldT02</th>
				<th>FieldT03</th>
				<th>FieldT04</th>
				<th>FieldT05</th>
				<th>FieldT06</th>
				<th>FieldT07</th>
				<th>FieldT08</th>
				<th>FieldT09</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody><%int i = 0; %>
			<c:forEach items="${list}" var="fieldTypes">
				<tr>
					<td><%=++i %></td>
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
					<td><a
						href="<s:url value="/fieldtypes/modify/{id}"><s:param name="id" value="${fieldTypes.id }" /></s:url>">修改</a> | <a href="#">删除</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
<%@ include file="bottom.jsp" %>