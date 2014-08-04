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
		<sf:form modelAttribute="sysResource" cssClass="form-horizontal"
			role="form">
	<div class="form-group">
		<sf:label path="resourceCode" cssClass="col-sm-2 control-label">资源编码</sf:label>
		<div class="col-sm-4">
			<sf:input cssClass="form-control" path="resourceCode" placeholder="请输入文字..." />
            <sf:errors path="resourceCode" cssClass="error" />
		</div>
        <div class="col-sm-4"></div>
	</div>

	<div class="form-group">
		<sf:label path="resourceName" cssClass="col-sm-2 control-label">资源名称</sf:label>
		<div class="col-sm-4">
			<sf:input cssClass="form-control" path="resourceName" placeholder="请输入文字..." />
            <sf:errors path="resourceName" cssClass="error" />
		</div>
        <div class="col-sm-4"></div>
	</div>

	<div class="form-group">
		<sf:label path="icon" cssClass="col-sm-2 control-label">图标路径</sf:label>
		<div class="col-sm-4">
			<sf:input cssClass="form-control" path="icon" placeholder="请输入文字..." />
            <sf:errors path="icon" cssClass="error" />
		</div>
        <div class="col-sm-4"></div>
	</div>

	<div class="form-group">
		<sf:label path="resourceUri" cssClass="col-sm-2 control-label">URL地址</sf:label>
		<div class="col-sm-4">
			<sf:input cssClass="form-control" path="resourceUri" placeholder="请输入文字..." />
            <sf:errors path="resourceUri" cssClass="error" />
		</div>
        <div class="col-sm-4"></div>
	</div>

	<div class="form-group">
		<sf:label path="resourceType" cssClass="col-sm-2 control-label">资源类型</sf:label>
		<div class="col-sm-4">
			<sf:input cssClass="form-control" path="resourceType" placeholder="请输入文字..." />
            <sf:errors path="resourceType" cssClass="error" />
		</div>
        <div class="col-sm-4"></div>
	</div>

	<div class="form-group">
		<sf:label path="orderId" cssClass="col-sm-2 control-label">顺序号</sf:label>
		<div class="col-sm-4">
			<sf:input cssClass="form-control" path="orderId" placeholder="请输入文字..." />
            <sf:errors path="orderId" cssClass="error" />
		</div>
        <div class="col-sm-4"></div>
	</div>

	<div class="form-group">
		<sf:label path="parentId" cssClass="col-sm-2 control-label">父ID</sf:label>
		<div class="col-sm-4">
			<sf:input cssClass="form-control" path="parentId" placeholder="请输入文字..." />
            <sf:errors path="parentId" cssClass="error" />
		</div>
        <div class="col-sm-4"></div>
	</div>

	<div class="form-group">
		<sf:label path="enabled" cssClass="col-sm-2 control-label">是否禁用</sf:label>
		<div class="col-sm-4">
			<sf:input cssClass="form-control" path="enabled" placeholder="请输入文字..." />
            <sf:errors path="enabled" cssClass="error" />
		</div>
        <div class="col-sm-4"></div>
	</div>

	<div class="form-group">
		<sf:label path="description" cssClass="col-sm-2 control-label">备注</sf:label>
		<div class="col-sm-4">
			<sf:input cssClass="form-control" path="description" placeholder="请输入文字..." />
            <sf:errors path="description" cssClass="error" />
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
					<a href='<s:url value="/sysresource" />' class="btn btn-default"><span
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
                resourceCode : {
                }, 
                resourceName : {
                }, 
                icon : {
                }, 
                resourceUri : {
                }, 
                resourceType : {
                }, 
                orderId : {
                }, 
                parentId : {
                }, 
                enabled : {
                }, 
                description : {
                }, 
			}
		});
	});
</script>
<%@ include file="bottom.jsp"%>
