<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="container main">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <strong>${page_title}</strong>
        </div>
        <div class="panel-body">
            <sf:form modelAttribute="collections" cssClass="form-horizontal" role="form">
                <div class="row">
                    <div class="col-sm-8">
                        <div class="row"> 
						<label for="ticketCode" class="col-sm-2 control-label">凭证号</label>
                            <div class="col-sm-4 ">
                                <sf:input cssClass="form-control" path="ticketCode" placeholder="凭证号" />
                                <p class="help-block" />
                            </div>
                        </div>
                        <div class="row">
                            <label for="projectId" class="col-sm-2 control-label">项目名称</label>
                            <div class="col-sm-8 required-field-block">
                                <b class="required-icon">*</b>
                                <%--    <sf:input cssClass="form-control" path="projectId" placeholder="项目ID" /> --%>
                                <sf:select cssClass="form-control select2" path="projectId" items="${projectlist }"
                                    itemValue="id" itemLabel="projectName" />
                                <p class="help-block" />
                            </div>
                           
                        </div>
                        <div class="row">
                            <label for="sourceOf" class="col-sm-2 control-label">款项来源</label>
                            <div class="col-sm-4 ">
                                <sf:select cssClass="form-control selectpicker" path="sourceOf" items="${sourceoflist }" />
                                <p class="help-block" />
                            </div>
                        </div>
                        <div class="row">
                            <label for="amount" class="col-sm-2 control-label">收款金额</label>
                            <div class="col-sm-4 required-field-block">
                                <b class="required-icon">*</b>
                                <sf:input cssClass="form-control" path="amount" placeholder="收款金额" />
                                <p class="help-block" />
                            </div>

                            <label for="paymentType" class="col-sm-2 control-label">收款方式</label>
                            <div class="col-sm-4 ">
                                <sf:select cssClass="form-control selectpicker" path="paymentType" items="${paymenttypelist }" />
                                <p class="help-block" />
                            </div>
                        </div>
                        <div class="row">
                            <label for="bankName" class="col-sm-2 control-label">开户行名称</label>
                            <div class="col-sm-4 ">
                                <sf:input cssClass="form-control" path="bankName" placeholder="开户行名称" />
                                <p class="help-block" />
                            </div>

                            <label for="bankAccount" class="col-sm-2 control-label">银行账号</label>
                            <div class="col-sm-4 ">
                                <sf:input cssClass="form-control" path="bankAccount" placeholder="银行账号" />
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
                        <a href='<s:url value="/collections" />' class="btn btn-link"><span
                            class="glyphicon glyphicon-share-alt"></span> 返 回 </a>

                    </div>
                    <div class="col-sm-4">
                        <div class="bs-callout bs-callout-danger">
                            <h4>欠款提示</h4>
                            <p>　　工程欠款：<span id="d1">0000.00</span></p>
                            <p>　　往来欠款：<span id="d2">0000.00</span></p>
                            <h4>操作提示</h4>
                            <p><span class="label label-danger">1、此信息一经提交，将不可修改，请谨慎操作。</span></p>
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
				projectId : {},
				ticketCode : {},
				sourceOf : {},
				paymentType : {},
				amount : {},
				bankAccount : {},
				bankName : {},
				trice : {},
				description : {},
			}
		});

		function refreshAmount(projectId){
    		$.post("<s:url value='/api/camounts/' />" + projectId, {}, function(result) {
    			if(result.indexOf('|') > 0){
    				var arr = result.split("|");
    				$("#d1").html(arr[0]);
    				$("#d2").html(arr[1]);
    			}
    		}, "text");
		}
		refreshAmount(jQuery("#projectId").val());
		
		
		$("#projectId").change(function(){
			refreshAmount($(this).val());
		});
	});
</script>
<%@ include file="bottom.jsp"%>
