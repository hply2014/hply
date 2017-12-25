<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="container main">
<c:if test="${not empty message}">
	
<div class="alert alert-success alert-dismissible col-md-offset-4 affix" role="alert">
  <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
  <strong><a href="<s:url value="/paymentitem/detail/${paymentItem.id }" />"> ${paymentItem.id }</a></strong> ，${message}
</div>
</c:if>
<c:if test="${not empty delMessage}">
<div class="alert alert-warning alert-dismissible col-md-offset-4 affix" role="alert">
  <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
  <strong>${paymentItem.id }</strong> ，${delMessage}
</div>
</c:if>
<div class="panel panel-primary">
  <div class="panel-heading"><strong>付款科目</strong>（ 共<c:out value="${rowCount}" />行
            ，第${pageIndex+1 }页 &nbsp;/&nbsp;共${pageCount }页）</div>
    <div class="panel-body">
            <div class="btn-toolbar" role="toolbar">
                <div class="btn-group">
                    <a href="<c:url value="/payment/create" />" class="btn btn-default"><span
                        class="glyphicon glyphicon-share-alt"></span> 返回到付款情况</a>
                </div>
            </div>

            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>付款科目名称</th>
                        <th class="amount">报销上限</th>
                        <th>创建用户</th>
                        <th>创建时间</th>
                        <th>备注</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    	int i = Integer.parseInt(request.getAttribute("currentPageStarted").toString());
                    %>
                    <c:forEach items="${list}" var="paymentItem">
                        <tr>
                            <td><%=++i%></td>
                            <td>${paymentItem.itemName}</td>
                         <%--   <td><a
                                href="<s:url value="/paymentitem/detail/{id}"><s:param name="id" value="${paymentItem.id }" /></s:url>"><c:out
                                        value="${paymentItem.itemName}" /></a></td> --%>
                            <td class="amount"><fmt:formatNumber value="${paymentItem.reimbursementCap}" pattern="0.00" /> %</td>
                            <td><c:out value="${paymentItem.createUser}" /></td>
                            <td><fmt:formatDate value="${paymentItem.createTime}" pattern="yyyy-MM-dd" /></td>
                            <td><c:out value="${paymentItem.description}" /></td>
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
                                href="<s:url value='/paymentitem?p=${pageIndex - 1}' />">上一页</a></li>
                            <li class="${pageIndex + 1 >= pageCount ? 'disabled' :'' }"><a
                                href="<s:url value='/paymentitem?p=${pageIndex + 1}' />">下一页</a></li>
                        </ul>
                    </div>
                    <div class="col-sm-2">&nbsp;</div>
                </div>
            </c:if>
  </div>
</div></div>
<%@ include file="bottom.jsp"%>
