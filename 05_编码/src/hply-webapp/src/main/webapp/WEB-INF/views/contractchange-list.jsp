<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="container main">
<c:if test="${not empty message}">
	<div></div>
<div class="alert alert-success alert-dismissible col-md-offset-2 affix" role="alert">
  <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
  <strong><a href="<s:url value="/contractchange/detail/${contractChange.id }" />"> ${contractChange.id }</a></strong> ，${message}
</div>
</c:if>
<c:if test="${not empty delMessage}">
<div class="alert alert-warning alert-dismissible col-md-offset-2 affix" role="alert">
  <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
  <strong>${contractChange.id }</strong> ，${delMessage}
</div>
</c:if>
<div class="panel panel-primary">
  <div class="panel-heading"><strong>合同补充协议</strong>（ 共<c:out value="${rowCount}" />行
            <c:if test="${pageCount > 1 }">，第${pageIndex+1 }页 &nbsp;/&nbsp;共${pageCount }页</c:if>）</div>
 <div class="panel-body">
            <div class="btn-toolbar" role="toolbar">
                <shiro:hasPermission name="`contractchange_create`">
                    <div class="btn-group">
                        <a href="<c:url value="/contractchange/create" />" class="btn btn-info"><span
                            class="glyphicon glyphicon-plus"></span> 新 建 </a>
                    </div>
                </shiro:hasPermission>
            </div>

            <table class="table table-hover">
                <thead>
                    <tr>
                        <th></th>
                        <th>#</th>
                        <th>增补协议编号</th>
                        <th>项目名称</th>
                        <th class="amount">管理费率</th>
                        <th class="amount">增减金额</th>
                        <th>登记人</th>
                        <th>登记时间</th>
                        <th>备注</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    	int i = Integer.parseInt(request.getAttribute("currentPageStarted").toString());
                    %>
                    <c:forEach items="${list}" var="contractChange">
                        <tr>
                            <td><span
                                class="glyphicon <c:out value="${contractChange.status != 1 ? 'glyphicon-file' : ''}" />"></span></td>
                            <td><%=++i%></td>
                            <td><a
                                href="<s:url value="/contractchange/detail/{id}"><s:param name="id" value="${contractChange.id }" /></s:url>"><c:out
                                        value="${contractChange.csaCode}" /></a></td>
                            <td><c:out value="${contractChange.projectId}" /></td>
                            <td class="amount"><fmt:formatNumber value="${contractChange.managementRate}" pattern="0.00" />%</td>
                            <td class="amount"><fmt:formatNumber value="${contractChange.changeAmount}" pattern="###,###,###,###,##0.00" /></td>
                            <td><c:out value="${contractChange.createUser}" /></td>
                            <td><fmt:formatDate value="${contractChange.trice}" pattern="yyyy-MM-dd" /></td>
                            <td><c:out value="${contractChange.description}" /></td>
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
                                href="<s:url value='/contractchange?p=${pageIndex - 1}' />">上一页</a></li>
                            <li class="${pageIndex + 1 >= pageCount ? 'disabled' :'' }"><a
                                href="<s:url value='/contractchange?p=${pageIndex + 1}' />">下一页</a></li>
                        </ul>
                    </div>
                    <div class="col-sm-2">&nbsp;</div>
                </div>
            </c:if>
  </div>
</div></div>
<%@ include file="bottom.jsp"%>
