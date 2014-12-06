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

.search-query:focus {
    width: 260px;
}
</style>

<div class="container main">
    <c:if test="${not empty message}">
        <div></div>
        <div class="alert alert-success alert-dismissible col-md-offset-2 affix" role="alert">
            <button type="button" class="close" data-dismiss="alert">
                <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
            </button>
            <strong><a href="<s:url value="/information/detail/${information.id }" />"> ${information.id }</a></strong>
            ，${message}
        </div>
    </c:if>
    <c:if test="${not empty delMessage}">
        <div class="alert alert-warning alert-dismissible col-md-offset-4 affix" role="alert">
            <button type="button" class="close" data-dismiss="alert">
                <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
            </button>
            <strong>${information.id }</strong> ，${delMessage}
        </div>
    </c:if>
    <div class="panel panel-primary">
        <div class="panel-heading">
            <strong>信息登记</strong>（ 共
            <c:out value="${rowCount}" />
            行
            <c:if test="${pageCount > 1 }">，第${pageIndex+1 }页 &nbsp;/&nbsp;共${pageCount }页</c:if>
            ）
        </div>
        <div class="panel-body">
            <div class="btn-toolbar" role="toolbar">
                <shiro:hasPermission name="`information_create`">
                    <div class="btn-group">
                        <a href="<c:url value="/information/create" />" class="btn btn-info"><span
                            class="glyphicon glyphicon-plus"></span> 新 建 </a>
                    </div>
                </shiro:hasPermission>
                <div class="span12">
                    <div id="custom-search-form" class="form-search form-horizontal pull-right">
                        <div class="input-append span12">
                            <input id="searchInput" type="text" class="search-query mac-style" value="${queryText }" placeholder="搜索 。。。">
                            <button type="button" class="btn" id="searchButton">
                                <span class="glyphicon glyphicon-search"></span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <table class="table table-hover">
                <thead>
                    <tr>
                        <th></th>
                        <th>#</th>
                        <th>所在部门</th>
                        <th>项目名称</th>
                        <th>地址</th>
                        <th>开发商</th>
                        <th>总包单位</th>
                        <th>品种</th>
                        <th>总面积</th>
                        <th>联系信息</th>
                        <th>登记信息</th>
                        <th>备注</th>
                        <th></th>

                    </tr>
                </thead>
                <tbody>
                    <%
                    	int i = Integer.parseInt(request.getAttribute("currentPageStarted").toString());
                    %>
                    <c:forEach items="${list}" var="information">
                        <tr>
                            <td><span
                                class="glyphicon <c:out value="${information.status != 1 ? 'glyphicon-file' : ''}" />"></span></td>
                            <td><%=++i%></td>
                            <td><a
                                href="<s:url value="/information/detail/{id}"><s:param name="id" value="${information.id }" /></s:url>"><c:out
                                        value="${information.organizationId}" /></a></td>
                            <td><c:out value="${information.projectName}" /></td>
                            <td><c:out value="${information.address}" /></td>
                            <td><c:out value="${information.developer}" /></td>
                            <td><c:out value="${information.epcCorporation}" /></td>
                            <td><c:out value="${information.variety}" /></td>
                            <td><c:out value="${information.totalArea}" /></td>
                            <td><c:if test="${not empty information.realName }">联系人：<c:out
                                        value="${information.realName}" />
                                    <br />
                                </c:if>
                                <c:if test="${not empty information.identification }">身份证：<c:out
                                        value="${information.identification}" />
                                    <br />
                                </c:if>
                                <c:if test="${not empty information.contact }">联系方式：<c:out
                                        value="${information.contact}" />
                                </c:if></td>
                            <td><c:out value="${information.createUser}" /><br />
                            <fmt:formatDate value="${information.trice}" pattern="yyyy-MM-dd" /></td>
                            <td><c:out value="${information.description}" /></td>
                            <td><c:if test="${information.status == 1 }">
                                    <shiro:hasPermission name="`information_modify`">
                                        <a
                                            href="<s:url value="/information/modify/{id}"><s:param name="id" value="${information.id }" /></s:url>">修改</a>
                                    </shiro:hasPermission>
                                </c:if> <c:if test="${information.status != 1 }">
                                    <shiro:hasPermission name="`information_create`">
                                        <a
                                            href="<s:url value="/information/modify/{id}"><s:param name="id" value="${information.id }" /></s:url>">修改</a>
                                    </shiro:hasPermission>
                                </c:if> <shiro:hasPermission name="`information_delete`">
                                    <a class="delete"
                                        data-confirm-message="信息登记数据：<c:out value="${information.id}" />，将被永久删除，操作不可撤销，是否确认？"
                                        href="<s:url value="/information/delete/{id}"><s:param name="id" value="${information.id }" /></s:url>">删除</a>
                                </shiro:hasPermission></td>
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
                                href="<s:url value='information'><s:param name='q' value='${queryText}'/><s:param name='p' value='${pageIndex - 1}'/></s:url>">上一页</a></li>
                            <li class="${pageIndex + 1 >= pageCount ? 'disabled' :'' }"><a
                                href="<s:url value='information'><s:param name='q' value='${queryText}'/><s:param name='p' value='${pageIndex + 1}'/></s:url>">下一页</a></li>
                        </ul>
                    </div>
                    <div class="col-sm-2">&nbsp;</div>
                </div>
            </c:if>
        </div>
    </div>
</div>
<script type="text/javascript">
<!--
$(function(){
    $("#searchButton").click(function(){
        self.location = "<s:url value='/information' />?q=" + $("#searchInput").val();
    });
    $('#searchInput').keydown(function(e){
        if(e.keyCode==13){
            self.location = "<s:url value='/information' />?q=" + $("#searchInput").val();
        }
    });
});

//-->
</script>
<%@ include file="bottom.jsp"%>
