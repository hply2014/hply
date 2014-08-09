<%@ page isELIgnored="false"%><%@ 
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
  <strong><a href="<s:url value="/projectsummary/detail/${projectSummary.id }" />"> ${projectSummary.id }</a></strong> ，${message}
</div>
</c:if>
<c:if test="${not empty delMessage}">
<div class="alert alert-warning alert-dismissible col-md-offset-2 affix" role="alert">
  <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
  <strong>${projectSummary.id }</strong> ，${delMessage}
</div>
</c:if>
<div class="panel panel-default">
  <div class="panel-heading"><strong>多项目汇总</strong>（<c:out value="${list.size()}" />条数据）</div>
  <div class="panel-body">
<div class="btn-toolbar" role="toolbar">
          <shiro:hasPermission name="`projectsummary_create`">
					<div class="btn-group">
						<a href="<c:url value="/projectsummary/create" />" class="btn btn-info"><span
							class="glyphicon glyphicon-plus"></span> 新 建 </a>
					</div>
				</shiro:hasPermission>
</div>

<table class="table table-hover">
	<thead>
		<tr>
			<th>#</th>
			
			<th>时间</th>
			<th>摘要</th>
			<th>项目ID</th>
			<th>所在部门</th>
			<th>项目编号</th>
			<th>项目名称</th>
			<th>合同金额</th>
			<th>合同调增额</th>
			<th>合同结算额</th>
			<th>比率</th>
			<th>应收管理费</th>
			<th>实收管理费</th>
			<th>累计收管理费</th>
			<th>尚欠管理费</th>
			<th>发票金额</th>
			<th>累计开票</th>
			<th>收款金额</th>
			<th>累计收款</th>
			<th>回收率</th>
			<th>发票金额</th>
			<th>累计开票</th>
			<th>支付金额</th>
			<th>累计</th>
			<th>比率</th>
			<th>应缴税金</th>
			<th>已缴税金</th>
			<th>累计已缴税金</th>
			<th>尚欠税金</th>
			<th>金额</th>
			<th>预计用量</th>
			<th>型材点</th>
			<th>操作</th>
		</tr>
	</thead>
	<tbody>
		<%
			int i = 0;
		%>
		<c:forEach items="${list}" var="projectSummary">
			<tr>
				<td><%=++i%></td>
               
				<td><a
					href="<s:url value="/projectsummary/detail/{id}"><s:param name="id" value="${projectSummary.id }" /></s:url>"><c:out
							value="${projectSummary.trice}" /></a></td>  
				<td><c:out value="${projectSummary.description}" /></td>
				<td><c:out value="${projectSummary.projectId}" /></td>
				<td><c:out value="${projectSummary.organizationId}" /></td>
				<td><c:out value="${projectSummary.projectCode}" /></td>
				<td><c:out value="${projectSummary.projectName}" /></td>
				<td><c:out value="${projectSummary.contractAmount}" /></td>
				<td><c:out value="${projectSummary.changeAmount}" /></td>
				<td><c:out value="${projectSummary.settlementAmount}" /></td>
				<td><c:out value="${projectSummary.managementRate}" /></td>
				<td><c:out value="${projectSummary.managementPlanAmount}" /></td>
				<td><c:out value="${projectSummary.managementRealAmount}" /></td>
				<td><c:out value="${projectSummary.managementTotalAmount}" /></td>
				<td><c:out value="${projectSummary.managementOweAmount}" /></td>
				<td><c:out value="${projectSummary.partyBillingAmount}" /></td>
				<td><c:out value="${projectSummary.partyBillingTotalAmount}" /></td>
				<td><c:out value="${projectSummary.collectionsAmount}" /></td>
				<td><c:out value="${projectSummary.collectionsTotalAmount}" /></td>
				<td><c:out value="${projectSummary.collectionsRate}" /></td>
				<td><c:out value="${projectSummary.customerBillingAmount}" /></td>
				<td><c:out value="${projectSummary.customerBillingTotalAmount}" /></td>
				<td><c:out value="${projectSummary.paymentAmount}" /></td>
				<td><c:out value="${projectSummary.paymentTotalAmount}" /></td>
				<td><c:out value="${projectSummary.taxRate}" /></td>
				<td><c:out value="${projectSummary.taxPlanAmount}" /></td>
				<td><c:out value="${projectSummary.taxRealAmount}" /></td>
				<td><c:out value="${projectSummary.taxTotalAmount}" /></td>
				<td><c:out value="${projectSummary.taxOweAmount}" /></td>
				<td><c:out value="${projectSummary.arrearsAmount}" /></td>
				<td><c:out value="${projectSummary.expectedValue}" /></td>
				<td><c:out value="${projectSummary.profilePoint}" /></td>
				<td>									<shiro:hasPermission name="`projectsummary_modify`">
										<a
											href="<s:url value="/projectsummary/modify/{id}"><s:param name="id" value="${projectSummary.id }" /></s:url>">修改</a>
									</shiro:hasPermission>
                                    <shiro:hasPermission name="`projectsummary_delete`">
									<a class="delete"
										data-confirm-message="多项目汇总数据：<c:out value="${projectSummary.id}" />，将被永久删除，操作不可撤销，是否确认？"
										href="<s:url value="/projectsummary/delete/{id}"><s:param name="id" value="${projectSummary.id }" /></s:url>">删除</a>
								</shiro:hasPermission>
                            

</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
  </div>
</div></div>
<%@ include file="bottom.jsp"%>
