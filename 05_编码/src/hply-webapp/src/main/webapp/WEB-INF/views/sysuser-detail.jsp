<%@ page isELIgnored="false"%><%@ 
taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ 
taglib
	uri="http://www.springframework.org/tags" prefix="s"%><%@ 
taglib
	uri="http://www.springframework.org/tags/form" prefix="sf"%><%@ 
taglib
	uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%><%@ 
page
	language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%><%@ include file="header.jsp"%>
<div class="container main">
	<div class="panel panel-default">
		<div class="panel-heading">
			<strong>${page_title}</strong>
		</div>
		<div class="panel-body">
			<div class="btn-toolbar" role="toolbar">
				<div class="btn-group">
					<a href="<s:url value="/sysuser" />" class="btn btn-info"><span
						class="glyphicon glyphicon-share-alt"></span> 返 回 </a>
				</div>
				<div class="btn-group">
					<a href="javascript:void();" id="btn_reset" class="btn btn-info"><span
						class="glyphicon glyphicon-lock"></span> 密码重置 </a>
				</div>
				<div class="btn-group">
					<a
						href="<s:url value="/sysuser/modify/{id}"><s:param name="id" value="${sysUser.id }" /></s:url>"
						class="btn btn-info"><span class="glyphicon glyphicon-pencil"></span>
						修 改 </a>
				</div>
				<div class="btn-group">
					<a
						data-confirm-message="删除后不可恢复，您确认要删除【<c:out value="${sysUser.realName}" />】么？"
						href="<s:url value="/sysuser/delete/{id}"><s:param name="id" value="${sysUser.id }" /></s:url>"
						class="btn btn-info delete"><span
						class="glyphicon glyphicon-trash"></span> 删 除 </a>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<sf:form modelAttribute="sysUser" cssClass="form-horizontal"
						role="form">
						<div class="form-group">
							<sf:label path="loginName" cssClass="col-sm-3 control-label">登陆名</sf:label>
							<div class="col-sm-9">
								<p class="form-control-static">
									<c:out value="${sysUser.loginName}" />
								</p>
							</div>
						</div>

						<div class="form-group">
							<sf:label path="realName" cssClass="col-sm-3 control-label">姓名</sf:label>
							<div class="col-sm-9">
								<p class="form-control-static">
									<c:out value="${sysUser.realName}" />
								</p>
							</div>
						</div>

						<div class="form-group">
							<sf:label path="organizationId" cssClass="col-sm-3 control-label">所在部门</sf:label>
							<div class="col-sm-9">
								<p class="form-control-static">
									<c:out value="${sysUser.organizationId}" />
								</p>
							</div>
						</div>

						<div class="form-group">
							<sf:label path="lastLoginIp" cssClass="col-sm-3 control-label">最后登陆IP</sf:label>
							<div class="col-sm-9">
								<p class="form-control-static">
									<c:out value="${sysUser.lastLoginIp}" />
								</p>
							</div>
						</div>

						<div class="form-group">
							<sf:label path="lastLoginTime" cssClass="col-sm-3 control-label">最后登陆时间</sf:label>
							<div class="col-sm-9">
								<p class="form-control-static">
									<fmt:formatDate value="${sysUser.lastLoginTime}"
										pattern="yyyy-MM-dd HH:mm:ss" />
								</p>
							</div>
						</div>

						<div class="form-group">
							<sf:label path="fails" cssClass="col-sm-3 control-label">连续登录失败次数</sf:label>
							<div class="col-sm-9">
								<p class="form-control-static">
									<c:out value="${sysUser.fails}" />
								</p>
							</div>
						</div>

						<div class="form-group">
							<sf:label path="logined" cssClass="col-sm-3 control-label">登陆总次数</sf:label>
							<div class="col-sm-9">
								<p class="form-control-static">
									<c:out value="${sysUser.logined}" />
								</p>
							</div>
						</div>

						<div class="form-group">
							<sf:label path="position" cssClass="col-sm-3 control-label">职务</sf:label>
							<div class="col-sm-9">
								<p class="form-control-static">
									<c:out value="${sysUser.position}" />
								</p>
							</div>
						</div>

						<div class="form-group">
							<sf:label path="enabled" cssClass="col-sm-3 control-label">是否启用</sf:label>
							<div class="col-sm-9">
								<p class="form-control-static">
									<c:out value="${sysUser.enabled}" />
								</p>
							</div>
						</div>

						<div class="form-group">
							<sf:label path="orderBy" cssClass="col-sm-3 control-label">顺序号</sf:label>
							<div class="col-sm-9">
								<p class="form-control-static">
									<c:out value="${sysUser.orderBy}" />
								</p>
							</div>
						</div>

						<div class="form-group">
							<sf:label path="createTime" cssClass="col-sm-3 control-label">创建时间</sf:label>
							<div class="col-sm-9">
								<p class="form-control-static">
									<fmt:formatDate value="${sysUser.createTime}"
										pattern="yyyy-MM-dd HH:mm:ss" />
								</p>
							</div>
						</div>

						<div class="form-group">
							<sf:label path="createUser" cssClass="col-sm-3 control-label">创建用户</sf:label>
							<div class="col-sm-9">
								<p class="form-control-static">
									<c:out value="${sysUser.createUser}" />
								</p>
							</div>
						</div>

						<div class="form-group">
							<sf:label path="updateTime" cssClass="col-sm-3 control-label">修改时间</sf:label>
							<div class="col-sm-9">
								<p class="form-control-static">
									<fmt:formatDate value="${sysUser.updateTime}"
										pattern="yyyy-MM-dd HH:mm:ss" />
								</p>
							</div>
						</div>

						<div class="form-group">
							<sf:label path="updateUser" cssClass="col-sm-3 control-label">修改用户</sf:label>
							<div class="col-sm-9">
								<p class="form-control-static">
									<c:out value="${sysUser.updateUser}" />
								</p>
							</div>
						</div>

						<div class="form-group">
							<sf:label path="description" cssClass="col-sm-3 control-label">备注</sf:label>
							<div class="col-sm-9">
								<p class="form-control-static">
									<c:out value="${sysUser.description}" />
								</p>
							</div>
						</div>

						<div class="form-group">
							<sf:label path="mustChangePassword"
								cssClass="col-sm-3 control-label">下次登录是否必须修改密码</sf:label>
							<div class="col-sm-9">
								<p class="form-control-static">
									<c:out value="${sysUser.mustChangePassword}" />
								</p>
							</div>
						</div>
					</sf:form>
				</div>
				<div class="col-md-6">
					<div class="panel panel-default">
						<div class="panel-heading">
							<strong>功能授权</strong>
						</div>
						<div class="panel-body">
							<div id="fancytree1"></div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>
<div class="modal fade" id="resetPasswordModal">
	<div class="modal-dialog">
		<form class="form-horizontal" role="form" id="resetPasswordForm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title">重置【${sysUser.realName}】的密码</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="password" class="col-sm-3 control-label">新密码</label>
						<div class="col-sm-6">
							<input class="form-control" id="password" type="password"
								name="password" placeholder="密码长度在4个字符以上" />
						</div>
					</div>
					<div class="form-group">
						<label for="password2" class="col-sm-3 control-label">确认</label>
						<div class="col-sm-6">
							<input class="form-control" type="password" name="password2"
								id="password2" placeholder="请再输一遍新密码" />
						</div>
					</div>
					<input type="hidden" name="id" value="${sysUser.id }">
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary">
						<span class="glyphicon glyphicon-saved"></span> 确定
					</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">
						<span class="glyphicon glyphicon-share-alt"></span> 取消
					</button>
				</div>
			</div>
		</form>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<script type="text/javascript">
	$.getScript("<s:url value="/assets/jquery.fancytree.js" />", function() {
		$("#fancytree1").fancytree({
			icons : false,
			checkbox : true,
			source : {
				url : encodeURI("<s:url value="/api/tree/${sysUser.id}"/>"),
				cache : false
			},
			activate : function(event, data) {
				data.node.setSelected(true);
			},
			select : function(event, data) {
				// var s = data.node.key;
				$.post("<s:url value="/api/auth/${sysUser.id}"/>" + "/" + data.node.key, function(data) {
					//alert(data);
				}, "text");
			}
		});
	});

	$(function() {
		$("#btn_reset").click(function() {
			$("#password, #password2").val("");
			$("#resetPasswordModal").modal("show");
			return false;
		});

		$("#resetPasswordForm").validate({
			submitHandler : function() {
				$.post("<s:url value="/api/resetpassword"/>", $("#resetPasswordForm").serialize(), function(data) {
					alert(data);
				}, "text");
				$("#resetPasswordModal").modal("hide");
			},
			errorElement : "p",
			rules : {
				password : {
					required : true,
					minlength : 4
				},
				password2 : {
					required : true,
					minlength : 4,
					equalTo : "#password"
				}
			},
			messages : {
				password : {
					minlength : "密码长度至少需要4位。"
				},
				password2 : {
					minlength : "确认密码长度至少需要4位。",
					equalTo : "必须与新密码完全一致。"
				}
			}
		});
	});
</script>
<%@ include file="bottom.jsp"%>
