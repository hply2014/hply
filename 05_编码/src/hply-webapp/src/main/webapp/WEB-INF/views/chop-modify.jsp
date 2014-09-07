<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="container main">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <strong>${page_title}</strong>
        </div>
        <div class="panel-body">
            <sf:form modelAttribute="chop" cssClass="form-horizontal" role="form">
                <div class="row">
                    <div class="col-sm-8">
                        <c:choose>
                            <c:when test="${1>1 }">


                                <div class="row">

                                    <label for="step1Idea" class="col-sm-2 control-label">事业部/项目部审核意见</label>
                                    <div class="col-sm-4 ">
                                        <sf:input cssClass="form-control" path="step1Idea" placeholder="事业部/项目部审核意见" />
                                        <p class="help-block" />
                                    </div>
                                </div>
                                <div class="row">
                                    <label for="step1User" class="col-sm-2 control-label">事业部/项目部审核人</label>
                                    <div class="col-sm-4 ">
                                        <sf:input cssClass="form-control" path="step1User" placeholder="事业部/项目部审核人" />
                                        <p class="help-block" />
                                    </div>

                                    <label for="step1Time" class="col-sm-2 control-label">事业部/项目部审核时间</label>
                                    <div class="col-sm-4 ">
                                        <div class="input-group date">
                                            <sf:input cssClass="form-control" path="step1Time"
                                                data-date-format="yyyy-mm-dd" />
                                            <span class="input-group-addon"><i
                                                class="glyphicon glyphicon-calendar"></i></span>
                                        </div>
                                        <p class="help-block" />
                                    </div>
                                </div>
                                <div class="row">
                                    <label for="step2Idea" class="col-sm-2 control-label">财务部审核意见</label>
                                    <div class="col-sm-4 ">
                                        <sf:input cssClass="form-control" path="step2Idea" placeholder="财务部审核意见" />
                                        <p class="help-block" />
                                    </div>

                                    <label for="step2User" class="col-sm-2 control-label">财务部审核人</label>
                                    <div class="col-sm-4 ">
                                        <sf:input cssClass="form-control" path="step2User" placeholder="财务部审核人" />
                                        <p class="help-block" />
                                    </div>
                                </div>
                                <div class="row">
                                    <label for="step2Time" class="col-sm-2 control-label">财务部审核时间</label>
                                    <div class="col-sm-4 ">
                                        <div class="input-group date">
                                            <sf:input cssClass="form-control" path="step2Time"
                                                data-date-format="yyyy-mm-dd" />
                                            <span class="input-group-addon"><i
                                                class="glyphicon glyphicon-calendar"></i></span>
                                        </div>
                                        <p class="help-block" />
                                    </div>

                                    <label for="step3Idea" class="col-sm-2 control-label">经办人办理结果</label>
                                    <div class="col-sm-4 ">
                                        <sf:input cssClass="form-control" path="step3Idea" placeholder="经办人办理结果" />
                                        <p class="help-block" />
                                    </div>
                                </div>
                                <div class="row">
                                    <label for="step3User" class="col-sm-2 control-label">经办人</label>
                                    <div class="col-sm-4 ">
                                        <sf:input cssClass="form-control" path="step3User" placeholder="经办人" />
                                        <p class="help-block" />
                                    </div>

                                    <label for="step3Time" class="col-sm-2 control-label">经办时间</label>
                                    <div class="col-sm-4 ">
                                        <div class="input-group date">
                                            <sf:input cssClass="form-control" path="step3Time"
                                                data-date-format="yyyy-mm-dd" />
                                            <span class="input-group-addon"><i
                                                class="glyphicon glyphicon-calendar"></i></span>
                                        </div>
                                        <p class="help-block" />
                                    </div>
                                </div>
                                <div class="row">
                                    <label for="stepStatus" class="col-sm-2 control-label">流程状态</label>
                                    <div class="col-sm-4 ">
                                        <sf:input cssClass="form-control" path="stepStatus" placeholder="流程状态" />
                                        <p class="help-block" />
                                    </div>
                                </div>
                            </c:when>

                            <c:otherwise>
                                <div class="row">
                                    <label for="chopCode" class="col-sm-2 control-label">编号</label>
                                    <div class="col-sm-4 required-field-block">
                                        <b class="required-icon">*</b>
                                        <sf:input cssClass="form-control" path="chopCode" placeholder="编号" />
                                        <p class="help-block" />
                                    </div>

                                </div>
                                <div class="row">
                                    <label for="projectId" class="col-sm-2 control-label">项目名称</label>
                                    <div class="col-sm-8 required-field-block">
                                        <b class="required-icon">*</b>
                                        <%--    <sf:input cssClass="form-control" path="projectId" placeholder="项目ID" /> --%>
                                        <sf:select cssClass="form-control select2" path="projectId"
                                            items="${projectlist }" itemValue="id" itemLabel="projectName" />
                                        <p class="help-block" />
                                    </div>
                                </div>
                                <%--
                        <div class="row">
                            <label for="projectCode" class="col-sm-2 control-label">项目编号</label>
                            <div class="col-sm-4 ">
                                <sf:input cssClass="form-control" path="projectCode" placeholder="项目编号" />
                                <p class="help-block" />
                            </div>

                            <label for="projectName" class="col-sm-2 control-label">项目名称</label>
                            <div class="col-sm-4 ">
                                <sf:input cssClass="form-control" path="projectName" placeholder="项目名称" />
                                <p class="help-block" />
                            </div>
                        </div> --%>
                                <div class="row">
                                    <label for="organizationId" class="col-sm-2 control-label">所在部门</label>
                                    <div class="col-sm-4 ">
                                        <p class="form-control-static">
                                            <c:out value="${chop.organizationId}" />
                                        </p>
                                        <p class="help-block" />
                                    </div>
                                    <label for="manager" class="col-sm-2 control-label">项目经理</label>
                                    <div class="col-sm-4 ">
                                        <p class="form-control-static" id="manager">
                                            <c:out value="${chop.manager}" />
                                        </p>
                                        <p class="help-block" />
                                    </div>
                                </div>

                                <div class="row">
                                    <sf:label path="content" cssClass="col-sm-2 control-label">主要内容</sf:label>
                                    <div class="col-sm-10">
                                        <sf:textarea cssClass="form-control" rows="3" path="content"
                                            placeholder="主要内容，500字以内" />
                                        <p class="help-block" />
                                    </div>
                                </div>


                                <div class="row">
                                    <label for="applyUser" class="col-sm-2 control-label">申请人</label>
                                    <div class="col-sm-4 ">
                                        <p class="form-control-static">
                                            <c:out value="${chop.applyUser}" />
                                        </p>
                                        <p class="help-block" />
                                    </div>

                                    <label for="applyTime" class="col-sm-2 control-label">申请时间</label>
                                    <div class="col-sm-4 ">
                                        <p class="form-control-static">
                                            <fmt:formatDate value="${chop.applyTime}" pattern="yyyy-MM-dd" />
                                        </p>
                                        <p class="help-block" />
                                    </div>
                                </div>
                            </c:otherwise>

                        </c:choose>

                        <button type="submit" class="btn btn-info pull-right">
                            <span class="glyphicon glyphicon-ok"></span> 提 交
                        </button>
                        <a href='<s:url value="/chop" />' class="btn btn-link"><span
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
				chopCode : {
					required : true
				},
				projectId : {},
				projectCode : {},
				projectName : {},
				manager : {},
				content : {},
				applyUser : {},
				applyTime : {},
				organizationId : {},
				step1Idea : {},
				step1User : {},
				step1Time : {},
				step2Idea : {},
				step2User : {},
				step2Time : {},
				step3Idea : {},
				step3User : {},
				step3Time : {},
				stepStatus : {},
			}
		});

		//在界面上选择了项目
		$("#projectId").change(function() {
			$.post("<s:url value='/api/getprojectmanager/' />" + jQuery("#projectId").val(), {}, function(result) {
				$("#manager").html(result);
			}, "text");
		});

		$.post("<s:url value='/api/getprojectmanager/' />" + jQuery("#projectId").val(), {}, function(result) {
			$("#manager").html(result);
		}, "text");
	});
</script>
<%@ include file="bottom.jsp"%>
