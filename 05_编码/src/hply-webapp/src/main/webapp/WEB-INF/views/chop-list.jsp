<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="container main">
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
<div class="panel panel-primary">
  <div class="panel-heading"><strong>盖章管理</strong>（ 共<c:out value="${rowCount}" />行
            <c:if test="${pageCount > 1 }">，第${pageIndex+1 }页 &nbsp;/&nbsp;共${pageCount }页</c:if>）</div>
 <div class="panel-body">
<div class="btn-toolbar" role="toolbar">
          <shiro:hasPermission name="`chop_create`">
					<div class="btn-group">
						<a href="<c:url value="/chop/create" />" class="btn btn-info"><span
							class="glyphicon glyphicon-plus"></span> 新 建 </a>
					</div>
				</shiro:hasPermission>
</div>

<table class="table table-hover">
	<thead>
		<tr>
			<th></th>
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
			
		</tr>
	</thead>
	<tbody>
		<%
			int i = Integer.parseInt(request.getAttribute("currentPageStarted").toString());
		%>
		<c:forEach items="${list}" var="chop">
			<tr>
				<td><span class="glyphicon <c:out value="${chop.status != 1 ? 'glyphicon-file' : ''}" />"></span></td>
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
				<td><c:if test="${chop.status == 1 }">
									<shiro:hasPermission name="`chop_modify`">
										<a
											href="<s:url value="/chop/modify/{id}"><s:param name="id" value="${chop.id }" /></s:url>">修改</a>
									</shiro:hasPermission>
								</c:if>
								<c:if test="${chop.status != 1 }">
									<shiro:hasPermission name="`chop_create`">
										<a
											href="<s:url value="/chop/modify/{id}"><s:param name="id" value="${chop.id }" /></s:url>">修改</a>
									</shiro:hasPermission>
								</c:if> <shiro:hasPermission name="`chop_delete`">
									<a class="delete"
										data-confirm-message="盖章管理数据：<c:out value="${chop.id}" />，将被永久删除，操作不可撤销，是否确认？"
										href="<s:url value="/chop/delete/{id}"><s:param name="id" value="${chop.id }" /></s:url>">删除</a>
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
                                href="<s:url value='/chop?p=${pageIndex - 1}' />">上一页</a></li>
                            <li class="${pageIndex + 1 >= pageCount ? 'disabled' :'' }"><a
                                href="<s:url value='/chop?p=${pageIndex + 1}' />">下一页</a></li>
                        </ul>
                    </div>
                    <div class="col-sm-2">&nbsp;</div>
                </div>
            </c:if>
  </div>
</div></div>
<%@ include file="bottom.jsp"%>
