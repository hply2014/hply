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
  <div class="panel-heading"><strong>系统资源</strong>（共<c:out value="${rowCount}" />行
            <c:if test="${pageCount > 1 }">，第${pageIndex+1 }页 &nbsp;/&nbsp;共${pageCount }页</c:if>）</div>
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
			<th>图标路径</th>
			<th>资源名称</th>
			<th>URL地址</th>
			<th>资源类型</th>
			<th>顺序号</th>
			<th>父ID</th>
			<th>是否禁用</th>
			<th>备注</th>
			<th>可访问的URI</th>
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
							value="${sysResource.resCode}" /></a></td>  
				<td><c:out value="${sysResource.resName}" /></td>
				<td><c:out value="${sysResource.icon}" /></td>
				<td><c:out value="${sysResource.resUrl}" /></td>
				<td><c:out value="${sysResource.resType}" /></td>
				<td><c:out value="${sysResource.orderBy}" /></td>
				<td><c:out value="${sysResource.parentId}" /></td>
				<td><c:out value="${sysResource.enabled}" /></td>
				<td><c:out value="${sysResource.description}" /></td>
				<td><c:out value="${sysResource.allowAccessUri}" /></td>
				<td>									<shiro:hasPermission name="`sysresource_modify`">
										<a
											href="<s:url value="/sysresource/modify/{id}"><s:param name="id" value="${sysResource.id }" /></s:url>">修改</a>
									</shiro:hasPermission>
                                    <shiro:hasPermission name="`sysresource_delete`">
									<a class="delete"
										data-confirm-message="系统资源数据：<c:out value="${sysResource.id}" />，将被永久删除，操作不可撤销，是否确认？"
										href="<s:url value="/sysresource/delete/{id}"><s:param name="id" value="${sysResource.id }" /></s:url>">删除</a>
								</shiro:hasPermission>
                            

</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
            <c:if test="${pageCount > 1 }">
                <div class="row">
                    <div class="col-sm-2 pager">
                        <span>共<c:out value="${rowCount}" /> 行，第${pageIndex+1 }页 &nbsp;/&nbsp;共${pageCount }页
                        </span>
                    </div>
                    <div class="col-sm-8">
                        <ul class="pager">
                            <li class="${pageIndex <= 0 ? 'disabled' :'' }"><a
                                href="<s:url value='/sysresource?p=${pageIndex - 1}' />">上一页</a></li>
                            <li class="${pageIndex + 1 >= pageCount ? 'disabled' :'' }"><a
                                href="<s:url value='/sysresource?p=${pageIndex + 1}' />">下一页</a></li>
                        </ul>
                    </div>
                    <div class="col-sm-2">&nbsp;</div>
                </div>
            </c:if>
  </div>
</div></div>
<%@ include file="bottom.jsp"%>
