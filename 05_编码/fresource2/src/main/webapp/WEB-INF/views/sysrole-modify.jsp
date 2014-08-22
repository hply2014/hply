<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="container main"><div class="panel panel-default">
	<div class="panel-heading">
		<strong>${page_title}</strong>
	</div>
	<div class="panel-body">
		<sf:form modelAttribute="sysRole" cssClass="form-horizontal"
			role="form">
				<div class="row"><div class="col-sm-8">
        <div class="row">
							<label for="roleCode" class="col-sm-2 control-label"></label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="roleCode"
									placeholder="" />
								<p class="help-block">&nbsp;</p>
							</div>
        
        
        
    
        
							<label for="name" class="col-sm-2 control-label">角色名称</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="name"
									placeholder="角色名称" />
								<p class="help-block">&nbsp;</p>
							</div>
        
        </div>
        
    
        <div class="row">
							<label for="isDefault" class="col-sm-2 control-label">是否是默认角色</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="isDefault"
									placeholder="是否是默认角色" />
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
						<a href='<s:url value="/sysrole" />' class="btn btn-link"><span
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
                roleCode : {
                }, 
                name : {
                }, 
                isDefault : {
                }, 
                description : {
                }, 
			}
		});
	});
</script>
<%@ include file="bottom.jsp"%>
