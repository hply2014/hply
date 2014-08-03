<%@ page isELIgnored="false"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib
	uri="http://www.springframework.org/tags" prefix="s"%><%@ taglib
	uri="http://www.springframework.org/tags/form" prefix="sf"%><%@ page
	language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%><%@ include file="header.jsp"%>
<div class="container main"><div class="panel panel-default">
	<div class="panel-heading">
		<strong>${page_title}</strong>
	</div>
	<div class="panel-body">
		<sf:form modelAttribute="chop" cssClass="form-horizontal"
			role="form">
	<div class="form-group">
		<sf:label path="chopCode" cssClass="col-sm-2 control-label">编号</sf:label>
		<div class="col-sm-4">
			<sf:input cssClass="form-control" path="chopCode" placeholder="请输入文字..." />
            <sf:errors path="chopCode" cssClass="error" />
		</div>
        <div class="col-sm-4"></div>
	</div>

	<div class="form-group">
		<sf:label path="projectId" cssClass="col-sm-2 control-label">项目ID</sf:label>
		<div class="col-sm-4">
			<sf:input cssClass="form-control" path="projectId" placeholder="请输入文字..." />
            <sf:errors path="projectId" cssClass="error" />
		</div>
        <div class="col-sm-4"></div>
	</div>

	<div class="form-group">
		<sf:label path="projectCode" cssClass="col-sm-2 control-label">项目编号</sf:label>
		<div class="col-sm-4">
			<sf:input cssClass="form-control" path="projectCode" placeholder="请输入文字..." />
            <sf:errors path="projectCode" cssClass="error" />
		</div>
        <div class="col-sm-4"></div>
	</div>

	<div class="form-group">
		<sf:label path="projectName" cssClass="col-sm-2 control-label">项目名称</sf:label>
		<div class="col-sm-4">
			<sf:input cssClass="form-control" path="projectName" placeholder="请输入文字..." />
            <sf:errors path="projectName" cssClass="error" />
		</div>
        <div class="col-sm-4"></div>
	</div>

	<div class="form-group">
		<sf:label path="manager" cssClass="col-sm-2 control-label">项目经理</sf:label>
		<div class="col-sm-4">
			<sf:input cssClass="form-control" path="manager" placeholder="请输入文字..." />
            <sf:errors path="manager" cssClass="error" />
		</div>
        <div class="col-sm-4"></div>
	</div>

	<div class="form-group">
		<sf:label path="content" cssClass="col-sm-2 control-label">主要内容</sf:label>
		<div class="col-sm-4">
			<sf:input cssClass="form-control" path="content" placeholder="请输入文字..." />
            <sf:errors path="content" cssClass="error" />
		</div>
        <div class="col-sm-4"></div>
	</div>

	<div class="form-group">
		<sf:label path="applyUser" cssClass="col-sm-2 control-label">申请人</sf:label>
		<div class="col-sm-4">
			<sf:input cssClass="form-control" path="applyUser" placeholder="请输入文字..." />
            <sf:errors path="applyUser" cssClass="error" />
		</div>
        <div class="col-sm-4"></div>
	</div>

	<div class="form-group">
		<sf:label path="applyTime" cssClass="col-sm-2 control-label">申请时间</sf:label>
		<div class="col-sm-4">
					<div class="input-group date">
						<sf:input cssClass="form-control" path="applyTime"
							data-date-format="yyyy-mm-dd" />
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-calendar"></i></span>
					</div>
            <sf:errors path="applyTime" cssClass="error" />
		</div>
        <div class="col-sm-4"></div>
	</div>

	<div class="form-group">
		<sf:label path="organizationId" cssClass="col-sm-2 control-label">所在部门</sf:label>
		<div class="col-sm-4">
			<sf:input cssClass="form-control" path="organizationId" placeholder="请输入文字..." />
            <sf:errors path="organizationId" cssClass="error" />
		</div>
        <div class="col-sm-4"></div>
	</div>

	<div class="form-group">
		<sf:label path="step1Idea" cssClass="col-sm-2 control-label">事业部/项目部审核意见</sf:label>
		<div class="col-sm-4">
			<sf:input cssClass="form-control" path="step1Idea" placeholder="请输入文字..." />
            <sf:errors path="step1Idea" cssClass="error" />
		</div>
        <div class="col-sm-4"></div>
	</div>

	<div class="form-group">
		<sf:label path="step1User" cssClass="col-sm-2 control-label">事业部/项目部审核人</sf:label>
		<div class="col-sm-4">
			<sf:input cssClass="form-control" path="step1User" placeholder="请输入文字..." />
            <sf:errors path="step1User" cssClass="error" />
		</div>
        <div class="col-sm-4"></div>
	</div>

	<div class="form-group">
		<sf:label path="step1Time" cssClass="col-sm-2 control-label">事业部/项目部审核时间</sf:label>
		<div class="col-sm-4">
					<div class="input-group date">
						<sf:input cssClass="form-control" path="step1Time"
							data-date-format="yyyy-mm-dd" />
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-calendar"></i></span>
					</div>
            <sf:errors path="step1Time" cssClass="error" />
		</div>
        <div class="col-sm-4"></div>
	</div>

	<div class="form-group">
		<sf:label path="step2Idea" cssClass="col-sm-2 control-label">财务部审核意见</sf:label>
		<div class="col-sm-4">
			<sf:input cssClass="form-control" path="step2Idea" placeholder="请输入文字..." />
            <sf:errors path="step2Idea" cssClass="error" />
		</div>
        <div class="col-sm-4"></div>
	</div>

	<div class="form-group">
		<sf:label path="step2User" cssClass="col-sm-2 control-label">财务部审核人</sf:label>
		<div class="col-sm-4">
			<sf:input cssClass="form-control" path="step2User" placeholder="请输入文字..." />
            <sf:errors path="step2User" cssClass="error" />
		</div>
        <div class="col-sm-4"></div>
	</div>

	<div class="form-group">
		<sf:label path="step2Time" cssClass="col-sm-2 control-label">财务部审核时间</sf:label>
		<div class="col-sm-4">
					<div class="input-group date">
						<sf:input cssClass="form-control" path="step2Time"
							data-date-format="yyyy-mm-dd" />
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-calendar"></i></span>
					</div>
            <sf:errors path="step2Time" cssClass="error" />
		</div>
        <div class="col-sm-4"></div>
	</div>

	<div class="form-group">
		<sf:label path="step3Idea" cssClass="col-sm-2 control-label">经办人办理结果</sf:label>
		<div class="col-sm-4">
			<sf:input cssClass="form-control" path="step3Idea" placeholder="请输入文字..." />
            <sf:errors path="step3Idea" cssClass="error" />
		</div>
        <div class="col-sm-4"></div>
	</div>

	<div class="form-group">
		<sf:label path="step3User" cssClass="col-sm-2 control-label">经办人</sf:label>
		<div class="col-sm-4">
			<sf:input cssClass="form-control" path="step3User" placeholder="请输入文字..." />
            <sf:errors path="step3User" cssClass="error" />
		</div>
        <div class="col-sm-4"></div>
	</div>

	<div class="form-group">
		<sf:label path="step3Time" cssClass="col-sm-2 control-label">经办时间</sf:label>
		<div class="col-sm-4">
					<div class="input-group date">
						<sf:input cssClass="form-control" path="step3Time"
							data-date-format="yyyy-mm-dd" />
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-calendar"></i></span>
					</div>
            <sf:errors path="step3Time" cssClass="error" />
		</div>
        <div class="col-sm-4"></div>
	</div>

	<div class="form-group">
		<sf:label path="stepStatus" cssClass="col-sm-2 control-label">流程状态</sf:label>
		<div class="col-sm-4">
			<sf:input cssClass="form-control" path="stepStatus" placeholder="请输入文字..." />
            <sf:errors path="stepStatus" cssClass="error" />
		</div>
        <div class="col-sm-4"></div>
	</div>

	<div class="form-group">
		<sf:label path="status" cssClass="col-sm-2 control-label">数据状态，0：草稿/1：正式</sf:label>
		<div class="col-sm-4">
			<sf:input cssClass="form-control" path="status" placeholder="请输入文字..." />
            <sf:errors path="status" cssClass="error" />
		</div>
        <div class="col-sm-4"></div>
	</div>
			<div>
				<div class="col-sm-4 control-label">
					<button type="submit" class="btn btn-primary">
						<span class="glyphicon glyphicon-ok"></span> 提 交
					</button>
				</div>
				<div class="col-sm-1 control-label">
					<a href='<s:url value="/chop" />' class="btn btn-default"><span
						class="glyphicon glyphicon-share-alt"></span> 返 回 </a>
				</div>
			</div>

		</sf:form>
	</div>
</div></div>
<script type="text/javascript">
	$(function() {
		$("form").validate({
			errorElement : "p",
			success: function(label) {
				label.text("　").addClass("success");
			},
			errorPlacement: function(error, element) {
				error.appendTo(element.parent("div").next("div"));
			},
			rules : { 	
                chopCode : {
                }, 
                projectId : {
                }, 
                projectCode : {
                }, 
                projectName : {
                }, 
                manager : {
                }, 
                content : {
                }, 
                applyUser : {
                }, 
                applyTime : {
                }, 
                organizationId : {
                }, 
                step1Idea : {
                }, 
                step1User : {
                }, 
                step1Time : {
                }, 
                step2Idea : {
                }, 
                step2User : {
                }, 
                step2Time : {
                }, 
                step3Idea : {
                }, 
                step3User : {
                }, 
                step3Time : {
                }, 
                stepStatus : {
                }, 
                status : {
                }, 
			}
		});
	});
</script>
<%@ include file="bottom.jsp"%>
