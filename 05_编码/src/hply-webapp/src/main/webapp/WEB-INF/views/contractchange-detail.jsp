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
                    <a href="<s:url value="/contractchange" />" class="btn btn-info"><span
                        class="glyphicon glyphicon-share-alt"></span> 返 回 </a>
                </div>
                <shiro:hasPermission name="`contractchange_modify`">
                    <div class="btn-group">
                        <a
                            href="<s:url value="/contractchange/modify/{id}"><s:param name="id" value="${contractChange.id }" /></s:url>"
                            class="btn btn-info"><span class="glyphicon glyphicon-pencil"></span> 修 改 </a>
                    </div>
                </shiro:hasPermission>
                <shiro:hasPermission name="`contractchange_delete`">
                    <div class="btn-group">
                        <a data-confirm-message="合同补充协议数据：<c:out value="${contractChange.id}" />，将被永久删除，操作不可撤销，是否确认？"
                            href="<s:url value="/contractchange/delete/{id}"><s:param name="id" value="${contractChange.id }" /></s:url>"
                            class="btn btn-info delete"><span class="glyphicon glyphicon-trash"></span> 删 除 </a>
                    </div>
                </shiro:hasPermission>
            </div>

            <sf:form modelAttribute="contractChange" cssClass="form-horizontal" role="form">
                <div class="form-group">
                    <sf:label path="csaCode" cssClass="col-sm-2 control-label">增补协议编号</sf:label>
                    <div class="col-sm-10">
                        <p class="form-control-static">
                            <c:out value="${contractChange.csaCode}" />
                        </p>
                    </div>
                </div>
                <div class="form-group">
                    <sf:label path="projectId" cssClass="col-sm-2 control-label">项目名称</sf:label>
                    <div class="col-sm-10">
                        <p class="form-control-static">
                            <c:out value="${contractChange.projectId}" />
                        </p>
                    </div>
                </div>


                <div class="form-group">
                    <sf:label path="managementRate" cssClass="col-sm-2 control-label">管理费率</sf:label>
                    <div class="col-sm-10">
                        <p class="form-control-static">
                            <fmt:formatNumber pattern="#,##0.00" value="${contractChange.managementRate}" />%
                        </p>
                    </div>
                </div>

                <div class="form-group">
                    <sf:label path="changeAmount" cssClass="col-sm-2 control-label">增减金额</sf:label>
                    <div class="col-sm-10">
                        <p class="form-control-static">
                            <fmt:formatNumber pattern="#,##0.00" value="${contractChange.changeAmount}" />
                        </p>
                    </div>
                </div>

                <div class="form-group">
                    <sf:label path="trice" cssClass="col-sm-2 control-label">增补时间</sf:label>
                    <div class="col-sm-10">
                        <p class="form-control-static">
                            <fmt:formatDate value="${contractChange.trice}" pattern="yyyy-MM-dd HH:mm:ss" />
                        </p>
                    </div>
                </div>

                <div class="form-group">
                    <sf:label path="createTime" cssClass="col-sm-2 control-label">创建时间</sf:label>
                    <div class="col-sm-10">
                        <p class="form-control-static">
                            <fmt:formatDate value="${contractChange.createTime}" pattern="yyyy-MM-dd HH:mm:ss" />
                        </p>
                    </div>
                </div>

                <div class="form-group">
                    <sf:label path="createUser" cssClass="col-sm-2 control-label">创建用户</sf:label>
                    <div class="col-sm-10">
                        <p class="form-control-static">
                            <c:out value="${contractChange.createUser}" />
                        </p>
                    </div>
                </div>

                <div class="form-group">
                    <sf:label path="updateTime" cssClass="col-sm-2 control-label">修改时间</sf:label>
                    <div class="col-sm-10">
                        <p class="form-control-static">
                            <fmt:formatDate value="${contractChange.updateTime}" pattern="yyyy-MM-dd HH:mm:ss" />
                        </p>
                    </div>
                </div>

                <div class="form-group">
                    <sf:label path="updateUser" cssClass="col-sm-2 control-label">修改用户</sf:label>
                    <div class="col-sm-10">
                        <p class="form-control-static">
                            <c:out value="${contractChange.updateUser}" />
                        </p>
                    </div>
                </div>

                <div class="form-group">
                    <sf:label path="description" cssClass="col-sm-2 control-label">备注</sf:label>
                    <div class="col-sm-10">
                        <p class="form-control-static">
                            <c:out value="${contractChange.description}" />
                        </p>
                    </div>
                </div>
            </sf:form>
        </div>
    </div>
</div>
<%@ include file="bottom.jsp"%>
