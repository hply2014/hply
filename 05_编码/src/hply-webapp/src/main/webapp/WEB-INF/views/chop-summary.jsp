﻿<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="container main">
    <c:if test="${not empty message}">
        
        <div class="alert alert-success alert-dismissible col-md-offset-4 affix" role="alert">
            <button type="button" class="close" data-dismiss="alert">
                <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
            </button>
            <strong><a href="<s:url value="/chop/detail/${chop.id }" />"> ${chop.chopCode }</a></strong> ，${message}
        </div>
    </c:if>
    <c:if test="${not empty delMessage}">
        <div class="alert alert-warning alert-dismissible col-md-offset-4 affix" role="alert">
            <button type="button" class="close" data-dismiss="alert">
                <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
            </button>
            <strong>${chop.chopCode }</strong> ，${delMessage}
        </div>
    </c:if>
    <div class="panel panel-primary">
        <div class="panel-heading">
            <strong>用章统计</strong>（ 共
            <c:out value="${rowCount}" />
            行
            <c:if test="${pageCount > 1 }">，第${pageIndex+1 }页 &nbsp;/&nbsp;共${pageCount }页</c:if>
            ）
        </div>
        <div class="panel-body">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th></th>
                        <th>#</th>
                        <th>用章编号</th>
                        <th>项目名称</th>
                        <th>主要内容</th>
                        <th>申请信息</th>
                        <th>部门审核</th>
                        <th>财务部审批</th>
                        <th>经办人处理</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    	int i = Integer.parseInt(request.getAttribute("currentPageStarted").toString());
                    %>
                    <c:forEach items="${list}" var="chop">
                        <tr>
                            <td><span
                                class="glyphicon <c:out value="${chop.status != 1 ? 'glyphicon-file' : ''}" />"></span></td>
                            <td><%=++i%></td>
                            <td><a
                                href="<s:url value="/chop/detail/{id}"><s:param name="id" value="${chop.id }" /></s:url>"><c:out
                                        value="${chop.chopCode}" /></a></td>
                            <td><c:out value="${chop.projectName}" /></td>
                            <td><c:out value="${chop.content}" /></td>
                            <td><c:out value="${chop.applyUser}" /><br />所在部门：<c:out
                                    value="${chop.organizationId}" /><br />申请时间：<fmt:formatDate
                                    value="${chop.applyTime}" pattern="yyyy-MM-dd" /></td>
                            <td><c:if test="${empty chop.step1User }">未审核</c:if> <c:if
                                    test="${not empty chop.step1User }">部门审核：<c:out value="${chop.step1User}" />
                                    <br />
                                </c:if> <c:if test="${not empty chop.step1Idea }">意见：<c:out value="${chop.step1Idea}" />
                                    <br />
                                </c:if> <c:if test="${not empty chop.step1Time }">时间：<fmt:formatDate
                                        value="${chop.step1Time}" pattern="yyyy-MM-dd" />
                                </c:if></td>
                            <td><c:if test="${empty chop.step2User }">未审批</c:if> <c:if
                                    test="${not empty chop.step2User }">财务审批：<c:out value="${chop.step2User}" />
                                    <br />
                                </c:if> <c:if test="${not empty chop.step2Idea }">意见：<c:out value="${chop.step2Idea}" />
                                    <br />
                                </c:if> <c:if test="${not empty chop.step2Time }">时间：<fmt:formatDate
                                        value="${chop.step2Time}" pattern="yyyy-MM-dd" />
                                </c:if></td>
                            <td><c:if test="${empty chop.step3User }">未办理</c:if> <c:if
                                    test="${not empty chop.step3User }">办理人：<c:out value="${chop.step3User}" />
                                    <br />
                                </c:if> <c:if test="${not empty chop.step3Idea }">结果：<c:out value="${chop.step3Idea}" />
                                    <br />
                                </c:if> <c:if test="${not empty chop.step3Time }">时间：<fmt:formatDate
                                        value="${chop.step3Time}" pattern="yyyy-MM-dd" />
                                </c:if></td>
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
                                href="<s:url value='/chop?p=${pageIndex - 1}' />">上一页</a></li>
                            <li class="${pageIndex + 1 >= pageCount ? 'disabled' :'' }"><a
                                href="<s:url value='/chop?p=${pageIndex + 1}' />">下一页</a></li>
                        </ul>
                    </div>
                    <div class="col-sm-2">&nbsp;</div>
                </div>
            </c:if>
        </div>
    </div>
</div>
<%@ include file="bottom.jsp"%>
