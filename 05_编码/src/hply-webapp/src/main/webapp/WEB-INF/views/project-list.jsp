<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
    <div class="panel panel-primary">
        <div class="panel-heading">
            <strong>合同项目信息</strong>
            <c:if test="${pageCount > 1 }">（ 共
            <c:out value="${rowCount}" />
            行，第${pageIndex+1 }页 &nbsp;/&nbsp;共${pageCount }页）</c:if>
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
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    	int i = Integer.parseInt(request.getAttribute("currentPageStarted")
                    			.toString());
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
                            <td><fmt:formatNumber value="${project.managementRate}" pattern="#0.00" />%</td>
                            <td><fmt:formatNumber value="${project.taxRate}" pattern="#0.00" />%</td>
                            <td><fmt:formatNumber value="${project.contractAmount}"
                                    pattern="###,###,###,###,###0.00" />
                                <c:if test="${not empty project.settlementAmount && project.settlementAmount > 0 }">
                                    <br />结算：<fmt:formatNumber value="${project.settlementAmount}" pattern="###,###,###,###,###0.00" />
                                </c:if></td>
                            <td><span data-toggle="tooltip"
                                title="<c:if test='${not empty project.dutyPaidTime }'>时间：<fmt:formatDate value='${project.dutyPaidTime}' pattern='yyyy-MM-dd' /></c:if><c:if test="${not empty project.dutyPaidCode}">，收据编号：${project.dutyPaidCode}</c:if>">
                                    <fmt:formatNumber value="${project.dutyPaidAmount}" pattern="###,###,###,###,###0.00" /><span></td>
                            <td><c:out value="${project.createUser}" /></td>
                            <td title="<c:out value="${project.createUser}" />"><fmt:formatDate
                                    value="${project.trice}" pattern="yyyy-MM-dd" /></td>
                            <td><shiro:hasPermission name="`project_modify`">
                                    <a href="<s:url value="/project/modify/${project.id }" />">修改</a>
                                </shiro:hasPermission></td>
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
                                href="<s:url value='/project?p=${pageIndex - 1}' />">上一页</a></li>
                            <li class="${pageIndex + 1 >= pageCount ? 'disabled' :'' }"><a
                                href="<s:url value='/project?p=${pageIndex + 1}' />">下一页</a></li>
                        </ul>
                    </div>
                    <div class="col-sm-2">&nbsp;</div>
                </div>
            </c:if>
        </div>
    </div>
</div>
<script>
</script>
<%@ include file="bottom.jsp"%>
