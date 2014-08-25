﻿<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="container main">
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
  <div class="panel-heading"><strong>合同项目信息</strong>（共<c:out value="${rowCount}" />行
            <c:if test="${pageCount > 1 }">，第${pageIndex+1 }页 &nbsp;/&nbsp;共${pageCount }页</c:if>）</div>
  <div class="panel-body">
<div class="btn-toolbar" role="toolbar">
				<shiro:hasPermission name="`project_create`">
					<div class="btn-group">
						<a href="<c:url value="/project/create" />" class="btn btn-info"><span
							class="glyphicon glyphicon-plus"></span> 新 建 </a>
					</div>
				</shiro:hasPermission>
</div>

<table class="table table-hover">
	<thead>
		<tr>
			<th>#</th>
			<th></th>
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
                <td><span class="glyphicon <c:out value="${project.status != 1 ? 'glyphicon-file' : ''}" />"></span></td>
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
				<td><c:out value="${project.managementPlanAmount}" /></td>
				<td><c:out value="${project.taxPlanAmount}" /></td>
				<td><c:if test="${project.status == 1 }">
									<shiro:hasPermission name="`project_modify`">
										<a
											href="<s:url value="/project/modify/{id}"><s:param name="id" value="${project.id }" /></s:url>">修改</a>
									</shiro:hasPermission>
								</c:if>
								<c:if test="${project.status != 1 }">
									<shiro:hasPermission name="`project_create`">
										<a
											href="<s:url value="/project/modify/{id}"><s:param name="id" value="${project.id }" /></s:url>">修改</a>
									</shiro:hasPermission>
								</c:if> <shiro:hasPermission name="`project_delete`">
									<a class="delete"
										data-confirm-message="合同项目信息数据：<c:out value="${project.id}" />，将被永久删除，操作不可撤销，是否确认？"
										href="<s:url value="/project/delete/{id}"><s:param name="id" value="${project.id }" /></s:url>">删除</a>
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
                                href="<s:url value='/project?p=${pageIndex - 1}' />">上一页</a></li>
                            <li class="${pageIndex + 1 >= pageCount ? 'disabled' :'' }"><a
                                href="<s:url value='/project?p=${pageIndex + 1}' />">下一页</a></li>
                        </ul>
                    </div>
                    <div class="col-sm-2">&nbsp;</div>
                </div>
            </c:if>
  </div>
</div></div>
<%@ include file="bottom.jsp"%>
