<%@ page isELIgnored="false"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib
	uri="http://www.springframework.org/tags" prefix="s"%><%@ taglib
	uri="http://www.springframework.org/tags/form" prefix="sf"%><%@ page
	language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%><%@ include file="header.jsp"%>
<div class="panel panel-default">
  <div class="panel-heading">新建测试</div>
  <div class="panel-body">
<sf:form modelAttribute="fieldTypes" cssClass="form-horizontal"
	role="form">
	<div class="form-group">
		<sf:label path="fieldT01" cssClass="col-sm-2 control-label">fieldT01</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="fieldT01"
				placeholder="这里输入文字..." />
			<sf:errors path="fieldT01" cssClass="error" />
		</div>
	</div>
	<div class="form-group">
		<sf:label path="fieldT02" cssClass="col-sm-2 control-label">fieldT02</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="fieldT02"
				placeholder="这里输入文字..." />
			<sf:errors path="fieldT02" cssClass="error" />
		</div>
	</div>
	<div class="form-group">
		<sf:label path="fieldT03" cssClass="col-sm-2 control-label">fieldT03</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="fieldT03"
				placeholder="这里输入文字..." />
			<sf:errors path="fieldT03" cssClass="error" />
		</div>
	</div>
	<div class="form-group">
		<sf:label path="fieldT04" cssClass="col-sm-2 control-label">fieldT04</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="fieldT04"
				placeholder="这里输入文字..." />
			<sf:errors path="fieldT04" cssClass="error" />
		</div>
	</div>
	<div class="form-group">
		<sf:label path="fieldT05" cssClass="col-sm-2 control-label">fieldT05</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="fieldT05"
				placeholder="这里输入文字..." />
			<sf:errors path="fieldT05" cssClass="error" />
		</div>
	</div>
	<div class="form-group">
		<sf:label path="fieldT06" cssClass="col-sm-2 control-label">fieldT06</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="fieldT06"
				placeholder="这里输入文字..." />
			<sf:errors path="fieldT06" cssClass="error" />
		</div>
	</div>
	<div class="form-group">
		<sf:label path="fieldT07" cssClass="col-sm-2 control-label">fieldT07</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="fieldT07"
				placeholder="这里输入文字..." />
			<sf:errors path="fieldT07" cssClass="error" />
		</div>
	</div>
	<div class="form-group">
		<sf:label path="fieldT08" cssClass="col-sm-2 control-label">fieldT08</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="fieldT08"
				placeholder="这里输入文字..." />
			<sf:errors path="fieldT08" cssClass="error" />
		</div>
	</div>
	<div class="form-group">
		<sf:label path="fieldT09" cssClass="col-sm-2 control-label">fieldT09</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="fieldT09"
				placeholder="这里输入文字..." />
			<sf:errors path="fieldT09" cssClass="error" />
		</div>
	</div>
	
	<div>
		<div class="col-sm-5 control-label"><button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-ok"></span> 提  交 </button></div>
		<div class="col-sm-1 control-label">
		
		<a href='<s:url value="/fieldtypes" />' class="btn btn-default"><span class="glyphicon glyphicon-share-alt"></span> 返 回 </a>
		</div>
	</div>
	
</sf:form>
  </div>
</div>
<%@ include file="bottom.jsp"%>