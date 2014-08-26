<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="container main">
<c:if test="${not empty message}">
	<div></div>
<div class="alert alert-success alert-dismissible col-md-offset-2 affix" role="alert">
  <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
  <strong><a href="<s:url value="/projectsummary/detail/${projectSummary.id }" />"> ${projectSummary.id }</a></strong> ，${message}
</div>
</c:if>
<c:if test="${not empty delMessage}">
<div class="alert alert-warning alert-dismissible col-md-offset-2 affix" role="alert">
  <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
  <strong>${projectSummary.id }</strong> ，${delMessage}
</div>
</c:if>
<div class="panel panel-primary">
  <div class="panel-heading"><strong>多项目汇总</strong>（共<c:out value="${rowCount}" />行
            <c:if test="${pageCount > 1 }">，第${pageIndex+1 }页 &nbsp;/&nbsp;共${pageCount }页</c:if>）</div>
   <div class="panel-body">
        <a target="blank" href="<s:url value='/projectsummary/full' />" class="btn btn-link"><span
                            class="glyphicon glyphicon-share-alt"></span> 新窗口打开</a>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>时间</th>
                        <th>项目名称</th>
                        <th>合同信息</th>
                        <th>管理费情况</th>
                        <th>甲方开票情况</th>
                        <th>收款情况</th>
                        <th>客户开票情况</th>
                        <th>工程款支付情况</th>
                        <th>税金情况</th>
                        <th>垫付资金</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    	int i = Integer.parseInt(request.getAttribute("currentPageStarted").toString());
                    %>
                    <c:forEach items="${list}" var="projectSummary">
                        <tr>
                            <td><%=++i%></td>
                            <td><a data-toggle="tooltip"
                                title="<fmt:formatDate value='${projectSummary.trice}' pattern='yyyy/MM/dd HH:mm:ss' />：${projectSummary.description}"
                                href="<s:url value="/projectsummary/detail/{id}"><s:param name="id" value="${projectSummary.id }" /></s:url>">
                                    <fmt:formatDate value="${projectSummary.trice}" pattern="MM/dd" />
                            </a></td>
                            <td><c:out value="${projectSummary.projectCode}" /><br /> <c:out
                                    value="${projectSummary.projectName}" /></td>
                            <td>金额：<fmt:formatNumber value="${projectSummary.contractAmount}" pattern="###,###,###,###,###0.00" /><c:if
                                    test="${projectSummary.changeAmount > 0}">
                                    <br />调增：<fmt:formatNumber value="${projectSummary.changeAmount}" pattern="###,###,###,###,###0.00" />
                                </c:if><c:if
                                    test="${projectSummary.changeAmount > 0}">
                                    <br />累计：<fmt:formatNumber value="${projectSummary.changeTotalAmount}" pattern="###,###,###,###,###0.00" />
                                </c:if> <c:if test="${projectSummary.settlementAmount > 0 }">
                                    <br />结算：<fmt:formatNumber value="${projectSummary.settlementAmount}" pattern="###,###,###,###,###0.00" />
                                </c:if>
                            </td>
                            <td>费率：<fmt:formatNumber value="${projectSummary.managementRate}" pattern="###,###,###,###,###0.00" />%<br /> 应收：<fmt:formatNumber value="${projectSummary.managementPlanAmount}" pattern="###,###,###,###,###0.00" /> <c:if
                                    test="${projectSummary.managementRealAmount > 0}">
                                    <br /> 实收：<fmt:formatNumber value="${projectSummary.managementRealAmount}" pattern="###,###,###,###,###0.00" />
                                </c:if> <c:if test="${projectSummary.managementTotalAmount > 0 }">
                                    <br /> 累计：<fmt:formatNumber value="${projectSummary.managementTotalAmount}" pattern="###,###,###,###,###0.00" />
                                </c:if> <br /> 尚欠：<fmt:formatNumber value="${projectSummary.managementOweAmount}" pattern="###,###,###,###,###0.00" /></td>
                            <td><c:if test="${projectSummary.partyBillingAmount > 0}">开票：<fmt:formatNumber value="${projectSummary.partyBillingAmount}" pattern="###,###,###,###,###0.00" />
                                    <br />
                                </c:if> <c:if test="${projectSummary.partyBillingTotalAmount > 0}">累计：<fmt:formatNumber value="${projectSummary.partyBillingTotalAmount}" pattern="###,###,###,###,###0.00" />
                                </c:if></td>
                            <td><c:if test="${projectSummary.collectionsAmount > 0}">收款：<fmt:formatNumber value="${projectSummary.collectionsAmount}" pattern="###,###,###,###,###0.00" />
                                    <br />
                                </c:if> <c:if test="${projectSummary.collectionsTotalAmount > 0 }">累计：<fmt:formatNumber value="${projectSummary.collectionsTotalAmount}" pattern="###,###,###,###,###0.00" />
                                </c:if> <c:if test="${projectSummary.collectionsRate > 0}">
                                    <br />回款率：<fmt:formatNumber value="${projectSummary.collectionsRate}" pattern="0.00" />%</c:if></td>
                            <td><c:if test="${projectSummary.customerBillingAmount > 0}">开票：<fmt:formatNumber value="${projectSummary.customerBillingAmount}" pattern="###,###,###,###,###0.00" />
                                    <br />
                                </c:if> <c:if test="${projectSummary.customerBillingTotalAmount > 0}">累计：<fmt:formatNumber value="${projectSummary.customerBillingTotalAmount}" pattern="###,###,###,###,###0.00" />
                                </c:if></td>
                            <td><c:if test="${projectSummary.paymentAmount > 0}">支付：<fmt:formatNumber value="${projectSummary.paymentAmount}" pattern="###,###,###,###,###0.00" />
                                    <br />
                                </c:if> <c:if test="${projectSummary.paymentTotalAmount > 0}">累计：<fmt:formatNumber value="${projectSummary.paymentTotalAmount}" pattern="###,###,###,###,###0.00" />
                                </c:if></td>
                            <td><c:if test="${projectSummary.taxRate > 0}"> 税率：<fmt:formatNumber value="${projectSummary.taxRate}" pattern="0.00" />%
                                </c:if> <c:if test="${projectSummary.taxPlanAmount > 0}">
                                    <br /> 应收：<fmt:formatNumber value="${projectSummary.taxPlanAmount}" pattern="###,###,###,###,###0.00" />
                                </c:if> <c:if test="${projectSummary.taxRealAmount > 0}">
                                    <br /> 已收：<fmt:formatNumber value="${projectSummary.taxRealAmount}" pattern="###,###,###,###,###0.00" />
                                </c:if> <c:if test="${projectSummary.taxTotalAmount > 0}">
                                    <br /> 累计：<fmt:formatNumber value="${projectSummary.taxTotalAmount}" pattern="###,###,###,###,###0.00" />
                                </c:if> <c:if test="${projectSummary.taxOweAmount > 0}">
                                    <br /> 尚欠：<fmt:formatNumber value="${projectSummary.taxOweAmount}" pattern="###,###,###,###,###0.00" />
                                </c:if></td>
                            <td><c:if test="${projectSummary.arrearsAmount > 0}">
                                    <fmt:formatNumber value="${projectSummary.arrearsAmount}" pattern="###,###,###,###,###0.00" />
                                </c:if></td>
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
                                href="<s:url value='/projectsummary?p=${pageIndex - 1}' />">上一页</a></li>
                            <li class="${pageIndex + 1 >= pageCount ? 'disabled' :'' }"><a
                                href="<s:url value='/projectsummary?p=${pageIndex + 1}' />">下一页</a></li>
                        </ul>
                    </div>
                    <div class="col-sm-2">&nbsp;</div>
                </div>
            </c:if>
  </div>
</div></div>
<%@ include file="bottom.jsp"%>
