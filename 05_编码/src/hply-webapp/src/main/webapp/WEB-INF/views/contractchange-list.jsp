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
        <div class="alert alert-warning alert-dismissible col-md-offset-4 affix" role="alert">
            <button type="button" class="close" data-dismiss="alert">
                <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
            </button>
            <strong>${contractChange.id }</strong> ，${delMessage}
        </div>
    </c:if>
    <div class="panel panel-primary">
        <div class="panel-heading">
            <strong>合同补充协议</strong>（ 共
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
                        <th></th>
                        <th>#</th>
                        <th>项目名称</th>
                        <th>增补协议编号</th>
                        <th class="amount">管理费率</th>
                        <th class="amount">增减金额</th>
                        <th>登记人</th>
                        <th>登记时间</th>
                        <th>备注</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    	int i = Integer.parseInt(request.getAttribute("currentPageStarted").toString());
                    %>
                    <c:forEach items="${list}" var="contractChange">
                        <tr>
                            <td><span
                                class="glyphicon <c:out value="${contractChange.status != 1 ? 'glyphicon-file' : ''}" />"></span></td>
                            <td><%=++i%></td>
                            <td><a
                                href="<s:url value="/project/detail/{id}?target=contractchange"><s:param name="id" value="${contractChange.id }" /></s:url>"><c:out
                                        value="${contractChange.projectId}" /></a></td>
                            <td><c:out value="${contractChange.csaCode}" /></td>
                            <td class="amount"><fmt:formatNumber value="${contractChange.managementRate}"
                                    pattern="0.00" />%</td>
                            <td class="amount"><fmt:formatNumber value="${contractChange.changeAmount}"
                                    pattern="###,###,###,###,##0.00" /></td>
                            <td><c:out value="${contractChange.createUser}" /></td>
                            <td><fmt:formatDate value="${contractChange.trice}" pattern="yyyy-MM-dd" /></td>
                            <td><c:out value="${contractChange.description}" /></td>
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
                                href="<s:url value='/contractchange?oid=${oid}&p=${pageIndex - 1}' />">上一页</a></li>
                            <li class="${pageIndex + 1 >= pageCount ? 'disabled' :'' }"><a
                                href="<s:url value='/contractchange?oid=${oid}&p=${pageIndex + 1}' />">下一页</a></li>
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
        self.location = '<s:url value="/contractchange"/>?oid=${oid}&p=' + $(this).val();
    });
    

    $(".org").change(function(){
        self.location = '<s:url value="/contractchange"/>?oid=' + $(this).val();
    });

});
//-->
</script>
<%@ include file="bottom.jsp"%>
