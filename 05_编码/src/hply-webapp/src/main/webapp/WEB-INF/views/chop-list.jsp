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
<%@ include file="header.jsp"%>
<c:if test="${not empty message}">
	<div></div>
<div class="alert alert-success alert-dismissible col-md-offset-2 affix" role="alert">
  <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
  <strong><a href="<s:url value="/chop/detail/${chop.id }" />"> ${chop.id }</a></strong> ，${message}
</div>
</c:if>
<c:if test="${not empty delMessage}">
<div class="alert alert-warning alert-dismissible col-md-offset-2 affix" role="alert">
  <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
  <strong>${chop.id }</strong> ，${delMessage}
</div>
</c:if>
<div class="panel panel-default">
  <div class="panel-heading"><strong>${page_title}</strong>（<c:out value="${list.size()}" />条数据）</div>
  <div class="panel-body">
<div class="btn-toolbar" role="toolbar">
  <div class="btn-group">
  <a href="<c:url value="/chop/create" />" class="btn btn-info"><span class="glyphicon glyphicon-plus"></span> 新 建 </a>
</div>
</div>

<table class="table table-hover">
	<thead>
		<tr>
			<th>#</th>
			<th>编号</th>
			<th>项目ID</th>
			<th>项目编号</th>
			<th>项目名称</th>
			<th>项目经理</th>
			<th>主要内容</th>
			<th>申请人</th>
			<th>申请时间</th>
			<th>所在部门</th>
			<th>事业部/项目部审核意见</th>
			<th>事业部/项目部审核人</th>
			<th>事业部/项目部审核时间</th>
			<th>财务部审核意见</th>
			<th>财务部审核人</th>
			<th>财务部审核时间</th>
			<th>经办人办理结果</th>
			<th>经办人</th>
			<th>经办时间</th>
			<th>流程状态</th>
			<th>操作</th>
		</tr>
	</thead>
	<tbody>
		<%
			int i = 0;
		%>
		<c:forEach items="${list}" var="chop">
			<tr>
				<td><%=++i%></td>
				<td><a
					href="<s:url value="/chop/detail/{id}"><s:param name="id" value="${chop.id }" /></s:url>"><c:out
							value="${chop.chopCode}" /></a></td>  
				<td><c:out value="${chop.projectId}" /></td>
				<td><c:out value="${chop.projectCode}" /></td>
				<td><c:out value="${chop.projectName}" /></td>
				<td><c:out value="${chop.manager}" /></td>
				<td><c:out value="${chop.content}" /></td>
				<td><c:out value="${chop.applyUser}" /></td>
				<td><fmt:formatDate value="${chop.applyTime}"
						pattern="yyyy-MM-dd" /></td>  
				<td><c:out value="${chop.organizationId}" /></td>
				<td><c:out value="${chop.step1Idea}" /></td>
				<td><c:out value="${chop.step1User}" /></td>
				<td><fmt:formatDate value="${chop.step1Time}"
						pattern="yyyy-MM-dd" /></td>  
				<td><c:out value="${chop.step2Idea}" /></td>
				<td><c:out value="${chop.step2User}" /></td>
				<td><fmt:formatDate value="${chop.step2Time}"
						pattern="yyyy-MM-dd" /></td>  
				<td><c:out value="${chop.step3Idea}" /></td>
				<td><c:out value="${chop.step3User}" /></td>
				<td><fmt:formatDate value="${chop.step3Time}"
						pattern="yyyy-MM-dd" /></td>  
				<td><c:out value="${chop.stepStatus}" /></td>
				<td><a
					href="<s:url value="/chop/modify/{id}"><s:param name="id" value="${chop.id }" /></s:url>">修改</a>
					| <a class="delete" data-confirm-message="删除后不可恢复，您确认要删除【<c:out value="${chop.id}" />】么？"
					href="<s:url value="/chop/delete/{id}"><s:param name="id" value="${chop.id }" /></s:url>">删除</a></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
  </div>
</div>
<%@ include file="bottom.jsp"%>
