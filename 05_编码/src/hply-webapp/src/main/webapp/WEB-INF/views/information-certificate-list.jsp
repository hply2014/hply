<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="container main">
<c:if test="${not empty message}">
	
<div class="alert alert-success alert-dismissible col-md-offset-4 affix" role="alert">
  <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
  <strong><a href="<s:url value="/information/certificate/detail/${informationCertificate.id }" />"> ${informationCertificate.id }</a></strong> ，${message}
</div>
</c:if>
<c:if test="${not empty delMessage}">
<div class="alert alert-warning alert-dismissible col-md-offset-4 affix" role="alert">
  <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
  <strong>${informationCertificate.id }</strong> ，${delMessage}
</div>
</c:if>
<div class="panel panel-primary">
  <div class="panel-heading"><strong>证书类别</strong>（ 共<c:out value="${rowCount}" />行
            ，第${pageIndex+1 }页 &nbsp;/&nbsp;共${pageCount }页）</div>
    <div class="panel-body">
            <div class="btn-toolbar" role="toolbar">
                <shiro:hasPermission name="`information_certificate`">
                    <div class="btn-group">
                        <a href="<c:url value="/information/certificate/create" />" class="btn btn-info"><span
                            class="glyphicon glyphicon-plus"></span> 新 建 </a>
                    </div>
                </shiro:hasPermission>
                <div class="btn-group">
                    <a href="<c:url value="/information" />" class="btn btn-default"><span
                        class="glyphicon glyphicon-share-alt"></span> 返回到信息登记</a>
                </div>

            </div>

            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>证书类别</th>
                        <th>是否锁证</th>
                        <th>缴费方式</th>
                        <th class="amount">金额</th>
                        <th>创建用户</th>
                        <th>创建时间</th>
                        <th>备注</th>
                        <th></th>

                    </tr>
                </thead>
                <tbody>
                    <%
                    	int i = Integer.parseInt(request.getAttribute("currentPageStarted").toString());
                    %>
                    <c:forEach items="${list}" var="informationCertificate">
                        <tr>
                            <td><%=++i%></td>
                            <td><c:out value="${informationCertificate.type}" /></td>
                            <td><c:out value="${informationCertificate.lockFlag == 1? '已锁证':'未锁证'}" /></td>
                            <td><c:out value="${informationCertificate.payFlag == 1? '一次性付清':'按月付'}" /></td>
                            <td class="amount"><fmt:formatNumber value="${informationCertificate.amount}" pattern="0.00" /></td>
                            <td><c:out value="${informationCertificate.createUser}" /></td>
                            <td><fmt:formatDate value="${informationCertificate.createTime}" pattern="yyyy-MM-dd" /></td>
                            <td><c:out value="${informationCertificate.description}" /></td>
                            <td>
                            	<shiro:hasPermission name="`information_certificate`">
                                    <a href="<s:url value="/information/certificate/modify/{id}"><s:param name="id" value="${informationCertificate.id }" /></s:url>">修改</a>
                                    <a class="delete" data-confirm-message="证书类别数据：<c:out value="${informationCertificate.id}" />，将被永久删除，操作不可撤销，是否确认？"
                                        href="<s:url value="/information/certificate/delete/{id}"><s:param name="id" value="${informationCertificate.id }" /></s:url>">删除</a>
                                </shiro:hasPermission>
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
                                href="<s:url value='/information/certificate?p=${pageIndex - 1}' />">上一页</a></li>
                            <li class="${pageIndex + 1 >= pageCount ? 'disabled' :'' }"><a
                                href="<s:url value='/information/certificate?p=${pageIndex + 1}' />">下一页</a></li>
                        </ul>
                    </div>
                    <div class="col-sm-2">&nbsp;</div>
                </div>
            </c:if>
  </div>
</div></div>
<%@ include file="bottom.jsp"%>
