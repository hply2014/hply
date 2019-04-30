<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<style type="text/css">
#custom-search-form {
	margin: 0;
	margin-top: 5px;
	padding: 0;
}

#custom-search-form .search-query {
	padding-right: 3px;
	padding-right: 4px \9;
	padding-left: 3px;
	padding-left: 4px \9;
	/* IE7-8 doesn't have border-radius, so don't indent the padding */
	margin-bottom: 0;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	-webkit-transition: width 0.2s ease-in-out;
	-moz-transition: width 0.2s ease-in-out;
	-o-transition: width 0.2s ease-in-out;
	transition: width 0.2s ease-in-out;
}

#custom-search-form button {
	border: 0;
	background: none;
	/** belows styles are working good */
	padding: 2px 5px;
	margin-top: 2px;
	position: relative;
	left: -28px;
	/* IE7-8 doesn't have border-radius, so don't indent the padding */
	margin-bottom: 0;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
}

.search-query:focus+button {
	z-index: 3;
}
</style>

<div class="container main">
    <c:if test="${not empty delMessage}">
        <div class="alert alert-warning alert-dismissible col-md-offset-4 affix" role="alert">
            <button type="button" class="close" data-dismiss="alert">
                <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
            </button>
            ${delMessage}
        </div>
    </c:if>
    <div class="panel panel-primary">
        <div class="panel-heading">
            <strong>${page_title}</strong>
        </div>
        <div class="panel-body">
            <div class="btn-toolbar" role="toolbar">
                <div class="btn-group">
                    <a href="<s:url value="/project" />" onclick="return goback();" class="btn btn-default"><span
                        class="glyphicon glyphicon-share-alt"></span> 返 回 </a>
                </div>

                <shiro:hasPermission name="`project_modify`">
                    <div class="btn-group">
                        <a
                            href="<s:url value="/project/modify/{id}"><s:param name="id" value="${project.id }" /></s:url>"
                            class="btn btn-default"><span class="glyphicon glyphicon-pencil"></span> 修 改 </a>
                    </div>
                </shiro:hasPermission>
            </div>
            <div class="panel-body">
                <div class="panel with-nav-tabs panel-default">
                    <div class="panel-heading">
                        <ul class="nav nav-tabs">
                            <li target="summary" ${target=='summary'?'class="active"':'' }><a href="#tab0default" data-toggle="tab">总览信息</a></li>
                            <li target="history" ${target=='history'?'class="active"':'' }><a href="#tab8default" data-toggle="tab">变更记录</a></li>
                            <li target="project" ${target=='project'?'class="active"':'' }><a href="#tab1default" data-toggle="tab">合同项目信息</a></li>
                            <li target="contractchange" ${target=='contractchange'?'class="active"':'' }><a href="#tab1xdefault"
                                data-toggle="tab">补充协议</a></li>
                            <li target="partybilling" ${target=='partybilling'?'class="active"':'' }><a href="#tab2default"
                                data-toggle="tab">甲方开票情况</a></li>
                            <li target="customerbilling" ${target=='customerbilling'?'class="active"':'' }><a href="#tab3default"
                                data-toggle="tab">客户开票情况</a></li>
                            <li target="collections" ${target=='collections'?'class="active"':'' }><a href="#tab4default"
                                data-toggle="tab">收款情况</a></li>
                            <li target="payment" ${target=='payment'?'class="active"':'' }><a href="#tab5default" data-toggle="tab">付款情况</a></li>
                            <li target="arrears" ${target=='arrears'?'class="active"':'' }><a href="#tab6default" data-toggle="tab">往来欠款</a></li>
                            <li target="profile" ${target=='profile'?'class="active"':'' }><a href="#tab7default" data-toggle="tab">型材</a></li>
                        </ul>
                    </div>

                    <div class="panel-body">
                        <div class="tab-content">
                            <div class="tab-pane fade${target=='summary'?' in active':'' }" id="tab0default">
                                <!-- 总览信息 -->
                                <div class="row">
                                    <div class="col-sm-8">
                                        <table class="table">
                                            <tr>
                                                <th colspan="2">更新时间</th>
                                                <td><fmt:formatDate value="${projectSummary.trice}"
                                                        pattern="yyyy-MM-dd" /></td>
                                            </tr>
                                            <tr>
                                                <th rowspan="5" width="150px">项目信息</th>
                                                <th width="150px">项目编号</th>
                                                <td><c:out value="${projectSummary.projectCode}" /></td>
                                            </tr>
                                            <tr>
                                                <th>项目名称</th>
                                                <td><c:out value="${projectSummary.projectName}" /></td>
                                            </tr>
                                            <tr>
                                                <th>合同分类</th>
                                                <td><c:out value="${projectSummary.contractType}" /></td>
                                            </tr>
                                            <tr>
                                            	<th>合同总额</th>
                                            	<td style="padding: 0px;">
										    		<table class="table notFooter" style="padding: 0px;margin: 0px;">
										    			<tr>
										    				<th></th>
										    				<th>合同税率</th>
										    				<th>合同金额</th>
										    				<th>合同调增额</th>
										    				<th>合计</th>
										    			</tr>
										    			<c:forEach items="${lProjectTotalAmount}" var="projectTotalAmount">
			                                            <tr>
										    				<th></th>
			                                                <td><fmt:formatNumber value="${projectTotalAmount.taxRate}" />%</td>
			                                                <td><fmt:formatNumber value="${projectTotalAmount.amount}" pattern="###,###,###,###,##0.00" /></td>
			                                                <td><fmt:formatNumber value="${projectTotalAmount.changeAmount}" pattern="###,###,###,###,##0.00" /></td>
			                                                <td><fmt:formatNumber value="${projectTotalAmount.amount + projectTotalAmount.changeAmount}" pattern="###,###,###,###,##0.00" /></td>
			                                            </tr>
			                                            </c:forEach>
			                                            <tr>
			                                                <th>合计</th>
			                                                <td><c:out value="${projectSummary.contractTaxRate}" /></td>
			                                                <td><fmt:formatNumber value="${projectSummary.contractAmount}" pattern="###,###,###,###,##0.00" /></td>
			                                                <td><fmt:formatNumber value="${projectSummary.changeTotalAmount}" pattern="###,###,###,###,##0.00" /></td>
			                                                <td><fmt:formatNumber value="${projectSummary.contractAmount + projectSummary.changeTotalAmount}" pattern="###,###,###,###,##0.00" /></td>
			                                            </tr>
			                                        </table>
												</td>
                                            </tr>
                                            
                                            <%-- <tr>
                                                <th>合同金额</th>
                                                <td><fmt:formatNumber value="${projectSummary.contractAmount}"
                                                        pattern="###,###,###,###,##0.00" /></td>
                                            </tr>
                                            <tr>
                                                <th>合同税率</th>
                                                <td><c:out value="${projectSummary.contractTaxRate}" /></td>
                                            </tr>
                                            <c:choose>
										    	<c:when test="${projectSummary.contractTaxRate == '混合税率' }">
		                                            <tr>
		                                            	<th></th>
		                                            	<td style="padding: 0px;">
												    		<table class="table notFooter" style="padding: 0px;margin: 0px;">
												    			<c:forEach items="${lProjectTaxRateGroup}" var="projectTaxRate">
					                                            <tr>
					                                                <th><fmt:formatNumber value="${projectTaxRate.taxRate}" />%</th>
					                                                <td><fmt:formatNumber value="${projectTaxRate.amount}" pattern="###,###,###,###,##0.00" /></td>
					                                            </tr>
					                                            </c:forEach>
					                                        </table>
														</td>
		                                            </tr>
												</c:when>
												<c:otherwise>
													<tr>
		                                            	<td colspan="2" style="padding: 0px;border:none;"></td>
		                                            </tr>
												</c:otherwise>
											</c:choose>
                                            <tr>
                                                <th>合同调增额</th>
                                                <td><fmt:formatNumber value="${projectSummary.changeAmount}"
                                                        pattern="###,###,###,###,##0.00" /></td>
                                            </tr>
                                            <tr>
                                                <th>合同调增额</th>
                                                <td><fmt:formatNumber value="${projectSummary.changeTotalAmount}"
                                                        pattern="###,###,###,###,##0.00" /></td>
                                            </tr> --%>
                                            <tr>
                                                <th>合同结算额</th>
                                                <td><fmt:formatNumber value="${projectSummary.settlementAmount}"
                                                        pattern="###,###,###,###,##0.00" /></td>
                                            </tr>
                                            <tr>
                                                <th rowspan="4">甲方开票情况</th>
                                                <th>金额</th>
                                                <td><fmt:formatNumber value="${projectSummary.partyBillingAmount}"
                                                        pattern="###,###,###,###,##0.00" /></td>
                                            </tr>
                                            <tr>
                                                <th>销项税金</th>
                                                <td><fmt:formatNumber
                                                        value="${projectSummary.partyBillingOutputTaxAmount}"
                                                        pattern="###,###,###,###,##0.00" /></td>
                                            </tr>
                                            <tr>
                                                <th>累计开票</th>
                                                <td><fmt:formatNumber
                                                        value="${projectSummary.partyBillingTotalAmount}"
                                                        pattern="###,###,###,###,##0.00" /></td>
                                            </tr>
                                            <c:choose>
										    	<c:when test="${lPartyBillingGroup!=null && fn:length(lPartyBillingGroup) > 0}">
                                            		<tr>
		                                            	<th></th>
		                                            	<td style="padding: 0px;">
												    		<table class="table notFooter" style="padding: 0px;margin: 0px;">
												    			<c:forEach items="${lPartyBillingGroup}" var="partyBillingGroup" varStatus="status">
						                                            <tr>
						                                                <th><fmt:formatNumber value="${partyBillingGroup.taxRate}" pattern="#,##0.00" />%</th>
						                                                <td><fmt:formatNumber value="${partyBillingGroup.amount}" pattern="###,###,###,###,##0.00" /></td>
						                                            </tr>
						                                        </c:forEach>
					                                        </table>
														</td>
		                                            </tr>
												</c:when>
												<c:otherwise>
                                            		<tr>
		                                            	<td colspan="2" style="padding: 0px;border:none;"></td>
		                                            </tr>
												</c:otherwise>
											</c:choose>
                                            
                                            <tr>
                                                <th rowspan="2">收款情况</th>
                                                <%-- <th>收款金额</th>
                                                <td><fmt:formatNumber value="${projectSummary.collectionsAmount}"
                                                        pattern="###,###,###,###,##0.00" /></td>
                                            </tr>
                                            <tr> --%>

                                                <th>累计收款</th>
                                                <td><fmt:formatNumber
                                                        value="${projectSummary.collectionsTotalAmount}"
                                                        pattern="###,###,###,###,##0.00" /></td>
                                            </tr>
                                            <c:choose>
										    	<c:when test="${(projectSummary.collectionsTotalProjectAmount) > 0 || (projectSummary.managementTotalAmount) > 0 || (projectSummary.collectionsTotalIncomeAmount) > 0 || (projectSummary.collectionsTotalOtherAmount) > 0}">
		                                            <tr>
		                                            	<th></th>
		                                            	<td style="padding: 0px;">
												    		<table class="table notFooter" style="padding: 0px;margin: 0px;">
					                                            <c:if test="${projectSummary.collectionsTotalProjectAmount > 0}">
						                                            <tr>
						                                                <th>工程款</th>
						                                                <td><fmt:formatNumber value="${projectSummary.collectionsTotalProjectAmount}" pattern="###,###,###,###,##0.00" /></td>
						                                            </tr>
			                                                    </c:if>
			                                                    <c:if test="${projectSummary.managementTotalAmount > 0}">
						                                            <tr>
						                                                <th>管理费</th>
						                                                <td><fmt:formatNumber value="${projectSummary.managementTotalAmount}" pattern="###,###,###,###,##0.00" /></td>
						                                            </tr>
			                                                    </c:if>
			                                                    <c:if test="${projectSummary.collectionsTotalIncomeAmount > 0}">
						                                            <tr>
						                                                <th>自入款</th>
						                                                <td><fmt:formatNumber value="${projectSummary.collectionsTotalIncomeAmount}" pattern="###,###,###,###,##0.00" /></td>
						                                            </tr>
			                                                    </c:if>
			                                                    <c:if test="${projectSummary.collectionsTotalOtherAmount > 0}">
						                                            <tr>
						                                                <th>其他</th>
						                                                <td><fmt:formatNumber value="${projectSummary.collectionsTotalOtherAmount}" pattern="###,###,###,###,##0.00" /></td>
						                                            </tr>
			                                                    </c:if>
					                                        </table>
														</td>
		                                            </tr>
												</c:when>
												<c:otherwise>
													<tr>
		                                            	<td colspan="2" style="padding: 0px;border:none;"></td>
		                                            </tr>
												</c:otherwise>
											</c:choose>
                                            <%-- <tr>

                                                <th colspan="2">回款率</th>
                                                <td><fmt:formatNumber value="${projectSummary.collectionsRate}"
                                                        pattern="0.00" />%</td>
                                            </tr> --%>
                                            <tr>
                                                <th rowspan="4">客户开票情况</th>
                                                <th>金额</th>
                                                <td><fmt:formatNumber
                                                        value="${projectSummary.customerBillingAmount}"
                                                        pattern="###,###,###,###,##0.00" /></td>
                                            </tr>
                                            <tr>
                                                <th>进项税金</th>
                                                <td><fmt:formatNumber
                                                        value="${projectSummary.customerBillingInputTaxAmount}"
                                                        pattern="###,###,###,###,##0.00" /></td>
                                            </tr>
                                            <tr>

                                                <th>累计开票</th>
                                                <td><fmt:formatNumber
                                                        value="${projectSummary.customerBillingTotalAmount}"
                                                        pattern="###,###,###,###,##0.00" /></td>
                                            </tr>
                                            <c:choose>
										    	<c:when test="${(lProjectCustomerBilling)!= null && fn:length(lProjectCustomerBilling) > 0}">
		                                            <tr>
		                                            	<th></th>
		                                            	<td style="padding: 0px;">
												    		<table class="table notFooter" style="padding: 0px;margin: 0px;">
												    			<c:forEach items="${lProjectCustomerBilling}" var="projectCustomerBilling">
					                                            <tr>
					                                                <th><c:out value="${projectCustomerBilling.invoiceType}" /></th>
					                                                <td><fmt:formatNumber value="${projectCustomerBilling.invoiceAmount}" pattern="###,###,###,###,##0.00" /></td>
					                                                <td><fmt:formatNumber value="${projectCustomerBilling.invoiceAmountRate*100}" pattern="0.00" />%</td>
					                                            </tr>
					                                            </c:forEach>
					                                        </table>
														</td>
		                                            </tr>
												</c:when>
												<c:otherwise>
													<tr>
		                                            	<td colspan="2" style="padding: 0px;border:none;"></td>
		                                            </tr>
												</c:otherwise>
											</c:choose>
                                            <tr>
                                                <th>支付工程款情况</th>
                                                <%-- <th>支付金额</th>
                                                <td><fmt:formatNumber value="${projectSummary.paymentAmount}"
                                                        pattern="###,###,###,###,##0.00" /></td>
                                            </tr>
                                            <tr> --%>

                                                <th>累计支付金额</th>
                                                <td><fmt:formatNumber value="${projectSummary.paymentTotalAmount}"
                                                        pattern="###,###,###,###,##0.00" /></td>
                                            </tr>
                                            <tr>
                                                <th rowspan="5">税金情况</th>
                                                <th>税负率</th>
                                                <td><fmt:formatNumber value="${projectSummary.taxBearingRate}"
                                                        pattern="0.00" />%</td>
                                            </tr>
                                            <tr>
                                                <th>应收税负率税金</th>
                                                <td><fmt:formatNumber value="${projectSummary.taxBearingAmount}"
                                                        pattern="###,###,###,###,##0.00" /></td>
                                            </tr>
                                            <%-- <tr>
                                                <th>当期已收税负率税金</th>
                                                <td><fmt:formatNumber value="${projectSummary.taxBearingRealAmount}"
                                                        pattern="###,###,###,###,##0.00" /></td>
                                            </tr> --%>
                                            <tr>
                                                <th>累计已收税负率税金</th>
                                                <td><fmt:formatNumber value="${projectSummary.taxBearingTotalRealAmount}"
                                                        pattern="###,###,###,###,##0.00" /></td>
                                            </tr>
                                            <tr>
                                                <th>应缴税金</th>
                                                <td><fmt:formatNumber value="${projectSummary.taxPlanAmount}"
                                                        pattern="###,###,###,###,##0.00" /></td>
                                            </tr>
                                            <%-- <tr>
                                                <th>当期异地已缴税金</th>
                                                <td><fmt:formatNumber value="${projectSummary.paymentDifferentTaxAmount}"
                                                        pattern="###,###,###,###,##0.00" /></td>
                                            </tr> --%>
                                            <tr>
                                                <th>累计异地已缴税金</th>
                                                <td><fmt:formatNumber value="${projectSummary.paymentTotalDifferentTaxAmount}"
                                                        pattern="###,###,###,###,##0.00" /></td>
                                            </tr>
                                            <%-- <tr>

                                                <th>当期应缴税金</th>
                                                <td><fmt:formatNumber value="${projectSummary.taxPlanAmount}"
                                                        pattern="###,###,###,###,##0.00" /></td>
                                            </tr>
                                            <tr>

                                                <th>已缴税金</th>
                                                <td><fmt:formatNumber value="${projectSummary.taxRealAmount}"
                                                        pattern="###,###,###,###,##0.00" /></td>
                                            </tr>
                                            <tr>

                                                <th>累计已缴税金</th>
                                                <td><fmt:formatNumber value="${projectSummary.taxTotalAmount}"
                                                        pattern="###,###,###,###,##0.00" /></td>
                                            </tr>
											<tr>

                                                <th>尚欠税金</th>
                                                <td><fmt:formatNumber value="${projectSummary.taxOweAmount}"
                                                        pattern="###,###,###,###,##0.00" /></td>
                                            </tr> --%>
                                            <tr>
                                                <th rowspan="4">管理费情况</th>
                                                <th>比率</th>
                                                <td><fmt:formatNumber value="${projectSummary.managementRate}"
                                                        pattern="0.00" />%</td>
                                            </tr>
                                            <tr>
                                                <th>应收管理费</th>
                                                <td><fmt:formatNumber
                                                        value="${projectSummary.managementPlanAmount}"
                                                        pattern="###,###,###,###,##0.00" /></td>
                                            </tr>
                                           <%--  <tr>
                                                <th>本期收管理费</th>
                                                <td><fmt:formatNumber
                                                        value="${projectSummary.managementRealAmount}"
                                                        pattern="###,###,###,###,##0.00" /></td>
                                            </tr> --%>
                                            <tr>
                                                <th>累计收管理费</th>
                                                <td><fmt:formatNumber
                                                        value="${projectSummary.managementTotalAmount}"
                                                        pattern="###,###,###,###,##0.00" /></td>
                                            </tr>
                                            <tr>
                                                <th>尚欠管理费</th>
                                                <td><fmt:formatNumber value="${projectSummary.managementOweAmount}"
                                                        pattern="###,###,###,###,##0.00" /></td>
                                            </tr>
                                            <%-- <tr>
                                                <th colspan="2">往来欠款</th>
                                                <td><fmt:formatNumber value="${projectSummary.arrearsAmount}"
                                                        pattern="###,###,###,###,##0.00" /></td>
                                            </tr> --%>
                                            <tr>
                                                <th rowspan="2">型材</th>
                                                <th>预计用量</th>
                                                <td>
                                                    <c:if test="${projectSummary.expectedValueTon > 0}">
                                                    	吨：<fmt:formatNumber value="${projectSummary.expectedValueTon}" pattern="###,###,###,###,##0.00" />&emsp;&emsp;
                                                    </c:if>
                                                    <c:if test="${projectSummary.expectedValueSquareMeter > 0}">
                                                    	平米：<fmt:formatNumber value="${projectSummary.expectedValueSquareMeter}" pattern="###,###,###,###,##0.00" />
                                                    </c:if>
                                                </td>
                                            </tr>
                                            <tr>

                                                <th>型材点</th>
                                                <td><c:out value="${projectSummary.profilePoint}" /></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="bs-callout bs-callout-danger">
                                            <h4>欠款情况</h4>
                                            <p>
												工程欠款：<span id="q1">0000.00</span><br />IF（结算额>0，结算额，合同额+累计调增）-已收工程款
                                            </p>
                                            <hr />
                                            <h4>往来欠款</h4>
                                            <p>
                                            	<c:forEach items="${lArrearsType}" var="arrearsType" varStatus="status">
                                            		<c:out value="${arrearsType.arrearsType}" />：<span><fmt:formatNumber value='${arrearsType.amountTotal}' pattern='###,###,###,###,##0.00' /></span><br />
                                            	</c:forEach>
                                            </p>
                                            <hr />
                                            <h4>计息情况</h4>
                                            <p>
												应收利息：<span id="j1">0000.00</span>
                                            </p>
                                            <hr />
                                            <p>
												已收利息：<span id="j2">0000.00</span>
                                            </p>
                                            <hr />
                                            <h4>开票情况</h4>
                                            <p>
												已审开票额：<span id="k1">0000.00</span>
                                            </p>
                                            <hr />
                                            <p>
												已开票欠款：<span id="k2">0000.00</span><br />已审开票额 - 已收工程款
                                            </p>
                                            <hr />
                                            <p>
												工程款结存：<span id="k3">0000.00</span><br />工程款累计+自入款累计-累计付款
                                            </p>
                                            <hr />
                                            <p>
												可用余额：<span id="k4">0000.00</span><br />IF（应缴税金&lt;0，工程款结存，工程款结存-应缴税金）
                                            </p>
                                            <hr />
                                            <h4>印花税缴纳情况</h4>
                                            <p>
												<c:choose>
											    	<c:when test="${project.dutyPaidAmount > 0 }">
														已缴纳：<span><fmt:formatNumber value="${project.dutyPaidAmount}" pattern="###,###,###,###,##0.00" /></span>
													</c:when>
													<c:otherwise>
														未缴纳
													</c:otherwise>
												</c:choose>
                                            </p>
                                            <hr />
                                            <h4>回款比率情况</h4>
                                            <p>
                                            	<span class="label
												<c:choose>
											    	<c:when test="${projectSummary.collectionsRate >= 80 }">
														label-success
													</c:when>
													<c:otherwise>
														label-danger
													</c:otherwise>
												</c:choose>"><fmt:formatNumber value="${projectSummary.collectionsRate}" pattern="0.00" />%</span>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade${target=='project'?' in active':'' }" id="tab1default">
                                <!-- 合同项目信息 -->
                                <sf:form modelAttribute="project" cssClass="form-horizontal" role="form">
                                    <div class="row">
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <sf:label path="projectCode" cssClass="col-sm-2 control-label">项目编号</sf:label>
                                                <div class="col-sm-4">
                                                    <p class="form-control-static">
                                                        <c:out value="${project.projectCode}" />
                                                    </p>
                                                </div>
                                                <sf:label path="projectName" cssClass="col-sm-2 control-label">项目名称</sf:label>
                                                <div class="col-sm-4">
                                                    <p class="form-control-static">
                                                        <c:out value="${project.projectName}" />
                                                    </p>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <sf:label path="organizationId" cssClass="col-sm-2 control-label">所在部门</sf:label>
                                                <div class="col-sm-4">
                                                    <p class="form-control-static">
                                                        <c:out value="${project.organizationId}" />
                                                    </p>
                                                </div>
                                                <sf:label path="partyName" cssClass="col-sm-2 control-label">甲方名称</sf:label>
                                                <div class="col-sm-4">
                                                    <p class="form-control-static">
                                                        <c:out value="${project.partyName}" />
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <sf:label path="partyAddress" cssClass="col-sm-2 control-label">工程地址</sf:label>
                                                <div class="col-sm-4">
                                                    <p class="form-control-static">
                                                        <c:out value="${project.partyAddress}" />
                                                    </p>
                                                </div>
                                                <sf:label path="manager" cssClass="col-sm-2 control-label">项目实施人</sf:label>
                                                <div class="col-sm-4">
                                                    <p class="form-control-static">
                                                        <c:out value="${project.manager}" />
                                                    </p>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <sf:label path="contractCode" cssClass="col-sm-2 control-label">合同号</sf:label>
                                                <div class="col-sm-4">
                                                    <p class="form-control-static">
                                                        <c:out value="${project.contractCode}" />
                                                    </p>
                                                </div>
                                                <sf:label path="corperation" cssClass="col-sm-2 control-label">合作单位</sf:label>
                                                <div class="col-sm-4">
                                                    <p class="form-control-static">
                                                        <c:out value="${project.corperation}" />
                                                    </p>
                                                </div>
                                            </div>


                                            <div class="row">
                                                <sf:label path="legalAssignee" cssClass="col-sm-2 control-label">法人代表</sf:label>
                                                <div class="col-sm-4">
                                                    <p class="form-control-static">
                                                        <c:out value="${project.legalAssignee}" />
                                                    </p>
                                                </div>
                                                <sf:label path="isWithholdingOffsite" cssClass="col-sm-2 control-label">异地代扣代缴</sf:label>
                                                <div class="col-sm-4">
                                                    <p class="form-control-static">
                                                        <c:choose>
													    	<c:when test="${project.isWithholdingOffsite == '1' }">
																是
															</c:when>
															<c:otherwise>
																否
															</c:otherwise>
														</c:choose>
                                                    </p>
                                                </div>
                                            </div>

                                            <%-- <div class="row">
                                                <sf:label path="taxPlanAmount" cssClass="col-sm-2 control-label">应缴税金</sf:label>
                                                <div class="col-sm-4">
                                                    <p class="form-control-static">
                                                        <fmt:formatNumber pattern="#,##0.00"
                                                            value="${project.taxPlanAmount}" />
                                                    </p>
                                                </div>
                                                <sf:label path="taxRate" cssClass="col-sm-2 control-label">税金比率</sf:label>
                                                <div class="col-sm-4">
                                                    <p class="form-control-static">
                                                        <fmt:formatNumber pattern="#,##0.00" value="${project.taxRate}" />
                                                    </p>
                                                </div>
                                            </div> --%>
                                            
                                            <div class="row">
                                                <sf:label path="managementRate" cssClass="col-sm-2 control-label">管理费率</sf:label>
                                                <div class="col-sm-4">
                                                    <p class="form-control-static">
                                                        <fmt:formatNumber pattern="#,##0.00"
                                                            value="${project.managementRate}" />
                                                    </p>
                                                </div>
                                                <sf:label path="managementPlanAmount" cssClass="col-sm-2 control-label">应收管理费</sf:label>
                                                <div class="col-sm-4">
                                                    <p class="form-control-static">
                                                        <fmt:formatNumber pattern="#,##0.00"
                                                            value="${project.managementPlanAmount}" />
                                                    </p>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <sf:label path="contractAmount" cssClass="col-sm-2 control-label">合同金额</sf:label>
                                                <div class="col-sm-4">
                                                    <p class="form-control-static">
                                                        <fmt:formatNumber pattern="#,##0.00"
                                                            value="${project.contractAmount}" />
                                                    </p>
                                                </div>
                                                <sf:label path="contractDate" cssClass="col-sm-2 control-label">合同签订日期</sf:label>
                                                <div class="col-sm-4">
                                                    <p class="form-control-static">
                                                        <fmt:formatDate value="${project.contractDate}"
                                                            pattern="yyyy-MM-dd" />
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <sf:label path="taxBearingRate" cssClass="col-sm-2 control-label">税负率</sf:label>
                                                <div class="col-sm-4">
                                                    <p class="form-control-static">
                                                        <fmt:formatNumber pattern="0.00" value="${project.taxBearingRate}" />%
                                                    </p>
                                                </div>
                                                <sf:label path="contractType" cssClass="col-sm-2 control-label">合同分类</sf:label>
                                                <div class="col-sm-4">
                                                    <p class="form-control-static">
                                                        <c:out value="${project.contractType}" />
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <sf:label path="contractTaxRate" cssClass="col-sm-2 control-label">合同税率</sf:label>
                                                <div class="col-sm-4">
                                                    <p class="form-control-static">
                                                        <c:out value="${project.contractTaxRate}" />
                                                        <!-- 合同税率-混合税率 -->
                                                        <c:if test="${project.contractTaxRate == '混合税率'}">
                                                        	<table class="table table-hover">
						                                        <thead>
						                                            <tr>
						                                                <th>名称</th>
						                                                <th>税率</th>
						                                                <th>金额</th>
						                                            </tr>
						                                        </thead>
						                                        <tbody id="projectTaxRateList">
						                                            <c:forEach items="${lProjectTaxRate}" var="projectTaxRate">
						                                                <tr>
						                                                    <td>
						                                                    	<c:out value="${projectTaxRate.name}" />
						                                                    </td>
						                                                    <td>
																				<fmt:formatNumber value="${projectTaxRate.taxRate}"/>%
						                                                    </td>
						                                                    <td>
							                                                    <fmt:formatNumber value="${projectTaxRate.amount}" pattern="##0.00" />
																			</td>
						                                				</tr>
						                                            </c:forEach>
						                                        </tbody>
						                                    </table>
                                            			</c:if>
                                                    </p>
                                                </div>
                                                <sf:label path="settlementAmount" cssClass="col-sm-2 control-label">结算金额</sf:label>
                                                <div class="col-sm-4">
                                                    <p class="form-control-static">
                                                        <fmt:formatNumber pattern="#,##0.00"
                                                            value="${project.settlementAmount}" />
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <sf:label path="dutyPaidTime" cssClass="col-sm-2 control-label">印花税上交时间</sf:label>
                                                <div class="col-sm-4">
                                                    <p class="form-control-static">
                                                        <fmt:formatDate value="${project.dutyPaidTime}"
                                                            pattern="yyyy-MM-dd" />
                                                    </p>
                                                </div>
                                                <sf:label path="dutyPaidAmount" cssClass="col-sm-2 control-label">印花税上交金额</sf:label>
                                                <div class="col-sm-4">
                                                    <p class="form-control-static">
                                                        <fmt:formatNumber pattern="#,##0.00"
                                                            value="${project.dutyPaidAmount}" />
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <sf:label path="dutyPaidCode" cssClass="col-sm-2 control-label">印花税收据编号</sf:label>
                                                <div class="col-sm-4">
                                                    <p class="form-control-static">
                                                        <c:out value="${project.dutyPaidCode}" />
                                                    </p>
                                                </div>
                                                <label for="capitalOccupied" class="col-sm-2 control-label">占用资金情况</label>
                                                <div class="col-sm-4 ">
                                                    <%--
                                <sf:input cssClass="form-control" path="capitalOccupied" placeholder="占用资金情况" /> --%>
                                                    <p class="form-control-static" id="capitalOccupied">&nbsp;</p>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <sf:label path="createUser" cssClass="col-sm-2 control-label">创建用户</sf:label>
                                                <div class="col-sm-4">
                                                    <p class="form-control-static">
                                                        <c:out value="${project.createUser}" />
                                                    </p>
                                                </div>
                                                <sf:label path="createTime" cssClass="col-sm-2 control-label">创建时间</sf:label>
                                                <div class="col-sm-4">
                                                    <p class="form-control-static">
                                                        <fmt:formatDate value="${project.createTime}"
                                                            pattern="yyyy-MM-dd" />
                                                    </p>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <sf:label path="updateUser" cssClass="col-sm-2 control-label">修改用户</sf:label>
                                                <div class="col-sm-4">
                                                    <p class="form-control-static">
                                                        <c:out value="${project.updateUser}" />
                                                    </p>
                                                </div>
                                                <sf:label path="updateTime" cssClass="col-sm-2 control-label">修改时间</sf:label>
                                                <div class="col-sm-4">
                                                    <p class="form-control-static">
                                                        <fmt:formatDate value="${project.updateTime}"
                                                            pattern="yyyy-MM-dd" />
                                                    </p>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <sf:label path="description" cssClass="col-sm-2 control-label">备注</sf:label>
                                                <div class="col-sm-4">
                                                    <p class="form-control-static">
                                                        <c:out value="${project.description}" />
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-4"></div>
                                    </div>

                                </sf:form>
                            </div>
                            <div class="tab-pane fade${target=='contractchange'?' in active':'' }" id="tab1xdefault">
                                <!-- 补充协议 -->
                                <div class="panel-body">
                                    <div class="btn-toolbar" role="toolbar">
                                        <shiro:hasPermission name="`contractchange_create`">
                                            <div class="btn-group">
                                                <a
                                                    href="<c:url value="/contractchange/create?projectid=${projectId}" />"
                                                    class="btn btn-info"><span class="glyphicon glyphicon-plus"></span>
                                                    新 建 </a>
                                            </div>
                                        </shiro:hasPermission>
                                         <shiro:hasPermission name="`contractchange_check`">
                                            <div class="btn-group">
                                                <a href="javascript:void();" onclick="batchCheck('contract_change', '${projectId}');" class="btn btn-default"><span class="glyphicon glyphicon-th-list"></span>
                                                    批量审核 </a>
                                            </div>
                                        </shiro:hasPermission>
                                        <div style="float:right;">
                                        	<h4>总笔数：<span>${fn:length(lContractChange) }</span>；增减金额合计：<span id="contractChangeTotalAmount">0.00</span></h4>
                                        </div>
                                    </div>

                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th></th>
                                                <th>#</th>
                                                <th>增补协议编号</th>
                                                <%--  <th class="amount">管理费率</th> --%>
                        						<th class="amount">税率</th>
                                                <th class="amount">增减金额</th>
                                                <th>登记人</th>
                                                <th>登记时间</th>
                                                <th>备注</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:set var="contractChangeTotalAmount" value="0" />
                                            <c:forEach items="${lContractChange}" var="contractChange" varStatus="status">
                                            	<c:set var="contractChangeTotalAmount" value="${contractChangeTotalAmount + contractChange.changeAmount}" />
                                                <tr>
                                                    <td><span
                                                        class="glyphicon <c:out value="${contractChange.status != 1 ? 'glyphicon-file' : ''}" />"></span></td>
                                                    <td>${status.count}</td>
                                                    <td><c:out value="${contractChange.csaCode}" /></td>
                                                    <%--      <td class="amount"><fmt:formatNumber
                                                            value="${contractChange.managementRate}" pattern="0.00" />%</td> --%>
                                                    <td class="amount"><fmt:formatNumber
                                                            value="${contractChange.taxRate}" />%</td>
                                                    <td class="amount"><fmt:formatNumber
                                                            value="${contractChange.changeAmount}"
                                                            pattern="###,###,###,###,##0.00" /></td>
                                                    <td><c:out value="${contractChange.createUser}" /></td>
                                                    <td><fmt:formatDate value="${contractChange.trice}"
                                                            pattern="yyyy-MM-dd" /></td>
                                                    <td><c:out value="${contractChange.description}" /></td>
                                               <td><c:if test="${contractChange.status !=1 }">
                                    <shiro:hasPermission name="`contractchange_check`">
                                        <a class="check" data-confirm-message="合同补充协议：<c:out value="${contractChange.id}" />，审核后所有数据将不能被修改，是否确认？" href="<s:url value="/contractchange/check/${contractChange.id }" />">审核</a>
                                    </shiro:hasPermission>
                                    <shiro:hasPermission name="`contractchange_create`">
                                        <a href="<s:url value="/contractchange/modify/${contractChange.id }" />">修改</a>
                                        <a class="delete"
                                            data-confirm-message="合同补充协议：<c:out value="${contractChange.id}" />，将被永久删除，操作不可撤销，是否确认？"
                                            href="<s:url value="/contractchange/delete/${contractChange.id }" />">删除</a>
                                    </shiro:hasPermission>
                                </c:if></td> </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="tab-pane fade${target=='partybilling'?' in active':'' }" id="tab2default">
                                <!-- 甲方开票情况 -->

                                <div class="panel-body">
                                    <div class="btn-toolbar" role="toolbar">
                                        <shiro:hasPermission name="`partybilling_create`">
                                            <div class="btn-group">
                                                <a href="<c:url value="/partybilling/create?projectid=${projectId}" />"
                                                    class="btn btn-info"><span class="glyphicon glyphicon-plus"></span>
                                                    新 建 </a>
                                            </div>
                                        </shiro:hasPermission>
                                                                                 <shiro:hasPermission name="`partybilling_check`">
                                            <div class="btn-group">
                                                <a href="javascript:void();" onclick="batchCheck('party_billing', '${projectId}');" class="btn btn-default"><span class="glyphicon glyphicon-th-list"></span>
                                                    批量审核 </a>
                                            </div>
                                        </shiro:hasPermission>
                                        <div class="btn-group">
	                                        <div id="custom-search-form" class="form-search form-horizontal pull-right">
						                        <div class="input-append span12">
						                            <input id="searchPartyBillingInput" type="text" class="search-query mac-style" placeholder="搜索 。。。">
						                            <button type="button" class="btn" id="searchPartyBillingButton">
						                                <span class="glyphicon glyphicon-search"></span>
						                            </button>
						                        </div>
						                    </div>
					                    </div>
                                        <div style="float:right;">
                                        	<h4>总笔数：<span id="lPartyBilling">${fn:length(lPartyBilling) }</span>；金额合计：<span id="partyBillingTotalAmount">0.00</span>；销项税金合计：<span id="partyBillingTotalOutputTaxAmount">0.00</span>；发票金额合计：<span id="partyBillingTotalInvoiceAmount">0.00</span></h4>
                                        </div>
                                    </div>

                                    <table class="table table-hover" id="partyBillingTable">
                                        <thead>
                                            <tr>
                                                <th></th>
                                                <th>#</th>
                                                <!-- <th>发票票号</th> -->
                        						<th>付款单位</th>
                                                <th class="amount">金额</th>
                                                <th class="amount">税率</th>
                                                <th class="amount">销项税金</th>
                                                <th class="amount">发票金额</th>
                                                <th>开票人</th>
                                                <th>开票时间</th>
                                                <th>备注</th>
                                                <!-- <th>审核情况</th> -->
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:set var="partyBillingTotalAmount" value="0" />
                                        	<c:set var="partyBillingTotalOutputTaxAmount" value="0" />
                                        	<c:set var="partyBillingTotalInvoiceAmount" value="0" />
                                            <c:forEach items="${lPartyBilling}" var="partyBilling" varStatus="status">
                                            	<c:set var="partyBillingTotalAmount" value="${partyBillingTotalAmount + partyBilling.amount}" />
                                            	<c:set var="partyBillingTotalOutputTaxAmount" value="${partyBillingTotalOutputTaxAmount + partyBilling.outputTaxAmount}" />
                                            	<c:set var="partyBillingTotalInvoiceAmount" value="${partyBillingTotalInvoiceAmount + partyBilling.invoiceAmount}" />
                                                <tr>
                                                    <td><span
                                                        class="glyphicon <c:out value="${partyBilling.status != 1 ? 'glyphicon-file' : ''}" />"></span></td>
                                                    <td>${status.count}</td>
                                                    <%-- <td><c:out value="${partyBilling.invoiceCode}" /></td> --%>
                            						<td><c:out value="${partyBilling.field01}" /></td>
                                                    <td class="amount"><fmt:formatNumber
                                                            value="${partyBilling.amount}"
                                                            pattern="###,###,###,###,##0.00" /></td>
                                                    <td class="amount"><fmt:formatNumber
                                                            value="${partyBilling.taxRate}" />%</td>
                                                    <td class="amount"><fmt:formatNumber
                                                            value="${partyBilling.outputTaxAmount}"
                                                            pattern="###,###,###,###,##0.00" /></td>
                                                    <td class="amount"><fmt:formatNumber
                                                            value="${partyBilling.invoiceAmount}"
                                                            pattern="###,###,###,###,##0.00" /></td>
                                                    <td><c:out value="${partyBilling.createUser}" /></td>
                                                    <td><fmt:formatDate value="${partyBilling.trice}"
                                                            pattern="yyyy-MM-dd" /></td>
                                                    <td><c:out value="${partyBilling.description}" /></td>
                                                    <%-- <td><c:if test="${empty partyBilling.step1Time}">未审核</c:if> <c:if
                                                            test="${not empty partyBilling.step1Time}">${partyBilling.step1User}：${partyBilling.step1Idea}，
                                    <fmt:formatDate value="${partyBilling.step1Time}" pattern="yyyy-MM-dd" />
                                                        </c:if></td> --%>
                                                    <td><c:if test="${ partyBilling.stepStatus != 1 }">
                                                            <shiro:hasPermission name="`partybilling_step1`">
                                                                <a class="check"
                                                                	data-confirm-message="甲方开票情况数据：<c:out value="${partyBilling.id}" />，审核后所有数据将不能被修改，是否确认？"
                                                                    href="<s:url value="/partybilling/check/{id}"><s:param name="id" value="${partyBilling.id }" /></s:url>">审核</a>
                                                                <%-- <a
                                                                    href="<s:url value="/partybilling/step1/{id}"><s:param name="id" value="${partyBilling.id }" /></s:url>">审核</a> --%>
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
                            <div class="tab-pane fade${target=='customerbilling'?' in active':'' }" id="tab3default">
                                <!-- 客户开票情况 -->
                                <div class="panel-body">
                                    <div class="btn-toolbar" role="toolbar">
                                        <shiro:hasPermission name="`customerbilling_create`">
                                            <div class="btn-group">
                                                <a
                                                    href="<c:url value="/customerbilling/create?projectid=${projectId}" />"
                                                    class="btn btn-info"><span class="glyphicon glyphicon-plus"></span>
                                                    新 建 </a>
                                            </div>
                                        </shiro:hasPermission> <shiro:hasPermission name="`customerbilling_check`">
                                            <div class="btn-group">
                                                <a href="javascript:void();" onclick="batchCheck('customer_billing', '${projectId}');" class="btn btn-default"><span class="glyphicon glyphicon-th-list"></span>
                                                    批量审核 </a>
                                            </div>
                                        </shiro:hasPermission>
                                        <div class="btn-group">
	                                        <div id="custom-search-form" class="form-search form-horizontal pull-right">
						                        <div class="input-append span12">
						                            <input id="searchCustomerBillingInput" type="text" class="search-query mac-style" placeholder="搜索 。。。">
						                            <button type="button" class="btn" id="searchCustomerBillingButton">
						                                <span class="glyphicon glyphicon-search"></span>
						                            </button>
						                        </div>
						                    </div>
					                    </div>
					                    
                                        <div style="float:right;">
                                        	<h4>总笔数：<span id="lCustomerBilling">${fn:length(lCustomerBilling) }</span>；金额合计：<span id="customerBillingTotalAmount">0.00</span>；进项税金合计：<span id="customerBillingTotalInputTaxAmount">0.00</span>；发票金额合计：<span id="customerBillingTotalInvoiceAmount">0.00</span></h4>
                                        </div>
                                    </div>

                                    <table class="table table-hover" id="customerBillingTable">
                                        <thead>
                                            <tr>
                                                <th></th>
                                                <th>#</th>
                                                <!-- <th>发票票号</th> -->
                                                <th>发票类别</th>
                                                <th class="amount">金额</th>
                                                <th class="amount">税率</th>
                                                <th class="amount">进项税金</th>
                                                <th class="amount">发票金额</th>
                                                <th>创建用户</th>
                                                <th>开票时间</th>
                                                <th>备注</th>
<th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:set var="customerBillingTotalAmount" value="0" />
                                        	<c:set var="customerBillingTotalInputTaxAmount" value="0" />
                                        	<c:set var="customerBillingTotalInvoiceAmount" value="0" />
                                            <c:forEach items="${lCustomerBilling}" var="customerBilling" varStatus="status">
                                        		<c:set var="customerBillingTotalAmount" value="${customerBillingTotalAmount + customerBilling.amount}" />
                                        		<c:set var="customerBillingTotalInputTaxAmount" value="${customerBillingTotalInputTaxAmount + customerBilling.inputTaxAmount}" />
                                        		<c:set var="customerBillingTotalInvoiceAmount" value="${customerBillingTotalInvoiceAmount + customerBilling.invoiceAmount}" />
                                                <tr>
                                                    <td><span
                                                        class="glyphicon <c:out value="${customerBilling.status != 1 ? 'glyphicon-file' : ''}" />"></span></td>
                                                    <td>${status.count}</td>
                                                    <%-- <td><c:out value="${customerBilling.invoiceCode}" /></td> --%>
                                                    <td><c:out value="${customerBilling.invoiceType}" /></td>
                                                    <td class="amount"><fmt:formatNumber
                                                            value="${customerBilling.amount}"
                                                            pattern="###,###,###,###,##0.00" /></td>
                                                    <td class="amount"><fmt:formatNumber
                                                            value="${customerBilling.taxRate}" />%</td>
                                                    <td class="amount"><fmt:formatNumber
                                                            value="${customerBilling.inputTaxAmount}"
                                                            pattern="###,###,###,###,##0.00" /></td>
                                                    <td class="amount"><fmt:formatNumber
                                                            value="${customerBilling.invoiceAmount}"
                                                            pattern="###,###,###,###,##0.00" /></td>
                                                    <td><c:out value="${customerBilling.createUser}" /></td>
                                                    <td><fmt:formatDate value="${customerBilling.trice}"
                                                            pattern="yyyy-MM-dd" /></td>
                                                    <td><c:out value="${customerBilling.description}" /></td>
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
                                </c:if></td> </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="tab-pane fade${target=='collections'?' in active':'' }" id="tab4default">
                                <!-- 收款情况 -->
                                <div class="panel-body">
                                    <div class="btn-toolbar" role="toolbar">
                                        <shiro:hasPermission name="`collections_create`">
                                            <div class="btn-group">
                                                <a href="<c:url value="/collections/create?projectid=${projectId}" />"
                                                    class="btn btn-info"><span class="glyphicon glyphicon-plus"></span>
                                                    新 建 </a>
                                            </div>
                                        </shiro:hasPermission><shiro:hasPermission name="`collections_check`">
                                            <div class="btn-group">
                                                <a href="javascript:void();" onclick="batchCheck('collections', '${projectId}');" class="btn btn-default"><span class="glyphicon glyphicon-th-list"></span>
                                                    批量审核 </a>
                                            </div>
                                        </shiro:hasPermission>
                                        <div style="float:right;">
                                        	<h4>总笔数：<span>${fn:length(lCollections) }</span>；工程款合计：<span id="collectionsTotalProjectAmount">0.00</span>；管理费合计：<span id="collectionsTotalManagementAmount">0.00</span>；自入款合计：<span id="collectionsTotalIncomeAmount">0.00</span>；其他合计：<span id="collectionsTotalOtherAmount">0.00</span></h4>
                                        </div>
                                    </div>

                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th></th>
                                                <th>#</th>
                                                <!-- <th>凭证号</th> -->
                                                <th>款项来源</th>
                                                <th>收款方式</th>
                                                <th class="amount">收款金额</th>
                                                <th>收款人</th>
                                                <th>收款时间</th>
                                                <th>备注</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:set var="collectionsTotalAmount" value="0" />
                                        	<c:set var="collectionsTotalProjectAmount" value="0" />
                                        	<c:set var="collectionsTotalManagementAmount" value="0" />
                                        	<c:set var="collectionsTotalIncomeAmount" value="0" />
                                        	<c:set var="collectionsTotalOtherAmount" value="0" />
                                            <c:forEach items="${lCollections}" var="collections" varStatus="status">
												<!-- 总计 -->
                                            	<c:set var="collectionsTotalAmount" value="${collectionsTotalAmount + collections.amount}" />
                                            	<c:choose>
											    	<c:when test="${collections.sourceOf == '工程款' }">
                                        				<c:set var="collectionsTotalProjectAmount" value="${collectionsTotalProjectAmount + collections.amount}" />
													</c:when>
											    	<c:when test="${collections.sourceOf == '管理费' }">
                                        				<c:set var="collectionsTotalManagementAmount" value="${collectionsTotalManagementAmount + collections.amount}" />
													</c:when>
											    	<c:when test="${collections.sourceOf == '自入款' }">
                                        				<c:set var="collectionsTotalIncomeAmount" value="${collectionsTotalIncomeAmount + collections.amount}" />
													</c:when>
													<c:otherwise>
														<!-- 其他 --> 
														<c:set var="collectionsTotalOtherAmount" value="${collectionsTotalOtherAmount + collections.amount}" />
													</c:otherwise>
												</c:choose>
                                                <tr>
                                                    <td><span
                                                        class="glyphicon <c:out value="${collections.status != 1 ? 'glyphicon-file' : ''}" />"></span></td>
                                                    <td>${status.count}</td>
                                                    <%-- <td><c:out value="${collections.ticketCode}" /></td> --%>
                                                    <td><c:out value="${collections.sourceOf}" /></td>
                                                    <td><c:out value="${collections.paymentType}" /></td>
                                                    <td class="amount"><fmt:formatNumber
                                                            value="${collections.amount}"
                                                            pattern="###,###,###,###,##0.00" /></td>
                                                    <td><c:out value="${collections.createUser}" /></td>
                                                    <td><fmt:formatDate value="${collections.trice}"
                                                            pattern="yyyy-MM-dd" /></td>
                                                    <td><c:out value="${collections.description}" /></td>
                                                     <td><c:if test="${collections.status != 1 }">
                                    <shiro:hasPermission name="`collections_check`">
                                        <a class="check" data-confirm-message="收款情况：<c:out value="${collections.id}" />，审核后所有数据将不能被修改，是否确认？" href="<s:url value="/collections/check/${collections.id }" />">审核</a>
                                    </shiro:hasPermission>
                                    <shiro:hasPermission name="`collections_create`">
                                        <a href="<s:url value="/collections/modify/${collections.id }" />">修改</a>
                                        <a class="delete"
                                            data-confirm-message="收款情况：<c:out value="${collections.id}" />，将被永久删除，操作不可撤销，是否确认？"
                                            href="<s:url value="/collections/delete/${collections.id }" />">删除</a>
                                    </shiro:hasPermission>
                                </c:if></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="tab-pane fade${target=='payment'?' in active':'' }" id="tab5default">
                                <!-- 付款情况 -->
                                <div class="panel-body">
                                    <div class="btn-toolbar" role="toolbar">
                                        <shiro:hasPermission name="`payment_create`">
                                            <div class="btn-group">
                                                <a href="<c:url value="/payment/create?projectid=${projectId}" />"
                                                    class="btn btn-info"><span class="glyphicon glyphicon-plus"></span>
                                                    新 建 </a>
                                            </div>
                                        </shiro:hasPermission><shiro:hasPermission name="`payment_check`">
                                            <div class="btn-group">
                                                <a href="javascript:void();" onclick="batchCheck('payment', '${projectId}');" class="btn btn-default"><span class="glyphicon glyphicon-th-list"></span>
                                                    批量审核 </a>
                                            </div>
                                        </shiro:hasPermission>
                                        <div class="btn-group">
	                                        <div id="custom-search-form" class="form-search form-horizontal pull-right">
						                        <div class="input-append span12">
						                            <input id="searchPaymentInput" type="text" class="search-query mac-style" placeholder="搜索 。。。">
						                            <button type="button" class="btn" id="searchPaymentButton">
						                                <span class="glyphicon glyphicon-search"></span>
						                            </button>
						                        </div>
						                    </div>
					                    </div>
                                        
                                        <div style="float:right;">
                                        	<h4>总笔数：<span id="lPayment">${fn:length(lPayment) }</span>；付款金额合计：<span id="paymentTotalAmount">0.00</span></h4>
                                        </div>
                                    </div>

                                    <table class="table table-hover" id="paymentTable">
                                        <thead>
                                            <tr>
                                                <th></th>
                                                <th>#</th>
                                                <!-- <th>凭证号</th> -->
                                                <th>付款科目</th>
                                                <th>支付方式</th>
                                                <th class="amount">付款金额</th>
                                                <th>付款人</th>
                                                <th>付款时间</th>
                                                <th>备注</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:set var="paymentTotalAmount" value="0" />
                                            <c:forEach items="${lPayment}" var="payment" varStatus="status">
                                        		<c:set var="paymentTotalAmount" value="${paymentTotalAmount + payment.amount}" />
                                                <tr>
                                                    <td><span
                                                        class="glyphicon <c:out value="${payment.status != 1 ? 'glyphicon-file' : ''}" />"></span></td>
                                                    <td>${status.count}</td>
                                                    <%-- <td><c:out value="${payment.ticketCode}" /></td> --%>
                                                    <td><c:out value="${payment.paymentItemId}" /></td>
                                                    <td><c:out value="${payment.payType}" /></td>
                                                    <td class="amount"><fmt:formatNumber value="${payment.amount}"
                                                            pattern="###,###,###,###,##0.00" /></td>
                                                    <td><c:out value="${payment.createUser}" /></td>
                                                    <td><fmt:formatDate value="${payment.trice}"
                                                            pattern="yyyy-MM-dd" /></td>
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
                                </div>
                            </div>
                            <div class="tab-pane fade${target=='arrears'?' in active':'' }" id="tab6default">
                                <!-- 往来欠款 -->
                                <div class="panel-body">
                                    <div class="btn-toolbar" role="toolbar"><shiro:hasPermission name="`arrears_create`">
                                        <div class="btn-group">
                                            <a href="<c:url value="/arrears/create?projectid=${projectId}" />"
                                                class="btn btn-info"><span class="glyphicon glyphicon-plus"></span>
                                                新 建 </a>
                                        </div> </shiro:hasPermission><shiro:hasPermission name="`arrears_check`">
                                            <div class="btn-group">
                                                <a href="javascript:void();" onclick="batchCheck('arrears', '${projectId}');" class="btn btn-default"><span class="glyphicon glyphicon-th-list"></span>
                                                    批量审核 </a>
                                            </div>
                                        </shiro:hasPermission>
                                        <div style="float:right;">
                                        	<h4>总笔数：<span>${fn:length(lArrears) }</span>；借出金额合计：<span id="arrearsOutputTotalAmount">0.00</span>；还入金额合计：<span id="arrearsInputTotalAmount">0.00</span></h4>
                                        </div>
                                    </div>

                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th></th>
                                                <th>#</th>
                                                <!-- <th>凭证号</th> -->
                                                <th>款项分类</th>
                                                <th class="amount">借出金额</th>
                                                <th class="amount">还入金额</th>
                                                <th>支付方式</th>
                                                <th>登记人</th>
                                                <th>登记时间</th>
                                                <th>备注</th>
<th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:set var="arrearsOutputTotalAmount" value="0" />
                                        	<c:set var="arrearsInputTotalAmount" value="0" />
                                            <c:forEach items="${lArrears}" var="arrears" varStatus="status">
                                                <tr>
                                                    <td><span
                                                        class="glyphicon <c:out value="${arrears.status != 1 ? 'glyphicon-file' : ''}" />"></span></td>
                                                    <td>${status.count}</td>
                                                    <%-- <td><c:out value="${arrears.arrearsCode}" /></td> --%>
                                                    <td><c:out value="${arrears.arrearsType}" /></td>
                                                    <td class="amount">
                                                    	<c:if test="${arrears.amount < 0}">
                                                    		<c:set var="arrearsOutputTotalAmount" value="${arrearsOutputTotalAmount + arrears.amount}" />
                                                            <span
                                                                <c:if test="${arrears.interestRate > 0 }">title="此笔费用计息，利率：<fmt:formatNumber value="${arrears.interestRate}" pattern="0.00"/>%，已计息：<fmt:formatNumber value="${arrears.interestAmount}" pattern="###,###,###,###,##0.00"/>" class="label label-default"</c:if>>
                                                                <c:if test="${arrears.interestRate > 0 }">
                                                                    <a style="color: #fff"
                                                                        href="javascript:showDialog('${arrears.id}')">
                                                                </c:if> <fmt:formatNumber value="${arrears.amount}"
                                                                    pattern="###,###,###,###,##0.00" /> <c:if
                                                                    test="${arrears.interestRate > 0 }">
                                                                    </a>
                                                                </c:if>
                                                            </span>
                                                        </c:if></td>
                                                    <td class="amount">
                                                    	<c:if test="${arrears.amount > 0}">
                                                    		<c:set var="arrearsInputTotalAmount" value="${arrearsInputTotalAmount + arrears.amount}" />
                                                            <fmt:formatNumber value="${arrears.amount}"
                                                                pattern="###,###,###,###,##0.00" />
                                                        </c:if></td>
                                                    <td><c:out value="${arrears.payType}" /></td>
                                                    <td><c:out value="${arrears.createUser}" /></td>
                                                    <td><fmt:formatDate value="${arrears.trice}"
                                                            pattern="yyyy-MM-dd" /></td>
                                                    <td><c:if test="${not empty arrears.description}">
                                                            <span data-container="body" data-toggle="popover"
                                                                data-placement="left"
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
                                </c:if>
                                <c:if test="${arrears.status == 1 && arrears.amount + arrears.offsetAmount < 0}">
<shiro:hasPermission name="`arrears_check`">
                                        <a href="javascript:void()" onclick="repay('${arrears.id }', ${arrears.amount + arrears.offsetAmount}, ${arrears.interestAmount})">还款</a>
                                    </shiro:hasPermission>
</c:if>
                                </td> </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="tab-pane fade${target=='profile'?' in active':'' }" id="tab7default">
                                <!-- 型材 -->
                                <div class="panel-body">
                                    <div class="btn-toolbar" role="toolbar">
                                        <shiro:hasPermission name="`profile_create`">
                                            <div class="btn-group">
                                                <a href="<c:url value="/profile/create?projectid=${projectId}" />"
                                                    class="btn btn-info"><span class="glyphicon glyphicon-plus"></span>
                                                    新 建 </a>
                                            </div>
                                        </shiro:hasPermission><shiro:hasPermission name="`profile_check`">
                                            <div class="btn-group">
                                                <a href="javascript:void();" onclick="batchCheck('profile', '${projectId}');" class="btn btn-default"><span class="glyphicon glyphicon-th-list"></span>
                                                    批量审核 </a>
                                            </div>
                                        </shiro:hasPermission>
                                        <div style="float:right;">
                                        	<h4>总笔数：<span>${fn:length(lProfile) }</span>；预计用量(吨)合计：<span id="profileTotalExpectedValueT">0.00</span>；预计用量(平米)合计：<span id="profileTotalExpectedValueM2">0.00</span></h4>
                                        </div>
                                    </div>

                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th></th>
                                                <th>#</th>
                                                <th class="amount">预计用量</th>
                                                <th>型材点</th>
                                                <th>创建用户</th>
                                                <th>登记时间</th>
                                                <th>备注</th>
                                                <th></th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:set var="profileTotalExpectedValueT" value="0" />
                                        	<c:set var="profileTotalExpectedValueM2" value="0" />
                                            <c:forEach items="${lProfile}" var="profile" varStatus="status">
                                            	<c:choose>
											    	<c:when test="${profile.unit == '吨' }">
	                                        			<c:set var="profileTotalExpectedValueT" value="${profileTotalExpectedValueT + profile.expectedValue}" />
													</c:when>
													<c:otherwise>
	                                        			<c:set var="profileTotalExpectedValueM2" value="${profileTotalExpectedValue + profile.expectedValue}" />
													</c:otherwise>
												</c:choose>
                                                <tr>
                                                    <td><span
                                                        class="glyphicon <c:out value="${profile.status != 1 ? 'glyphicon-file' : ''}" />"></span></td>
                                                    <td>${status.count}</td>
                                                    <td class="amount"><fmt:formatNumber
                                                            value="${profile.expectedValue}"
                                                            pattern="###,###,###,###,##0.00" /><c:out value="${profile.unit}" /></td>
                                                    <td><c:out value="${profile.profilePoint}" /></td>
                                                    <td><c:out value="${profile.createUser}" /></td>
                                                    <td><fmt:formatDate value="${profile.trice}"
                                                            pattern="yyyy-MM-dd" /></td>
                                                    <td><c:out value="${profile.description}" /></td>
                                                   <td><c:if test="${profile.status != 1 }">
                                    <shiro:hasPermission name="`profile_check`">
                                        <a class="check" data-confirm-message="型材：<c:out value="${profile.id}" />，审核后所有数据将不能被修改，是否确认？" href="<s:url value="/profile/check/${profile.id }" />">审核</a>
                                    </shiro:hasPermission>
                                    <shiro:hasPermission name="`profile_create`">
                                        <a href="<s:url value="/profile/modify/${profile.id }" />">修改</a>
                                        <a class="delete"
                                            data-confirm-message="型材数据：<c:out value="${profile.id}" />，将被永久删除，操作不可撤销，是否确认？"
                                            href="<s:url value="/profile/delete/${profile.id }" />">删除</a>
                                    </shiro:hasPermission>
                                </c:if></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <div class="tab-pane fade${target=='history'?' in active':'' }" id="tab8default">
                                <!-- 变更记录 -->
                                <div class="panel-body">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>时间</th>
                                                <th>操作人</th>
                                                <th>摘要</th>
                                                <th>内容</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${lHistory}" var="history" varStatus="status">
                                                <tr>
                                                    <td>${status.count}</td>
                                                    <td><fmt:formatDate value="${history.trice}"
                                                            pattern="yyyy/MM/dd HH:mm" /></td>
                                                    <td>${history.field01}</td>
                                                    <td>${history.description}</td>
                                                    <td>
														<c:if test="${fn:startsWith(history.tableName, '/project/')}">
															合同额：<fmt:formatNumber value="${history.contractAmount}" pattern="###,###,###,###,##0.00" />
                                                            <c:if test="${history.settlementAmount > 0 }">
                                                                <br />结算额：<fmt:formatNumber
                                                                    value="${history.settlementAmount}"
                                                                    pattern="###,###,###,###,##0.00" />
                                                            </c:if><br />
                                                            	<%-- 管理费率：<fmt:formatNumber
                                                                value="${history.managementRate}"
                                                                pattern="###,###,###,###,##0.00" />%<br /> 应收管理费：<fmt:formatNumber
                                                                value="${history.managementPlanAmount}"
                                                                pattern="###,###,###,###,##0.00" />
                                                            <br />税率：<fmt:formatNumber
                                                                value="${history.taxRate}" />% <br /> 应缴税金：<fmt:formatNumber
                                                                value="${history.taxPlanAmount}"
                                                                pattern="###,###,###,###,##0.00" /><br /> --%>
                                                        </c:if>
														<c:if test="${fn:startsWith(history.tableName, '/contractchange/')}"><!-- ${history.changeTotalAmount > 0} -->
                                                            <%-- 调增：<fmt:formatNumber value="${history.changeAmount}"
                                                                pattern="###,###,###,###,##0.00" />
                                                            <br /> --%>累计调增额：<fmt:formatNumber
                                                                value="${history.changeTotalAmount}"
                                                                pattern="###,###,###,###,##0.00" /><br />
                                                        </c:if>
														<c:if test="${fn:startsWith(history.tableName, '/project/') || fn:startsWith(history.tableName, '/contractchange/') || fn:startsWith(history.tableName, '/collections/')}"><!-- ${history.managementRealAmount > 0} -->
															管理费率：<fmt:formatNumber value="${history.managementRate}"
                                                                pattern="###,###,###,###,##0.00" />%<br /> 应收管理费：<fmt:formatNumber
                                                                value="${history.managementPlanAmount}"
                                                                pattern="###,###,###,###,##0.00" />
                                                            <br /> 本期收管理费：<fmt:formatNumber
                                                                value="${history.managementRealAmount}"
                                                                pattern="###,###,###,###,##0.00" />
                                                            <br /> 累计管理费：<fmt:formatNumber
                                                                value="${history.managementTotalAmount}"
                                                                pattern="###,###,###,###,##0.00" />
                                                            <br /> 尚欠管理费：<fmt:formatNumber
                                                                value="${history.managementOweAmount}"
                                                                pattern="###,###,###,###,##0.00" /><br />
                                                        </c:if>
														<c:if test="${fn:startsWith(history.tableName, '/partybilling/')}"><!-- ${history.partyBillingAmount > 0} -->
															开票：<fmt:formatNumber
                                                                value="${history.partyBillingAmount}"
                                                                pattern="###,###,###,###,##0.00" /><br />销项税金：<fmt:formatNumber
                                                                value="${history.partyBillingOutputTaxAmount}"
                                                                pattern="###,###,###,###,##0.00" /><br />累计甲方开票：<fmt:formatNumber
                                                                value="${history.partyBillingTotalAmount}"
                                                                pattern="###,###,###,###,##0.00" /><br />
                                                        </c:if>
														<c:if test="${fn:startsWith(history.tableName, '/collections/')}"><!-- ${history.collectionsTotalAmount > 0} -->
															<%-- 收款：<fmt:formatNumber
                                                                value="${history.collectionsAmount}"
                                                                pattern="###,###,###,###,##0.00" />
                                                            <br /> --%>累计收款：<fmt:formatNumber
                                                                value="${history.collectionsTotalAmount}"
                                                                pattern="###,###,###,###,##0.00" /><br />回款率：<fmt:formatNumber
                                                                value="${history.collectionsRate}" pattern="0.00" />%<br />
														</c:if>
														<c:if test="${fn:startsWith(history.tableName, '/customerbilling/')}"><!-- ${history.customerBillingAmount > 0} -->
                                                            	开票：<fmt:formatNumber
                                                                value="${history.customerBillingAmount}"
                                                                pattern="###,###,###,###,##0.00" />
                                                            <br />进项税金：<fmt:formatNumber
                                                                value="${history.customerBillingInputTaxAmount}"
                                                                pattern="###,###,###,###,##0.00" />
                                                            <br />累计客户开票：<fmt:formatNumber
                                                                value="${history.customerBillingTotalAmount}"
                                                                pattern="###,###,###,###,##0.00" /><br />
                                                        </c:if>
														<c:if test="${fn:startsWith(history.tableName, '/payment/')}"><!-- ${history.paymentAmount > 0} -->
															<%-- 支付：<fmt:formatNumber
                                                                value="${history.paymentAmount}"
                                                                pattern="###,###,###,###,##0.00" />
                                                            <br /> --%>累计支付：<fmt:formatNumber value="${history.paymentTotalAmount}" pattern="###,###,###,###,##0.00" /><br />
                                                        </c:if>
														<c:if test="${fn:startsWith(history.tableName, '/project/') || fn:startsWith(history.tableName, '/contractchange/') || fn:startsWith(history.tableName, '/payment/')}"><!-- ${history.taxRealAmount > 0} -->
															税率：<fmt:formatNumber value="${history.taxRate}" />%<br />
															应缴税金：<fmt:formatNumber value="${history.taxPlanAmount}" pattern="###,###,###,###,##0.00" /><br />
                                                            <%-- <br /> 已缴税金：<fmt:formatNumber
                                                                value="${history.taxRealAmount}"
                                                                pattern="###,###,###,###,##0.00" /> --%>累计缴税金：<fmt:formatNumber value="${history.taxTotalAmount}" pattern="###,###,###,###,##0.00" /><br />
                                                            <%-- <br /> 尚欠税金：<fmt:formatNumber
                                                                value="${history.taxOweAmount}"
                                                                pattern="###,###,###,###,##0.00" /> --%>
                                                        </c:if>
														<c:if test="${fn:startsWith(history.tableName, '/arrears/')}"><!-- ${history.arrearsAmount > 0} -->
															往来欠款：<fmt:formatNumber value="${history.arrearsAmount}"
                                                                pattern="###,###,###,###,##0.00" />
                                                        </c:if>
													</td>
												<tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript">
function batchCheck(mid, pid){
	if(!confirm("此操作无法撤销，确定要批量审核吗？"))
	{
		return;
	}
	$.post("<s:url value='/api/batchcheck/'/>", {projectId: pid, modelId: mid}, 
    	function(r){
    		var ret = r.split('|');
    		if(ret[0] == "OK"){
    			self.location.href = ret[1];
    		}else{
    			alert("批量审核错误");
    		}
    	}, "text");
}

function repay(id, aa, ia){
	$("#myModal .modal-title").html("归还本金及利息");
	var str = "<div class=\"row\"><label class=\"col-sm-2 control-label\">本金</label><div class=\"col-sm-4\"><input id=\"repay_amount0\" class=\"form-control\" type=\"text\" value=\"" 
	+ -1*aa +"\"/><p class=\"help-block\" /></div></div> <div class=\"row\"><label class=\"col-sm-2 control-label\">利息</label><div class=\"col-sm-4 \"><input id=\"repay_amount1\" class=\"form-control\" type=\"text\" value=\"" 
	+ -1*ia + "\"/><p class=\"help-block\" /></div></div>";
	$("#myModalContent").html(str);
	$('#myModal').data("arrears-id", id);
	$("#myModal .btn-danger").off("click").on("click",function() {
		var aid = $('#myModal').data("arrears-id");
		if(aid != null){
	    	$.post("<s:url value='/api/repay/'/>" + aid +"/" + $("#repay_amount0").val() + "/" + $("#repay_amount1").val(), {},
	    			function(result) {
	    				//未提交成功，提示错误
	    				if(result.message != "OK"){
	    					alert(result.message);
	    					return;
	    				}
	    				self.location.reload();
	    				return;
	    			}, "json");
		}
		$('#myModal').modal("hide");
		var href = $("#myModal").data("href");
		if(href != null){
			self.location.replace(href);
		}
	});
	$('#myModal').modal('show');
}
function showDialog(arrearsId) {
	var rows = "";
	$.post("<s:url value='/api/getinterestdetail/'/>" + arrearsId, {},
			function(result) {
				var ic = 1;
				for (var i = 0; i < result.length -1; i++) {
					if(i == result.length - 2){
						// 最后一行
						rows += "<tr><td>"
							+ result[i+1].description + " = " + result[i+1].interestAmount
							+ "</td><td class=\"amount\">" + (ic+1) + "</td></tr>\r\n";
					}
					else if(result[i].interestAmount != result[i+1].interestAmount){
						rows += "<tr><td>"
								+ result[i].description + " = " + result[i].interestAmount
								+ "</td><td class=\"amount\">" + ic + "</td></tr>\r\n";
						ic = 1;
					}else{
						ic++;
					}
				}

				$("#myModal .modal-title").html("利息计算明细");
				var str = "<table width=\"70%\"border=\"0\"><tr><th>日息</th><th class=\"amount\">天数</th></tr>"
						+ rows + "</table>";
				$("#myModalContent").html(str);
				$("#myModal .btn-danger").off("click").on("click",function() {
					$('#myModal').modal("hide");
				});
				$('#myModal').modal('show');
			}, "json");

}
	$(function() {
		$("#contractChangeTotalAmount").text("<fmt:formatNumber value='${contractChangeTotalAmount}' pattern='###,###,###,###,##0.00' />");
		var partyBillingTotalAmount = "<fmt:formatNumber value='${partyBillingTotalAmount}' pattern='###,###,###,###,##0.00' />";
		var partyBillingTotalOutputTaxAmount = "<fmt:formatNumber value='${partyBillingTotalOutputTaxAmount}' pattern='###,###,###,###,##0.00' />";
		var partyBillingTotalInvoiceAmount = "<fmt:formatNumber value='${partyBillingTotalInvoiceAmount}' pattern='###,###,###,###,##0.00' />";
		var customerBillingTotalAmount = "<fmt:formatNumber value='${customerBillingTotalAmount}' pattern='###,###,###,###,##0.00' />";
		var customerBillingTotalInputTaxAmount = "<fmt:formatNumber value='${customerBillingTotalInputTaxAmount}' pattern='###,###,###,###,##0.00' />";
		var customerBillingTotalInvoiceAmount = "<fmt:formatNumber value='${customerBillingTotalInvoiceAmount}' pattern='###,###,###,###,##0.00' />";
		$("#partyBillingTotalAmount").text(partyBillingTotalAmount);
		$("#partyBillingTotalOutputTaxAmount").text(partyBillingTotalOutputTaxAmount);
		$("#partyBillingTotalInvoiceAmount").text(partyBillingTotalInvoiceAmount);
		$("#customerBillingTotalAmount").text(customerBillingTotalAmount);
		$("#customerBillingTotalInputTaxAmount").text(customerBillingTotalInputTaxAmount);
		$("#customerBillingTotalInvoiceAmount").text(customerBillingTotalInvoiceAmount);
		
		$("#collectionsTotalProjectAmount").text("<fmt:formatNumber value='${collectionsTotalProjectAmount}' pattern='###,###,###,###,##0.00' />");
		$("#collectionsTotalManagementAmount").text("<fmt:formatNumber value='${collectionsTotalManagementAmount}' pattern='###,###,###,###,##0.00' />");
		$("#collectionsTotalOtherAmount").text("<fmt:formatNumber value='${collectionsTotalOtherAmount}' pattern='###,###,###,###,##0.00' />");
		$("#collectionsTotalIncomeAmount").text("<fmt:formatNumber value='${collectionsTotalIncomeAmount}' pattern='###,###,###,###,##0.00' />");
		var paymentTotalAmount = "<fmt:formatNumber value='${paymentTotalAmount}' pattern='###,###,###,###,##0.00' />";
		$("#paymentTotalAmount").text(paymentTotalAmount);
		$("#arrearsOutputTotalAmount").text("<fmt:formatNumber value='${arrearsOutputTotalAmount}' pattern='###,###,###,###,##0.00' />");
		$("#arrearsInputTotalAmount").text("<fmt:formatNumber value='${arrearsInputTotalAmount}' pattern='###,###,###,###,##0.00' />");
		$("#profileTotalExpectedValueT").text("<fmt:formatNumber value='${profileTotalExpectedValueT}' pattern='###,###,###,###,##0.00' />");
		$("#profileTotalExpectedValueM2").text("<fmt:formatNumber value='${profileTotalExpectedValueM2}' pattern='###,###,###,###,##0.00' />");
		$.post("<s:url value='/api/capitaloccupied/${project.id}' />", {}, function(result) {
			$("#capitalOccupied").html(
					"${project.capitalOccupied == 1 ? '是' : '否'}，<span class=\"label label-info\">往来欠款累计：" + result + "</span>");
		}, "text");

		$.post("<s:url value='/api/projectdetail/${project.id}' />", {}, function(result) {
			if (result.indexOf('|') > 0) {
				var arr = result.split("|");
				$("#q1").html(arr[0]);
				// $("#q2").html(arr[1]);

				$("#j1").html(arr[2]);
				$("#j2").html(arr[3]);

				$("#k1").html(arr[4]);
				$("#k2").html(arr[5]);
				$("#k3").html(arr[6]);
				$("#k4").html(arr[7]);
				
			}
		}, "text");
		
		$(".nav-tabs li").click(function(){
			var selfurl = self.location.href;
			var url = selfurl.split('?')[0] + "?target=" + $(this).attr("target");
			$.post("<s:url value='/api/setlasturl'/>", {url: url});
		});

		
		$("#searchPartyBillingButton").click(function(){
			var searchText = $("#searchPartyBillingInput").val().trim();
			var totalAmount = 0;
			var totalOutputTaxAmount = 0;
			var totalInvoiceAmount = 0;
			var totalCount = 0;
			if(searchText){
				$("#partyBillingTable tbody tr").each(function(){
					var that = this;
					var text = $(that).find("td").eq(4).html();
					if(text){
						if(text.indexOf(searchText)>-1){
							$(that).show();
							totalCount++;
							var amount = $(that).find("td").eq(3).html().replace(/\,/g,"");
							var outputTaxamount = $(that).find("td").eq(5).html().replace(/\,/g,"");
							var invoiceamount = $(that).find("td").eq(6).html().replace(/\,/g,"");
							totalAmount= Number(totalAmount)+Number(amount);
							totalOutputTaxAmount= Number(totalOutputTaxAmount)+Number(outputTaxamount);
							totalInvoiceAmount= Number(totalInvoiceAmount)+Number(invoiceamount);
						}else{
							$(that).hide();
						}
					}else{
						$(that).hide();
					}
				});
				totalAmount = totalAmount.toFixed(2).replace(/\d{1,3}(?=(\d{3})+(\.\d*)?$)/g,'$&,');
				totalOutputTaxAmount = totalOutputTaxAmount.toFixed(2).replace(/\d{1,3}(?=(\d{3})+(\.\d*)?$)/g,'$&,');
				totalInvoiceAmount = totalInvoiceAmount.toFixed(2).replace(/\d{1,3}(?=(\d{3})+(\.\d*)?$)/g,'$&,');
			}else{
				$("#partyBillingTable tbody tr").show();
				totalAmount = paymentTotalAmount;
				totalCount = $("#partyBillingTable tbody tr").length;
			}
			$("#lPartyBilling").text(totalCount);
			$("#partyBillingTotalAmount").text(totalAmount);
			$("#partyBillingTotalOutputTaxAmount").text(totalOutputTaxAmount);
			$("#partyBillingTotalInvoiceAmount").text(totalInvoiceAmount);
		});

		
		$("#searchCustomerBillingButton").click(function(){
			var searchText = $("#searchCustomerBillingInput").val().trim();
			var totalAmount = 0;
			var totalInputTaxAmount = 0;
			var totalInvoiceAmount = 0;
			var totalCount = 0;
			if(searchText){
				$("#customerBillingTable tbody tr").each(function(){
					var that = this;
					var text = $(that).find("td").eq(4).html();
					if(text){
						if(text.indexOf(searchText)>-1){
							$(that).show();
							totalCount++;
							var amount = $(that).find("td").eq(3).html().replace(/\,/g,"");
							var inputTaxamount = $(that).find("td").eq(5).html().replace(/\,/g,"");
							var invoiceamount = $(that).find("td").eq(6).html().replace(/\,/g,"");
							totalAmount= Number(totalAmount)+Number(amount);
							totalInputTaxAmount= Number(totalInputTaxAmount)+Number(inputTaxamount);
							totalInvoiceAmount= Number(totalInvoiceAmount)+Number(invoiceamount);
						}else{
							$(that).hide();
						}
					}else{
						$(that).hide();
					}
				});
				totalAmount = totalAmount.toFixed(2).replace(/\d{1,3}(?=(\d{3})+(\.\d*)?$)/g,'$&,');
				totalInputTaxAmount = totalInputTaxAmount.toFixed(2).replace(/\d{1,3}(?=(\d{3})+(\.\d*)?$)/g,'$&,');
				totalInvoiceAmount = totalInvoiceAmount.toFixed(2).replace(/\d{1,3}(?=(\d{3})+(\.\d*)?$)/g,'$&,');
			}else{
				$("#customerBillingTable tbody tr").show();
				totalAmount = paymentTotalAmount;
				totalCount = $("#customerBillingTable tbody tr").length;
			}
			$("#lCustomerBilling").text(totalCount);
			$("#customerBillingTotalAmount").text(totalAmount);
			$("#customerBillingTotalInputTaxAmount").text(totalInputTaxAmount);
			$("#customerBillingTotalInvoiceAmount").text(totalInvoiceAmount);
		});
		
		$("#searchPaymentButton").click(function(){
			var searchText = $("#searchPaymentInput").val().trim();
			var totalAmount = 0;
			var totalCount = 0;
			if(searchText){
				$("#paymentTable tbody tr").each(function(){
					var that = this;
					var text = $(that).find("td").eq(7).html();
					if(text){
						if(text.indexOf(searchText)>-1){
							$(that).show();
							totalCount++;
							var amount = $(that).find("td").eq(4).html().replace(/\,/g,"");
							totalAmount= Number(totalAmount)+Number(amount);
						}else{
							$(that).hide();
						}
					}else{
						$(that).hide();
					}
				});
				totalAmount = totalAmount.toFixed(2).replace(/\d{1,3}(?=(\d{3})+(\.\d*)?$)/g,'$&,');
			}else{
				$("#paymentTable tbody tr").show();
				totalAmount = paymentTotalAmount;
				totalCount = $("#paymentTable tbody tr").length;
			}
			$("#lPayment").text(totalCount);
			$("#paymentTotalAmount").text(totalAmount);
		});
	});
</script>


<%@ include file="bottom.jsp"%>
