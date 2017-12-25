<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="container main">
    <c:if test="${not empty message}">
        
        <div class="alert alert-success alert-dismissible col-md-offset-4 affix" role="alert">
            <button type="button" class="close" data-dismiss="alert">
                <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
            </button>
            <strong><a href="<s:url value="/customerbilling/detail/${customerBilling.id }" />">
                    ${customerBilling.id }</a></strong> ，${message}
        </div>
    </c:if>
    <c:if test="${not empty delMessage}">
        <div class="alert alert-warning alert-dismissible col-md-offset-4 affix" role="alert">
            <button type="button" class="close" data-dismiss="alert">
                <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
            </button>
            <strong>${customerBilling.id }</strong> ，${delMessage}
        </div>
    </c:if>
    <div class="panel panel-primary">
        <div class="panel-heading">
            <strong>客户开票情况</strong>（ 共
            <c:out value="${rowCount}" />
            行，
                <select class="selectpicker page" data-size="10" data-style="btn-warning btn-sm" data-width="120px"></select>&nbsp;/&nbsp;共${pageCount }页 
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
                        <th></th>
                        <th>#</th>
                        <th>项目名称</th>
                        <!-- <th>发票票号</th> -->
                        <th>发票类别</th>
                        <th class="amount">发票金额</th>
                        <th>开票时间</th>
                        <th>创建用户</th>
                        <th>备注</th>

                    </tr>
                </thead>
                <tbody>
                    <%
                    	int i = Integer.parseInt(request.getAttribute("currentPageStarted").toString());
                    %>
                    <c:forEach items="${list}" var="customerBilling">
                        <tr>
                            <td><span
                                class="glyphicon <c:out value="${customerBilling.status != 1 ? 'glyphicon-file' : ''}" />"></span></td>
                            <td><%=++i%></td>
                            <td><a
                                href="<s:url value="/project/detail/{id}?target=customerbilling"><s:param name="id" value="${customerBilling.id }" /></s:url>"><c:out
                                        value="${customerBilling.projectId}" /></a></td>
                            <%-- <td><c:out value="${customerBilling.invoiceCode}" /></td> --%>
                            <td><c:out value="${customerBilling.invoiceType}" /></td>
                            <td class="amount"><fmt:formatNumber value="${customerBilling.invoiceAmount}"
                                    pattern="###,###,###,###,##0.00" /></td>
                            <td><fmt:formatDate value="${customerBilling.trice}" pattern="yyyy-MM-dd" /></td>
                            <td><c:out value="${customerBilling.createUser}" /></td>
                            <td><c:if test="${customerBilling.status != 1 }">
                                    <shiro:hasPermission name="`customerbilling_check`">
                                        <a class="check"
                                            data-confirm-message="客户开票情况：<c:out value="${customerBilling.id}" />，审核后所有数据将不能被修改，是否确认？"
                                            href="<s:url value="/customerbilling/check/${customerBilling.id }" />">审核</a>
                                    </shiro:hasPermission>
                                    <shiro:hasPermission name="`customerbilling_create`">
                                        <a href="<s:url value="/customerbilling/modify/${customerBilling.id }" />">修改</a>
                                        <a class="delete"
                                            data-confirm-message="客户开票情况数据：<c:out value="${customerBilling.id}" />，将被永久删除，操作不可撤销，是否确认？"
                                            href="<s:url value="/customerbilling/delete/${customerBilling.id }" />">删除</a>
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
                                href="<s:url value='/customerbilling?oid=${oid}&p=${pageIndex - 1}' />">上一页</a></li>
                            <li class="${pageIndex + 1 >= pageCount ? 'disabled' :'' }"><a
                                href="<s:url value='/customerbilling?oid=${oid}&p=${pageIndex + 1}' />">下一页</a></li>
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
        self.location = '<s:url value="/customerbilling"/>?oid=${oid}&p=' + $(this).val();
    });
    

    $(".org").change(function(){
        self.location = '<s:url value="/customerbilling"/>?oid=' + $(this).val();
    });

});
//-->
</script>
<%@ include file="bottom.jsp"%>
