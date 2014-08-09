﻿<%@ page isELIgnored="false"%><%@ 
taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ 
taglib
	uri="http://www.springframework.org/tags" prefix="s"%><%@ 
taglib
	uri="http://www.springframework.org/tags/form" prefix="sf"%><%@ 
taglib
	uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%><%@ 
	taglib
	prefix="shiro" uri="http://shiro.apache.org/tags"%><%@ 
page
	language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="header.jsp"%><div class="container main">
<c:if test="${not empty message}">
	<div></div>
<div class="alert alert-success alert-dismissible col-md-offset-2 affix" role="alert">
  <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
  <strong><a href="<s:url value="/sysorganization/detail/${sysOrganization.id }" />"> ${sysOrganization.id }</a></strong> ，${message}
</div>
</c:if>
<c:if test="${not empty delMessage}">
<div class="alert alert-warning alert-dismissible col-md-offset-2 affix" role="alert">
  <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
  <strong>${sysOrganization.id }</strong> ，${delMessage}
</div>
</c:if>
<div class="panel panel-default">
  <div class="panel-heading"><strong>组织机构</strong>（<c:out value="${list.size()}" />条数据）</div>
  <div class="panel-body">
<div class="btn-toolbar" role="toolbar">
          <shiro:hasPermission name="`sysorganization_create`">
					<div class="btn-group">
						<a href="<c:url value="/sysorganization/create" />" class="btn btn-info"><span
							class="glyphicon glyphicon-plus"></span> 新 建 </a>
					</div>
				</shiro:hasPermission>
</div>

<table class="table table-hover">
	<thead>
		<tr>
			<th>#</th>
			
			<th>机构名称</th>
			<th>备注</th>
			<th>操作</th>
		</tr>
	</thead>
	<tbody>
		<%
			int i = 0;
		%>
		<c:forEach items="${list}" var="sysOrganization">
			<tr>
				<td><%=++i%></td>
               
				<td><a
					href="<s:url value="/sysorganization/detail/{id}"><s:param name="id" value="${sysOrganization.id }" /></s:url>"><c:out
							value="${sysOrganization.organizationName}" /></a></td>  
				<td><c:out value="${sysOrganization.description}" /></td>
				<td>									<shiro:hasPermission name="`sysorganization_modify`">
										<a
											href="<s:url value="/sysorganization/modify/{id}"><s:param name="id" value="${sysOrganization.id }" /></s:url>">修改</a>
									</shiro:hasPermission>
                                    <shiro:hasPermission name="`sysorganization_delete`">
									<a class="delete"
										data-confirm-message="组织机构数据：<c:out value="${sysOrganization.id}" />，将被永久删除，操作不可撤销，是否确认？"
										href="<s:url value="/sysorganization/delete/{id}"><s:param name="id" value="${sysOrganization.id }" /></s:url>">删除</a>
								</shiro:hasPermission>
                            

</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
  </div>
</div></div>
<%@ include file="bottom.jsp"%>
