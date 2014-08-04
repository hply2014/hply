﻿<%@ page isELIgnored="false"%><%@ taglib
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
		<sf:form modelAttribute="sysRoleResource" cssClass="form-horizontal"
			role="form">
	<div class="form-group">
		<sf:label path="roleId" cssClass="col-sm-2 control-label"></sf:label>
		<div class="col-sm-4">
			<sf:input cssClass="form-control" path="roleId" placeholder="请输入文字..." />
            <sf:errors path="roleId" cssClass="error" />
		</div>
        <div class="col-sm-4"></div>
	</div>

	<div class="form-group">
		<sf:label path="resourceId" cssClass="col-sm-2 control-label"></sf:label>
		<div class="col-sm-4">
			<sf:input cssClass="form-control" path="resourceId" placeholder="请输入文字..." />
            <sf:errors path="resourceId" cssClass="error" />
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
					<a href='<s:url value="/sysroleresource" />' class="btn btn-default"><span
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
                roleId : {
                }, 
                resourceId : {
                }, 
			}
		});
	});
</script>
<%@ include file="bottom.jsp"%>
