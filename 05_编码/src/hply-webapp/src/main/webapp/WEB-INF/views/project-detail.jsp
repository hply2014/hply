<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="container main">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <strong>${page_title}</strong>
        </div>
        <div class="panel-body">
            <div class="btn-toolbar" role="toolbar">
                <div class="btn-group">
                    <a href="<s:url value="/project" />" class="btn btn-default"><span
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
                            <li ${target=='summary'?'class="active"':'' }><a href="#tab0default" data-toggle="tab">总览信息</a></li>
                            <li ${target=='project'?'class="active"':'' }><a href="#tab1default" data-toggle="tab">合同项目信息</a></li>
                            <li ${target=='contractchange'?'class="active"':'' }><a href="#tab1xdefault" data-toggle="tab">补充协议</a></li>
                            <li ${target=='partybilling'?'class="active"':'' }><a href="#tab2default" data-toggle="tab">甲方开票情况</a></li>
                            <li ${target=='customerbilling'?'class="active"':'' }><a href="#tab3default" data-toggle="tab">客户开票情况</a></li>
                            <li ${target=='collections'?'class="active"':'' }><a href="#tab4default" data-toggle="tab">收款情况</a></li>
                            <li ${target=='payment'?'class="active"':'' }><a href="#tab5default" data-toggle="tab">付款情况</a></li>
                            <li ${target=='arrears'?'class="active"':'' }><a href="#tab6default" data-toggle="tab">往来欠款</a></li>
                            <li ${target=='profile'?'class="active"':'' }><a href="#tab7default" data-toggle="tab">型材</a></li>
                        </ul>
                    </div>

                    <div class="panel-body">
                        <div class="tab-content">
                            <div class="tab-pane fade${target=='summary'?' in active':'' }" id="tab0default">
                                <!-- 总览信息 -->
                                <table class="table">
                                    <tr>
                                        <th colspan="2">更新时间</th>
                                        <td><fmt:formatDate value="${projectSummary.trice}" pattern="yyyy-MM-dd" /></td>
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
                                        <td><fmt:formatNumber value="${projectSummary.managementPlanAmount}"
                                                pattern="###,###,###,###,##0.00" /></td>
                                    </tr>
                                    <tr>
                                        <th>实收管理费</th>
                                        <td><fmt:formatNumber value="${projectSummary.managementRealAmount}"
                                                pattern="###,###,###,###,##0.00" /></td>
                                    </tr>
                                    <tr>
                                        <th>累计收管理费</th>
                                        <td><fmt:formatNumber value="${projectSummary.managementTotalAmount}"
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
                                        <td><fmt:formatNumber value="${projectSummary.partyBillingTotalAmount}"
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
                                        <td><fmt:formatNumber value="${projectSummary.collectionsTotalAmount}"
                                                pattern="###,###,###,###,##0.00" /></td>
                                    </tr>
                                    <tr>

                                        <th>回收率</th>
                                        <td><fmt:formatNumber value="${projectSummary.collectionsRate}"
                                                pattern="0.00" />%</td>
                                    </tr>
                                    <tr>
                                        <th rowspan="2">客户开票情况</th>
                                        <th>发票金额</th>
                                        <td><fmt:formatNumber value="${projectSummary.customerBillingAmount}"
                                                pattern="###,###,###,###,##0.00" /></td>
                                    </tr>
                                    <tr>

                                        <th>累计开票</th>
                                        <td><fmt:formatNumber value="${projectSummary.customerBillingTotalAmount}"
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
                                        <td><fmt:formatNumber value="${projectSummary.taxRate}" pattern="0.00" />%</td>
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
                                                <sf:label path="partyAddress" cssClass="col-sm-2 control-label">甲方地址</sf:label>
                                                <div class="col-sm-4">
                                                    <p class="form-control-static">
                                                        <c:out value="${project.partyAddress}" />
                                                    </p>
                                                </div>
                                                <sf:label path="manager" cssClass="col-sm-2 control-label">项目经理</sf:label>
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
                                    <div class="btn-toolbar" role="toolbar">
                                        <shiro:hasPermission name="`contractchange_create`">
                                            <div class="btn-group">
                                                <a href="<c:url value="/contractchange/create?projectid=${projectId}" />" class="btn btn-info"><span
                                                    class="glyphicon glyphicon-plus"></span> 新 建 </a>
                                            </div>
                                        </shiro:hasPermission>
                                    </div>

                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th></th>
                                                <th>#</th>
                                                <th>增补协议编号</th>
                                                <th class="amount">管理费率</th>
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
                                                    <td><c:out
                                                                value="${contractChange.csaCode}" /></td>
                                                    <td class="amount"><fmt:formatNumber
                                                            value="${contractChange.managementRate}" pattern="0.00" />%</td>
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
                                    <div class="btn-toolbar" role="toolbar">
                                        <shiro:hasPermission name="`partybilling_create`">
                                            <div class="btn-group">
                                                <a href="<c:url value="/partybilling/create?projectid=${projectId}" />" class="btn btn-info"><span
                                                    class="glyphicon glyphicon-plus"></span> 新 建 </a>
                                            </div>
                                        </shiro:hasPermission>
                                    </div>

                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th></th>
                                                <th>#</th>
                                                <th>发票票号</th>
                                                <th class="amount">税率</th>
                                                <th class="amount">发票金额</th>
                                                <th>开票人</th>
                                                <th>开票时间</th>
                                                <th>审核情况</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${lPartyBilling}" var="partyBilling">
                                                <tr>
                                                    <td><span
                                                        class="glyphicon <c:out value="${partyBilling.status != 1 ? 'glyphicon-file' : ''}" />"></span></td>
                                                    <td>&nbsp;</td>
                                                    <td><c:out
                                                                value="${partyBilling.invoiceCode}" /></td>
                                                    <td class="amount"><fmt:formatNumber
                                                            value="${partyBilling.taxRate}" pattern="0.00" />%</td>
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
                                                    <td><c:if test="${ partyBilling.stepStatus != 1 }">
                                                            <shiro:hasPermission name="`partybilling_step1`">
                                                                <a
                                                                    href="<s:url value="/partybilling/step1/{id}"><s:param name="id" value="${partyBilling.id }" /></s:url>">审核</a>
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
                                                <a href="<c:url value="/customerbilling/create?projectid=${projectId}" />" class="btn btn-info"><span
                                                    class="glyphicon glyphicon-plus"></span> 新 建 </a>
                                            </div>
                                        </shiro:hasPermission>
                                    </div>

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
                                    <div class="btn-toolbar" role="toolbar">
                                        <shiro:hasPermission name="`collections_create`">
                                            <div class="btn-group">
                                                <a href="<c:url value="/collections/create?projectid=${projectId}" />" class="btn btn-info"><span
                                                    class="glyphicon glyphicon-plus"></span> 新 建 </a>
                                            </div>
                                        </shiro:hasPermission>
                                    </div>

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
                                                    <%--
                            <td><c:if test="${collections.status == 1 }">
                                    <shiro:hasPermission name="`collections_modify`">
                                        <a
                                            href="<s:url value="/collections/modify/{id}"><s:param name="id" value="${collections.id }" /></s:url>">修改</a>
                                    </shiro:hasPermission>
                                </c:if> <c:if test="${collections.status != 1 }">
                                    <shiro:hasPermission name="`collections_create`">
                                        <a
                                            href="<s:url value="/collections/modify/{id}"><s:param name="id" value="${collections.id }" /></s:url>">修改</a>
                                    </shiro:hasPermission>
                                </c:if> <shiro:hasPermission name="`collections_delete`">
                                    <a class="delete"
                                        data-confirm-message="收款情况数据：<c:out value="${collections.id}" />，将被永久删除，操作不可撤销，是否确认？"
                                        href="<s:url value="/collections/delete/{id}"><s:param name="id" value="${collections.id }" /></s:url>">删除</a>
                                </shiro:hasPermission></td> --%>
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
                                                <a href="<c:url value="/payment/create?projectid=${projectId}" />" class="btn btn-info"><span
                                                    class="glyphicon glyphicon-plus"></span> 新 建 </a>
                                            </div>
                                        </shiro:hasPermission>
                                    </div>

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
                                                    <%--
				<td><c:if test="${payment.status == 1 }">
									<shiro:hasPermission name="`payment_modify`">
										<a
											href="<s:url value="/payment/modify/{id}"><s:param name="id" value="${payment.id }" /></s:url>">修改</a>
									</shiro:hasPermission>
								</c:if>
								<c:if test="${payment.status != 1 }">
									<shiro:hasPermission name="`payment_create`">
										<a
											href="<s:url value="/payment/modify/{id}"><s:param name="id" value="${payment.id }" /></s:url>">修改</a>
									</shiro:hasPermission>
								</c:if> <shiro:hasPermission name="`payment_delete`">
									<a class="delete"
										data-confirm-message="付款情况数据：<c:out value="${payment.id}" />，将被永久删除，操作不可撤销，是否确认？"
										href="<s:url value="/payment/delete/{id}"><s:param name="id" value="${payment.id }" /></s:url>">删除</a>
								</shiro:hasPermission>

</td> --%>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="tab-pane fade${target=='arrears'?' in active':'' }" id="tab6default">
                                <!-- 往来欠款 -->
                                <div class="panel-body">
                                    <div class="btn-toolbar" role="toolbar">
                                        <div class="btn-group">
                                            <a href="<c:url value="/arrears/create?projectid=${projectId}" />" class="btn btn-info"><span
                                                class="glyphicon glyphicon-plus"></span> 新 建 </a>
                                        </div>
                                    </div>

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
                                                    <%--
				<td><a
					href="<s:url value="/arrears/modify/{id}"><s:param name="id" value="${arrears.id }" /></s:url>">修改</a>
					| <a class="delete" data-confirm-message="删除后不可恢复，您确认要删除【<c:out value="${arrears.id}" />】么？"
					href="<s:url value="/arrears/delete/{id}"><s:param name="id" value="${arrears.id }" /></s:url>">删除</a></td> --%>
                                                </tr>
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
                                                <a href="<c:url value="/profile/create?projectid=${projectId}" />" class="btn btn-info"><span
                                                    class="glyphicon glyphicon-plus"></span> 新 建 </a>
                                            </div>
                                        </shiro:hasPermission>
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
                                                    <%--      <td><c:if test="${profile.status == 1 }">
                                    <shiro:hasPermission name="`profile_modify`">
                                        <a
                                            href="<s:url value="/profile/modify/{id}"><s:param name="id" value="${profile.id }" /></s:url>">修改</a>
                                    </shiro:hasPermission>
                                </c:if> <c:if test="${profile.status != 1 }">
                                    <shiro:hasPermission name="`profile_create`">
                                        <a
                                            href="<s:url value="/profile/modify/{id}"><s:param name="id" value="${profile.id }" /></s:url>">修改</a>
                                    </shiro:hasPermission>
                                </c:if> <shiro:hasPermission name="`profile_delete`">
                                    <a class="delete"
                                        data-confirm-message="型材数据：<c:out value="${profile.id}" />，将被永久删除，操作不可撤销，是否确认？"
                                        href="<s:url value="/profile/delete/{id}"><s:param name="id" value="${profile.id }" /></s:url>">删除</a>
                                </shiro:hasPermission></td> --%>
                                                </tr>
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
	$(function() {
		$.post("<s:url value='/api/capitaloccupied/${project.id}' />", {}, function(result) {
			$("#capitalOccupied").html(
					"${project.capitalOccupied == 1 ? '是' : '否'}，<span class=\"label label-info\">往来欠款累计：" + result + "</span>");
		}, "text");
	});
</script>


<%@ include file="bottom.jsp"%>
