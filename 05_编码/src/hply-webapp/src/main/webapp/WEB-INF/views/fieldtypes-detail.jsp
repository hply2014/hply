<%@ page isELIgnored="false"%><%@ 
taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ 
taglib
	uri="http://www.springframework.org/tags" prefix="s"%><%@ 
taglib
	uri="http://www.springframework.org/tags/form" prefix="sf"%><%@ 
taglib
	uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%><%@ 
page
	language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%><%@ include file="header.jsp"%>
<div class="panel panel-default">
  <div class="panel-heading"><strong>${page_title}</strong></div>
  <div class="panel-body">
<div class="btn-toolbar" role="toolbar">
  <div class="btn-group">
  <a href="<s:url value="/fieldtypes" />" class="btn btn-info"><span class="glyphicon glyphicon-share-alt"></span> 返 回  </a>
</div>
  <div class="btn-group">
  <a href="<s:url value="/fieldtypes/modify/{id}"><s:param name="id" value="${fieldTypes.id }" /></s:url>" class="btn btn-info"><span class="glyphicon glyphicon-pencil"></span> 修 改  </a>
</div>
  <div class="btn-group">
  <a data-confirm-message="删除后不可恢复，您确认要删除“<c:out value="${fieldTypes.fieldT01}" />”么？" href="<s:url value="/fieldtypes/delete/{id}"><s:param name="id" value="${fieldTypes.id }" /></s:url>" class="btn btn-info delete"><span class="glyphicon glyphicon-trash"></span> 删 除  </a>
</div>
</div>

<sf:form modelAttribute="fieldTypes" cssClass="form-horizontal"
	role="form">
	<div class="form-group">
		<sf:label path="fieldT01" cssClass="col-sm-2 control-label">fieldT01</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${fieldTypes.fieldT01 }" /></p>
		</div>
	</div>
	<div class="form-group">
		<sf:label path="fieldT02" cssClass="col-sm-2 control-label">fieldT02</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatNumber pattern="#,##0.00" groupingUsed="true" value="${fieldTypes.fieldT02 }" /></p>
		</div>
	</div>
	<div class="form-group">
		<sf:label path="fieldT03" cssClass="col-sm-2 control-label">fieldT03</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${fieldTypes.fieldT03 }" /></p>
		</div>
	</div>
	<div class="form-group">
		<sf:label path="fieldT04" cssClass="col-sm-2 control-label">fieldT04</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${fieldTypes.fieldT04 }" /></p>
		</div>
	</div>
	<div class="form-group">
		<sf:label path="fieldT05" cssClass="col-sm-2 control-label">fieldT05</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${fieldTypes.fieldT05 }" /></p>
		</div>
	</div>
	<div class="form-group">
		<sf:label path="fieldT06" cssClass="col-sm-2 control-label">fieldT06</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatDate value="${fieldTypes.fieldT06}"
				pattern="yyyy-MM-dd HH:mm:ss" /></p>
		</div>
	</div>
	<div class="form-group">
		<sf:label path="fieldT07" cssClass="col-sm-2 control-label">fieldT07</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${fieldTypes.fieldT07 }" /></p>
		</div>
	</div>
	<div class="form-group">
		<sf:label path="fieldT08" cssClass="col-sm-2 control-label">fieldT08</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatNumber type="number" pattern="#0.00" groupingUsed="true" value="${fieldTypes.fieldT08 }" /></p>
		</div>
	</div>
	<div class="form-group">
		<sf:label path="fieldT09" cssClass="col-sm-2 control-label">fieldT09</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatNumber type="number" pattern="#0.00" groupingUsed="true" value="${fieldTypes.fieldT09 }" /></p>
		</div>
	</div>	
</sf:form>
  </div>
</div>
<%@ include file="bottom.jsp"%>