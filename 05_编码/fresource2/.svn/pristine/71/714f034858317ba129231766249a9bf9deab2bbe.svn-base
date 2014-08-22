<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="container main">
<c:if test="${not empty message}">
	<div></div>
<div class="alert alert-success alert-dismissible col-md-offset-2 affix" role="alert">
  <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
  <strong><a href="<s:url value="/sysresource/detail/${sysResource.id }" />"> ${sysResource.id }</a></strong> ，${message}
</div>
</c:if>
<c:if test="${not empty delMessage}">
<div class="alert alert-warning alert-dismissible col-md-offset-2 affix" role="alert">
  <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
  <strong>${sysResource.id }</strong> ，${delMessage}
</div>
</c:if>
<div class="panel panel-default">
  <div class="panel-heading"><strong>系统资源，包括导航，菜单和按钮</strong>（<c:out value="${list.size()}" />条数据）</div>
  <div class="panel-body">
<div class="btn-toolbar" role="toolbar">
          <shiro:hasPermission name="`sysresource_create`">
					<div class="btn-group">
						<a href="<c:url value="/sysresource/create" />" class="btn btn-info"><span
							class="glyphicon glyphicon-plus"></span> 新 建 </a>
					</div>
				</shiro:hasPermission>
</div>

<table class="table table-hover">
	<thead>
		<tr>
			<th>#</th>
			
			<th>资源编码</th>
			<th>资源名称</th>
			<th>图标路径</th>
			<th>URI地址</th>
			<th>资源类型</th>
			<th>父ID</th>
			<th>顺序号</th>
			<th>有权限访问的URI集合，白名单</th>
			<th>无权限访问的URI集合，黑名单</th>
			<th>是否禁用</th>
			<th>扩展字段1</th>
			<th>扩展字段2</th>
			<th>扩展字段3</th>
			<th>扩展字段4</th>
			<th>备注</th>
			<th>操作</th>
		</tr>
	</thead>
	<tbody>
		<%
			int i = 0;
		%>
		<c:forEach items="${list}" var="sysResource">
			<tr>
				<td><%=++i%></td>
               
				<td><a
					href="<s:url value="/sysresource/detail/{id}"><s:param name="id" value="${sysResource.id }" /></s:url>"><c:out
							value="${sysResource.resourceCode}" /></a></td>  
				<td><c:out value="${sysResource.resourceName}" /></td>
				<td><c:out value="${sysResource.icon}" /></td>
				<td><c:out value="${sysResource.resourceUri}" /></td>
				<td><c:out value="${sysResource.resourceType}" /></td>
				<td><c:out value="${sysResource.parentId}" /></td>
				<td><c:out value="${sysResource.orderId}" /></td>
				<td><c:out value="${sysResource.accessUris}" /></td>
				<td><c:out value="${sysResource.noAccessUris}" /></td>
				<td><c:out value="${sysResource.enabled}" /></td>
				<td><c:out value="${sysResource.ext01}" /></td>
				<td><c:out value="${sysResource.ext02}" /></td>
				<td><c:out value="${sysResource.ext03}" /></td>
				<td><c:out value="${sysResource.ext04}" /></td>
				<td><c:out value="${sysResource.description}" /></td>
				<td>									<shiro:hasPermission name="`sysresource_modify`">
										<a
											href="<s:url value="/sysresource/modify/{id}"><s:param name="id" value="${sysResource.id }" /></s:url>">修改</a>
									</shiro:hasPermission>
                                    <shiro:hasPermission name="`sysresource_delete`">
									<a class="delete"
										data-confirm-message="系统资源，包括导航，菜单和按钮数据：<c:out value="${sysResource.id}" />，将被永久删除，操作不可撤销，是否确认？"
										href="<s:url value="/sysresource/delete/{id}"><s:param name="id" value="${sysResource.id }" /></s:url>">删除</a>
								</shiro:hasPermission>
                            

</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
  </div>
</div></div>
<%@ include file="bottom.jsp"%>
