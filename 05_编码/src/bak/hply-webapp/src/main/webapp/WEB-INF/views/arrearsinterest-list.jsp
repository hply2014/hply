<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="container main">
<c:if test="${not empty message}">
	<div></div>
<div class="alert alert-success alert-dismissible col-md-offset-2 affix" role="alert">
  <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
  <strong><a href="<s:url value="/arrearsinterest/detail/${arrearsInterest.id }" />"> ${arrearsInterest.id }</a></strong> ，${message}
</div>
</c:if>
<c:if test="${not empty delMessage}">
<div class="alert alert-warning alert-dismissible col-md-offset-2 affix" role="alert">
  <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
  <strong>${arrearsInterest.id }</strong> ，${delMessage}
</div>
</c:if>
<div class="panel panel-default">
  <div class="panel-heading"><strong>往来欠款的利息计算明细</strong>（共<c:out value="${rowCount}" />行
            <c:if test="${pageCount > 1 }">，第${pageIndex+1 }页 &nbsp;/&nbsp;共${pageCount }页</c:if>）</div>
  <div class="panel-body">
<div class="btn-toolbar" role="toolbar">
				<shiro:hasPermission name="`arrearsinterest_create`">
					<div class="btn-group">
						<a href="<c:url value="/arrearsinterest/create" />" class="btn btn-info"><span
							class="glyphicon glyphicon-plus"></span> 新 建 </a>
					</div>
				</shiro:hasPermission>
</div>

<table class="table table-hover">
	<thead>
		<tr>
			<th>#</th>
			
			<th>流水号</th>
			<th>项目ID</th>
			<th>计息时间</th>
			<th>计息金额</th>
			<th>计息基数</th>
			<th>计息期数：201405期</th>
			<th>本期的第几天</th>
			<th>摘要</th>
			<th>操作</th>
		</tr>
	</thead>
	<tbody>
		<%
			int i = 0;
		%>
		<c:forEach items="${list}" var="arrearsInterest">
			<tr>
				<td><%=++i%></td>
               
				<td><a
					href="<s:url value="/arrearsinterest/detail/{id}"><s:param name="id" value="${arrearsInterest.id }" /></s:url>"><c:out
							value="${arrearsInterest.serialId}" /></a></td>  
				<td><c:out value="${arrearsInterest.projectId}" /></td>
				<td><fmt:formatDate value="${arrearsInterest.trice}"
						pattern="yyyy-MM-dd" /></td>  
				<td><c:out value="${arrearsInterest.amount}" /></td>
				<td><c:out value="${arrearsInterest.interestAmount}" /></td>
				<td><c:out value="${arrearsInterest.pharse}" /></td>
				<td><c:out value="${arrearsInterest.atday}" /></td>
				<td><c:out value="${arrearsInterest.description}" /></td>
				<td>									<shiro:hasPermission name="`arrearsinterest_modify`">
										<a
											href="<s:url value="/arrearsinterest/modify/{id}"><s:param name="id" value="${arrearsInterest.id }" /></s:url>">修改</a>
									</shiro:hasPermission>
                                    <shiro:hasPermission name="`arrearsinterest_delete`">
									<a class="delete"
										data-confirm-message="往来欠款的利息计算明细数据：<c:out value="${arrearsInterest.id}" />，将被永久删除，操作不可撤销，是否确认？"
										href="<s:url value="/arrearsinterest/delete/{id}"><s:param name="id" value="${arrearsInterest.id }" /></s:url>">删除</a>
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
                                href="<s:url value='/arrearsinterest?p=${pageIndex - 1}' />">上一页</a></li>
                            <li class="${pageIndex + 1 >= pageCount ? 'disabled' :'' }"><a
                                href="<s:url value='/arrearsinterest?p=${pageIndex + 1}' />">下一页</a></li>
                        </ul>
                    </div>
                    <div class="col-sm-2">&nbsp;</div>
                </div>
            </c:if>
  </div>
</div></div>
<%@ include file="bottom.jsp"%>
