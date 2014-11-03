<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="container main"><div class="panel panel-primary">
  <div class="panel-heading"><strong>${page_title}</strong></div>
  <div class="panel-body">
<div class="btn-toolbar" role="toolbar">
  <div class="btn-group">
  <a href="<s:url value="/fieldtypes" />" onclick="return goback();" class="btn btn-info"><span class="glyphicon glyphicon-share-alt"></span> 返 回  </a>
</div>
<shiro:hasPermission name="`fieldtypes_modify`">
				<div class="btn-group">
					<a
						href="<s:url value="/fieldtypes/modify/{id}"><s:param name="id" value="${fieldTypes.id }" /></s:url>"
						class="btn btn-info"><span class="glyphicon glyphicon-pencil"></span>
						修 改 </a>
				</div></shiro:hasPermission>
                <shiro:hasPermission name="`fieldtypes_delete`">
				<div class="btn-group">
					<a
						data-confirm-message="所有数据类型的测试样表数据：<c:out value="${fieldTypes.id}" />，将被永久删除，操作不可撤销，是否确认？"
						href="<s:url value="/fieldtypes/delete/{id}"><s:param name="id" value="${fieldTypes.id }" /></s:url>"
						class="btn btn-info delete"><span
						class="glyphicon glyphicon-trash"></span> 删 除 </a>
				</div></shiro:hasPermission>
</div>

<sf:form modelAttribute="fieldTypes" cssClass="form-horizontal"
	role="form">
	<div class="form-group">
		<sf:label path="fieldT01" cssClass="col-sm-2 control-label"></sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${fieldTypes.fieldT01}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="fieldT02" cssClass="col-sm-2 control-label"></sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatNumber pattern="#,##0.00" value="${fieldTypes.fieldT02}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="fieldT03" cssClass="col-sm-2 control-label"></sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${fieldTypes.fieldT03}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="fieldT04" cssClass="col-sm-2 control-label"></sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${fieldTypes.fieldT04}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="fieldT05" cssClass="col-sm-2 control-label"></sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${fieldTypes.fieldT05}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="fieldT06" cssClass="col-sm-2 control-label"></sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatDate value="${fieldTypes.fieldT06}" pattern="yyyy-MM-dd" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="fieldT07" cssClass="col-sm-2 control-label"></sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${fieldTypes.fieldT07}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="fieldT08" cssClass="col-sm-2 control-label"></sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${fieldTypes.fieldT08}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="fieldT09" cssClass="col-sm-2 control-label"></sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${fieldTypes.fieldT09}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="status" cssClass="col-sm-2 control-label">数据状态，0：草稿/1：正式</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${fieldTypes.status}" /></p>
		</div>
	</div>
</sf:form>
  </div>
</div></div>
<%@ include file="bottom.jsp"%>
