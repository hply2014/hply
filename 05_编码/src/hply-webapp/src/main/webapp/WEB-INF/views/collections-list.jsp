<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="container main">
<c:if test="${not empty message}">
	<div></div>
<div class="alert alert-success alert-dismissible col-md-offset-2 affix" role="alert">
  <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
  <strong><a href="<s:url value="/collections/detail/${collections.id }" />"> ${collections.id }</a></strong> ，${message}
</div>
</c:if>
<c:if test="${not empty delMessage}">
<div class="alert alert-warning alert-dismissible col-md-offset-2 affix" role="alert">
  <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
  <strong>${collections.id }</strong> ，${delMessage}
</div>
</c:if>
<div class="panel panel-primary">
  <div class="panel-heading"><strong>收款情况</strong>（共<c:out value="${rowCount}" />行
            <c:if test="${pageCount > 1 }">，第${pageIndex+1 }页 &nbsp;/&nbsp;共${pageCount }页</c:if>）</div>
 <div class="panel-body">
            <div class="btn-toolbar" role="toolbar">
                <shiro:hasPermission name="`collections_create`">
                    <div class="btn-group">
                        <a href="<c:url value="/collections/create" />" class="btn btn-info"><span
                            class="glyphicon glyphicon-plus"></span> 新 建 </a>
                    </div>
                </shiro:hasPermission>
            </div>

            <table class="table table-hover">
                <thead>
                    <tr>
                        <th></th>
                        <th>#</th>
                        <th>凭证号</th>
                        <th>项目名称</th>
                        <th>款项来源</th>
                        <th>收款方式</th>
                        <th>收款金额</th>
                        <th>银行账号</th>
                        <th>开户行名称</th>
                        <th>收款人</th>
                        <th>收款时间</th>
                        <th>备注</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    	int i = Integer.parseInt(request.getAttribute("currentPageStarted").toString());
                    %>
                    <c:forEach items="${list}" var="collections">
                        <tr>
                            <td><span
                                class="glyphicon <c:out value="${collections.status != 1 ? 'glyphicon-file' : ''}" />"></span></td>
                            <td><%=++i%></td>
                            <td><c:out value="${collections.ticketCode}" /></td>
                            <td><a
                                href="<s:url value="/collections/detail/{id}"><s:param name="id" value="${collections.id }" /></s:url>"><c:out
                                        value="${collections.projectId}" /></a></td>
                            <td><c:out value="${collections.sourceOf}" /></td>
                            <td><c:out value="${collections.paymentType}" /></td>
                            <td><c:out value="${collections.amount}" /></td>
                            <td><c:out value="${collections.bankAccount}" /></td>
                            <td><c:out value="${collections.bankName}" /></td>
                            <td><c:out value="${collections.createUser}" /></td>
                            <td><fmt:formatDate value="${collections.trice}" pattern="yyyy-MM-dd" /></td>
                            <td><c:out value="${collections.description}" /></td>
                            <%--
                            <td><c:if test="${collections.status == 1 }">
                                    <shiro:hasPermission name="`collections_modify`">
                                        <a
                                            href="<s:url value="/collections/modify/{id}"><s:param name="id" value="${collections.id }" /></s:url>">修改</a>
                                    </shiro:hasPermission>
                                </c:if> <c:if test="${collections.status != 1 }">
                                    <shiro:hasPermission name="`collections_create`">
                                        <a
                                            href="<s:url value="/collections/modify/{id}"><s:param name="id" value="${collections.id }" /></s:url>">修改</a>
                                    </shiro:hasPermission>
                                </c:if> <shiro:hasPermission name="`collections_delete`">
                                    <a class="delete"
                                        data-confirm-message="收款情况数据：<c:out value="${collections.id}" />，将被永久删除，操作不可撤销，是否确认？"
                                        href="<s:url value="/collections/delete/{id}"><s:param name="id" value="${collections.id }" /></s:url>">删除</a>
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
                            <li class="${pageIndex <= 0 ? 'disabled' :'' }"><a
                                href="<s:url value='/collections?p=${pageIndex - 1}' />">上一页</a></li>
                            <li class="${pageIndex + 1 >= pageCount ? 'disabled' :'' }"><a
                                href="<s:url value='/collections?p=${pageIndex + 1}' />">下一页</a></li>
                        </ul>
                    </div>
                    <div class="col-sm-2">&nbsp;</div>
                </div>
            </c:if>
  </div>
</div></div>
<%@ include file="bottom.jsp"%>
