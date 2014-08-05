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
  <strong><a href="<s:url value="/project/detail/${project.id }" />"> ${project.id }</a></strong> ，${message}
</div>
</c:if>
<c:if test="${not empty delMessage}">
<div class="alert alert-warning alert-dismissible col-md-offset-2 affix" role="alert">
  <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
  <strong>${project.id }</strong> ，${delMessage}
</div>
</c:if>
<div class="panel panel-default">
  <div class="panel-heading"><strong>${page_title}</strong>（<c:out value="${list.size()}" />条数据）</div>
  <div class="panel-body">
<div class="btn-toolbar" role="toolbar">
  <div class="btn-group">
  <a href="<c:url value="/project/create" />" class="btn btn-info"><span class="glyphicon glyphicon-plus"></span> 新 建 </a>
</div>
</div>

<table class="table table-hover">
	<thead>
		<tr>
			<th>#</th>
			<th>项目编号</th>
			<th>项目名称</th>
			<th>所在部门</th>
			<th>甲方名称</th>
			<th>甲方地址</th>
			<th>项目经理</th>
			<th>合同号</th>
			<th>合作单位</th>
			<th>法人代表</th>
			<th>异地代扣代缴</th>
			<th>管理费率</th>
			<th>税金比率</th>
			<th>合同金额</th>
			<th>结算金额</th>
			<th>印花税上交时间</th>
			<th>印花税上交金额</th>
			<th>印花税收据编号</th>
			<th>占用资金情况</th>
			<th>项目状态</th>
			<th>登记时间</th>
			<th>备注</th>
			<th>数据状态，0：草稿/1：正式</th>
			<th>应收管理费</th>
			<th>应缴税金</th>
			<th>操作</th>
		</tr>
	</thead>
	<tbody>
		<%
			int i = 0;
		%>
		<c:forEach items="${list}" var="project">
			<tr>
				<td><%=++i%></td>
				<td><a
					href="<s:url value="/project/detail/{id}"><s:param name="id" value="${project.id }" /></s:url>"><c:out
							value="${project.projectCode}" /></a></td>  
				<td><c:out value="${project.projectName}" /></td>
				<td><c:out value="${project.organizationId}" /></td>
				<td><c:out value="${project.partyName}" /></td>
				<td><c:out value="${project.partyAddress}" /></td>
				<td><c:out value="${project.manager}" /></td>
				<td><c:out value="${project.contractCode}" /></td>
				<td><c:out value="${project.corperation}" /></td>
				<td><c:out value="${project.legalAssignee}" /></td>
				<td><c:out value="${project.isWithholdingOffsite}" /></td>
				<td><c:out value="${project.managementRate}" /></td>
				<td><c:out value="${project.taxRate}" /></td>
				<td><c:out value="${project.contractAmount}" /></td>
				<td><c:out value="${project.settlementAmount}" /></td>
				<td><fmt:formatDate value="${project.dutyPaidTime}"
						pattern="yyyy-MM-dd" /></td>  
				<td><c:out value="${project.dutyPaidAmount}" /></td>
				<td><c:out value="${project.dutyPaidCode}" /></td>
				<td><c:out value="${project.capitalOccupied}" /></td>
				<td><c:out value="${project.projectStatus}" /></td>
				<td><fmt:formatDate value="${project.trice}"
						pattern="yyyy-MM-dd" /></td>  
				<td><c:out value="${project.description}" /></td>
				<td><c:out value="${project.status}" /></td>
				<td><c:out value="${project.managementPlanAmount}" /></td>
				<td><c:out value="${project.taxPlanAmount}" /></td>
				<td><a
					href="<s:url value="/project/modify/{id}"><s:param name="id" value="${project.id }" /></s:url>">修改</a>
					| <a class="delete" data-confirm-message="删除后不可恢复，您确认要删除【<c:out value="${project.id}" />】么？"
					href="<s:url value="/project/delete/{id}"><s:param name="id" value="${project.id }" /></s:url>">删除</a></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
  </div>
</div></div>
<%@ include file="bottom.jsp"%>
