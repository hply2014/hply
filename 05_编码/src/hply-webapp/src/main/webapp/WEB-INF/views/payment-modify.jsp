<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="container main">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <strong>${page_title}</strong>
        </div>
        <div class="panel-body">
            <sf:form modelAttribute="payment" cssClass="form-horizontal" role="form">
                <div class="row">
                    <div class="col-sm-8">
                        <div class="row">
                            <label for="ticketCode" class="col-sm-2 control-label">凭证号</label>
                            <div class="col-sm-4 required-field-block">
                                <b class="required-icon">*</b>
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

                            <label for="paymentItemId" class="col-sm-2 control-label">付款科目</label>
                            <div class="col-sm-3 required-field-block">
                                <b class="required-icon">*</b>
                                <sf:select cssClass="form-control selectpicker" path="paymentItemId"
                                    items="${paymentitemlist }" itemValue="id" itemLabel="itemName" />
                                <p class="help-block" />
                            </div>
                            <shiro:hasPermission name="`payment-item`">
                                <div class="col-sm-4">
                                    <a href='<s:url value="/paymentitem" />' class="btn btn-link"><span
                                        class="glyphicon glyphicon-cog"></span> 付款科目设置 </a>
                                </div>
                            </shiro:hasPermission>
                        </div>
                        <div class="row">
                            <label for="amount" class="col-sm-2 control-label">付款金额</label>
                            <div class="col-sm-4 required-field-block">
                                <b class="required-icon">*</b>
                                <sf:input cssClass="form-control" path="amount" placeholder="付款金额" />
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
                        <a href='<s:url value="/payment" />' class="btn btn-link"><span
                            class="glyphicon glyphicon-share-alt"></span> 返 回 </a>

                    </div>
                    <div class="col-sm-4">
                        <div class="bs-callout bs-callout-danger">
                            <h4>操作提示</h4>
                            <p>
                                <span class="label label-danger">1、此信息一经提交，将不可修改，请谨慎操作。</span>
                            </p>
                            <h4>报销提示</h4>
                            <p>
                                已开票额：<span id="checkedAmount">0000.00</span>
                            </p>
                            <p>
                                报销上限：<span id="limitAmount">0000.00</span>
                            </p>
                            <p>
                                报销累计：<span id="totalAmount">0000.00</span>
                            </p>
                            <p>
                                报销剩余：<span id="oweAmount">0000.00</span>
                            </p>
                            <h4>欠款提示</h4>
                            <p>
                                已开票欠款：<span id="k1">0000.00</span>
                            </p>
                            <p>
                                往来欠款：<span id="d2">0000.00</span>
                            </p>
                            <p>
                                工程款结存：<span id="j0">0000.00</span>
                            </p>
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
		jQuery.validator.addMethod("allowLimit", function(value, element) {
			return false;
		}, "请正确填写您的邮政编码");

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
				ticketCode : {
					required : true
				},
				payType : {},
				paymentItemId : {},
				amount : {
					required : true,
					number : true,
					max : 0
				},
				bankAccount : {},
				bankName : {},
				trice : {},
				description : {},
			}
		});

		function refreshLimitAmount() {
			//刷新了上限额度，4个值
			$.post("<s:url value='/api/alllimitamount/' />" + jQuery("#projectId").val() + "/" + jQuery("#paymentItemId").val(), {},
					function(result) {
						var arr = result.split("|");
						if (arr.length >= 4) {
							$("#checkedAmount").html(arr[0]);
							$("#limitAmount").html(arr[1]);
							$("#totalAmount").html(arr[2]);
							$("#oweAmount").html(arr[3]);
							$("#amount").rules("add", {
								max : parseFloat(arr[3].replace(/,/g, ''))
							});
						}
					}, "text");

		}

		function refreshOweAmount() {
			//获取工程欠款余额，往来欠款总额和工程款结存
			$.post("<s:url value='/api/pamounts/' />" + jQuery("#projectId").val(), {}, function(result) {
				var arr = result.split("|");
				if (arr.length >= 3) {
					$("#k1").html(arr[0]);
					$("#d2").html(arr[1]);
					$("#j0").html(arr[2]);
				}
			}, "text");

		}

		//在界面上选择了项目
		$("#projectId").change(function() {
			refreshLimitAmount();
			refreshOweAmount();
		});

		//选择了付款科目
		$("#paymentItemId").change(function() {
			refreshLimitAmount();
		});

		refreshLimitAmount();
		refreshOweAmount();
	});
</script>
<%@ include file="bottom.jsp"%>
