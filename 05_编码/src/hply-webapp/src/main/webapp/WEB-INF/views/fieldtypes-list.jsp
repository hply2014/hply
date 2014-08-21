<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="container main">
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
<div class="panel panel-primary">
  <div class="panel-heading"><strong>所有数据类型的测试样表</strong>（<c:out value="${list.size()}" />条数据）</div>
  <div class="panel-body">
<div class="btn-toolbar" role="toolbar">
          <shiro:hasPermission name="`fieldtypes_create`">
					<div class="btn-group">
						<a href="<c:url value="/fieldtypes/create" />" class="btn btn-info"><span
							class="glyphicon glyphicon-plus"></span> 新 建 </a>
					</div>
				</shiro:hasPermission>
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
			<th></th>
			
		</tr>
	</thead>
	<tbody>
		<%
			int i = 0;
		%>
		<c:forEach items="${list}" var="fieldTypes">
			<tr>
				<td><%=++i%></td>
                <td><span class="glyphicon <c:out value="${fieldTypes.status != 1 ? 'glyphicon-file' : ''}" />"></span></td>
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
				<td><c:if test="${fieldtypes.status == 1 }">
									<shiro:hasPermission name="`fieldtypes_modify`">
										<a
											href="<s:url value="/fieldtypes/modify/{id}"><s:param name="id" value="${fieldTypes.id }" /></s:url>">修改</a>
									</shiro:hasPermission>
								</c:if>
								<c:if test="${fieldTypes.status != 1 }">
									<shiro:hasPermission name="`fieldtypes_create`">
										<a
											href="<s:url value="/fieldtypes/modify/{id}"><s:param name="id" value="${fieldTypes.id }" /></s:url>">修改</a>
									</shiro:hasPermission>
								</c:if> <shiro:hasPermission name="`fieldtypes_delete`">
									<a class="delete"
										data-confirm-message="所有数据类型的测试样表数据：<c:out value="${fieldTypes.id}" />，将被永久删除，操作不可撤销，是否确认？"
										href="<s:url value="/fieldtypes/delete/{id}"><s:param name="id" value="${fieldTypes.id }" /></s:url>">删除</a>
								</shiro:hasPermission>

</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
  </div>
</div></div>
<%@ include file="bottom.jsp"%>
