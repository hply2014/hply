<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="container main">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <strong>${page_title}</strong>
        </div>
        <div class="panel-body">
            <sf:form modelAttribute="customerBilling" cssClass="form-horizontal" role="form">
                <div class="row">
                    <div class="col-sm-8">
                        <%-- <div class="row">
                            <label for="invoiceCode" class="col-sm-2 control-label">发票票号</label>
                            <div class="col-sm-4 required-field-block">
                                <sf:input cssClass="form-control" path="invoiceCode" placeholder="发票票号" />
                                <p class="help-block" />
                            </div>
                        </div> --%>
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
                            <label for="invoiceType" class="col-sm-2 control-label">发票类别</label>
                            <div class="col-sm-8 required-field-block">
                                <sf:select cssClass="form-control selectpicker" path="invoiceType" items="${billingTypes }" />
                                <p class="help-block" />
                            </div>
                            <div class="col-sm-2">
                            	<a href="javascript:showInvoiceTypeFormDialog('${billingTypesId }');" class="btn btn-link"><span
                                        class="glyphicon glyphicon-cog"></span> 设置 </a>
                            </div>
                        </div>
                        <div class="row">
                            <label for="invoiceAmount" class="col-sm-2 control-label">发票金额</label>
                            <div class="col-sm-4 required-field-block">
                                <b class="required-icon">*</b>
                                <sf:input cssClass="form-control" path="invoiceAmount" placeholder="发票金额" />
                                <p class="help-block" />
                            </div>
                            <label for="taxRate" class="col-sm-2 control-label">税率（%）</label>
                            <div class="col-sm-4 required-field-block">
                                <b class="required-icon">*</b>
                                <sf:input cssClass="form-control" path="taxRate" placeholder="税率" />
                                <p class="help-block" />
                            </div>
                        </div>
                        <div class="row">
                            <label for="amount" class="col-sm-2 control-label">金额</label>
                            <div class="col-sm-4 required-field-block">
                                <b class="required-icon">*</b>
                                <sf:input cssClass="form-control" path="amount" placeholder="金额" />
                                <p class="help-block" readonly="true" />
                            </div>
                            <label for="inputTaxAmount" class="col-sm-2 control-label">进项税金</label>
                            <div class="col-sm-4 required-field-block">
                                <b class="required-icon">*</b>
                                <sf:input cssClass="form-control" path="inputTaxAmount" placeholder="进项税金" />
                                <p class="help-block" readonly="true" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-4 col-sm-offset-2 checkbox">
                                <sf:checkbox cssClass="icheckbox" path="isAutoCreatePayment" id="isAutoCreatePayment"
                                    value="1" />
                                <label for="isAutoCreatePayment">自动生成付款记录</label>
                                <p class="help-block" />
                            </div>
                        </div>
                        <div class="row" id="paymentBox" style="display: none;">
                            <label for="paymentItemId" class="col-sm-2 control-label">付款科目</label>
                            <div class="col-sm-4 required-field-block">
                                <b class="required-icon">*</b>
                                <sf:select cssClass="form-control selectpicker" path="paymentItemId"
                                    items="${paymentitemlist }" itemValue="id" itemLabel="itemName" />
                                <p class="help-block" />
                            </div>
                            <label for="payType" class="col-sm-2 control-label">支付方式</label>
                            <div class="col-sm-4 required-field-block">
                                <b class="required-icon">*</b>
                                <sf:select cssClass="form-control selectpicker" path="payType"
                                    items="${paymenttypelist }" />
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

                        <button type="submit" id="btn_submit" class="btn btn-info pull-right">
                            <span class="glyphicon glyphicon-ok"></span> 提 交
                        </button>
                        <a href='<s:url value="/customerbilling" />' onclick="return goback();" class="btn btn-link"><span
                            class="glyphicon glyphicon-share-alt"></span> 返 回 </a>

                    </div>
                    <div class="col-sm-4">
                        <div class="bs-callout bs-callout-danger">
                            <h4>操作提示</h4>
                            <p><span class="label label-danger">1、此信息一经审核，将不可修改，请谨慎操作。</span></p>
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
<script type="text/template" charset="utf-8" id='invoiceTypeEditTemplate'>
<form id="invoiceTypeForm" class="form-horizontal" role="form">
	<input type="hidden" id="id" value=""/>
	<div class="row">
		<label for="paramValue" class="col-sm-2 control-label">参数值</label>
    	<div class="col-sm-10">
			<input id="paramValue" name="paramValue" class="form-control" placeholder="参数值" type="text" value="">
			<p class="help-block">参数值以“/”分隔，前后不需要“/”。</p>
    	</div>
    </div>
</form>
</script>
<!--/container main -->
<script type="text/javascript">
	$(function() {
		$("#invoiceAmount,#taxRate").keyup(function() {
			var invoiceAmount = Number($("#invoiceAmount").val()).toFixed(2);
			var amount = (invoiceAmount/(1+Number($("#taxRate").val())/100)).toFixed(2);
			$("#amount").val(amount);
			$("#inputTaxAmount").val(Number(invoiceAmount-amount).toFixed(2));
		});
		var setPaymentItem = function(){
			var invoiceType = $("#invoiceType").val();
			$('#paymentItemId option:contains(' + invoiceType + ')').each(function(){
				if ($(this).text() == invoiceType) {
					$('#paymentItemId').selectpicker('val', $(this).val());
				}
			});
		};
		$("#invoiceType").on("change",setPaymentItem);
		$("#isAutoCreatePayment").on('ifChecked', function(){
			setPaymentItem();
			$("#paymentBox").show();
		}).on("ifUnchecked",function(){
			$("#paymentBox").hide();
		});
		if($("#isAutoCreatePayment").is(':checked')){
			$("#paymentBox").show();
		}else{
			$("#paymentBox").hide();
		}
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
				/* invoiceCode : {}, */
				invoiceType : {},
				amount : {
					required : true,
					number : true
				},
				taxRate : {
					number : true,
					range : [ 0, 100 ]
				},
				inputTaxAmount : {
					required : true,
					number : true
				},
				invoiceAmount : {
					required : true,
					number : true
				},
				trice : {},
				description : {},
				isAutoCreatePayment: {},
				paymentItemId : {
					checkpaymentitem : true,
				},
				payType : {
					checkpaymentitem : true,
				},
			}
		});
		
		$("#myModalContent").delegate("#paramValue","blur",function(){
			if($('#invoiceTypeForm').find("#paramValue").val()){
				$('#invoiceTypeForm').find(".help-block").html("参数值以“/”分隔，前后不需要“/”。");
			}else{
				$('#invoiceTypeForm').find(".help-block").html('参数值以“/”分隔，前后不需要“/”。<br><b class="glyphicon glyphicon-remove text-danger"></b><i>必须填写</i>');
			}
		});
		$("#myModal .btn-danger").off("click").on("click",function() {
			var data = {
				id: $('#invoiceTypeForm').find("#id").val(),
				paramValue: $('#invoiceTypeForm').find("#paramValue").val(),
			};
			if(data.paramValue){
				$('#invoiceTypeForm').find(".help-block").html("参数值以“/”分隔，前后不需要“/”。");
		    	$.post("<s:url value='/sysparameter/modify.json'/>", data,
	    			function(result) {
	    				//未提交成功，提示错误
	    				if(result.message != "OK"){
	    					alert(result.message);
	    					return;
	    				}
	    				self.location.reload();
	    				return;
	    			}, "json");
				$('#myModal').modal("hide");
			}else{
				$('#invoiceTypeForm').find(".help-block").html('参数值以“/”分隔，前后不需要“/”。<br><b class="glyphicon glyphicon-remove text-danger"></b><i>必须填写</i>');
			}
		});
	});
	function showInvoiceTypeFormDialog(id) {
    	$.get("<s:url value='/sysparameter/get/'/>" + id + ".json", {},
			function(result) {
				$("#myModal .modal-title").html("发票类别参数修改");
				$("#myModalContent").html(templateContent("invoiceTypeEditTemplate"));
				$('#invoiceTypeForm').find("#id").val(result.id);
				$('#invoiceTypeForm').find("#paramValue").val(result.paramValue);
				$('#myModal').modal('show');
			}, "json");
	}
</script>
<%@ include file="bottom.jsp"%>
