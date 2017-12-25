<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="container main">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <strong>${page_title}</strong>
        </div>
        <div class="panel-body">
            <sf:form cssClass="form-horizontal" role="form">
                <div class="form-group">

                    <div class="row">
                        <div class="col-sm-8">
                            <div class="row">
                                <label for="password0" class="col-sm-2 control-label">原密码</label>
                                <div class="col-sm-4">
                                    <input class="form-control" id="password0" type="password" name="password0"
                                        placeholder="请输入原密码" />
                                    <p class="help-block">&nbsp;</p>
                                </div>
                            </div>
                            <div class="row">
                                <label for="password" class="col-sm-2 control-label">新密码</label>
                                <div class="col-sm-4">
                                    <input class="form-control" id="password" type="password" name="password"
                                        placeholder="新密码长度在4个字符以上" />
                                    <p class="help-block">&nbsp;</p>
                                </div>
                            </div>
                            <div class="row">
                                <label for="password2" class="col-sm-2 control-label">确认</label>
                                <div class="col-sm-4">
                                    <input class="form-control" type="password" name="password2" id="password2"
                                        placeholder="请再输一遍新密码" />
                                    <p class="help-block">&nbsp;</p>
                                </div>
                            </div>
                            <button type="submit" id="btn_submit" class="btn btn-info col-sm-offset-2">
                                <span class="glyphicon glyphicon-ok"></span> 提 交
                            </button>
                        </div>
                    </div>
                </div>
                <input type="hidden" name="id" value="${userId }">
            </sf:form>
        </div>
    </div>
</div>
<script type="text/javascript">
	$(function() {
		$("form").validate({
			submitHandler : function() {
				$.post("<s:url value="/api/changepassword"/>", $("form").serialize(), function(data) {
					alert(data);
					if (data.indexOf("成功") >= 0) {
						self.location = "<s:url value='/' />";
					}
					$("#password0").focus();
				}, "text");
			},
			errorElement : "i",
			success : function(label, element) {
				$(element).parent().addClass("valid");
				$(element).next().html('');
				//.next().html('<b class="glyphicon glyphicon-ok text-success"></b><i>正确</i>');
			},
			errorPlacement : function(error, element) {
				element.parent().addClass("invalid");
				element.next().html('<b class="glyphicon glyphicon-remove text-danger"></b><i>' + error.html() + "</i>");
			},
			rules : {
				password0 : {
					required : true
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