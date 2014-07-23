<%@ page isELIgnored="false" %><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><%@ taglib uri="http://www.springframework.org/tags" prefix="s" %><%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %><%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%><!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<title>修改测试</title>
<%@ include file="header.jsp" %>
	<h1>修改测试</h1>
	<sf:form modelAttribute="fieldTypes">
		<table>
			<tr>
				<td>fieldt01</td>
				<td><sf:input path="fieldT01" /><sf:errors path="fieldT01" cssClass="error"/></td>
			</tr>
			<tr>
				<td>fieldt02</td>
				<td><sf:input path="fieldT02" /><sf:errors path="fieldT02" cssClass="error"/></td>
			</tr>
			<tr>
				<td>fieldt03</td>
				<td><sf:input path="fieldT03" /><sf:errors path="fieldT03" cssClass="error"/></td>
			</tr>
			<tr>
				<td>fieldt04</td>
				<td><sf:input path="fieldT04" /><sf:errors path="fieldT04" cssClass="error"/></td>
			</tr>
			<tr>
				<td>fieldt05</td>
				<td><sf:input path="fieldT05" /><sf:errors path="fieldT05" cssClass="error"/></td>
			</tr>
			<tr>
				<td>fieldT06</td>
				<td><sf:input path="fieldT06" /><sf:errors path="fieldT06" cssClass="error"/></td>
			</tr>
			<tr>
				<td>fieldT07</td>
				<td><sf:input path="fieldT07" /><sf:errors path="fieldT07" cssClass="error"/></td>
			</tr>
			<tr>
				<td>fieldT08</td>
				<td><sf:input path="fieldT08" /><sf:errors path="fieldT08" cssClass="error"/></td>
			</tr>
			<tr>
				<td>fieldT09</td>
				<td><sf:input path="fieldT09" /><sf:errors path="fieldT09" cssClass="error"/></td>
			</tr>
		</table>
		<sf:hidden path="version"/>
		<input type="submit" value="submit all" />
	<div><a href='<s:url value="/fieldtypes" />'>返回</a></div>
	</sf:form>
<%@ include file="bottom.jsp" %>