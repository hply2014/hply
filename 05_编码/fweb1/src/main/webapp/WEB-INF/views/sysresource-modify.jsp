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
		<sf:form modelAttribute="sysResource" cssClass="form-horizontal"
			role="form">
				<div class="row"><div class="col-sm-8">
        <div class="row">
							<label for="resourceCode" class="col-sm-2 control-label">资源编码</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="resourceCode"
									placeholder="资源编码" />
								<p class="help-block">&nbsp;</p>
							</div>
        
        

        
							<label for="resourceName" class="col-sm-2 control-label">资源名称</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="resourceName"
									placeholder="资源名称" />
								<p class="help-block">&nbsp;</p>
							</div>
        
        </div>

        <div class="row">
							<label for="icon" class="col-sm-2 control-label">图标路径</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="icon"
									placeholder="图标路径" />
								<p class="help-block">&nbsp;</p>
							</div>
        
        

        
							<label for="resourceUri" class="col-sm-2 control-label">URL地址</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="resourceUri"
									placeholder="URL地址" />
								<p class="help-block">&nbsp;</p>
							</div>
        
        </div>

        <div class="row">
							<label for="resourceType" class="col-sm-2 control-label">资源类型</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="resourceType"
									placeholder="资源类型" />
								<p class="help-block">&nbsp;</p>
							</div>
        
        

        
							<label for="orderId" class="col-sm-2 control-label">顺序号</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="orderId"
									placeholder="顺序号" />
								<p class="help-block">&nbsp;</p>
							</div>
        
        </div>

        <div class="row">
							<label for="parentId" class="col-sm-2 control-label">父ID</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="parentId"
									placeholder="父ID" />
								<p class="help-block">&nbsp;</p>
							</div>
        
        

        
							<label for="enabled" class="col-sm-2 control-label">是否禁用</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="enabled"
									placeholder="是否禁用" />
								<p class="help-block">&nbsp;</p>
							</div>
        
        </div>
						<div class="row">
							<sf:label path="description" cssClass="col-sm-2 control-label">备注</sf:label>
							<div class="col-sm-10">
								<sf:textarea cssClass="form-control" rows="3" path="description"
									placeholder="备注，500字以内" />
								<p class="help-block">&nbsp;</p>
							</div>
						</div>
                        
						<button type="submit" class="btn btn-info pull-right">
							<span class="glyphicon glyphicon-ok"></span> 提 交
						</button>
						<a href='<s:url value="/sysresource" />' class="btn btn-link"><span
							class="glyphicon glyphicon-share-alt"></span> 返 回 </a>
                        
				</div>
			</div>
				<c:if test="${not empty errors}">
					<div id="alert-error" class="col-sm-6 col-sm-offset-5">
						<div class="alert alert-danger alert-dismissible fade in"
							role="alert">
							<button type="button" class="close" data-dismiss="alert">
								<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
							</button>
							<h4>请求错误</h4>
							<p>
								<sf:errors path="*" />
							</p>
						</div>
					</div>
				</c:if>
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
