<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="container main">
    <c:if test="${not empty message}">
        <div></div>
        <div class="alert alert-success alert-dismissible col-md-offset-2 affix" role="alert">
            <button type="button" class="close" data-dismiss="alert">
                <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
            </button>
            <strong><a href="<s:url value="/partybilling/detail/${partyBilling.id }" />"> ${partyBilling.id }</a></strong>
            ，${message}
        </div>
    </c:if>
    <c:if test="${not empty delMessage}">
        <div class="alert alert-warning alert-dismissible col-md-offset-2 affix" role="alert">
            <button type="button" class="close" data-dismiss="alert">
                <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
            </button>
            <strong>${partyBilling.id }</strong> ，${delMessage}
        </div>
    </c:if>
    <div class="panel panel-primary">
        <div class="panel-heading">
            <strong>甲方开票情况</strong>（
            <c:out value="${list.size()}" />
            条数据）
        </div>
        <div class="panel-body">
            <div class="btn-toolbar" role="toolbar">
                <shiro:hasPermission name="`partybilling_create`">
                    <div class="btn-group">
                        <a href="<c:url value="/partybilling/create" />" class="btn btn-info"><span
                            class="glyphicon glyphicon-plus"></span> 新 建 </a>
                    </div>
                </shiro:hasPermission>
            </div>

            <table class="table table-hover">
                <thead>
                    <tr>
                        <th></th>
                        <th>#</th>
                        <th>发票票号</th>
                        <th>项目名称</th>
                        <th>税率</th>
                        <th>发票金额</th>
                        <th>开票人</th>
                        <th>开票时间</th>
                        <th>审核状态</th>
                        <th>审核情况</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    	int i = 0;
                    %>
                    <c:forEach items="${list}" var="partyBilling">
                        <tr>
                            <td><span
                                class="glyphicon <c:out value="${partyBilling.status != 1 ? 'glyphicon-file' : ''}" />"></span></td>
                            <td><%=++i%></td>
                            <td><a
                                href="<s:url value="/partybilling/detail/{id}"><s:param name="id" value="${partyBilling.id }" /></s:url>"><c:out
                                        value="${partyBilling.invoiceCode}" /></a></td>
                            <td>${ partyBilling.projectId}</td>
                            <td><c:out value="${partyBilling.taxRate}" />%</td>
                            <td><c:out value="${partyBilling.amount}" /></td>
                            <td><c:out value="${partyBilling.createUser}" /></td>
                            <td><fmt:formatDate value="${partyBilling.trice}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                            <td>${partyBilling.stepStatus == 1 ? '已' : '未'}审核</td>
                            <td><c:if test="${not empty partyBilling.step1User}">${partyBilling.step1User}：“${partyBilling.step1Idea}”<br /><fmt:formatDate
                                        value="${partyBilling.step1Time}" pattern="yyyy-MM-dd HH:mm:ss" />
                                </c:if></td>
                            <td><c:if test="${ partyBilling.stepStatus != 1 }">
                                    <shiro:hasPermission name="`partybilling_step1`">
                                        <a
                                            href="<s:url value="/partybilling/step1/{id}"><s:param name="id" value="${partyBilling.id }" /></s:url>">审核</a>
                                    </shiro:hasPermission>
                                    <shiro:hasPermission name="`partybilling_create`">
                                        <a
                                            href="<s:url value="/partybilling/modify/{id}"><s:param name="id" value="${partyBilling.id }" /></s:url>">修改</a>
                                        <a class="delete"
                                            data-confirm-message="甲方开票情况数据：<c:out value="${partyBilling.id}" />，将被永久删除，操作不可撤销，是否确认？"
                                            href="<s:url value="/partybilling/delete/{id}"><s:param name="id" value="${partyBilling.id }" /></s:url>">删除</a>
                                    </shiro:hasPermission>
                                </c:if></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<%@ include file="bottom.jsp"%>
