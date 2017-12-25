<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="container main">
    <c:if test="${not empty message}">

        <div class="alert alert-success alert-dismissible col-md-offset-4 affix" role="alert">
            <button type="button" class="close" data-dismiss="alert">
                <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
            </button>
            <strong><a href="<s:url value="/payment/detail/${payment.id }" />"> ${payment.id }</a></strong> ，${message}
        </div>
    </c:if>
    <c:if test="${not empty delMessage}">
        <div class="alert alert-warning alert-dismissible col-md-offset-4 affix" role="alert">
            <button type="button" class="close" data-dismiss="alert">
                <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
            </button>
            <strong>${payment.id }</strong> ，${delMessage}
        </div>
    </c:if>
    <div class="panel panel-primary">
        <div class="panel-heading">
            <strong>付款情况</strong>（ 共
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
                <shiro:hasPermission name="`payment_create`">
                    <div class="btn-group">
                        <a href="<c:url value="/payment/create" />" class="btn btn-info"><span
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
                        <!-- <th>凭证号</th> -->
                        <th>付款科目</th>
                        <th>支付方式</th>
                        <th class="amount">付款金额</th>
                        <th>付款人</th>
                        <th>付款时间</th>
                        <th>备注</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    	int i = Integer.parseInt(request.getAttribute("currentPageStarted")
                    			.toString());
                    %>
                    <c:forEach items="${list}" var="payment">
                        <tr>
                            <td><span
                                class="glyphicon <c:out value="${payment.status != 1 ? 'glyphicon-file' : ''}" />"></span></td>
                            <td><%=++i%></td>
                            <td><a
                                href="<s:url value="/project/detail/{id}?target=payment"><s:param name="id" value="${payment.id }" /></s:url>"><c:out
                                        value="${payment.projectId}" /></a></td>
                            <%-- <td><c:out value="${payment.ticketCode}" /></td> --%>
                            <td><c:out value="${payment.paymentItemId}" /></td>
                            <td><c:out value="${payment.payType}" /></td>
                            <td class="amount"><fmt:formatNumber value="${payment.amount}"
                                    pattern="###,###,###,###,##0.00" /></td>
                            <td><c:out value="${payment.createUser}" /></td>
                            <td><fmt:formatDate value="${payment.trice}" pattern="yyyy-MM-dd" /></td>
                            <td><c:out value="${payment.description}" /></td>
                            <td><c:if test="${payment.status != 1 }">
                                    <shiro:hasPermission name="`payment_check`">
                                        <a class="check" data-confirm-message="付款情况：<c:out value="${payment.id}" />，审核后所有数据将不能被修改，是否确认？" href="<s:url value="/payment/check/${payment.id }" />">审核</a>
                                    </shiro:hasPermission>
                                    <shiro:hasPermission name="`payment_create`">
                                        <a href="<s:url value="/payment/modify/${payment.id }" />">修改</a>
                                        <a class="delete"
                                            data-confirm-message="付款情况：<c:out value="${payment.id}" />，将被永久删除，操作不可撤销，是否确认？"
                                            href="<s:url value="/payment/delete/${payment.id }" />">删除</a>
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
                                href="<s:url value='/payment?oid=${oid}&p=${pageIndex - 1}' />">上一页</a></li>
                            <li class="${pageIndex + 1 >= pageCount ? 'disabled' :'' }"><a
                                href="<s:url value='/payment?oid=${oid}&p=${pageIndex + 1}' />">下一页</a></li>
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
        self.location = '<s:url value="/payment"/>?oid=${oid}&p=' + $(this).val();
    });
    

    $(".org").change(function(){
        self.location = '<s:url value="/payment"/>?oid=' + $(this).val();
    });

});
//-->
</script>
<%@ include file="bottom.jsp"%>
