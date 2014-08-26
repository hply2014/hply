<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="container main">
	<c:if test="${not empty message}">
		<div></div>
		<div class="alert alert-success alert-dismissible col-md-offset-2 affix" role="alert">
			<button type="button" class="close" data-dismiss="alert">
				<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
			</button>
			<strong><a href="<s:url value="/profile/detail/${profile.id }" />"> ${profile.id }</a></strong> ，${message}
		</div>
	</c:if>
	<c:if test="${not empty delMessage}">
		<div class="alert alert-warning alert-dismissible col-md-offset-2 affix" role="alert">
			<button type="button" class="close" data-dismiss="alert">
				<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
			</button>
			<strong>${profile.id }</strong> ，${delMessage}
		</div>
	</c:if>
	<div class="panel panel-primary">
		<div class="panel-heading">
			<strong>型材</strong>（共
			<c:out value="${rowCount}" />
			行
			<c:if test="${pageCount > 1 }">，第${pageIndex+1 }页 &nbsp;/&nbsp;共${pageCount }页</c:if>
			）
		</div>
		<div class="panel-body">
			<div class="btn-toolbar" role="toolbar">
				<shiro:hasPermission name="`profile_create`">
					<div class="btn-group">
						<a href="<c:url value="/profile/create" />" class="btn btn-info"><span class="glyphicon glyphicon-plus"></span>
							新 建 </a>
					</div>
				</shiro:hasPermission>
			</div>

			<table class="table table-hover">
				<thead>
					<tr>
						<th></th>
						<th>#</th>
						<th>项目名称</th>
						<th>预计用量</th>
						<th>型材点</th>
						<th>登记时间</th>
						<th>创建用户</th>
						<th>备注</th>
						<th></th>

					</tr>
				</thead>
				<tbody>
					<%
						int i = Integer.parseInt(request.getAttribute("currentPageStarted").toString());
					%>
					<c:forEach items="${list}" var="profile">
						<tr>
							<td><span class="glyphicon <c:out value="${profile.status != 1 ? 'glyphicon-file' : ''}" />"></span></td>
							<td><%=++i%></td>
							<td><a href="<s:url value="/profile/detail/{id}"><s:param name="id" value="${profile.id }" /></s:url>"><c:out
										value="${profile.projectId}" /></a></td>
							<td><c:out value="${profile.expectedValue}" /></td>
							<td><c:out value="${profile.profilePoint}" /></td>
							<td><fmt:formatDate value="${profile.trice}" pattern="yyyy-MM-dd" /></td>
							<td><c:out value="${profile.createUser}" /></td>
							<td><c:out value="${profile.description}" /></td>
							<%--      <td><c:if test="${profile.status == 1 }">
                                    <shiro:hasPermission name="`profile_modify`">
                                        <a
                                            href="<s:url value="/profile/modify/{id}"><s:param name="id" value="${profile.id }" /></s:url>">修改</a>
                                    </shiro:hasPermission>
                                </c:if> <c:if test="${profile.status != 1 }">
                                    <shiro:hasPermission name="`profile_create`">
                                        <a
                                            href="<s:url value="/profile/modify/{id}"><s:param name="id" value="${profile.id }" /></s:url>">修改</a>
                                    </shiro:hasPermission>
                                </c:if> <shiro:hasPermission name="`profile_delete`">
                                    <a class="delete"
                                        data-confirm-message="型材数据：<c:out value="${profile.id}" />，将被永久删除，操作不可撤销，是否确认？"
                                        href="<s:url value="/profile/delete/{id}"><s:param name="id" value="${profile.id }" /></s:url>">删除</a>
                                </shiro:hasPermission></td> --%>
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
							<li class="${pageIndex <= 0 ? 'disabled' :'' }"><a href="<s:url value='/profile?p=${pageIndex - 1}' />">上一页</a></li>
							<li class="${pageIndex + 1 >= pageCount ? 'disabled' :'' }"><a
								href="<s:url value='/profile?p=${pageIndex + 1}' />">下一页</a></li>
						</ul>
					</div>
					<div class="col-sm-2">&nbsp;</div>
				</div>
			</c:if>
		</div>
	</div>
</div>
<%@ include file="bottom.jsp"%>
