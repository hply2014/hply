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
                    <a href="<s:url value="/sysauthorization" />" class="btn btn-info"><span
                        class="glyphicon glyphicon-share-alt"></span> 返 回 </a>
                </div>
                <div class="btn-group">
                    <a
                        href="<s:url value="/sysauthorization/modify/{id}"><s:param name="id" value="${sysAuthorization.id }" /></s:url>"
                        class="btn btn-info"><span class="glyphicon glyphicon-pencil"></span> 修 改 </a>
                </div>
                <div class="btn-group">
                    <a data-confirm-message="授权关系数据：<c:out value="${sysAuthorization.id}" />，将被永久删除，操作不可撤销，是否确认？"
                        href="<s:url value="/sysauthorization/delete/{id}"><s:param name="id" value="${sysAuthorization.id }" /></s:url>"
                        class="btn btn-info delete"><span class="glyphicon glyphicon-trash"></span> 删 除 </a>
                </div>
            </div>

            <sf:form modelAttribute="sysAuthorization" cssClass="form-horizontal" role="form">
                <div class="form-group">
                    <sf:label path="resourceId" cssClass="col-sm-2 control-label">资源ID</sf:label>
                    <div class="col-sm-10">
                        <p class="form-control-static">
                            <c:out value="${sysAuthorization.resourceId}" />
                        </p>
                    </div>
                </div>

                <div class="form-group">
                    <sf:label path="userId" cssClass="col-sm-2 control-label">用户ID</sf:label>
                    <div class="col-sm-10">
                        <p class="form-control-static">
                            <c:out value="${sysAuthorization.userId}" />
                        </p>
                    </div>
                </div>

                <div class="form-group">
                    <sf:label path="createTime" cssClass="col-sm-2 control-label">创建时间</sf:label>
                    <div class="col-sm-10">
                        <p class="form-control-static">
                            <fmt:formatDate value="${sysAuthorization.createTime}" pattern="yyyy-MM-dd" />
                        </p>
                    </div>
                </div>

                <div class="form-group">
                    <sf:label path="createUser" cssClass="col-sm-2 control-label">创建用户</sf:label>
                    <div class="col-sm-10">
                        <p class="form-control-static">
                            <c:out value="${sysAuthorization.createUser}" />
                        </p>
                    </div>
                </div>
            </sf:form>
        </div>
    </div>
</div>
<%@ include file="bottom.jsp"%>
