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
<title>详情页面</title>
<%@ include file="header.jsp" %>
	<h1>详情页面</h1>
	<div><a href='<s:url value="/fieldtypes" />'>返回</a></div>
		<table>
			<tr>
				<td>fieldt01</td>
				<td><c:out value="${fieldTypes.fieldT01 }" /></td>
			</tr>
			<tr>
				<td>fieldt02</td>
				<td><c:out value="${fieldTypes.fieldT02 }" /></td>
			</tr>
			<tr>
				<td>fieldt03</td>
				<td><c:out value="${fieldTypes.fieldT03 }" /></td>
			</tr>
			<tr>
				<td>fieldt04</td>
				<td><c:out value="${fieldTypes.fieldT04 }" /></td>
			</tr>
			<tr>
				<td>fieldt05</td>
				<td><c:out value="${fieldTypes.fieldT05 }" /></td>
			</tr>
			<tr>
				<td>fieldT06</td>
				<td><fmt:formatDate value="${fieldTypes.fieldT06}"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>
			</tr>
			<tr>
				<td>fieldT07</td>
				<td><c:out value="${fieldTypes.fieldT07 }" /></td>
			</tr>
			<tr>
				<td>fieldT08</td>
				<td><c:out value="${fieldTypes.fieldT08 }" /></td>
			</tr>
			<tr>
				<td>fieldT09</td>
				<td><c:out value="${fieldTypes.fieldT09 }" /></td>
			</tr>
		</table>
<%@ include file="bottom.jsp" %>