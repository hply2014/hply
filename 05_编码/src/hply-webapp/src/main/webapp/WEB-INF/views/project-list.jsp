﻿<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="container main">
    <c:if test="${not empty message}">
        <div></div>
        <div class="alert alert-success alert-dismissible col-md-offset-2 affix" role="alert">
            <button type="button" class="close" data-dismiss="alert">
                <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
            </button>
            <strong><a href="<s:url value="/project/detail/${project.id }" />"> ${project.id }</a></strong> ，${message}
        </div>
    </c:if>
    <c:if test="${not empty delMessage}">
        <div class="alert alert-warning alert-dismissible col-md-offset-2 affix" role="alert">
            <button type="button" class="close" data-dismiss="alert">
                <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
            </button>
            <strong>${project.id }</strong> ，${delMessage}
        </div>
    </c:if>
    <div class="panel panel-default">
        <div class="panel-heading">
            <strong>合同项目信息</strong>（
            <c:out value="${list.size()}" />
            条数据）
        </div>
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
                        <th></th>
                        <th>#</th>
                        <th>项目编号</th>
                        <th>项目名称</th>
                        <th>所在部门</th>
                        <th>项目经理</th>
                        <th>管理费率</th>
                        <th>税金比率</th>
                        <th>合同金额</th>
                        <th>印花税上交金额</th>
                        <th>登记人</th>
                        <th>登记时间</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    	int i = 0;
                    %>
                    <c:forEach items="${list}" var="project">
                        <tr>
                            <td><span
                                class="glyphicon <c:out value="${project.status != 1 ? 'glyphicon-file' : ''}" />"></span></td>
                            <td><%=++i%></td>
                            <td><a
                                href="<s:url value="/project/detail/{id}"><s:param name="id" value="${project.id }" /></s:url>"><c:out
                                        value="${project.projectCode}" /></a></td>
                            <td><c:out value="${project.projectName}" /></td>
                            <td><c:out value="${project.organizationId}" /></td>
                            <td><c:out value='${project.manager}' /></td>
                            <td><c:out value="${project.managementRate}" /></td>
                            <td><c:out value="${project.taxRate}" /></td>
                            <td><c:out value="${project.contractAmount}" /> <c:if
                                    test="${not empty project.settlementAmount && project.settlementAmount > 0 }">
                                    <br />结算：<c:out value="${project.settlementAmount}" />
                                </c:if></td>
                            <td><span data-toggle="tooltip" title="时间：<fmt:formatDate value='${project.dutyPaidTime}' pattern='yyyy-MM-dd' />，收据编号：<c:out value='${project.dutyPaidCode}' />"> 
                            <c:out value="${project.dutyPaidAmount}" /><span></td>
                         <td><c:out value="${project.createUser}" /></td>
                            <td title="<c:out value="${project.createUser}" />"><fmt:formatDate value="${project.trice}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                            </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<%@ include file="bottom.jsp"%>
