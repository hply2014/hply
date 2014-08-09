﻿<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="container main">
    <c:if test="${not empty message}">
        <div></div>
        <div class="alert alert-success alert-dismissible col-md-offset-2 affix" role="alert">
            <button type="button" class="close" data-dismiss="alert">
                <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
            </button>
            <strong><a href="<s:url value="/customerbilling/detail/${customerBilling.id }" />">
                    ${customerBilling.id }</a></strong> ，${message}
        </div>
    </c:if>
    <c:if test="${not empty delMessage}">
        <div class="alert alert-warning alert-dismissible col-md-offset-2 affix" role="alert">
            <button type="button" class="close" data-dismiss="alert">
                <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
            </button>
            <strong>${customerBilling.id }</strong> ，${delMessage}
        </div>
    </c:if>
    <div class="panel panel-default">
        <div class="panel-heading">
            <strong>客户开票情况</strong>（
            <c:out value="${list.size()}" />
            条数据）
        </div>
        <div class="panel-body">
            <div class="btn-toolbar" role="toolbar">
                <shiro:hasPermission name="`customerbilling_create`">
                    <div class="btn-group">
                        <a href="<c:url value="/customerbilling/create" />" class="btn btn-info"><span
                            class="glyphicon glyphicon-plus"></span> 新 建 </a>
                    </div>
                </shiro:hasPermission>
            </div>

            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>#</th>
                        <th></th>
                        <th>项目ID</th>
                        <th>发票票号</th>
                        <th>发票类别</th>
                        <th>发票金额</th>
                        <th>开票时间</th>
                        <th>备注</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    	int i = 0;
                    %>
                    <c:forEach items="${list}" var="customerBilling">
                        <tr>
                            <td><%=++i%></td>
                            <td><span
                                class="glyphicon <c:out value="${customerBilling.status != 1 ? 'glyphicon-file' : ''}" />"></span></td>
                            <td><a
                                href="<s:url value="/customerbilling/detail/{id}"><s:param name="id" value="${customerBilling.id }" /></s:url>"><c:out
                                        value="${customerBilling.projectId}" /></a></td>
                            <td><c:out value="${customerBilling.invoiceCode}" /></td>
                            <td><c:out value="${customerBilling.invoiceType}" /></td>
                            <td><c:out value="${customerBilling.amount}" /></td>
                            <td><fmt:formatDate value="${customerBilling.trice}" pattern="yyyy-MM-dd" /></td>
                            <td><c:out value="${customerBilling.description}" /></td>
                            <td><c:if test="${customerbilling.status == 1 }">
                                    <shiro:hasPermission name="`customerbilling_modify`">
                                        <a
                                            href="<s:url value="/customerbilling/modify/{id}"><s:param name="id" value="${customerBilling.id }" /></s:url>">修改</a>
                                    </shiro:hasPermission>
                                </c:if> <c:if test="${customerBilling.status != 1 }">
                                    <shiro:hasPermission name="`customerbilling_create`">
                                        <a
                                            href="<s:url value="/customerbilling/modify/{id}"><s:param name="id" value="${customerBilling.id }" /></s:url>">修改</a>
                                    </shiro:hasPermission>
                                </c:if> <shiro:hasPermission name="`customerbilling_delete`">
                                    <a class="delete"
                                        data-confirm-message="客户开票情况数据：<c:out value="${customerBilling.id}" />，将被永久删除，操作不可撤销，是否确认？"
                                        href="<s:url value="/customerbilling/delete/{id}"><s:param name="id" value="${customerBilling.id }" /></s:url>">删除</a>
                                </shiro:hasPermission></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<%@ include file="bottom.jsp"%>
