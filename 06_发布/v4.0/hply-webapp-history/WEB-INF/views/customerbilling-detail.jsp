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
                    <a href="<s:url value="/customerbilling" />" class="btn btn-info"><span
                        class="glyphicon glyphicon-share-alt"></span> 返 回 </a>
                </div>
            </div>

            <sf:form modelAttribute="customerBilling" cssClass="form-horizontal" role="form">
                <div class="form-group">
                    <sf:label path="projectId" cssClass="col-sm-2 control-label">项目ID</sf:label>
                    <div class="col-sm-10">
                        <p class="form-control-static">
                            <c:out value="${customerBilling.projectId}" />
                        </p>
                    </div>
                </div>

                <div class="form-group">
                    <sf:label path="invoiceCode" cssClass="col-sm-2 control-label">发票票号</sf:label>
                    <div class="col-sm-10">
                        <p class="form-control-static">
                            <c:out value="${customerBilling.invoiceCode}" />
                        </p>
                    </div>
                </div>

                <div class="form-group">
                    <sf:label path="invoiceType" cssClass="col-sm-2 control-label">发票类别</sf:label>
                    <div class="col-sm-10">
                        <p class="form-control-static">
                            <c:out value="${customerBilling.invoiceType}" />
                        </p>
                    </div>
                </div>

                <div class="form-group">
                    <sf:label path="amount" cssClass="col-sm-2 control-label">发票金额</sf:label>
                    <div class="col-sm-10">
                        <p class="form-control-static">
                            <fmt:formatNumber pattern="#,##0.00" value="${customerBilling.amount}" />
                        </p>
                    </div>
                </div>

                <div class="form-group">
                    <sf:label path="trice" cssClass="col-sm-2 control-label">开票时间</sf:label>
                    <div class="col-sm-10">
                        <p class="form-control-static">
                            <fmt:formatDate value="${customerBilling.trice}" pattern="yyyy-MM-dd" />
                        </p>
                    </div>
                </div>

                <div class="form-group">
                    <sf:label path="createTime" cssClass="col-sm-2 control-label">创建时间</sf:label>
                    <div class="col-sm-10">
                        <p class="form-control-static">
                            <fmt:formatDate value="${customerBilling.createTime}" pattern="yyyy-MM-dd" />
                        </p>
                    </div>
                </div>

                <div class="form-group">
                    <sf:label path="createUser" cssClass="col-sm-2 control-label">创建用户</sf:label>
                    <div class="col-sm-10">
                        <p class="form-control-static">
                            <c:out value="${customerBilling.createUser}" />
                        </p>
                    </div>
                </div>

                <div class="form-group">
                    <sf:label path="updateTime" cssClass="col-sm-2 control-label">修改时间</sf:label>
                    <div class="col-sm-10">
                        <p class="form-control-static">
                            <fmt:formatDate value="${customerBilling.updateTime}" pattern="yyyy-MM-dd" />
                        </p>
                    </div>
                </div>

                <div class="form-group">
                    <sf:label path="updateUser" cssClass="col-sm-2 control-label">修改用户</sf:label>
                    <div class="col-sm-10">
                        <p class="form-control-static">
                            <c:out value="${customerBilling.updateUser}" />
                        </p>
                    </div>
                </div>

                <div class="form-group">
                    <sf:label path="description" cssClass="col-sm-2 control-label">备注</sf:label>
                    <div class="col-sm-10">
                        <p class="form-control-static">
                            <c:out value="${customerBilling.description}" />
                        </p>
                    </div>
                </div>

            </sf:form>
        </div>
    </div>
</div>
<%@ include file="bottom.jsp"%>
