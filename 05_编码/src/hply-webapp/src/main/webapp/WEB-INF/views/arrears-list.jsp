<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="container main">
<c:if test="${not empty message}">
	<div></div>
<div class="alert alert-success alert-dismissible col-md-offset-2 affix" role="alert">
  <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
  <strong><a href="<s:url value="/arrears/detail/${arrears.id }" />"> ${arrears.id }</a></strong> ，${message}
</div>
</c:if>
<c:if test="${not empty delMessage}">
<div class="alert alert-warning alert-dismissible col-md-offset-2 affix" role="alert">
  <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
  <strong>${arrears.id }</strong> ，${delMessage}
</div>
</c:if>
 <div class="panel panel-primary">
  <div class="panel-heading"><strong>往来欠款</strong>（ 共<c:out value="${rowCount}" />行
            <c:if test="${pageCount > 1 }">，第${pageIndex+1 }页 &nbsp;/&nbsp;共${pageCount }页</c:if>）</div>
  <div class="panel-body">
            <div class="btn-toolbar" role="toolbar">
                <div class="btn-group">
                    <a href="<c:url value="/arrears/create" />" class="btn btn-info"><span
                        class="glyphicon glyphicon-plus"></span> 新 建 </a>
                </div>
            </div>

            <table class="table table-hover">
                <thead>
                    <tr>
                        <th></th>
                        <th>#</th>
                        <th>凭证号</th>
                        <th>项目名称</th>
                        <th>款项分类</th>
                        <th class="amount">借款金额</th>
                        <th class="amount">还款金额</th>
                        <th class="amount">计息</th>
                        <th>支付方式</th>
                        <th>登记时间</th>
                        <th>登记人</th>
                        <th>备注</th>

                    </tr>
                </thead>
                <tbody>
                    <%
                    	int i = Integer.parseInt(request.getAttribute("currentPageStarted").toString());
                    %>
                    <c:forEach items="${list}" var="arrears">
                        <tr>
                            <td><span
                                class="glyphicon <c:out value="${arrears.status != 1 ? 'glyphicon-file' : ''}" />"></span></td>
                            <td><%=++i%></td>
                            <td><a
                                href="<s:url value="/arrears/detail/{id}"><s:param name="id" value="${arrears.id }" /></s:url>"><c:out
                                        value="${arrears.arrearsCode}" /></a></td>
                            <td><c:out value="${arrears.projectId}" /></td>
                            <td><c:out value="${arrears.arrearsType}" /></td>
                            <td class="amount"><span <c:if test="${arrears.interestRate > 0 }">title="此笔费用计算利息" class="label label-default"</c:if>><fmt:formatNumber value="${arrears.amount >=0 ? arrears.amount : 0.0}" pattern="###,###,###,###,##0.00"/></span></td>
                            <td class="amount"><fmt:formatNumber value="${arrears.amount < 0 ? arrears.amount*-1 : 0.0}" pattern="###,###,###,###,##0.00"/></td>
                            <td class="amount"><fmt:formatNumber value="${arrears.interestAmount}" pattern="###,###,###,###,##0.00"/></td>
                            <td><c:out value="${arrears.payType}" /></td>
                            <td><fmt:formatDate value="${arrears.trice}" pattern="yyyy-MM-dd" /></td>
                            <td><c:out value="${arrears.createUser}" /></td>
                            <td><c:out value="${arrears.description}" /></td>
                            <%--
				<td><a
					href="<s:url value="/arrears/modify/{id}"><s:param name="id" value="${arrears.id }" /></s:url>">修改</a>
					| <a class="delete" data-confirm-message="删除后不可恢复，您确认要删除【<c:out value="${arrears.id}" />】么？"
					href="<s:url value="/arrears/delete/{id}"><s:param name="id" value="${arrears.id }" /></s:url>">删除</a></td> --%>
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
                                href="<s:url value='/arrears?p=${pageIndex - 1}' />">上一页</a></li>
                            <li class="${pageIndex + 1 >= pageCount ? 'disabled' :'' }"><a
                                href="<s:url value='/arrears?p=${pageIndex + 1}' />">下一页</a></li>
                        </ul>
                    </div>
                    <div class="col-sm-2">&nbsp;</div>
                </div>
            </c:if>
  </div>
</div></div>
<%@ include file="bottom.jsp"%>
