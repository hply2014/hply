﻿<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="container main"><div class="panel panel-default">
	<div class="panel-heading">
		<strong>${page_title}</strong>
	</div>
	<div class="panel-body">
		<sf:form modelAttribute="sysParameter" cssClass="form-horizontal"
			role="form">
				<div class="row"><div class="col-sm-8">
        <div class="row">
							<label for="paramCode" class="col-sm-2 control-label">参数编码</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="paramCode"
									placeholder="参数编码" />
								<p class="help-block">&nbsp;</p>
							</div>
        
        
        
    
        
							<label for="paramName" class="col-sm-2 control-label">参数中文名称</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="paramName"
									placeholder="参数中文名称" />
								<p class="help-block">&nbsp;</p>
							</div>
        
        </div>
        
    
        <div class="row">
							<label for="paramValue" class="col-sm-2 control-label">参数值</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="paramValue"
									placeholder="参数值" />
								<p class="help-block">&nbsp;</p>
							</div>
        
        
        
    
        
							<label for="defaultValue" class="col-sm-2 control-label">默认值</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="defaultValue"
									placeholder="默认值" />
								<p class="help-block">&nbsp;</p>
							</div>
        
        </div>
        
    
        <div class="row">
							<label for="isInner" class="col-sm-2 control-label">是否系统内置</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="isInner"
									placeholder="是否系统内置" />
								<p class="help-block">&nbsp;</p>
							</div>
        
        
        
    
        
							<label for="createTime" class="col-sm-2 control-label">创建时间</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>
					<div class="input-group date">
						<sf:input cssClass="form-control" path="createTime"
							data-date-format="yyyy-mm-dd" />
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-calendar"></i></span>
					</div>
								<p class="help-block">&nbsp;</p>
							</div>
        
        </div>
        
    
        <div class="row">
							<label for="ext01" class="col-sm-2 control-label">预留扩展字段1</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="ext01"
									placeholder="预留扩展字段1" />
								<p class="help-block">&nbsp;</p>
							</div>
        
        
        
    
        
							<label for="ext02" class="col-sm-2 control-label">预留扩展字段2</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="ext02"
									placeholder="预留扩展字段2" />
								<p class="help-block">&nbsp;</p>
							</div>
        
        </div>
        
    
        <div class="row">
							<label for="ext03" class="col-sm-2 control-label">预留扩展字段3</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="ext03"
									placeholder="预留扩展字段3" />
								<p class="help-block">&nbsp;</p>
							</div>
        
        
        
    
        
							<label for="ext04" class="col-sm-2 control-label">预留扩展字段4</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="ext04"
									placeholder="预留扩展字段4" />
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
						<a href='<s:url value="/sysparameter" />' class="btn btn-link"><span
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
		</div><!--/panel-body-->
	</div><!--/panel-->
</div><!--/container main -->
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
                paramCode : {
                }, 
                paramName : {
                }, 
                paramValue : {
                }, 
                defaultValue : {
                }, 
                isInner : {
                }, 
                createTime : {
                }, 
                ext01 : {
                }, 
                ext02 : {
                }, 
                ext03 : {
                }, 
                ext04 : {
                }, 
                description : {
                }, 
			}
		});
	});
</script>
<%@ include file="bottom.jsp"%>
