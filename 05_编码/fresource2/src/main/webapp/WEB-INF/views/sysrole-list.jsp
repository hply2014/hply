<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="container main">
<c:if test="${not empty message}">
	<div></div>
<div class="alert alert-success alert-dismissible col-md-offset-2 affix" role="alert">
  <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
  <strong><a href="<s:url value="/sysrole/detail/${sysRole.id }" />"> ${sysRole.id }</a></strong> ，${message}
</div>
</c:if>
<c:if test="${not empty delMessage}">
<div class="alert alert-warning alert-dismissible col-md-offset-2 affix" role="alert">
  <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
  <strong>${sysRole.id }</strong> ，${delMessage}
</div>
</c:if>
<div class="panel panel-default">
  <div class="panel-heading"><strong>系统角色表</strong>（<c:out value="${list.size()}" />条数据）</div>
  <div class="panel-body">
<div class="btn-toolbar" role="toolbar">
          <shiro:hasPermission name="`sysrole_create`">
					<div class="btn-group">
						<a href="<c:url value="/sysrole/create" />" class="btn btn-info"><span
							class="glyphicon glyphicon-plus"></span> 新 建 </a>
					</div>
				</shiro:hasPermission>
</div>

<table class="table table-hover">
	<thead>
		<tr>
			<th>#</th>
			
			<th></th>
			<th>角色名称</th>
			<th>是否是默认角色</th>
			<th>描述</th>
			<th>操作</th>
		</tr>
	</thead>
	<tbody>
		<%
			int i = 0;
		%>
		<c:forEach items="${list}" var="sysRole">
			<tr>
				<td><%=++i%></td>
               
				<td><a
					href="<s:url value="/sysrole/detail/{id}"><s:param name="id" value="${sysRole.id }" /></s:url>"><c:out
							value="${sysRole.roleCode}" /></a></td>  
				<td><c:out value="${sysRole.name}" /></td>
				<td><c:out value="${sysRole.isDefault}" /></td>
				<td><c:out value="${sysRole.description}" /></td>
				<td>									<shiro:hasPermission name="`sysrole_modify`">
										<a
											href="<s:url value="/sysrole/modify/{id}"><s:param name="id" value="${sysRole.id }" /></s:url>">修改</a>
									</shiro:hasPermission>
                                    <shiro:hasPermission name="`sysrole_delete`">
									<a class="delete"
										data-confirm-message="系统角色表数据：<c:out value="${sysRole.id}" />，将被永久删除，操作不可撤销，是否确认？"
										href="<s:url value="/sysrole/delete/{id}"><s:param name="id" value="${sysRole.id }" /></s:url>">删除</a>
								</shiro:hasPermission>
                            

</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
  </div>
</div></div>
<%@ include file="bottom.jsp"%>
