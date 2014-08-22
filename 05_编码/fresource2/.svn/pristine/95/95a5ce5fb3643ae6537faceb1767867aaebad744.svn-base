<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="container main">
<c:if test="${not empty message}">
	<div></div>
<div class="alert alert-success alert-dismissible col-md-offset-2 affix" role="alert">
  <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
  <strong><a href="<s:url value="/sysparameter/detail/${sysParameter.id }" />"> ${sysParameter.id }</a></strong> ，${message}
</div>
</c:if>
<c:if test="${not empty delMessage}">
<div class="alert alert-warning alert-dismissible col-md-offset-2 affix" role="alert">
  <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
  <strong>${sysParameter.id }</strong> ，${delMessage}
</div>
</c:if>
<div class="panel panel-default">
  <div class="panel-heading"><strong>系统参数</strong>（<c:out value="${list.size()}" />条数据）</div>
  <div class="panel-body">
<div class="btn-toolbar" role="toolbar">
          <shiro:hasPermission name="`sysparameter_create`">
					<div class="btn-group">
						<a href="<c:url value="/sysparameter/create" />" class="btn btn-info"><span
							class="glyphicon glyphicon-plus"></span> 新 建 </a>
					</div>
				</shiro:hasPermission>
</div>

<table class="table table-hover">
	<thead>
		<tr>
			<th>#</th>
			
			<th>参数编码</th>
			<th>参数中文名称</th>
			<th>参数值</th>
			<th>默认值</th>
			<th>是否系统内置</th>
			<th>预留扩展字段1</th>
			<th>预留扩展字段2</th>
			<th>预留扩展字段3</th>
			<th>预留扩展字段4</th>
			<th>备注</th>
			<th>操作</th>
		</tr>
	</thead>
	<tbody>
		<%
			int i = 0;
		%>
		<c:forEach items="${list}" var="sysParameter">
			<tr>
				<td><%=++i%></td>
               
				<td><a
					href="<s:url value="/sysparameter/detail/{id}"><s:param name="id" value="${sysParameter.id }" /></s:url>"><c:out
							value="${sysParameter.paramCode}" /></a></td>  
				<td><c:out value="${sysParameter.paramName}" /></td>
				<td><c:out value="${sysParameter.paramValue}" /></td>
				<td><c:out value="${sysParameter.defaultValue}" /></td>
				<td><c:out value="${sysParameter.isInner}" /></td>
				<td><c:out value="${sysParameter.ext01}" /></td>
				<td><c:out value="${sysParameter.ext02}" /></td>
				<td><c:out value="${sysParameter.ext03}" /></td>
				<td><c:out value="${sysParameter.ext04}" /></td>
				<td><c:out value="${sysParameter.description}" /></td>
				<td>									<shiro:hasPermission name="`sysparameter_modify`">
										<a
											href="<s:url value="/sysparameter/modify/{id}"><s:param name="id" value="${sysParameter.id }" /></s:url>">修改</a>
									</shiro:hasPermission>
                                    <shiro:hasPermission name="`sysparameter_delete`">
									<a class="delete"
										data-confirm-message="系统参数数据：<c:out value="${sysParameter.id}" />，将被永久删除，操作不可撤销，是否确认？"
										href="<s:url value="/sysparameter/delete/{id}"><s:param name="id" value="${sysParameter.id }" /></s:url>">删除</a>
								</shiro:hasPermission>
                            

</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
  </div>
</div></div>
<%@ include file="bottom.jsp"%>
