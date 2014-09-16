<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="container main">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <strong>${page_title}</strong>
        </div>
        <div class="panel-body">
            <sf:form modelAttribute="arrears" cssClass="form-horizontal" role="form">
                <div class="row">
                    <div class="col-sm-8">
                        <div class="row">
                            <label for="arrearsCode" class="col-sm-2 control-label">凭证号</label>
                            <div class="col-sm-4 ">
                                <sf:input cssClass="form-control" path="arrearsCode" placeholder="凭证号" />
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
                            <label for="arrearsType" class="col-sm-2 control-label">欠款分类</label>
                            <div class="col-sm-4 required-field-block">
                                <b class="required-icon">*</b>
                                <sf:select cssClass="form-control selectpicker" path="arrearsType"
                                    items="${arrearsTypes }" />
                                <p class="help-block" />
                            </div>
                            <label for="amount" class="col-sm-2 control-label">金额</label>
                            <div class="col-sm-4 required-field-block">
                                <b class="required-icon">*</b>
                                <sf:input cssClass="form-control" path="amount" placeholder="金额" />
                                <p class="help-block" />
                            </div>
                        </div>
                        <div class="row">
                            <label for="interestRate" class="col-sm-2 control-label">计息利率（%）</label>
                            <div class="col-sm-2 required-field-block">
                                <b class="required-icon">*</b>
                                <sf:input cssClass="form-control" path="interestRate" placeholder="计息利率" />
                                <p class="help-block" />
                            </div>
                        </div>
                        <div class="row">
                            <label for="fundsUsing" class="col-sm-2 control-label">资金使用方</label>
                            <div class="col-sm-4 ">
                                <sf:input cssClass="form-control" path="fundsUsing" placeholder="资金使用方" />
                                <p class="help-block" />
                            </div>
                            <label for="payType" class="col-sm-2 control-label">支付方式</label>
                            <div class="col-sm-4 ">
                                <sf:select cssClass="form-control selectpicker" path="payType" items="${payTypes }" />
                                <p class="help-block" />
                            </div>
                        </div>
                        <div class="row">
                            <label for="bankAccount" class="col-sm-2 control-label">银行账号</label>
                            <div class="col-sm-4 ">
                                <sf:input cssClass="form-control" path="bankAccount" placeholder="银行账号" />
                                <p class="help-block" />
                            </div>
                            <label for="bankName" class="col-sm-2 control-label">开户行名称</label>
                            <div class="col-sm-4 ">
                                <sf:input cssClass="form-control" path="bankName" placeholder="开户行名称" />
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
                        <a href='<s:url value="/arrears" />' class="btn btn-link"><span
                            class="glyphicon glyphicon-share-alt"></span> 返 回 </a>

                    </div>
                    <div class="col-sm-4">
                        <div class="bs-callout bs-callout-danger">
                            <h4>往来欠款</h4>
                            <p>累计：<span id="q1">0000.00</span></p>
                            <h4>计息情况</h4>
                            <p>应收利息：<span id="q2">0000.00</span></p>
                            <p>已收利息：<span id="q3">0000.00</span></p>
                            <h4>操作提示</h4>
                            <p>
                                1、<span class="label label-danger">此信息一经提交，将不可修改，请谨慎操作。</span>
                            </p>
                            <p>
                                2、<span class="label label-info">此笔费用将汇总到付款情况中</span>，供应商（客户）付出去的钱，为正；供应商（客户）收到的钱，为负。
                            </p>
                            <p>
                                3、计息按月利率<span class="label label-default">1.00%</span>标准计算，每月20日系统自动结息。
                            </p>
                            <p>4、计息月利率可由系统管理员在“参数设置”中调整，新调整的利率在下次计息日自动生效，且仅影响尚未结息的费用。</p>
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
				projectId : {
					required : true
				},
				fundsUsing : {},
				arrearsType : {},
				payType : {},
				amount : {
					required : true,
					number : true
				},
				interestAmount : {
					number : true
				},
				interestRate : {
					required : true,
					number : true,
					range : [ 0, 100 ]
				},
				bankAccount : {},
				bankName : {},
				trice : {},
				description : {},
				arrearsCode : {},
			}
		});

		$("#amount").change(function() {
			if (parseFloat($(this).val()) > 0) {
				$("#interestRate").data("orgin-value", $("#interestRate").val()).val("0.0").attr("readonly", "true");
			}else{
				var v = $("#interestRate").data("orgin-value");
				if(v != null){
					$("#interestRate").val(v).removeAttr("readonly");
				}
			}
		});
		


		function refreshAmount(projectId){
    		$.post("<s:url value='/api/getarrearsamount/' />" + projectId, {}, function(result) {
    			if(result.indexOf('|') > 0){
    				var arr = result.split("|");
    				$("#q1").html(arr[0]);
    				$("#q2").html(arr[1]);
    				$("#q3").html(arr[2]);
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
