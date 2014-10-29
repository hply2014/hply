﻿<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="container main">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <strong>${page_title}</strong>
        </div>
        <div class="panel-body">
            <div class="btn-toolbar" role="toolbar">
                <div class="btn-group">
                    <a href="<s:url value="/project" />" class="btn btn-info"><span
                        class="glyphicon glyphicon-share-alt"></span> 返 回 </a>
                </div>

                <shiro:hasPermission name="`project_modify`">
                    <div class="btn-group">
                        <a
                            href="<s:url value="/project/modify/{id}"><s:param name="id" value="${project.id }" /></s:url>"
                            class="btn btn-info"><span class="glyphicon glyphicon-pencil"></span> 修 改 </a>
                    </div>
                </shiro:hasPermission>
            </div>

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
                                    <fmt:formatNumber pattern="#,##0.00" value="${project.managementRate}" />
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
                                    <fmt:formatNumber pattern="#,##0.00" value="${project.contractAmount}" />
                                </p>
                            </div>
                            <sf:label path="settlementAmount" cssClass="col-sm-2 control-label">结算金额</sf:label>
                            <div class="col-sm-4">
                                <p class="form-control-static">
                                    <fmt:formatNumber pattern="#,##0.00" value="${project.settlementAmount}" />
                                </p>
                            </div>
                        </div>

                        <div class="row">
                            <sf:label path="dutyPaidTime" cssClass="col-sm-2 control-label">印花税上交时间</sf:label>
                            <div class="col-sm-4">
                                <p class="form-control-static">
                                    <fmt:formatDate value="${project.dutyPaidTime}" pattern="yyyy-MM-dd" />
                                </p>
                            </div>
                            <sf:label path="dutyPaidAmount" cssClass="col-sm-2 control-label">印花税上交金额</sf:label>
                            <div class="col-sm-4">
                                <p class="form-control-static">
                                    <fmt:formatNumber pattern="#,##0.00" value="${project.dutyPaidAmount}" />
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
                                    <fmt:formatNumber pattern="#,##0.00" value="${project.managementPlanAmount}" />
                                </p>
                            </div>
                            <sf:label path="taxPlanAmount" cssClass="col-sm-2 control-label">应缴税金</sf:label>
                            <div class="col-sm-4">
                                <p class="form-control-static">
                                    <fmt:formatNumber pattern="#,##0.00" value="${project.taxPlanAmount}" />
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
                                    <fmt:formatDate value="${project.createTime}" pattern="yyyy-MM-dd" />
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
                                    <fmt:formatDate value="${project.updateTime}" pattern="yyyy-MM-dd" />
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
