<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
            <strong>盖章管理</strong>（ 共
            <c:out value="${rowCount}" />
            行， <select class="selectpicker page" data-size="10" data-style="btn-warning btn-sm" data-width="120px"></select>&nbsp;/&nbsp;共${pageCount }页
            ）
            <c:if test='${not empty orglist}'>
                <div class="pull-right">
                    <select class="selectpicker org" data-size="10" data-style="btn-danger btn-sm" data-width="120px">
                        <c:forEach items="${orglist}" var="org">
                            <option ${org.id == oid ? 'selected' : '' } value="${org.id}">${org.organizationName}</option>
                        </c:forEach>
                    </select>
                </div>
            </c:if>
        </div>
        <div class="panel-body">
            <div class="btn-toolbar" role="toolbar">
                <shiro:hasPermission name="`chop_create`">
                    <div class="btn-group">
                        <a href="<c:url value="/chop/create" />" class="btn btn-info"><span
                            class="glyphicon glyphicon-plus"></span> 新 建 </a>
                    </div>
                </shiro:hasPermission>
            </div>

            <table class="table table-hover">
                <thead>
                    <tr>
                        <th></th>
                        <th>#</th>
                        <th>用章编号</th>
                        <th>项目名称 &nbsp;/&nbsp;主要内容</th>
                        <th>申请信息</th>
                        <th>部门审核</th>
                        <th>财务部审批</th>
                        <th>盖章受理</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    	int i = Integer.parseInt(request.getAttribute("currentPageStarted")
                    			.toString());
                    %>
                    <c:forEach items="${list}" var="chop">
                        <tr>
                            <td><span
                                class="glyphicon <c:out value="${chop.status != 1 ? 'glyphicon-file' : ''}" />"></span></td>
                            <td><%=++i%></td>
                            <td><a
                                href="<s:url value="/chop/detail/{id}"><s:param name="id" value="${chop.id }" /></s:url>"><c:out
                                        value="${chop.chopCode}" /></a></td>
                            <td><c:out value="${chop.projectName}" /><br/><c:out value="${chop.content}" /></td>
                            <td><c:out value="${chop.applyUser}" /><br /><fmt:formatDate
                                    value="${chop.applyTime}" pattern="yyyy-MM-dd" /></td>
                            <td><c:if test="${empty chop.step1User }">未审核</c:if> <c:if
                                    test="${not empty chop.step1User }"><c:out value="${chop.step1User}" />
                                    <br />
                                </c:if><c:if test="${not empty chop.step1Time }"><fmt:formatDate
                                        value="${chop.step1Time}" pattern="yyyy-MM-dd" />
                                </c:if></td>
                            <td><c:if test="${empty chop.step2User }">未审批</c:if> <c:if test="${not empty chop.step2Idea }"><c:out value="${chop.step2Idea}" />
                                    <br />
                                </c:if> <c:if
                                    test="${not empty chop.step2User }"><c:out value="${chop.step2User}" />
                                    <br />
                                </c:if> <c:if test="${not empty chop.step2Time }"><fmt:formatDate
                                        value="${chop.step2Time}" pattern="yyyy-MM-dd" />
                                </c:if></td>
                            <td><c:if test="${empty chop.step3User }">未办理</c:if> <c:if test="${not empty chop.step3Idea }"><c:out value="${chop.step3Idea}" />
                                    <br />
                                </c:if> <c:if
                                    test="${not empty chop.step3User }"><c:out value="${chop.step3User}" />
                                    <br />
                                </c:if> <c:if test="${not empty chop.step3Time }"><fmt:formatDate
                                        value="${chop.step3Time}" pattern="yyyy-MM-dd" />
                                </c:if></td>
                            <td><c:if test="${ empty chop.stepStatus }">
                                    <shiro:hasPermission name="`chop_check1`">
                                        <a
                                            href="<s:url value="/chop/step1/{id}"><s:param name="id" value="${chop.id }" /></s:url>">部门审核</a>
                                        <br />
                                    </shiro:hasPermission>
                                    <shiro:hasPermission name="`chop_create`">
                                        <a
                                            href="<s:url value="/chop/modify/{id}"><s:param name="id" value="${chop.id }" /></s:url>">修改</a>
                                        <a class="delete"
                                            data-confirm-message="用章申请数据：<c:out value="${chop.chopCode}" />，将被永久删除，操作不可撤销，是否确认？"
                                            href="<s:url value="/chop/delete/{id}"><s:param name="id" value="${chop.id }" /></s:url>">删除</a>
                                    </shiro:hasPermission>
                                </c:if> <c:if test="${ chop.stepStatus == '1' }">
                                    <shiro:hasPermission name="`chop_check2`">
                                        <a
                                            href="<s:url value="/chop/step2/{id}"><s:param name="id" value="${chop.id }" /></s:url>">财务审核</a>
                                    </shiro:hasPermission>
                                    <shiro:hasPermission name="`chop_check2_1`">
                                        <a
                                            href="<s:url value="/chop/step2/{id}"><s:param name="id" value="${chop.id }" /></s:url>">财务审核（代）</a>
                                    </shiro:hasPermission>
                                </c:if> <c:if test="${ chop.stepStatus == '2' }">
                                    <shiro:hasPermission name="`chop_check3`">
                                        <a
                                            href="<s:url value="/chop/step3/{id}"><s:param name="id" value="${chop.id }" /></s:url>">办理</a>
                                    </shiro:hasPermission>

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
                                href="<s:url value='/chop?p=${pageIndex - 1}' />&oid=${oid}">上一页</a></li>
                            <li class="${pageIndex + 1 >= pageCount ? 'disabled' :'' }"><a
                                href="<s:url value='/chop?p=${pageIndex + 1}' />&oid=${oid}">下一页</a></li>
                        </ul>
                    </div>
                    <div class="col-sm-2">&nbsp;</div>
                </div>
            </c:if>
        </div>
    </div>
</div>
<script type="text/javascript">
<!--
$(function() {
    var p = '';
    for (var i = 0; i < <c:out value="${pageCount}" />; i++) {
        p = p + '<option ' + (i== ${pageIndex} ? 'selected': '') + ' value="' + i + '">第' + (i + 1) + '页</option>';
    }

    $(".page").append(p).change(function(){
        self.location = '<s:url value="/chop"/>?oid=${oid}&p=' + $(this).val();
    });
    

    $(".org").change(function(){
        self.location = '<s:url value="/chop"/>?oid=' + $(this).val();
    });

});
//-->
</script>
<%@ include file="bottom.jsp"%>
