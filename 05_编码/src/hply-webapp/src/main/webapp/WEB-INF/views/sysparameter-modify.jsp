﻿<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="container main">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <strong>${page_title}</strong>
        </div>
        <div class="panel-body">
            <sf:form modelAttribute="sysParameter" cssClass="form-horizontal" role="form">
                <div class="row">
                    <div class="col-sm-8">
                        <div class="row">
                            <label for="enName" class="col-sm-2 control-label">参数英文名称</label>
                            <div class="col-sm-4 ">
                                <sf:input cssClass="form-control" path="enName" placeholder="参数英文名称" />
                                <p class="help-block" />
                            </div>

                            <label for="cnName" class="col-sm-2 control-label">参数中文名称</label>
                            <div class="col-sm-4 ">
                                <sf:input cssClass="form-control" path="cnName" placeholder="参数中文名称" />
                                <p class="help-block" />
                            </div>
                        </div>
                        <div class="row">
                            <label for="paramValue" class="col-sm-2 control-label">参数值</label>
                            <div class="col-sm-4 ">
                                <sf:input cssClass="form-control" path="paramValue" placeholder="参数值" />
                                <p class="help-block" />
                            </div>

                            <label for="defaultValue" class="col-sm-2 control-label">默认值</label>
                            <div class="col-sm-4 ">
                                <sf:input cssClass="form-control" path="defaultValue" placeholder="默认值" />
                                <p class="help-block" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-4 col-sm-offset-2 checkbox">
                                <sf:checkbox cssClass="icheckbox" path="isInner" id="isInner" value="1" />
                                <label for="isInner">系统内置</label>
                                <p class="help-block" />
                            </div>
                        </div>
                        <div class="row">
                            <sf:label path="description" cssClass="col-sm-2 control-label">备注</sf:label>
                            <div class="col-sm-10">
                                <sf:textarea cssClass="form-control" rows="3" path="description" placeholder="备注，500字以内" />
                                <p class="help-block" />
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
                        <div class="alert alert-danger alert-dismissible fade in" role="alert">
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
        <!--/panel-body-->
    </div>
    <!--/panel-->
</div>
<!--/container main -->
<script type="text/javascript">
	$(function() {
		$("form").validate({
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
				enName : {},
				cnName : {},
				paramValue : {},
				defaultValue : {},
				isInner : {},
				description : {},
			}
		});
	});
</script>
<%@ include file="bottom.jsp"%>
