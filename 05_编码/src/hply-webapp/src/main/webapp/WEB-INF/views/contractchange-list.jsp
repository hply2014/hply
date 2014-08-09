<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="container main">
    <c:if test="${not empty message}">
        <div></div>
        <div class="alert alert-success alert-dismissible col-md-offset-2 affix" role="alert">
            <button type="button" class="close" data-dismiss="alert">
                <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
            </button>
            <strong><a href="<s:url value="/contractchange/detail/${contractChange.id }" />">
                    ${contractChange.id }</a></strong> ，${message}
        </div>
    </c:if>
    <c:if test="${not empty delMessage}">
        <div class="alert alert-warning alert-dismissible col-md-offset-2 affix" role="alert">
            <button type="button" class="close" data-dismiss="alert">
                <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
            </button>
            <strong>${contractChange.id }</strong> ，${delMessage}
        </div>
    </c:if>
    <div class="panel panel-default">
        <div class="panel-heading">
            <strong>合同补充协议</strong>（
            <c:out value="${list.size()}" />
            条数据）
        </div>
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
                        <th>#</th>
                        <th></th>
                        <th>增补协议编号</th>
                        <th>项目ID</th>
                        <th>管理费率</th>
                        <th>增减金额</th>
                        <th>增补时间</th>
                        <th>备注</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    	int i = 0;
                    %>
                    <c:forEach items="${list}" var="contractChange">
                        <tr>
                            <td><%=++i%></td>
                            <td><span
                                class="glyphicon <c:out value="${contractChange.status != 1 ? 'glyphicon-file' : ''}" />"></span></td>
                            <td><a
                                href="<s:url value="/contractchange/detail/{id}"><s:param name="id" value="${contractChange.id }" /></s:url>"><c:out value="${contractChange.csaCode}" /></a></td>
                            <td><c:out
                                        value="${contractChange.projectId}" /></td>
                            <td><c:out value="${contractChange.managementRate}" /></td>
                            <td><c:out value="${contractChange.changeAmount}" /></td>
                            <td><fmt:formatDate value="${contractChange.trice}" pattern="yyyy-MM-dd" /></td>
                            <td><c:out value="${contractChange.description}" /></td>
                            <td><c:if test="${contractchange.status == 1 }">
                                    <shiro:hasPermission name="`contractchange_modify`">
                                        <a
                                            href="<s:url value="/contractchange/modify/{id}"><s:param name="id" value="${contractChange.id }" /></s:url>">修改</a>
                                    </shiro:hasPermission>
                                </c:if> <c:if test="${contractChange.status != 1 }">
                                    <shiro:hasPermission name="`contractchange_create`">
                                        <a
                                            href="<s:url value="/contractchange/modify/{id}"><s:param name="id" value="${contractChange.id }" /></s:url>">修改</a>
                                    </shiro:hasPermission>
                                </c:if> <shiro:hasPermission name="`contractchange_delete`">
                                    <a class="delete"
                                        data-confirm-message="合同补充协议数据：<c:out value="${contractChange.id}" />，将被永久删除，操作不可撤销，是否确认？"
                                        href="<s:url value="/contractchange/delete/{id}"><s:param name="id" value="${contractChange.id }" /></s:url>">删除</a>
                                </shiro:hasPermission></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<%@ include file="bottom.jsp"%>
