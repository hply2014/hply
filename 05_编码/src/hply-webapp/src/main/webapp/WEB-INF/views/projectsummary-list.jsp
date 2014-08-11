<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="container main">
    <c:if test="${not empty message}">
        <div></div>
        <div class="alert alert-success alert-dismissible col-md-offset-2 affix" role="alert">
            <button type="button" class="close" data-dismiss="alert">
                <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
            </button>
            <strong><a href="<s:url value="/projectsummary/detail/${projectSummary.id }" />">
                    ${projectSummary.id }</a></strong> ，${message}
        </div>
    </c:if>
    <c:if test="${not empty delMessage}">
        <div class="alert alert-warning alert-dismissible col-md-offset-2 affix" role="alert">
            <button type="button" class="close" data-dismiss="alert">
                <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
            </button>
            <strong>${projectSummary.id }</strong> ，${delMessage}
        </div>
    </c:if>
    <div class="panel panel-default">
        <div class="panel-heading">
            <strong>多项目汇总</strong>（
            <c:out value="${list.size()}" />
            条数据）
        </div>
        <div class="panel-body">
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
                    	int i = 0;
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
                            <td>金额：<c:out value="${projectSummary.contractAmount}" /> <c:if
                                    test="${projectSummary.changeAmount > 0}">
                                    <br />调增：<c:out value="${projectSummary.changeAmount}" />
                                </c:if><c:if
                                    test="${projectSummary.changeAmount > 0}">
                                    <br />累计：<c:out value="${projectSummary.changeTotalAmount}" />
                                </c:if> <c:if test="${projectSummary.settlementAmount > 0 }">
                                    <br />结算：<c:out value="${projectSummary.settlementAmount}" />
                                </c:if>
                            </td>
                            <td>费率：<c:out value="${projectSummary.managementRate}" />%<br /> 应收：<c:out
                                    value="${projectSummary.managementPlanAmount}" /> <c:if
                                    test="${projectSummary.managementRealAmount > 0}">
                                    <br /> 实收：<c:out value="${projectSummary.managementRealAmount}" />
                                </c:if> <c:if test="${projectSummary.managementTotalAmount > 0 }">
                                    <br /> 累计：<c:out value="${projectSummary.managementTotalAmount}" />
                                </c:if> <br /> 尚欠：<c:out value="${projectSummary.managementOweAmount}" /></td>
                            <td><c:if test="${projectSummary.partyBillingAmount} > 0">开票：<c:out
                                        value="${projectSummary.partyBillingAmount}" />
                                    <br />
                                </c:if> <c:if test="${projectSummary.partyBillingTotalAmount > 0}">累计：<c:out
                                        value="${projectSummary.partyBillingTotalAmount}" />
                                </c:if></td>
                            <td><c:if test="${projectSummary.collectionsAmount > 0}">收款：<c:out
                                        value="${projectSummary.collectionsAmount}" />
                                    <br />
                                </c:if> <c:if test="${projectSummary.collectionsTotalAmount} > 0">累计：<c:out
                                        value="${projectSummary.collectionsTotalAmount}" />
                                </c:if> <c:if test="${projectSummary.collectionsRate > 0}">
                                    <br />回款率：<c:out value="${projectSummary.collectionsRate}" />%</c:if></td>
                            <td><c:if test="${projectSummary.customerBillingAmount > 0}">开票：<c:out
                                        value="${projectSummary.customerBillingAmount}" />
                                    <br />
                                </c:if> <c:if test="${projectSummary.customerBillingTotalAmount > 0}">累计：<c:out
                                        value="${projectSummary.customerBillingTotalAmount}" />
                                </c:if></td>
                            <td><c:if test="${projectSummary.paymentAmount > 0}">支付：<c:out
                                        value="${projectSummary.paymentAmount}" />
                                    <br />
                                </c:if> <c:if test="${projectSummary.paymentTotalAmount > 0}">累计：<c:out
                                        value="${projectSummary.paymentTotalAmount}" />
                                </c:if></td>
                            <td><c:if test="${projectSummary.taxRate > 0}"> 税率：<c:out
                                        value="${projectSummary.taxRate}" />%
                                </c:if> <c:if test="${projectSummary.taxPlanAmount > 0}">
                                    <br /> 应收：<c:out value="${projectSummary.taxPlanAmount}" />
                                </c:if> <c:if test="${projectSummary.taxRealAmount > 0}">
                                    <br /> 已收：<c:out value="${projectSummary.taxRealAmount}" />
                                </c:if> <c:if test="${projectSummary.taxTotalAmount > 0}">
                                    <br /> 累计：<c:out value="${projectSummary.taxTotalAmount}" />
                                </c:if> <c:if test="${projectSummary.taxOweAmount > 0}">
                                    <br /> 尚欠：<c:out value="${projectSummary.taxOweAmount}" />
                                </c:if></td>
                            <td><c:if test="${projectSummary.arrearsAmount > 0}">
                                    <c:out value="${projectSummary.arrearsAmount}" />
                                </c:if></td>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<%@ include file="bottom.jsp"%>
