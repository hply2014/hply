<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="container main">
    <c:if test="${not empty message}">

        <div class="alert alert-success alert-dismissible col-md-offset-4 affix" role="alert">
            <button type="button" class="close" data-dismiss="alert">
                <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
            </button>
            <strong><a href="<s:url value="/chop/detail/${chop.id }" />"> ${chop.chopCode }</a></strong> ，${message}
        </div>
    </c:if>
    <c:if test="${not empty delMessage}">
        <div class="alert alert-warning alert-dismissible col-md-offset-4 affix" role="alert">
            <button type="button" class="close" data-dismiss="alert">
                <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
            </button>
            <strong>${chop.chopCode }</strong> ，${delMessage}
        </div>
    </c:if>
    <div class="panel panel-primary">
        <div class="panel-heading">
            <strong>${page_title }</strong>（共${rowCount}行）
        </div>
        <div class="panel-body">
            <div class="btn-toolbar" role="toolbar">
                <div class="btn_group">
                    <c:if test='${not empty orglist}'>
                        <select id="orgSelect">
                            <c:forEach items="${orglist}" var="org">
                                <option ${org.id == oid ? 'selected' : '' } value="${org.id}">${org.organizationName}</option>
                            </c:forEach>
                        </select>&nbsp; </c:if>
                    <select id="monthsSelect1">
                        <c:forEach items="${months}" var="str">
                            <option ${p1 == str ? 'selected' : '' } value="${str}">${str }</option>
                        </c:forEach>
                    </select> 至 <select id="monthsSelect2">
                        <c:forEach items="${months}" var="str">
                            <option ${p2 == str ? 'selected' : '' } value="${str}">${str }</option>
                        </c:forEach>
                    </select>&nbsp;&nbsp; <a
                        href="<c:url value="/chop/export?oid=${oid}&p1=${p1}&p2=${p2}" />" class="btn btn-danger"><span
                        class="glyphicon glyphicon-floppy-save"></span>导出到Excel . . . </a>
                </div>
            </div>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>序号</th>
                        <th>名称</th>
                        <th>日期</th>
                        <th>项目名称</th>
                        <th>盖章内容</th>
                        <th>经办人</th>
                        <th>项目经理</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    	int i = 0;
                    %>
                    <c:forEach items="${list}" var="chop">
                        <tr>
                            <td><%=++i%></td>
                            <td><c:out value="${chop.applyUser}" /></td>
                            <td><fmt:formatDate value="${chop.applyTime}" pattern="yyyy-MM-dd" /></td>
                            <td><c:out value="${chop.projectName}" /></td>
                            <td><c:out value="${chop.content}" /></td>
                            <td><c:out value="${chop.step3User}" /></td>
                            <td><c:out value="${chop.manager}" /></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript">
	$(function() {
		$("select").change(
				function() {
					var orgid = $("#orgSelect").val() || "${orgId}";
					self.location = "<s:url value='/chop/summary' />" + "?oid=" + orgid + "&p1=" + $("#monthsSelect1").val() + "&p2="
							+ $("#monthsSelect2").val();

				});
	});
</script>
<%@ include file="bottom.jsp"%>
