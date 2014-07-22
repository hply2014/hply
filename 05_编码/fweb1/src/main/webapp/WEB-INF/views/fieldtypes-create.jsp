<%@ page isELIgnored="false" %><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><%@ taglib uri="http://www.springframework.org/tags" prefix="s" %><%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %><%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%><!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<title>${title}一个测试表</title>
<script type="text/javascript" src="<c:url value="/assets/jquery.min.js" />"></script>
</head>
<body>
<h1>${title}一个测试表</h1>
<sf:form id="form" method="post" modelAttribute="fieldTypes" action="api/fieldtypes">
<sf:hidden path="id"/>
<table>
<tr>
<td><sf:label path="fieldT01">fieldT01</sf:label></td><td><sf:input path="fieldT01" /></td>
</tr>
<tr>
<td><sf:label path="fieldT02">fieldT02</sf:label></td><td><sf:input path="fieldT02" /></td>
</tr>
<tr>
<td><sf:label path="fieldT03">fieldT03</sf:label></td><td><sf:input path="fieldT03" /></td>
</tr>
<tr>
<td><sf:label path="fieldT04">fieldT04</sf:label></td><td><sf:input path="fieldT04" /></td>
</tr>
<tr>
<td><sf:label path="fieldT05">fieldT05</sf:label></td><td><sf:input path="fieldT05" /></td>
</tr>
<tr>
<td><sf:label path="fieldT06">fieldT06</sf:label></td><td><sf:input path="fieldT06" /></td>
</tr>
<tr>
<td><sf:label path="fieldT07">fieldT07</sf:label></td><td><sf:input path="fieldT07" /></td>
</tr>
<tr>
<td><sf:label path="fieldT08">fieldT08</sf:label></td><td><sf:input path="fieldT08" /></td>
</tr>
<tr>
<td><sf:label path="fieldT09">fieldT09</sf:label></td><td><sf:input path="fieldT09" /></td>
</tr>
</table>
<input type="submit" value="submit fieldtypes form">
</sf:form>
<input type="button" id="del" value="delete object" />
		<script type="text/javascript">
			$(document).ready(function() {
				$("#form").submit(function() {  
					$.post($(this).attr("action"), $(this).serialize(), function(data) {
						alert(data);
					}, "text");
					return false;  
				});			
				$("del").click(function(){
					$.post("<c:url value="/api/fieldtypes/ff22f79b-061b-4164-8a9f-a983fbf50b13" />", "", function(data){
						alert(data);
					}, "text");
				});
			});
		</script>
</body>
</html>