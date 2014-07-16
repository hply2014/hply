<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%><!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<h2>Create New Table</h2>
		<c:if test="${not empty message}">
			<div id="message" class="success">${message}</div>
		</c:if>
		<form:form method="POST" modelAttribute="newTable">
			<fieldset>
				<table>
					<tr>
						<td>ID</td>
						<td><form:input path="id" /><form:errors path="id" cssClass="error" /></td>
					</tr>
					<tr>
						<td>t1</td>
						<td><form:input path="t1" /><form:errors path="t1" cssClass="error" /></td>
					</tr>
					<tr>
						<td>t2</td>
						<td><form:input path="t2" /><form:errors path="t2" cssClass="error" /></td>
					</tr>
					<tr>
						<td>t3</td>
						<td><form:input path="t3" /><form:errors path="t3" cssClass="error" /></td>
					</tr>
					<tr>
						<td>t4</td>
						<td><form:input path="t4" /><form:errors path="t4" cssClass="error" /></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" value="I submit" /></td>
					</tr>
				</table>
			</fieldset>
		</form:form>
	</div>
</body>
</html>