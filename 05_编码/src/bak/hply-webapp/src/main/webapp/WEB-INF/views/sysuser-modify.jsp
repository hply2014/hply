<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="container main"><div class="panel panel-default">
	<div class="panel-heading">
		<strong>${page_title}</strong>
	</div>
	<div class="panel-body">
		<sf:form modelAttribute="sysUser" cssClass="form-horizontal"
			role="form">
				<div class="row"><div class="col-sm-8">
        <div class="row">
							<label for="loginName" class="col-sm-2 control-label">登陆名</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="loginName"
									placeholder="登陆名" />
								<p class="help-block">&nbsp;</p>
							</div>
        
        
        
    
        
							<label for="realName" class="col-sm-2 control-label">姓名</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="realName"
									placeholder="姓名" />
								<p class="help-block">&nbsp;</p>
							</div>
        
        </div>
        
    
        <div class="row">
							<label for="organizationId" class="col-sm-2 control-label">所在部门</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="organizationId"
									placeholder="所在部门" />
								<p class="help-block">&nbsp;</p>
							</div>
        
        
        
    
        
							<label for="password" class="col-sm-2 control-label">密码</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="password"
									placeholder="密码" />
								<p class="help-block">&nbsp;</p>
							</div>
        
        </div>
        
    
        <div class="row">
							<label for="lastLoginIp" class="col-sm-2 control-label">最后登陆IP</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="lastLoginIp"
									placeholder="最后登陆IP" />
								<p class="help-block">&nbsp;</p>
							</div>
        
        
        
    
        
							<label for="lastLoginTime" class="col-sm-2 control-label">最后登陆时间</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>
					<div class="input-group date">
						<sf:input cssClass="form-control" path="lastLoginTime"
							data-date-format="yyyy-mm-dd" />
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-calendar"></i></span>
					</div>
								<p class="help-block">&nbsp;</p>
							</div>
        
        </div>
        
    
        <div class="row">
							<label for="fails" class="col-sm-2 control-label">连续登录失败次数</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="fails"
									placeholder="连续登录失败次数" />
								<p class="help-block">&nbsp;</p>
							</div>
        
        
        
    
        
							<label for="logined" class="col-sm-2 control-label">登陆总次数</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="logined"
									placeholder="登陆总次数" />
								<p class="help-block">&nbsp;</p>
							</div>
        
        </div>
        
    
        <div class="row">
							<label for="position" class="col-sm-2 control-label">职务</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="position"
									placeholder="职务" />
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
							<label for="orderBy" class="col-sm-2 control-label">顺序号</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="orderBy"
									placeholder="顺序号" />
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
							<label for="mustChangePassword" class="col-sm-2 control-label">下次登录是否必须修改密码</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="mustChangePassword"
									placeholder="下次登录是否必须修改密码" />
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
						<a href='<s:url value="/sysuser" />' class="btn btn-link"><span
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
                loginName : {
                }, 
                realName : {
                }, 
                organizationId : {
                }, 
                password : {
                }, 
                lastLoginIp : {
                }, 
                lastLoginTime : {
                }, 
                fails : {
                }, 
                logined : {
                }, 
                position : {
                }, 
                enabled : {
                }, 
                orderBy : {
                }, 
                createTime : {
                }, 
                description : {
                }, 
                mustChangePassword : {
                }, 
			}
		});
	});
</script>
<%@ include file="bottom.jsp"%>
