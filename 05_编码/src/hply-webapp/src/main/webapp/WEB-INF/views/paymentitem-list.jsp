<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="container main">
    <c:if test="${not empty message}">
        <div></div>
        <div class="alert alert-success alert-dismissible col-md-offset-2 affix" role="alert">
            <button type="button" class="close" data-dismiss="alert">
                <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
            </button>
            <strong><a href="<s:url value="/paymentitem/detail/${paymentItem.id }" />"> ${paymentItem.id }</a></strong>
            ，${message}
        </div>
    </c:if>
    <c:if test="${not empty delMessage}">
        <div class="alert alert-warning alert-dismissible col-md-offset-2 affix" role="alert">
            <button type="button" class="close" data-dismiss="alert">
                <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
            </button>
            <strong>${paymentItem.id }</strong> ，${delMessage}
        </div>
    </c:if>
    <div class="panel panel-primary">
        <div class="panel-heading">
            <strong>付款科目</strong>（
            <c:out value="${list.size()}" />
            条数据）
        </div>
        <div class="panel-body">
            <div class="btn-toolbar" role="toolbar">
                <shiro:hasPermission name="`payment-item`">
                    <div class="btn-group">
                        <a href="<c:url value="/paymentitem/create" />" class="btn btn-info"><span
                            class="glyphicon glyphicon-plus"></span> 新 建 </a>
                    </div>
                </shiro:hasPermission>
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
                        <th>报销比例上限</th>
                        <th>创建用户</th>
                        <th>创建时间</th>
                        <th>备注</th>
                        <th></th>

                    </tr>
                </thead>
                <tbody>
                    <%
                    	int i = 0;
                    %>
                    <c:forEach items="${list}" var="paymentItem">
                        <tr>
                            <td><%=++i%></td>

                            <td><a
                                href="<s:url value="/paymentitem/detail/{id}"><s:param name="id" value="${paymentItem.id }" /></s:url>"><c:out
                                        value="${paymentItem.itemName}" /></a></td>
                            <td><fmt:formatNumber value="${paymentItem.reimbursementCap}" pattern="#.00" /> %</td>
                            <td><c:out value="${paymentItem.createUser}" /></td>
                            <td><fmt:formatDate value="${paymentItem.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                            <td><c:out value="${paymentItem.description}" /></td>
                            <td><shiro:hasPermission name="`payment-item`">
                                    <a
                                        href="<s:url value="/paymentitem/modify/{id}"><s:param name="id" value="${paymentItem.id }" /></s:url>">修改</a>
                                    <a class="delete"
                                        data-confirm-message="付款科目数据：<c:out value="${paymentItem.id}" />，将被永久删除，操作不可撤销，是否确认？"
                                        href="<s:url value="/paymentitem/delete/{id}"><s:param name="id" value="${paymentItem.id }" /></s:url>">删除</a>
                                </shiro:hasPermission></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<%@ include file="bottom.jsp"%>
