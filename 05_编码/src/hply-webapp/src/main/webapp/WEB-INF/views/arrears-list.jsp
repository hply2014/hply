﻿<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="container main">
    <c:if test="${not empty message}">
        
        <div class="alert alert-success alert-dismissible col-md-offset-4 affix" role="alert">
            <button type="button" class="close" data-dismiss="alert">
                <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
            </button>
            <strong><a href="<s:url value="/arrears/detail/${arrears.id }" />"> ${arrears.id }</a></strong> ，${message}
        </div>
    </c:if>
    <c:if test="${not empty delMessage}">
        <div class="alert alert-warning alert-dismissible col-md-offset-4 affix" role="alert">
            <button type="button" class="close" data-dismiss="alert">
                <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
            </button>
            <strong>${arrears.id }</strong> ，${delMessage}
        </div>
    </c:if>
    <div class="panel panel-primary">
        <div class="panel-heading">
            <strong>往来欠款</strong>（ 共
            <c:out value="${rowCount}" />
            行 ， <select class="selectpicker page" data-size="10" data-style="btn-warning btn-sm" data-width="120px"></select>&nbsp;/&nbsp;共${pageCount }页

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
                <div class="btn-group">
                    <a href="<c:url value="/arrears/create" />" class="btn btn-info"><span
                        class="glyphicon glyphicon-plus"></span> 新 建 </a>
                </div>
            </div>

            <table class="table table-hover">
                <thead>
                    <tr>
                        <th></th>
                        <th>#</th>
                        <th>项目名称</th>
                        <th>凭证号</th>
                        <th>款项分类</th>
                        <th class="amount">借出金额</th>
                        <th class="amount">还入金额</th>
                        <th>支付方式</th>
                        <th>登记时间</th>
                        <th>登记人</th>
                        <th>备注</th>

                    </tr>
                </thead>
                <tbody>
                    <%
                    	int i = Integer.parseInt(request.getAttribute("currentPageStarted")
                    			.toString());
                    %>
                    <c:forEach items="${list}" var="arrears">
                        <tr>
                            <td><span
                                class="glyphicon <c:out value="${arrears.status != 1 ? 'glyphicon-file' : ''}" />"></span></td>
                            <td><%=++i%></td>
                            <td><a
                                href="<s:url value="/project/detail/{id}?target=arrears"><s:param name="id" value="${arrears.id }" /></s:url>"><c:out
                                        value="${arrears.projectId}" /></a></td>
                            <td><c:out value="${arrears.arrearsCode}" /></td>
                            <td><c:out value="${arrears.arrearsType}" /></td>
                            <td class="amount"><c:if test="${arrears.amount < 0}">
                                    <span
                                        <c:if test="${arrears.interestRate > 0 }">title="此笔费用计息，利率：<fmt:formatNumber value="${arrears.interestRate}" pattern="0.00"/>%，已计息：<fmt:formatNumber value="${arrears.interestAmount}" pattern="###,###,###,###,##0.00"/>" class="label label-default"</c:if>>
                                        <c:if test="${arrears.interestRate > 0 }">
                                            <a style="color: #fff" href="javascript:showDialog('${arrears.id}')">
                                        </c:if> <fmt:formatNumber value="${arrears.amount}" pattern="###,###,###,###,##0.00" />
                                        <c:if test="${arrears.interestRate > 0 }">
                                            </a>
                                        </c:if>
                                    </span>
                                </c:if></td>
                            <td class="amount"><c:if test="${arrears.amount > 0}">
                                    <fmt:formatNumber value="${arrears.amount}" pattern="###,###,###,###,##0.00" />
                                </c:if></td>
                            <td><c:out value="${arrears.payType}" /></td>
                            <td><fmt:formatDate value="${arrears.trice}" pattern="yyyy-MM-dd" /></td>
                            <td><c:out value="${arrears.createUser}" /></td>
                            <td><c:if test="${not empty arrears.description}">
                                    <span data-container="body" data-toggle="popover" data-placement="left"
                                        data-content="${arrears.description}"
                                        class="glyphicon glyphicon-exclamation-sign"></span>
                                </c:if></td>
                            <td><c:if test="${arrears.status != 1 }">
                                    <shiro:hasPermission name="`arrears_check`">
                                        <a class="check"
                                            data-confirm-message="往来欠款数据：<c:out value="${arrears.id}" />，审核后所有数据将不能被修改，是否确认？"
                                            href="<s:url value="/arrears/check/${arrears.id }" />">审核</a>
                                    </shiro:hasPermission>
                                    <shiro:hasPermission name="`arrears_create`">
                                        <a href="<s:url value="/arrears/modify/${arrears.id }" />">修改</a>
                                        <a class="delete"
                                            data-confirm-message="往来欠款数据：<c:out value="${arrears.id}" />，将被永久删除，操作不可撤销，是否确认？"
                                            href="<s:url value="/arrears/delete/${arrears.id }" />">删除</a>
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
                                href="<s:url value='/arrears?oid=${oid}&p=${pageIndex - 1}' />">上一页</a></li>
                            <li class="${pageIndex + 1 >= pageCount ? 'disabled' :'' }"><a
                                href="<s:url value='/arrears?oid=${oid}&p=${pageIndex + 1}' />">下一页</a></li>
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
	function showDialog(arrearsId) {
		var rows = "";
		$
				.post(
						"<s:url value='/api/getinterestdetail/' />" + arrearsId,
						{},
						function(result) {
							for (var i = 0; i < result.length; i++) {
								rows += "<tr title=\"" + result[i].description + "\"><td>" + (i + 1) + "</td><td>"
										+ new Date(result[i].trice).toLocaleDateString() + "</td><td class=\"amount\">" + result[i].amount
										+ "</td><td class=\"amount\">" + result[i].interestAmount + "</td></tr>\r\n";
							}

							$("#myModal .modal-title").html("利息计算明细");
							var str = "<table width=\"70%\"border=\"0\"><tr><th>#</th><th>日期</th><th class=\"amount\">计息基数</th><th class=\"amount\">当日计息</th></tr>"
									+ rows + "</table>";
							$("#myModalContent").html(str);
							$('#myModal').modal('show');
						}, "json");

	}
$(function() {
	var p = '';
	for (var i = 0; i < <c:out value="${pageCount}" />; i++) {
		p = p + '<option ' + (i== ${pageIndex} ? 'selected': '') + ' value="' + i + '">第' + (i + 1) + '页</option>';
	}

	$(".page").append(p).change(function(){
		self.location = '<s:url value="/arrears"/>?oid=${oid}&p=' + $(this).val();
	});
	

	$(".org").change(function(){
		self.location = '<s:url value="/arrears"/>?oid=' + $(this).val();
	});

});
//-->
</script>
<%@ include file="bottom.jsp"%>
