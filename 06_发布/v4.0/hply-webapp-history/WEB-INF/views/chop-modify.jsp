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
                        <c:if test="${not (empty step1 and empty step2 and empty step3) }">
                            <div class="row">
                                <label for="chopCode" class="col-sm-2 control-label">编号</label>
                                <div class="col-sm-4">
                                    <p class="form-control-static">
                                        <c:out value="${chop.chopCode}" />
                                    </p>
                                </div>
                                <label for="field01" class="col-sm-2 control-label">项目实施人</label>
                                <div class="col-sm-4 ">
                                    <p class="form-control-static" id="field01">
                                        <c:out value="${chop.field01}" />
                                    </p>
                                </div>
                            </div>
                            <div class="row">
                                <label for="projectId" class="col-sm-2 control-label">项目名称</label>
                                <div class="col-sm-8">
                                    <p class="form-control-static">
                                        <c:out value="${chop.projectName}" />
                                    </p>
                                </div>
                            </div>
                            <div class="row">
                                <label for="organizationId" class="col-sm-2 control-label">所在部门</label>
                                <div class="col-sm-4 ">
                                    <p class="form-control-static">
                                        <c:out value="${chop.organizationId}" />
                                    </p>
                                </div>
                                <label for="manager" class="col-sm-2 control-label">项目经理</label>
                                <div class="col-sm-4 ">
                                    <p class="form-control-static" id="manager">
                                        <c:out value="${chop.manager}" />
                                    </p>
                                </div>
                            </div>

                            <div class="row">
                                <sf:label path="content" cssClass="col-sm-2 control-label">主要内容</sf:label>
                                <div class="col-sm-10">
                                    <p class="form-control-static">
                                        <c:out value="${chop.content}" />
                                    </p>
                                </div>
                            </div>
                            <div class="row">
                                <label for="field02" class="col-sm-2 control-label">经办人</label>
                                <div class="col-sm-4 ">
                                    <p class="form-control-static">
                                        <c:out value="${chop.field02}" />
                                    </p>
                                </div>
                            </div>
                            <div class="row">
                                <label for="applyUser" class="col-sm-2 control-label">申请人</label>
                                <div class="col-sm-4 ">
                                    <p class="form-control-static">
                                        <c:out value="${chop.applyUser}" />
                                    </p>
                                </div>

                                <label for="applyTime" class="col-sm-2 control-label">申请时间</label>
                                <div class="col-sm-4 ">
                                    <p class="form-control-static">
                                        <fmt:formatDate value="${chop.applyTime}" pattern="yyyy-MM-dd" />
                                    </p>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${not empty step1 }">
                            <div class="row">
                                <div class="col-sm-2"></div>
                                <div class="col-sm-6 checkbox">
                                    <sf:checkbox cssClass="icheckbox" path="stepStatus" id="stepStatus" value="1" />
                                    <label for="stepStatus">同意</label>
                                    <p class="help-block" />
                                </div>
                            </div>
                            <div class="row">
                                <label for="step1Idea" class="col-sm-2 control-label">审核意见</label>
                                <div class="col-sm-6">
                                    <sf:input id="s1" cssClass="form-control" path="step1Idea" placeholder="部门审核意见" />
                                    <p class="help-block" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2"></div>
                                <button id="succ" type="submit" class="btn btn-success" disabled="disabled">
                                    <span class="glyphicon glyphicon-ok"></span> 同意
                                </button>
                                <button id="dang" type="submit" class="btn btn-danger sm-offset-3">
                                    <span class="glyphicon glyphicon-remove"></span> 拒绝
                                </button>
                                <a href='<s:url value="/chop" />' onclick="return goback();" class="btn btn-link"><span
                                    class="glyphicon glyphicon-share-alt"></span> 返 回 </a>
                            </div>
                        </c:if>
                        <c:if test="${not empty step2 }">
                            <div class="row">
                                <label class="col-sm-2 control-label">部门审核</label>
                                <div class="col-sm-10">
                                    <p class="form-control-static">
                                        <c:if test="${not empty chop.step1User }">
                                            <c:out value="${chop.step1User}" />
                                            <br />
                                        </c:if>
                                        <c:if test="${not empty chop.step1Idea }">意见：<c:out
                                                value="${chop.step1Idea}" />
                                            <br />
                                        </c:if>
                                        <c:if test="${not empty chop.step1Time }">时间：<fmt:formatDate
                                                value="${chop.step1Time}" pattern="yyyy-MM-dd" />
                                        </c:if>
                                    </p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2"></div>
                                <div class="col-sm-6 checkbox">
                                    <sf:checkbox cssClass="icheckbox" path="stepStatus" id="stepStatus" value="2" />
                                    <label for="stepStatus">同意</label>
                                    <p class="help-block" />
                                </div>
                            </div>
                            <div class="row">
                                <label for="step2Idea" class="col-sm-2 control-label">审核意见</label>
                                <div class="col-sm-6 ">
                                    <sf:input id="s1" cssClass="form-control" path="step2Idea" placeholder="财务部审核意见" />
                                    <p class="help-block" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2"></div>
                                <button id="succ" type="submit" class="btn btn-success" disabled="disabled">
                                    <span class="glyphicon glyphicon-ok"></span> 同意
                                </button>
                                <button id="dang" type="submit" class="btn btn-danger sm-offset-3">
                                    <span class="glyphicon glyphicon-remove"></span> 拒绝
                                </button>
                                <a href='<s:url value="/chop" />' onclick="return goback();" class="btn btn-link"><span
                                    class="glyphicon glyphicon-share-alt"></span> 返 回 </a>
                            </div>
                        </c:if>
                        <c:if test="${not empty step3 }">
                            <div class="row">
                                <label class="col-sm-2 control-label">部门审核</label>
                                <div class="col-sm-10">
                                    <p class="form-control-static">
                                        <c:if test="${not empty chop.step1User }">
                                            <c:out value="${chop.step1User}" />
                                            <br />
                                        </c:if>
                                        <c:if test="${not empty chop.step1Idea }">意见：<c:out
                                                value="${chop.step1Idea}" />
                                            <br />
                                        </c:if>
                                        <c:if test="${not empty chop.step1Time }">时间：<fmt:formatDate
                                                value="${chop.step1Time}" pattern="yyyy-MM-dd" />
                                        </c:if>
                                    </p>
                                </div>
                            </div>
                            <div class="row">
                                <label class="col-sm-2 control-label">财务部审批</label>
                                <div class="col-sm-10">
                                    <p class="form-control-static">
                                        <c:if test="${not empty chop.step2User }">
                                            <c:out value="${chop.step2User}" />
                                            <br />
                                        </c:if>
                                        <c:if test="${not empty chop.step2Idea }">意见：<c:out
                                                value="${chop.step2Idea}" />
                                            <br />
                                        </c:if>
                                        <c:if test="${not empty chop.step2Time }">时间：<fmt:formatDate
                                                value="${chop.step2Time}" pattern="yyyy-MM-dd" />
                                        </c:if>
                                    </p>
                                </div>
                            </div>
                            <div class="row">
                                <label for="step3Idea" class="col-sm-2 control-label">办理结果</label>
                                <div class="col-sm-6 ">
                                    <sf:input cssClass="form-control" path="step3Idea" value="已办理" />
                                    <p class="help-block" />
                                </div>
                            </div>
                            <input type="hidden" name="stepStatus" value="3" />
                            <div class="row">
                                <div class="col-sm-2"></div>
                                <button id="succ" type="submit" class="btn btn-success">
                                    <span class="glyphicon glyphicon-ok"></span> 办理
                                </button>
                                <a href='<s:url value="/chop" />' onclick="return goback();" class="btn btn-link"><span
                                    class="glyphicon glyphicon-share-alt"></span> 返 回 </a>
                            </div>
                        </c:if>

                        <c:if test="${empty step1 and empty step2 and empty step3 }">
                            <div class="row">
                                <label for="chopCode" class="col-sm-2 control-label">编号</label>
                                <div class="col-sm-4 required-field-block">
                                    <b class="required-icon">*</b>
                                    <sf:input cssClass="form-control" path="chopCode" placeholder="编号" />
                                    <p class="help-block" />
                                </div>
                                <label for="field01" class="col-sm-2 control-label">项目实施人</label>
                                <div class="col-sm-4 required-field-block">
                                    <b class="required-icon">*</b>
                                    <sf:input cssClass="form-control" path="field01" placeholder="项目实施人" />
                                    <p class="help-block" />
                                </div>
                            </div>
                            <div class="row">
                                <label for="projectId" class="col-sm-2 control-label">项目名称</label>
                                <div class="col-sm-10 required-field-block">
                                    <b class="required-icon">*</b>
                                    <sf:input cssClass="form-control" path="projectName" placeholder="项目名称" />
                                    <p class="help-block" />
                                </div>
                            </div>
                            <div class="row">
                                <label for="organizationId" class="col-sm-2 control-label">所在部门</label>
                                <div class="col-sm-4 ">
                                    <sf:select cssClass="form-control selectpicker" path="organizationId"
                                        items="${orglist }" itemValue="id" itemLabel="organizationName" />
                                    <p class="help-block" />
                                </div>
                                <label for="manager" class="col-sm-2 control-label">项目经理</label>
                                <div class="col-sm-4 ">
                                    <sf:input cssClass="form-control" path="manager" placeholder="项目经理" />
                                </div>
                            </div>

                            <div class="row">
                                <sf:label path="content" cssClass="col-sm-2 control-label">主要内容</sf:label>
                                <div class="col-sm-10 required-field-block">
                                    <b class="required-icon">*</b>
                                    <sf:textarea cssClass="form-control" rows="3" path="content"
                                        placeholder="主要内容，500字以内" />
                                    <p class="help-block" />
                                </div>
                            </div>

                            <div class="row">
                                <label for="field02" class="col-sm-2 control-label">经办人</label>
                                <div class="col-sm-4 ">
                                    <sf:input cssClass="form-control" path="field02" placeholder="经办人" />
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

                            <button type="submit" class="btn btn-info pull-right">
                                <span class="glyphicon glyphicon-ok"></span> 提 交
                            </button>
                            <a href='<s:url value="/chop" />' onclick="return goback();" class="btn btn-link"><span
                                class="glyphicon glyphicon-share-alt"></span> 返 回 </a>
                        </c:if>
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
				content : {
					required : true
				},
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

		$("#s1").val('拒绝，请重新修订');

		$('input').on('ifChecked', function(event) {
			$("#s1").val('同意，审核通过');
			$(".btn-success").removeAttr("disabled");
			$(".btn-danger").attr("disabled", "disabled");
		}).on('ifUnchecked', function(event) {
			$("#s1").val('拒绝，请重新修订');
			$(".btn-success").attr("disabled", "disabled");
			$(".btn-danger").removeAttr("disabled");
		});
	});
</script>
<%@ include file="bottom.jsp"%>
