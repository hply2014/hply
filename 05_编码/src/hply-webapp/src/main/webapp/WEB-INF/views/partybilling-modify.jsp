<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="container main">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <strong>${page_title}</strong>
        </div>
        <div class="panel-body">
            <sf:form modelAttribute="partyBilling" cssClass="form-horizontal" role="form">
                <div class="row">
                    <div class="col-sm-8">
                        <c:choose>
                            <c:when test="${step1 == 1}">


                                <div class="row">
                                    <label for="invoiceCode" class="col-sm-2 control-label">发票票号</label>
                                    <div class="col-sm-4 ">
                                        <p class="form-control-static">
                                            <c:out value="${partyBilling.invoiceCode}" />
                                        </p>
                                    </div>
                                    <label for="projectId" class="col-sm-2 control-label">项目名称</label>
                                    <div class="col-sm-4 required-field-block">
                                        <p class="form-control-static">
                                            <c:out value="${newProjectName}" />
                                        </p>
                                    </div>

                                </div>
                                <div class="row">
                                    <label for="taxRate" class="col-sm-2 control-label">税率</label>
                                    <div class="col-sm-4 ">
                                        <p class="form-control-static">
                                            <c:out value="${partyBilling.taxRate}" />
                                            %
                                        </p>

                                    </div>
                                    <label for="amount" class="col-sm-2 control-label">发票金额</label>
                                    <div class="col-sm-4 ">
                                        <p class="form-control-static">
                                            <c:out value="${partyBilling.amount}" />
                                        </p>
                                    </div>
                                </div>

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
                                    <div class="col-sm-4 ">
                                        <sf:input id="s1" cssClass="form-control" path="step1Idea" placeholder="审核意见" />
                                        <p class="help-block" />
                                    </div>
                                </div>
                                <div class="row">
                                    <sf:label path="description" cssClass="col-sm-2 control-label">备注</sf:label>
                                    <div class="col-sm-10">
                                        <sf:textarea cssClass="form-control" rows="3" path="description"
                                            placeholder="备注，500字以内" />
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
                                    <a href='<s:url value="/partybilling" />' class="btn btn-link"><span
                                        class="glyphicon glyphicon-share-alt"></span> 返 回 </a>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="row">
                                    <label for="invoiceCode" class="col-sm-2 control-label">发票票号</label>
                                    <div class="col-sm-4 required-field-block">
                                        <b class="required-icon">*</b>
                                        <sf:input cssClass="form-control" path="invoiceCode" placeholder="发票票号" />
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
                                <div class="row">
                                    <label for="taxRate" class="col-sm-2 control-label">税率（%）</label>
                                    <div class="col-sm-4 ">
                                        <sf:input cssClass="form-control" path="taxRate" placeholder="税率" />
                                        <p class="help-block" />
                                    </div>
                                    <label for="amount" class="col-sm-2 control-label">发票金额</label>
                                    <div class="col-sm-4 required-field-block">
                                <b class="required-icon">*</b>
                                        <sf:input cssClass="form-control" path="amount" placeholder="发票金额" />
                                        <p class="help-block" />
                                    </div>
                                </div>
                                <div class="row">
                                    <sf:label path="description" cssClass="col-sm-2 control-label">备注</sf:label>
                                    <div class="col-sm-10">
                                        <sf:textarea cssClass="form-control" rows="3" path="description"
                                            placeholder="备注，500字以内" />
                                        <p class="help-block" />
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-info pull-right">
                                    <span class="glyphicon glyphicon-ok"></span> 提 交
                                </button>
                                <a href='<s:url value="/partybilling" />' class="btn btn-link"><span
                                    class="glyphicon glyphicon-share-alt"></span> 返 回 </a>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="col-sm-4">
                        <div class="bs-callout bs-callout-danger">
                            <h4>操作提示</h4>
                            <p>1、此信息提交后，需由相关领导审核通过后，方可生效。</p>
                            <p>2、未审核通过前，信息可以修改或删除，审核后不可修改。</p>
                        </div>
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
		$(":text[value='0.0']").val('');

		$('input').on('ifChecked', function(event) {
			$("#s1").val('同意，审核通过');
			$(".btn-success").removeAttr("disabled");
			$(".btn-danger").attr("disabled", "disabled");
		}).on('ifUnchecked', function(event) {
			$("#s1").val('不同意，请重新修订');
			$(".btn-success").attr("disabled", "disabled");
			$(".btn-danger").removeAttr("disabled");
		});

		/*
		$("#succ").click(function(){
			$.post("<s:url value='/api/capitaloccupied/${project.id}' />", {}, function(result) {
				$("#capitalOccupied").html(result);
			}, "text");
		});
		$("#dang").click(function(){
			$.post("<s:url value='/api/capitaloccupied/${project.id}' />", {}, function(result) {
				$("#capitalOccupied").html(result);
			}, "text");
		});
		*/
		
		$("form").validate({
			errorElement : "i",
			success : function(label, element) {
				$(element).next().html('<b class="glyphicon glyphicon-ok text-success"></b><i>正确</i>');
			},
			errorPlacement : function(error, element) {
				element.next().html('<b class="glyphicon glyphicon-remove text-danger"></b><i>' + error.html() + "</i>");
			},
			rules : {
				projectId : {},
				invoiceCode : {
					required : true
				},
				amount : {
					required : true,
					number : true
				},
				trice : {},
				taxRate : {
					number : true,
					range : [ 0, 100 ]
				},
				taxAmount : {
					number : true
				},
				step1Idea : {},
				step1User : {},
				step1Time : {},
				stepStatus : {},
				description : {},
			}
		});
	});
</script>
<%@ include file="bottom.jsp"%>
