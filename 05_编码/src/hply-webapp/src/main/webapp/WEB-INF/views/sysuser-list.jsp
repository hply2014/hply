<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="container main">
    <c:if test="${not empty message}">
        <div></div>
        <div class="alert alert-success alert-dismissible col-md-offset-2 affix" role="alert">
            <button type="button" class="close" data-dismiss="alert">
                <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
            </button>
            <strong><a href="<s:url value="/sysuser/detail/${sysUser.id }" />"> ${sysUser.id }</a></strong> ，${message}
        </div>
    </c:if>
    <c:if test="${not empty delMessage}">
        <div class="alert alert-warning alert-dismissible col-md-offset-2 affix" role="alert">
            <button type="button" class="close" data-dismiss="alert">
                <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
            </button>
            <strong>${sysUser.id }</strong> ，${delMessage}
        </div>
    </c:if>
    <div class="panel panel-primary">
        <div class="panel-heading">
            <strong>系统用户</strong>（
            <c:out value="${list.size()}" />
            条数据）
        </div>
        <div class="panel-body">
            <div class="btn-toolbar" role="toolbar">
                    <div class="btn-group">
                        <a href="<c:url value="/sysuser/create" />" class="btn btn-info"><span
                            class="glyphicon glyphicon-plus"></span> 新 建 </a>
                    </div>
            </div>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>登陆名</th>
                        <th>姓名</th>
                        <th>所在部门</th>
                        <th>职务</th>
                        <th>最后登陆IP</th>
                        <th>最后登陆时间</th>
                        <th>登陆总次数</th>
                        <th>启用</th>
                        <th>修改用户</th>
                        <th></th>
                        
                    </tr>
                </thead>
                <tbody>
                    <%
                    	int i = 0;
                    %>
                    <c:forEach items="${list}" var="sysUser">
                        <tr>
                            <td><%=++i%></td>
                            <td><a
                                href="<s:url value="/sysuser/detail/{id}"><s:param name="id" value="${sysUser.id }" /></s:url>"><c:out
                                        value="${sysUser.loginName}" /></a></td>
                            <td><c:out value="${sysUser.realName}" /></td>
                            <td><c:out value="${sysUser.organizationId}" /></td>
                            <td><c:out value="${sysUser.position}" /></td>
                            <td><c:out value="${sysUser.lastLoginIp}" /></td>
                            <td><fmt:formatDate value="${sysUser.lastLoginTime}" pattern="yyyy-MM-dd" /></td>
                            <td><c:out value="${sysUser.logined}" /></td>
                            <td><c:out value="${sysUser.enabled ? '启用' : '禁用'}" /></td>
                            <td><c:out value="${sysUser.updateUser}" /></td>

                            <td><a
                                href="<s:url value="/sysuser/modify/{id}"><s:param name="id" value="${sysUser.id }" /></s:url>">修改</a>
                                <a class="delete"
                                data-confirm-message="系统用户数据：<c:out value="${sysUser.id}" />，将被永久删除，操作不可撤销，是否确认？"
                                href="<s:url value="/sysuser/delete/{id}"><s:param name="id" value="${sysUser.id }" /></s:url>">删除</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<%@ include file="bottom.jsp"%>
