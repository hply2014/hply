<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="container main"><div class="panel panel-primary">
  <div class="panel-heading"><strong>${page_title}</strong></div>
  <div class="panel-body">
<div class="btn-toolbar" role="toolbar">
  <div class="btn-group">
  <a href="<s:url value="/chop" />" class="btn btn-info"><span class="glyphicon glyphicon-share-alt"></span> 返 回  </a>
</div>
<shiro:hasPermission name="`chop_modify`">
				<div class="btn-group">
					<a
						href="<s:url value="/chop/modify/{id}"><s:param name="id" value="${chop.id }" /></s:url>"
						class="btn btn-info"><span class="glyphicon glyphicon-pencil"></span>
						修 改 </a>
				</div></shiro:hasPermission>
                <shiro:hasPermission name="`chop_delete`">
				<div class="btn-group">
					<a
						data-confirm-message="盖章管理数据：<c:out value="${chop.id}" />，将被永久删除，操作不可撤销，是否确认？"
						href="<s:url value="/chop/delete/{id}"><s:param name="id" value="${chop.id }" /></s:url>"
						class="btn btn-info delete"><span
						class="glyphicon glyphicon-trash"></span> 删 除 </a>
				</div></shiro:hasPermission>
</div>

<sf:form modelAttribute="chop" cssClass="form-horizontal"
	role="form">
	<div class="form-group">
		<sf:label path="chopCode" cssClass="col-sm-2 control-label">编号</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${chop.chopCode}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="projectId" cssClass="col-sm-2 control-label">项目ID</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${chop.projectId}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="projectCode" cssClass="col-sm-2 control-label">项目编号</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${chop.projectCode}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="projectName" cssClass="col-sm-2 control-label">项目名称</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${chop.projectName}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="manager" cssClass="col-sm-2 control-label">项目经理</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${chop.manager}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="content" cssClass="col-sm-2 control-label">主要内容</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${chop.content}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="applyUser" cssClass="col-sm-2 control-label">申请人</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${chop.applyUser}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="applyTime" cssClass="col-sm-2 control-label">申请时间</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatDate value="${chop.applyTime}" pattern="yyyy-MM-dd" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="organizationId" cssClass="col-sm-2 control-label">所在部门</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${chop.organizationId}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="step1Idea" cssClass="col-sm-2 control-label">事业部/项目部审核意见</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${chop.step1Idea}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="step1User" cssClass="col-sm-2 control-label">事业部/项目部审核人</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${chop.step1User}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="step1Time" cssClass="col-sm-2 control-label">事业部/项目部审核时间</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatDate value="${chop.step1Time}" pattern="yyyy-MM-dd" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="step2Idea" cssClass="col-sm-2 control-label">财务部审核意见</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${chop.step2Idea}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="step2User" cssClass="col-sm-2 control-label">财务部审核人</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${chop.step2User}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="step2Time" cssClass="col-sm-2 control-label">财务部审核时间</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatDate value="${chop.step2Time}" pattern="yyyy-MM-dd" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="step3Idea" cssClass="col-sm-2 control-label">经办人办理结果</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${chop.step3Idea}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="step3User" cssClass="col-sm-2 control-label">经办人</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${chop.step3User}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="step3Time" cssClass="col-sm-2 control-label">经办时间</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><fmt:formatDate value="${chop.step3Time}" pattern="yyyy-MM-dd" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="stepStatus" cssClass="col-sm-2 control-label">流程状态</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${chop.stepStatus}" /></p>
		</div>
	</div>

	<div class="form-group">
		<sf:label path="status" cssClass="col-sm-2 control-label">数据状态，0：草稿/1：正式</sf:label>
		<div class="col-sm-10">
			<p class="form-control-static"><c:out value="${chop.status}" /></p>
		</div>
	</div>
</sf:form>
  </div>
</div></div>
<%@ include file="bottom.jsp"%>
