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
        
        <div class="alert alert-success alert-dismissible col-md-offset-4 affix" role="alert">
            <button type="button" class="close" data-dismiss="alert">
                <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
            </button>
            <strong><a href="<s:url value="/project/detail/${project.id }" />"> ${project.id }</a></strong> ，${message}
        </div>
    </c:if>
    <c:if test="${not empty delMessage}">
        <div class="alert alert-warning alert-dismissible col-md-offset-4 affix" role="alert">
            <button type="button" class="close" data-dismiss="alert">
                <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
            </button>
            <strong>${project.id }</strong> ，${delMessage}
        </div>
    </c:if>
    <div class="panel panel-primary">
        <div class="panel-heading">
            <strong>合同项目信息</strong>（ 共
            <c:out value="${rowCount}" />
            行，
                <select class="selectpicker page" data-size="10" data-style="btn-warning btn-sm" data-width="120px"></select>&nbsp;/&nbsp;共${pageCount }页
            ）
            <c:if test='${not empty orglist}'>
                <div class="pull-right">
                    <select class="selectpicker org" data-size="10" data-style="btn-danger btn-sm" data-width="120px">
                        <c:forEach items="${orglist}" var="org">
                            <option ${org.id == oid ? 'selected' : '' } value="${org.id}">${org.organizationName}</option>
                        </c:forEach>
                    </select>
                </div>
            </c:if>
        </div>
        <div class="panel-body">
            <div class="btn-toolbar" role="toolbar">
                <shiro:hasPermission name="`project_create`">
                    <div class="btn-group">
                        <a href="<c:url value="/project/create" />" class="btn btn-info"><span
                            class="glyphicon glyphicon-plus"></span> 新 建 </a>
                    </div>
                </shiro:hasPermission>
                <div class="span12">
                    <div id="custom-search-form" class="form-search form-horizontal pull-right">
                        <div class="input-append span12">
                            <input id="searchInput" type="text" class="search-query mac-style" value="${queryText }"
                                placeholder="搜索 。。。">
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
                        <th>项目编号</th>
                        <th>项目名称</th>
                        <th>项目经理</th>
                        <th class="amount">管理费率</th>
                        <th class="amount">税金比率</th>
                        <th class="amount">合同金额</th>
                        <th class="amount">印花税上缴金额</th>
                        <th>登记时间</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    	int i = Integer.parseInt(request.getAttribute("currentPageStarted")
                    			.toString());
                    %>
                    <c:forEach items="${list}" var="project">
                        <tr>
                            <td><span
                                class="glyphicon <c:out value="${project.status != 1 ? 'glyphicon-file' : ''}" />"></span></td>
                            <td><%=++i%></td>
                            <td><a
                                href="<s:url value="/project/detail/{id}"><s:param name="id" value="${project.id }" /></s:url>"><c:out
                                        value="${project.projectCode}" /></a></td>
                            <td><c:out value="${project.projectName}" /></td>
                            <td><c:out value='${project.manager}' /></td>
                            <td class="amount"><fmt:formatNumber value="${project.managementRate}" pattern="#0.00" />%</td>
                            <td class="amount"><fmt:formatNumber value="${project.taxRate}" pattern="#0.00" />%</td>
                            <td class="amount"><fmt:formatNumber value="${project.contractAmount}"
                                    pattern="###,###,###,###,##0.00" /> <c:if
                                    test="${not empty project.settlementAmount && project.settlementAmount > 0 }">
                                    <br />结算：<fmt:formatNumber value="${project.settlementAmount}"
                                        pattern="###,###,###,###,##0.00" />
                                </c:if></td>
                            <td class="amount"><span data-toggle="tooltip"
                                title="<c:if test='${not empty project.dutyPaidTime }'>时间：<fmt:formatDate value='${project.dutyPaidTime}' pattern='yyyy-MM-dd' /></c:if><c:if test="${not empty project.dutyPaidCode}">，收据编号：${project.dutyPaidCode}</c:if>">
                                    <fmt:formatNumber value="${project.dutyPaidAmount}" pattern="###,###,###,###,##0.00" /><span></td>
                            <td><span title="<c:out value="登记人：${project.createUser}" />"><fmt:formatDate
                                        value="${project.trice}" pattern="yyyy-MM-dd" /></span></td>
                            <td><shiro:hasPermission name="`project_modify`">
                                    <a href="<s:url value="/project/modify/${project.id }" />">修改</a>
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
                                href="<s:url value='/project'><s:param name='q' value='${queryText}'/><s:param name='oid' value='${oid}'/><s:param name='p' value='${pageIndex - 1}'/></s:url>">上一页</a></li>
                            <li class="${pageIndex + 1 >= pageCount ? 'disabled' :'' }"><a
                                href="<s:url value='/project'><s:param name='q' value='${queryText}'/><s:param name='oid' value='${oid}'/><s:param name='p' value='${pageIndex + 1}'/></s:url>">下一页</a></li>
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
	$(function() {
		$("#searchButton").click(function() {
			self.location = "<s:url value='/project' />?q=" + $("#searchInput").val() + "&oid=${oid}";
		});
		$('#searchInput').keydown(function(e) {
			if (e.keyCode == 13) {
				self.location = "<s:url value='/project' />?q=" + $("#searchInput").val() + "&oid=${oid}";
			}
		});

		var p = '';
		for (var i = 0; i < <c:out value="${pageCount}" />; i++) {
			p = p + '<option ' + (i== ${pageIndex} ? 'selected': '') + ' value="' + i + '">第' + (i + 1) + '页</option>';
		}

		$(".page").append(p).change(function(){
			<c:if test='${empty queryText}'>self.location = '<s:url value="/project"/>?oid=${oid}&p=' + $(this).val();</c:if>
			<c:if test='${not empty queryText}'>self.location = '<s:url value="/project"/>?q=${queryText}&oid=${oid}&p=' + $(this).val();</c:if>
		});

		$(".org").change(function(){
			self.location = '<s:url value="/project"/>?oid=' + $(this).val();
		});
	});
//-->
</script>
<%@ include file="bottom.jsp"%>
