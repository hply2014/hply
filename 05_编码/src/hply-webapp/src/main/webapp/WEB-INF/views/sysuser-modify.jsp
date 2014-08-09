<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="container main">
    <div class="container main">
        <div class="panel panel-default">
            <div class="panel-heading">
                <strong>${page_title}</strong>
            </div>
            <div class="panel-body">
                <sf:form modelAttribute="sysUser" cssClass="form-horizontal" role="form">
                    <div class="form-group">
                        <sf:label path="loginName" cssClass="col-sm-2 control-label">登陆名</sf:label>
                        <div class="col-sm-4">
                            <sf:input cssClass="form-control" path="loginName" placeholder="请输入登录名..." />
                            <sf:errors path="loginName" cssClass="error" />
                        </div>
                        <div class="col-sm-4"></div>
                    </div>
                    <div class="form-group">
                        <sf:label path="realName" cssClass="col-sm-2 control-label">姓名</sf:label>
                        <div class="col-sm-4">
                            <sf:input cssClass="form-control" path="realName" placeholder="请输入姓名..." />
                            <sf:errors path="realName" cssClass="error" />
                        </div>
                        <div class="col-sm-4"></div>
                    </div>
                    <c:if test="${empty is_modify }">
                        <div class="form-group">
                            <sf:label path="password" cssClass="col-sm-2 control-label">密码</sf:label>
                            <div class="col-sm-4">
                                <sf:password cssClass="form-control" path="password" placeholder="请输入密码.." />
                                <sf:errors path="password" cssClass="error" />
                            </div>
                            <div class="col-sm-4"></div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">确认密码</label>
                            <div class="col-sm-4">
                                <input class="form-control" type="password" id="password2" name="password2"
                                    placeholder="请再次输入新密码" />
                            </div>
                            <div class="col-sm-4"></div>
                        </div>
                    </c:if>
                    <div class="form-group">
                        <div class="col-sm-2"></div>
                        <div class="col-sm-6 checkbox">
                            <sf:checkbox cssClass="icheckbox" path="mustChangePassword" id="mustChangePassword"
                                value="1" />
                            <label for="mustChangePassword">下次登录必须修改密码</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <sf:label path="organizationId" cssClass="col-sm-2 control-label">所在部门</sf:label>
                        <div class="col-sm-4">
                            <sf:select cssClass="form-control selectpicker" path="organizationId" items="${orglist }"
                                itemValue="id" itemLabel="organizationName" />
                            <sf:errors path="organizationId" cssClass="error" />
                        </div>
                        <div class="col-sm-4"></div>
                    </div>
                    <div class="form-group">
                        <sf:label path="position" cssClass="col-sm-2 control-label">职务</sf:label>
                        <div class="col-sm-4">
                            <sf:input cssClass="form-control" path="position" placeholder="请输入文字..." />
                            <sf:errors path="position" cssClass="error" />
                        </div>
                        <div class="col-sm-4"></div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-2"></div>
                        <div class="col-sm-6 checkbox">
                            <sf:checkbox cssClass="icheckbox" path="enabled" id="enabled" value="1" />
                            <label for="enabled">启用，允许登录系统</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <sf:label path="orderBy" cssClass="col-sm-2 control-label">顺序号</sf:label>
                        <div class="col-sm-4">
                            <sf:input cssClass="form-control" path="orderBy" placeholder="请输入文字..." />
                            <sf:errors path="orderBy" cssClass="error" />
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
                            <a href='<s:url value="/sysuser" />' class="btn btn-default"><span
                                class="glyphicon glyphicon-share-alt"></span> 返 回 </a>
                        </div>
                    </div>
                    <c:if test="${not empty errors}">
                        <div id="alert-error" class="col-sm-6 col-sm-offset-5">
                            <div class="alert alert-danger alert-dismissible fade in" role="alert">
                                <button type="button" class="close" data-dismiss="alert">
                                    <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                                </button>
                                <h4>数据提交错误</h4>
                                <p>
                                    <sf:errors path="*" />
                                </p>
                            </div>
                        </div>
                    </c:if>
                </sf:form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
	$(function() {
		$("form").validate({
			errorElement : "p",
			success : function(label) {
				label.text("　").addClass("success");
			},
			errorPlacement : function(error, element) {
				error.appendTo(element.parent("div").next("div"));
			},
			rules : {
				loginName : {
					required : true,
					minlength : 3,
					maxlength : 10
				},
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
				loginName : {
					minlength : "要求英文字母、数字，长度在3 ~ 20之间。"
				},
				password : {
					minlength : "密码长度至少需要4位。"
				},
				password2 : {
					minlength : "确认密码长度至少需要4位。",
					equalTo : "必须与密码完全一致。"
				}
			}
		});
	});
</script>
<%@ include file="bottom.jsp"%>
