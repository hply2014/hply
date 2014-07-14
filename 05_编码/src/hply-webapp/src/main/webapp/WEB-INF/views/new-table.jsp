<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
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
		<sf:form method="POST" modelAttribute="newTable">
			<fieldset>
				<table>
					<tr>
						<td>ID</td>
						<td><sf:input path="id" /></td>
					</tr>
					<tr>
						<td>t1</td>
						<td><sf:input path="t1" /></td>
					</tr>
					<tr>
						<td>t2</td>
						<td><sf:input path="t2" /></td>
					</tr>
					<tr>
						<td>t3</td>
						<td><sf:input path="t3" /></td>
					</tr>
					<tr>
						<td>t4</td>
						<td><sf:input path="t4" /></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" value="I submit" /></td>
					</tr>
				</table>
			</fieldset>
		</sf:form>
	</div>
</body>
</html>