﻿<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="container main">
<c:if test="${not empty message}">
	
<div class="alert alert-success alert-dismissible col-md-offset-4 affix" role="alert">
  <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
  <strong><a href="<s:url value="/sysparameter/detail/${sysParameter.id }" />"> ${sysParameter.id }</a></strong> ，${message}
</div>
</c:if>
<c:if test="${not empty delMessage}">
<div class="alert alert-warning alert-dismissible col-md-offset-4 affix" role="alert">
  <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
  <strong>${sysParameter.id }</strong> ，${delMessage}
</div>
</c:if>
<div class="panel panel-primary">
  <div class="panel-heading"><strong>系统参数</strong>（ 共<c:out value="${rowCount}" />行
            <c:if test="${pageCount > 1 }">，第${pageIndex+1 }页 &nbsp;/&nbsp;共${pageCount }页</c:if>）</div>
   <div class="panel-body">
            <div class="btn-toolbar" role="toolbar">
                <div class="btn-group">
                    <a href="<c:url value="/sysparameter/create" />" class="btn btn-info"><span
                        class="glyphicon glyphicon-plus"></span> 新 建 </a>
                </div>
            </div>

            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>#</th>

                        <th>参数英文名称</th>
                        <th>参数中文名称</th>
                        <th>参数值</th>
                        <th>默认值</th>
                        <th>系统内置</th>
                        <th>创建用户</th>
                        <th>备注</th>
                        <th></th>
                        
                    </tr>
                </thead>
                <tbody>
                    <%
                    	int i = Integer.parseInt(request.getAttribute("currentPageStarted").toString());
                    %>
                    <c:forEach items="${list}" var="sysParameter">
                        <tr>
                            <td><%=++i%></td>

                            <td><a
                                href="<s:url value="/sysparameter/detail/{id}"><s:param name="id" value="${sysParameter.id }" /></s:url>"><c:out
                                        value="${sysParameter.enName}" /></a></td>
                            <td><c:out value="${sysParameter.cnName}" /></td>
                            <td><c:out value="${sysParameter.paramValue}" /></td>
                            <td><c:out value="${sysParameter.defaultValue}" /></td>
                            <td><c:out value="${sysParameter.isInner ? '是' : '否'}" /></td>
                            <td><c:out value="${sysParameter.createUser}" /></td>
                            <td><c:out value="${sysParameter.description}" /></td>
                            <td><a
                                href="<s:url value="/sysparameter/modify/{id}"><s:param name="id" value="${sysParameter.id }" /></s:url>">修改</a>
                                <a class="delete"
                                data-confirm-message="系统参数数据：<c:out value="${sysParameter.id}" />，将被永久删除，操作不可撤销，是否确认？"
                                href="<s:url value="/sysparameter/delete/{id}"><s:param name="id" value="${sysParameter.id }" /></s:url>">删除</a>


                            </td>
                        </tr>
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
                                href="<s:url value='/sysparameter?p=${pageIndex - 1}' />">上一页</a></li>
                            <li class="${pageIndex + 1 >= pageCount ? 'disabled' :'' }"><a
                                href="<s:url value='/sysparameter?p=${pageIndex + 1}' />">下一页</a></li>
                        </ul>
                    </div>
                    <div class="col-sm-2">&nbsp;</div>
                </div>
            </c:if>
  </div>
</div></div>
<%@ include file="bottom.jsp"%>
