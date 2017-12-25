<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="container main"><div class="panel panel-default">
  <div class="panel-heading"><strong>${page_title}</strong></div>
  <div class="panel-body">
<div class="btn-toolbar" role="toolbar">
  <div class="btn-group">
  <a href="<s:url value="/arrearsinterest" />" onclick="return goback();" class="btn btn-info"><span class="glyphicon glyphicon-share-alt"></span> 返 回  </a>
</div>
</div>

<sf:form modelAttribute="arrearsInterest" cssClass="form-horizontal"
	role="form">
	<div class="form-group">
		<sf:label path="serialId" cssClass="col-sm-2 control-label">流水号</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${arrearsInterest.serialId}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="arrearsId" cssClass="col-sm-2 control-label"></sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${arrearsInterest.arrearsId}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="projectId" cssClass="col-sm-2 control-label">项目ID</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${arrearsInterest.projectId}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="trice" cssClass="col-sm-2 control-label">计息时间</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatDate value="${arrearsInterest.trice}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="amount" cssClass="col-sm-2 control-label">计息基数</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatNumber pattern="#,##0.00" value="${arrearsInterest.amount}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="offsetAmount" cssClass="col-sm-2 control-label">已还的利息，拆分到天的</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatNumber pattern="#,##0.00" value="${arrearsInterest.offsetAmount}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="interestAmount" cssClass="col-sm-2 control-label">当天的利息</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatNumber pattern="#,##0.00" value="${arrearsInterest.interestAmount}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="createTime" cssClass="col-sm-2 control-label"></sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatDate value="${arrearsInterest.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="description" cssClass="col-sm-2 control-label">摘要</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${arrearsInterest.description}" /></p>
		</div>
	</div>
</sf:form>
  </div>
</div></div>
<%@ include file="bottom.jsp"%>
