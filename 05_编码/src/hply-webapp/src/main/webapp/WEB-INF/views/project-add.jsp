<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%><!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<title>创建合同项目</title>
</head>
<body>
	<form action="/project/save">
		<table width="80%">
			<tr>
				<td>项目编号</td>
				<td><f:input path="projectcode" /></td>
			</tr>
			<tr>
				<td>项目名称</td>
				<td><f:input path="projectname" /></td>
			</tr>
			<tr>
				<td>所在部门</td>
				<td><f:input path="organizationid" /></td>
			</tr>
			<tr>
				<td>甲方名称</td>
				<td><f:input path="partyname" /></td>
			</tr>
			<tr>
				<td>异地代扣代缴</td>
				<td><f:checkbox path="firstName" /></td>
			</tr>
			<tr>
				<td>合同金额</td>
				<td><f:input path="iswithholdingoffsite"/></td>
			</tr>
			<tr><td colspan="2"><input type="submit" value="提交一下" /></td></tr>
		</table>
	</form>
</body>
</html>