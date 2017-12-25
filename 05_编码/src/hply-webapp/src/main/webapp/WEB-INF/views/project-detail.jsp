<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

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
                                                <th rowspan="6" width="150px">项目信息</th>
                                                <th width="150px">项目编号</th>
                                                <td><c:out value="${projectSummary.projectCode}" /></td>
                                            </tr>
                                            <tr>
                                                <th>项目名称</th>
                                                <td><c:out value="${projectSummary.projectName}" /></td>
                                            </tr>
                                            <tr>
                                                <th>合同金额</th>
                                                <td><fmt:formatNumber value="${projectSummary.contractAmount}"
                                                        pattern="###,###,###,###,##0.00" /></td>
                                            </tr>
                                            <tr>
                                                <th>合同调增额</th>
                                                <td><fmt:formatNumber value="${projectSummary.changeAmount}"
                                                        pattern="###,###,###,###,##0.00" /></td>
                                            </tr>
                                            <tr>
                                                <th>累计调增额</th>
                                                <td><fmt:formatNumber value="${projectSummary.changeTotalAmount}"
                                                        pattern="###,###,###,###,##0.00" /></td>
                                            </tr>
                                            <tr>
                                                <th>合同结算额</th>
                                                <td><fmt:formatNumber value="${projectSummary.settlementAmount}"
                                                        pattern="###,###,###,###,##0.00" /></td>
                                            </tr>
                                            <tr>
                                                <th rowspan="5">管理费情况</th>
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
                                            <tr>
                                                <th>实收管理费</th>
                                                <td><fmt:formatNumber
                                                        value="${projectSummary.managementRealAmount}"
                                                        pattern="###,###,###,###,##0.00" /></td>
                                            </tr>
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
                                            <tr>
                                                <th rowspan="2">甲方开票情况</th>
                                                <th>发票金额</th>
                                                <td><fmt:formatNumber value="${projectSummary.partyBillingAmount}"
                                                        pattern="###,###,###,###,##0.00" /></td>
                                            </tr>
                                            <tr>

                                                <th>累计开票</th>
                                                <td><fmt:formatNumber
                                                        value="${projectSummary.partyBillingTotalAmount}"
                                                        pattern="###,###,###,###,##0.00" /></td>
                                            </tr>
                                            <tr>
                                                <th rowspan="2">收款情况</th>
                                                <th>收款金额</th>
                                                <td><fmt:formatNumber value="${projectSummary.collectionsAmount}"
                                                        pattern="###,###,###,###,##0.00" /></td>
                                            </tr>
                                            <tr>

                                                <th>累计收款</th>
                                                <td><fmt:formatNumber
                                                        value="${projectSummary.collectionsTotalAmount}"
                                                        pattern="###,###,###,###,##0.00" /></td>
                                            </tr>
                                            <tr>

                                                <th colspan="2">回收率</th>
                                                <td><fmt:formatNumber value="${projectSummary.collectionsRate}"
                                                        pattern="0.00" />%</td>
                                            </tr>
                                            <tr>
                                                <th rowspan="2">客户开票情况</th>
                                                <th>发票金额</th>
                                                <td><fmt:formatNumber
                                                        value="${projectSummary.customerBillingAmount}"
                                                        pattern="###,###,###,###,##0.00" /></td>
                                            </tr>
                                            <tr>

                                                <th>累计开票</th>
                                                <td><fmt:formatNumber
                                                        value="${projectSummary.customerBillingTotalAmount}"
                                                        pattern="###,###,###,###,##0.00" /></td>
                                            </tr>
                                            <tr>
                                                <th rowspan="2">支付工程款情况</th>
                                                <th>支付金额</th>
                                                <td><fmt:formatNumber value="${projectSummary.paymentAmount}"
                                                        pattern="###,###,###,###,##0.00" /></td>
                                            </tr>
                                            <tr>

                                                <th>累计</th>
                                                <td><fmt:formatNumber value="${projectSummary.paymentTotalAmount}"
                                                        pattern="###,###,###,###,##0.00" /></td>
                                            </tr>
                                            <tr>
                                                <th rowspan="5">税金情况</th>
                                                <th>比率</th>
                                                <td><fmt:formatNumber value="${projectSummary.taxRate}"
                                                        pattern="0.00" />%</td>
                                            </tr>
                                            <tr>

                                                <th>应缴税金</th>
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
                                            </tr>
                                            <tr>
                                                <th colspan="2">垫付资金</th>
                                                <td><fmt:formatNumber value="${projectSummary.arrearsAmount}"
                                                        pattern="###,###,###,###,##0.00" /></td>
                                            </tr>
                                            <tr>
                                                <th rowspan="2">型材（吨）</th>
                                                <th>预计用量</th>
                                                <td><fmt:formatNumber value="${projectSummary.expectedValue}"
                                                        pattern="###,###,###,###,##0.00" /></td>
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
                                            <p>
                                                往来欠款（本金）：<span id="q2">0000.00</span>
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
                                                工程款结存：<span id="k3">0000.00</span><br />已收工程款-累计付款
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
                                                        <c:out value="${project.isWithholdingOffsite}" />
                                                    </p>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <sf:label path="managementRate" cssClass="col-sm-2 control-label">管理费率</sf:label>
                                                <div class="col-sm-4">
                                                    <p class="form-control-static">
                                                        <fmt:formatNumber pattern="#,##0.00"
                                                            value="${project.managementRate}" />
                                                    </p>
                                                </div>
                                                <sf:label path="taxRate" cssClass="col-sm-2 control-label">税金比率</sf:label>
                                                <div class="col-sm-4">
                                                    <p class="form-control-static">
                                                        <fmt:formatNumber pattern="#,##0.00" value="${project.taxRate}" />
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
                                                <sf:label path="managementPlanAmount" cssClass="col-sm-2 control-label">应收管理费</sf:label>
                                                <div class="col-sm-4">
                                                    <p class="form-control-static">
                                                        <fmt:formatNumber pattern="#,##0.00"
                                                            value="${project.managementPlanAmount}" />
                                                    </p>
                                                </div>
                                                <sf:label path="taxPlanAmount" cssClass="col-sm-2 control-label">应缴税金</sf:label>
                                                <div class="col-sm-4">
                                                    <p class="form-control-static">
                                                        <fmt:formatNumber pattern="#,##0.00"
                                                            value="${project.taxPlanAmount}" />
                                                    </p>
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
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th></th>
                                                <th>#</th>
                                                <th>增补协议编号</th>
                                                <%--  <th class="amount">管理费率</th> --%>
                                                <th class="amount">增减金额</th>
                                                <th>登记人</th>
                                                <th>登记时间</th>
                                                <th>备注</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${lContractChange}" var="contractChange">
                                                <tr>
                                                    <td><span
                                                        class="glyphicon <c:out value="${contractChange.status != 1 ? 'glyphicon-file' : ''}" />"></span></td>
                                                    <td>&nbsp;</td>
                                                    <td><c:out value="${contractChange.csaCode}" /></td>
                                                    <%--      <td class="amount"><fmt:formatNumber
                                                            value="${contractChange.managementRate}" pattern="0.00" />%</td> --%>
                                                    <td class="amount"><fmt:formatNumber
                                                            value="${contractChange.changeAmount}"
                                                            pattern="###,###,###,###,##0.00" /></td>
                                                    <td><c:out value="${contractChange.createUser}" /></td>
                                                    <td><fmt:formatDate value="${contractChange.trice}"
                                                            pattern="yyyy-MM-dd" /></td>
                                                    <td><c:out value="${contractChange.description}" /></td>
                                            	</tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="tab-pane fade${target=='partybilling'?' in active':'' }" id="tab2default">
                                <!-- 甲方开票情况 -->

                                <div class="panel-body">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th></th>
                                                <th>#</th>
                                                <th>发票票号</th>
                                                <th class="amount">发票金额</th>
                                                <th>开票人</th>
                                                <th>开票时间</th>
                                                <th>审核情况</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${lPartyBilling}" var="partyBilling">
                                                <tr>
                                                    <td><span
                                                        class="glyphicon <c:out value="${partyBilling.status != 1 ? 'glyphicon-file' : ''}" />"></span></td>
                                                    <td>&nbsp;</td>
                                                    <td><c:out value="${partyBilling.invoiceCode}" /></td>
                                                    <td class="amount"><fmt:formatNumber
                                                            value="${partyBilling.amount}"
                                                            pattern="###,###,###,###,##0.00" /></td>
                                                    <td><c:out value="${partyBilling.createUser}" /></td>
                                                    <td><fmt:formatDate value="${partyBilling.trice}"
                                                            pattern="yyyy-MM-dd" /></td>
                                                    <td><c:if test="${empty partyBilling.step1Time}">未审核</c:if> <c:if
                                                            test="${not empty partyBilling.step1Time}">${partyBilling.step1User}：${partyBilling.step1Idea}，
                                    <fmt:formatDate value="${partyBilling.step1Time}" pattern="yyyy-MM-dd" />
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
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th></th>
                                                <th>#</th>
                                                <th>发票票号</th>
                                                <th>发票类别</th>
                                                <th class="amount">发票金额</th>
                                                <th>创建用户</th>
                                                <th>开票时间</th>
                                                <th>备注</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${lCustomerBilling}" var="customerBilling">
                                                <tr>
                                                    <td><span
                                                        class="glyphicon <c:out value="${customerBilling.status != 1 ? 'glyphicon-file' : ''}" />"></span></td>
                                                    <td>&nbsp;</td>
                                                    <td><c:out value="${customerBilling.invoiceCode}" /></td>
                                                    <td><c:out value="${customerBilling.invoiceType}" /></td>
                                                    <td class="amount"><fmt:formatNumber
                                                            value="${customerBilling.amount}"
                                                            pattern="###,###,###,###,##0.00" /></td>
                                                    <td><c:out value="${customerBilling.createUser}" /></td>
                                                    <td><fmt:formatDate value="${customerBilling.trice}"
                                                            pattern="yyyy-MM-dd" /></td>
                                                    <td><c:out value="${customerBilling.description}" /></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="tab-pane fade${target=='collections'?' in active':'' }" id="tab4default">
                                <!-- 收款情况 -->
                                <div class="panel-body">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th></th>
                                                <th>#</th>
                                                <th>凭证号</th>
                                                <th>款项来源</th>
                                                <th>收款方式</th>
                                                <th class="amount">收款金额</th>
                                                <th>收款人</th>
                                                <th>收款时间</th>
                                                <th>备注</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${lCollections}" var="collections">
                                                <tr>
                                                    <td><span
                                                        class="glyphicon <c:out value="${collections.status != 1 ? 'glyphicon-file' : ''}" />"></span></td>
                                                    <td>&nbsp;</td>
                                                    <td><c:out value="${collections.ticketCode}" /></td>
                                                    <td><c:out value="${collections.sourceOf}" /></td>
                                                    <td><c:out value="${collections.paymentType}" /></td>
                                                    <td class="amount"><fmt:formatNumber
                                                            value="${collections.amount}"
                                                            pattern="###,###,###,###,##0.00" /></td>
                                                    <td><c:out value="${collections.createUser}" /></td>
                                                    <td><fmt:formatDate value="${collections.trice}"
                                                            pattern="yyyy-MM-dd" /></td>
                                                    <td><c:out value="${collections.description}" /></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="tab-pane fade${target=='payment'?' in active':'' }" id="tab5default">
                                <!-- 付款情况 -->
                                <div class="panel-body">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th></th>
                                                <th>#</th>
                                                <th>凭证号</th>
                                                <th>付款科目</th>
                                                <th>支付方式</th>
                                                <th class="amount">付款金额</th>
                                                <th>付款人</th>
                                                <th>付款时间</th>
                                                <th>备注</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${lPayment}" var="payment">
                                                <tr>
                                                    <td><span
                                                        class="glyphicon <c:out value="${payment.status != 1 ? 'glyphicon-file' : ''}" />"></span></td>
                                                    <td>&nbsp;</td>
                                                    <td><c:out value="${payment.ticketCode}" /></td>
                                                    <td><c:out value="${payment.paymentItemId}" /></td>
                                                    <td><c:out value="${payment.payType}" /></td>
                                                    <td class="amount"><fmt:formatNumber value="${payment.amount}"
                                                            pattern="###,###,###,###,##0.00" /></td>
                                                    <td><c:out value="${payment.createUser}" /></td>
                                                    <td><fmt:formatDate value="${payment.trice}"
                                                            pattern="yyyy-MM-dd" /></td>
                                                    <td><c:out value="${payment.description}" /></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="tab-pane fade${target=='arrears'?' in active':'' }" id="tab6default">
                                <!-- 往来欠款 -->
                                <div class="panel-body">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th></th>
                                                <th>#</th>
                                                <th>凭证号</th>
                                                <th>款项分类</th>
                                                <th class="amount">借出金额</th>
                                                <th class="amount">还入金额</th>
                                                <th>支付方式</th>
                                                <th>登记人</th>
                                                <th>登记时间</th>
                                                <th>备注</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${lArrears}" var="arrears">
                                                <tr>
                                                    <td><span
                                                        class="glyphicon <c:out value="${arrears.status != 1 ? 'glyphicon-file' : ''}" />"></span></td>
                                                    <td>&nbsp;</td>
                                                    <td><c:out value="${arrears.arrearsCode}" /></td>
                                                    <td><c:out value="${arrears.arrearsType}" /></td>
                                                    <td class="amount"><c:if test="${arrears.amount < 0}">
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
                                                    <td class="amount"><c:if test="${arrears.amount > 0}">
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
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="tab-pane fade${target=='profile'?' in active':'' }" id="tab7default">
                                <!-- 型材 -->
                                <div class="panel-body">
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
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${lProfile}" var="profile">
                                                <tr>
                                                    <td><span
                                                        class="glyphicon <c:out value="${profile.status != 1 ? 'glyphicon-file' : ''}" />"></span></td>
                                                    <td>&nbsp;</td>
                                                    <td class="amount"><fmt:formatNumber
                                                            value="${profile.expectedValue}"
                                                            pattern="###,###,###,###,##0.00" /></td>
                                                    <td><c:out value="${profile.profilePoint}" /></td>
                                                    <td><c:out value="${profile.createUser}" /></td>
                                                    <td><fmt:formatDate value="${profile.trice}"
                                                            pattern="yyyy-MM-dd" /></td>
                                                    <td><c:out value="${profile.description}" /></td>
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
                                            <c:forEach items="${lHistory}" var="history">
                                                <tr>
                                                    <td>&nbsp;</td>
                                                    <td><fmt:formatDate value="${history.trice}"
                                                            pattern="yyyy/MM/dd HH:mm" /></td>
                                                    <td>${history.field01}</td>
                                                    <td>${history.description}</td>
                                                    <td><c:if
                                                            test="${fn:startsWith(history.tableName, '/project/')}">
合同额：<fmt:formatNumber value="${history.contractAmount}" pattern="###,###,###,###,##0.00" />
                                                            <c:if test="${history.settlementAmount > 0 }">
                                                                <br />结算：<fmt:formatNumber
                                                                    value="${history.settlementAmount}"
                                                                    pattern="###,###,###,###,##0.00" />
                                                            </c:if>
                                                            <br />管理费率：<fmt:formatNumber
                                                                value="${history.managementRate}"
                                                                pattern="###,###,###,###,##0.00" />%<br /> 应收管理费：<fmt:formatNumber
                                                                value="${history.managementPlanAmount}"
                                                                pattern="###,###,###,###,##0.00" />
                                                            <br />税率：<fmt:formatNumber
                                                                value="${history.managementRate}"
                                                                pattern="###,###,###,###,##0.00" />% <br /> 应收税金：<fmt:formatNumber
                                                                value="${history.taxPlanAmount}"
                                                                pattern="###,###,###,###,##0.00" />
                                                        </c:if> <c:if test="${history.changeAmount > 0}">
                                                            调增：<fmt:formatNumber value="${history.changeAmount}"
                                                                pattern="###,###,###,###,##0.00" />
                                                            <br />累计调增：<fmt:formatNumber
                                                                value="${history.changeTotalAmount}"
                                                                pattern="###,###,###,###,##0.00" />
                                                        </c:if> <c:if test="${history.managementRealAmount > 0}">
                                                        管理费率：<fmt:formatNumber value="${history.managementRate}"
                                                                pattern="###,###,###,###,##0.00" />%<br /> 应收管理费：<fmt:formatNumber
                                                                value="${history.managementPlanAmount}"
                                                                pattern="###,###,###,###,##0.00" />
                                                            <br /> 实收管理费：<fmt:formatNumber
                                                                value="${history.managementRealAmount}"
                                                                pattern="###,###,###,###,##0.00" />
                                                            <br /> 累计管理费：<fmt:formatNumber
                                                                value="${history.managementTotalAmount}"
                                                                pattern="###,###,###,###,##0.00" />
                                                            <br /> 尚欠管理费：<fmt:formatNumber
                                                                value="${history.managementOweAmount}"
                                                                pattern="###,###,###,###,##0.00" />
                                                        </c:if> <c:if test="${history.partyBillingAmount > 0}">开票：<fmt:formatNumber
                                                                value="${history.partyBillingAmount}"
                                                                pattern="###,###,###,###,##0.00" />
                                                            <br />累计：<fmt:formatNumber
                                                                value="${history.partyBillingTotalAmount}"
                                                                pattern="###,###,###,###,##0.00" />
                                                        </c:if> <c:if test="${history.collectionsAmount > 0}">收款：<fmt:formatNumber
                                                                value="${history.collectionsAmount}"
                                                                pattern="###,###,###,###,##0.00" />
                                                            <br />累计：<fmt:formatNumber
                                                                value="${history.collectionsTotalAmount}"
                                                                pattern="###,###,###,###,##0.00" />
                                                            <br />回款率：<fmt:formatNumber
                                                                value="${history.collectionsRate}" pattern="0.00" />%</c:if> <c:if
                                                            test="${history.customerBillingAmount > 0}">开票：<fmt:formatNumber
                                                                value="${history.customerBillingAmount}"
                                                                pattern="###,###,###,###,##0.00" />
                                                            <br />累计：<fmt:formatNumber
                                                                value="${history.customerBillingTotalAmount}"
                                                                pattern="###,###,###,###,##0.00" />
                                                        </c:if> <c:if test="${history.paymentAmount > 0}">支付：<fmt:formatNumber
                                                                value="${history.paymentAmount}"
                                                                pattern="###,###,###,###,##0.00" />
                                                            <br />累计：<fmt:formatNumber
                                                                value="${history.paymentTotalAmount}"
                                                                pattern="###,###,###,###,##0.00" />
                                                        </c:if> <c:if test="${history.taxRealAmount > 0}"><br />税率：<fmt:formatNumber
                                                                value="${history.taxRate}" pattern="0.00" />%
                                                            <br /> 应收税金：<fmt:formatNumber
                                                                value="${history.taxPlanAmount}"
                                                                pattern="###,###,###,###,##0.00" />
                                                            <br /> 已缴税金：<fmt:formatNumber
                                                                value="${history.taxRealAmount}"
                                                                pattern="###,###,###,###,##0.00" />
                                                            <br /> 累计缴税金：<fmt:formatNumber
                                                                value="${history.taxTotalAmount}"
                                                                pattern="###,###,###,###,##0.00" />
                                                            <br /> 尚欠税金：<fmt:formatNumber
                                                                value="${history.taxOweAmount}"
                                                                pattern="###,###,###,###,##0.00" />
                                                        </c:if> <c:if test="${history.arrearsAmount > 0}">
                                                            <fmt:formatNumber value="${history.arrearsAmount}"
                                                                pattern="###,###,###,###,##0.00" />
                                                        </c:if></td>
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
	$('#myModal').data("arrears-id", id).modal('show');
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
				$('#myModal').modal('show');
			}, "json");

}
	$(function() {
		$.post("<s:url value='/api/capitaloccupied/${project.id}' />", {}, function(result) {
			$("#capitalOccupied").html(
					"${project.capitalOccupied == 1 ? '是' : '否'}，<span class=\"label label-info\">往来欠款累计：" + result + "</span>");
		}, "text");

		$.post("<s:url value='/api/projectdetail/${project.id}' />", {}, function(result) {
			if (result.indexOf('|') > 0) {
				var arr = result.split("|");
				$("#q1").html(arr[0]);
				$("#q2").html(arr[1]);

				$("#j1").html(arr[2]);
				$("#j2").html(arr[3]);

				$("#k1").html(arr[4]);
				$("#k2").html(arr[5]);
				$("#k3").html(arr[6]);

			}
		}, "text");
		
		$(".nav-tabs li").click(function(){
			var selfurl = self.location.href;
			var url = selfurl.split('?')[0] + "?target=" + $(this).attr("target");
			$.post("<s:url value='/api/setlasturl'/>", {url: url});
		});
	});
</script>


<%@ include file="bottom.jsp"%>
