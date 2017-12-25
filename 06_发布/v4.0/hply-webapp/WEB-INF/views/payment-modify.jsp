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
                        <%-- <div class="row">
                            <label for="ticketCode" class="col-sm-2 control-label">凭证号</label>
                            <div class="col-sm-4 required-field-block">
                                <sf:input cssClass="form-control" path="ticketCode" placeholder="凭证号" />
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
                        <div class="panel panel-default" id="paymentDifferentTaxAmountPanel">
                            <div class="panel-heading">
                            	<strong>异地税金</strong>
                            </div>
                            <div class="panel-body">
                              	<!-- 异地税金 -->
                                <div class="btn-toolbar" role="toolbar">
                                    <shiro:hasPermission name="`paymentdifferenttaxamount_create`">
                                        <div class="btn-group">
                                            <a href="javascript:;" id="addPaymentDifferentTaxAmount" class="btn btn-info"><span class="glyphicon glyphicon-plus"></span> 新 建 </a>
                                        </div>
                                    </shiro:hasPermission>
                                </div>
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>名称</th>
                                            <th>金额</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody id="paymentDifferentTaxAmountList">
                                        <c:forEach items="${lPaymentDifferentTaxAmount}" var="diff">
                                            <tr>
                                                <td>
                                                	<input type="text" class="form-control" id="diffNames" name="diffNames" placeholder="名称" value="<c:out value="${diff.name}" />"/>
													<p class="help-block" />
                                                </td>
                                                <td>
                                                	<input type="text" class="form-control" id="diffAmounts" name="diffAmounts" placeholder="金额" value="<fmt:formatNumber value="${diff.amount}" pattern="##0.00" />"/>
													<p class="help-block" />
												</td>
                                           		<td>
													<input type="hidden" id="diffIds" name="diffIds" value="${diff.id}"/>
													<input type="hidden" id="diffStatuss" name="diffStatuss" value="${diff.status}"/>
				                                    <shiro:hasPermission name="`paymentdifferenttaxamount_create`">
				                                        <a class="delete" id="${diff.id}"
				                                            data-confirm-message="混合税金：<c:out value="${diff.id}" />，将被永久删除，操作不可撤销，是否确认？"
				                                            href="javascript:deletePaymentDifferentTaxAmount('${diff.id}');">删除</a>
				                                    </shiro:hasPermission>
                            					</td>
                            				</tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
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
                        <%-- <div class="row">
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
                        </div> --%>
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
                        <a href='<s:url value="/api/jumplasturl" />' class="btn btn-link"><span
                            class="glyphicon glyphicon-share-alt"></span> 返 回 </a>

                    </div>
                    <div class="col-sm-4">
                        <div class="bs-callout bs-callout-danger">
                            <h4>操作提示</h4>
                            <p>
                                <span class="label label-danger">1、此信息一经审核，将不可修改，请谨慎操作。</span>
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
<script type="text/template" charset="utf-8" id='paymentDifferentTaxAmountAddTemplate'>
	<tr>
		<td>
			<input type="text" class="form-control" id="diffNames" name="diffNames" placeholder="名称" value=""/>
			<p class="help-block" />
		</td>
		<td>
			<input type="text" class="form-control" id="diffAmounts" name="diffAmounts" placeholder="金额" value="0"/>
			<p class="help-block" />
		</td>
		<td>
			<input type="hidden" id="diffIds" name="diffIds" value=" "/>
			<input type="hidden" id="diffStatuss" name="diffStatuss" value="0"/>
			<shiro:hasPermission name="`paymentdifferenttaxamount_create`">
				<a id="{{=it.id}}" class="delete js-delete" data-confirm-message="混合税金将被永久删除，操作不可撤销，是否确认？" href="javascript:deletePaymentDifferentTaxAmount('{{=it.id}}');">删除</a>
			</shiro:hasPermission>
		</td>
	</tr>
</script>
<script type="text/javascript">
	var isFirstLoad = true;
	$(function() {
		// 默认隐藏异地税金
		$("#paymentDifferentTaxAmountPanel").hide();
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
				/* ticketCode : {}, */
				payType : {},
				paymentItemId : {},
				amount : {
					required : true,
					number : true,
				},
				/* bankAccount : {},
				bankName : {}, */
				trice : {},
				description : {},
				diffNames : {
					required : true,
				},
				diffAmounts : {
					required : true,
					number : true,
				},
			}
		});

		function refreshLimitAmount() {
			var la = ["业务招待费", "车辆费", "差旅费"];
			var sv = $("#paymentItemId option[value='" + $("#paymentItemId").val() + "']").html();
			//刷新了上限额度，4个值
			$.post("<s:url value='/api/alllimitamount/' />" + jQuery("#projectId").val() + "/" + jQuery("#paymentItemId").val(), {},
					function(result) {
						var arr = result.split("|");
						if (arr.length >= 4) {
							$("#checkedAmount").html(arr[0]);
							$("#totalAmount").html(arr[2]);
							$("#oweAmount").html(arr[3]);
							if(jQuery.inArray(sv, la) >= 0 ){
								$("#limitAmount").html(arr[1]);
							}else{
								$("#limitAmount").html("不限");
							}
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
		
		$("#paymentDifferentTaxAmountList").delegate("input[type=text]","keyup",function(){
			// 修改过，状态为2
			$(this).parent().parent().find("#diffStatuss").val(2);
			if($(this).attr("id")=="diffAmounts"){
				getPaymentAmount();
			}
			getDescription();
		});
		
		$("#addPaymentDifferentTaxAmount").click(function(){
			$("#paymentDifferentTaxAmountList").append(templateContent("paymentDifferentTaxAmountAddTemplate",{id: UUID()}));
		});

		//选择了付款科目
		$("#paymentItemId").change(function() {
			refreshLimitAmount();
			var paymentItemName = $(this).find("option:selected").text();
			if(paymentItemName == "异地税金"){
				$("#amount").attr("readonly","readonly");
				if(!isFirstLoad){
					$("#amount").val(0);
				}
				$("#paymentDifferentTaxAmountPanel").show();
				// 选择异地税金时表格中没有数据默认添加一条
				if($("#paymentDifferentTaxAmountList").find('tr').length < 1){
					$("#addPaymentDifferentTaxAmount").click();
				}
			}else{
				$("#amount").removeAttr("readonly");
				$("#paymentDifferentTaxAmountPanel").hide();
				$("#paymentDifferentTaxAmountList").find('tr').each(function(){
					deletePaymentDifferentTaxAmount($(this).find("a").eq(0).attr("id"));
				});
			}
			isFirstLoad = false;
		}).change();
		
		refreshLimitAmount();
		refreshOweAmount();
	});
	
	// 计算付款金额=异地税金中金额和
	function getPaymentAmount(){
		var totalDiffTaxAmount = 0;// 异地税金中金额和
		$("#paymentDifferentTaxAmountList").find("tr").each(function(){
			var diffStatus = $(this).find("#diffStatuss").val();
			if(diffStatus != -1){
				var diffAmount = $(this).find("#diffAmounts").val();
				totalDiffTaxAmount+=Number(diffAmount);
			}
		});
		$("#amount").val(totalDiffTaxAmount.toFixed(2));
	};

	var deletePaymentDifferentTaxAmount = function(selector){
		var $tr = $("#"+selector).parent().parent();
		var diffStatus = $tr.find("#diffStatuss").val();
		if(diffStatus == 0){
			// 新增未修改，删除TR
			$tr.remove();
		}else{
			var diffId = $tr.find("#diffIds").val();
			if(diffId){
				// 修改过ID不为空，状态为-1
				$tr.find("#diffStatuss").val(-1);
				$tr.hide();
			}else{
				// 修改过ID为空，删除TR
				$tr.remove();
			}
		}
		// 删除后重新计算
		getPaymentAmount();
	};
	
	// 获取备注
	var getDescription = function(){
		var paymentItemName = $("#paymentItemId").find("option:selected").text();
		if(paymentItemName == "异地税金"){
			var description = paymentItemName+"：";
			$("#paymentDifferentTaxAmountList").find('tr').each(function(){
				var diffStatus = $(this).find("#diffStatuss").val();
				if(diffStatus != -1){
					description += $(this).find("#diffNames").val()+"：";
					description += $(this).find("#diffAmounts").val()+"；";
				}
			});
			$("#description").val(description);
		}
	};
</script>
<%@ include file="bottom.jsp"%>
