<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="container main"><div class="panel panel-default">
	<div class="panel-heading">
		<strong>${page_title}</strong>
	</div>
	<div class="panel-body">
		<sf:form modelAttribute="projectSummary" cssClass="form-horizontal"
			role="form">
				<div class="row"><div class="col-sm-8">
        <div class="row">
							<label for="serialId" class="col-sm-2 control-label">记录流程号</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="serialId"
									placeholder="记录流程号" />
								<p class="help-block">&nbsp;</p>
							</div>
        
        
        
    
        
							<label for="trice" class="col-sm-2 control-label">时间</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>
					<div class="input-group date">
						<sf:input cssClass="form-control" path="trice"
							data-date-format="yyyy-mm-dd" />
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-calendar"></i></span>
					</div>
								<p class="help-block">&nbsp;</p>
							</div>
        
        </div>
        
    
        <div class="row">
							<label for="projectId" class="col-sm-2 control-label">项目ID</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="projectId"
									placeholder="项目ID" />
								<p class="help-block">&nbsp;</p>
							</div>
        
        
        
    
        
							<label for="organizationId" class="col-sm-2 control-label">所在部门</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="organizationId"
									placeholder="所在部门" />
								<p class="help-block">&nbsp;</p>
							</div>
        
        </div>
        
    
        <div class="row">
							<label for="projectCode" class="col-sm-2 control-label">项目编号</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="projectCode"
									placeholder="项目编号" />
								<p class="help-block">&nbsp;</p>
							</div>
        
        
        
    
        
							<label for="projectName" class="col-sm-2 control-label">项目名称</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="projectName"
									placeholder="项目名称" />
								<p class="help-block">&nbsp;</p>
							</div>
        
        </div>
        
    
        <div class="row">
							<label for="contractAmount" class="col-sm-2 control-label">合同金额</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="contractAmount"
									placeholder="合同金额" />
								<p class="help-block">&nbsp;</p>
							</div>
        
        
        
    
        
							<label for="changeAmount" class="col-sm-2 control-label">合同调增额</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="changeAmount"
									placeholder="合同调增额" />
								<p class="help-block">&nbsp;</p>
							</div>
        
        </div>
        
    
        <div class="row">
							<label for="changeTotalAmount" class="col-sm-2 control-label">累计调增额</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="changeTotalAmount"
									placeholder="累计调增额" />
								<p class="help-block">&nbsp;</p>
							</div>
        
        
        
    
        
							<label for="settlementAmount" class="col-sm-2 control-label">合同结算额</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="settlementAmount"
									placeholder="合同结算额" />
								<p class="help-block">&nbsp;</p>
							</div>
        
        </div>
        
    
        <div class="row">
							<label for="managementRate" class="col-sm-2 control-label">比率</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="managementRate"
									placeholder="比率" />
								<p class="help-block">&nbsp;</p>
							</div>
        
        
        
    
        
							<label for="managementPlanAmount" class="col-sm-2 control-label">应收管理费</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="managementPlanAmount"
									placeholder="应收管理费" />
								<p class="help-block">&nbsp;</p>
							</div>
        
        </div>
        
    
        <div class="row">
							<label for="managementRealAmount" class="col-sm-2 control-label">实收管理费</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="managementRealAmount"
									placeholder="实收管理费" />
								<p class="help-block">&nbsp;</p>
							</div>
        
        
        
    
        
							<label for="managementTotalAmount" class="col-sm-2 control-label">累计收管理费</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="managementTotalAmount"
									placeholder="累计收管理费" />
								<p class="help-block">&nbsp;</p>
							</div>
        
        </div>
        
    
        <div class="row">
							<label for="managementOweAmount" class="col-sm-2 control-label">尚欠管理费</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="managementOweAmount"
									placeholder="尚欠管理费" />
								<p class="help-block">&nbsp;</p>
							</div>
        
        
        
    
        
							<label for="partyBillingAmount" class="col-sm-2 control-label">发票金额</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="partyBillingAmount"
									placeholder="发票金额" />
								<p class="help-block">&nbsp;</p>
							</div>
        
        </div>
        
    
        <div class="row">
							<label for="partyBillingTotalAmount" class="col-sm-2 control-label">累计开票</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="partyBillingTotalAmount"
									placeholder="累计开票" />
								<p class="help-block">&nbsp;</p>
							</div>
        
        
        
    
        
							<label for="collectionsAmount" class="col-sm-2 control-label">收款金额</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="collectionsAmount"
									placeholder="收款金额" />
								<p class="help-block">&nbsp;</p>
							</div>
        
        </div>
        
    
        <div class="row">
							<label for="collectionsTotalAmount" class="col-sm-2 control-label">累计收款</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="collectionsTotalAmount"
									placeholder="累计收款" />
								<p class="help-block">&nbsp;</p>
							</div>
        
        
        
    
        
							<label for="collectionsRate" class="col-sm-2 control-label">回收率</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="collectionsRate"
									placeholder="回收率" />
								<p class="help-block">&nbsp;</p>
							</div>
        
        </div>
        
    
        <div class="row">
							<label for="customerBillingAmount" class="col-sm-2 control-label">发票金额</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="customerBillingAmount"
									placeholder="发票金额" />
								<p class="help-block">&nbsp;</p>
							</div>
        
        
        
    
        
							<label for="customerBillingTotalAmount" class="col-sm-2 control-label">累计开票</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="customerBillingTotalAmount"
									placeholder="累计开票" />
								<p class="help-block">&nbsp;</p>
							</div>
        
        </div>
        
    
        <div class="row">
							<label for="paymentAmount" class="col-sm-2 control-label">支付金额</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="paymentAmount"
									placeholder="支付金额" />
								<p class="help-block">&nbsp;</p>
							</div>
        
        
        
    
        
							<label for="paymentTotalAmount" class="col-sm-2 control-label">累计</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="paymentTotalAmount"
									placeholder="累计" />
								<p class="help-block">&nbsp;</p>
							</div>
        
        </div>
        
    
        <div class="row">
							<label for="taxRate" class="col-sm-2 control-label">比率</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="taxRate"
									placeholder="比率" />
								<p class="help-block">&nbsp;</p>
							</div>
        
        
        
    
        
							<label for="taxPlanAmount" class="col-sm-2 control-label">应缴税金</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="taxPlanAmount"
									placeholder="应缴税金" />
								<p class="help-block">&nbsp;</p>
							</div>
        
        </div>
        
    
        <div class="row">
							<label for="taxRealAmount" class="col-sm-2 control-label">已缴税金</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="taxRealAmount"
									placeholder="已缴税金" />
								<p class="help-block">&nbsp;</p>
							</div>
        
        
        
    
        
							<label for="taxTotalAmount" class="col-sm-2 control-label">累计已缴税金</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="taxTotalAmount"
									placeholder="累计已缴税金" />
								<p class="help-block">&nbsp;</p>
							</div>
        
        </div>
        
    
        <div class="row">
							<label for="taxOweAmount" class="col-sm-2 control-label">尚欠税金</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="taxOweAmount"
									placeholder="尚欠税金" />
								<p class="help-block">&nbsp;</p>
							</div>
        
        
        
    
        
							<label for="arrearsAmount" class="col-sm-2 control-label">金额</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="arrearsAmount"
									placeholder="金额" />
								<p class="help-block">&nbsp;</p>
							</div>
        
        </div>
        
    
        <div class="row">
							<label for="expectedValue" class="col-sm-2 control-label">预计用量</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="expectedValue"
									placeholder="预计用量" />
								<p class="help-block">&nbsp;</p>
							</div>
        
        
        
    
        
							<label for="profilePoint" class="col-sm-2 control-label">型材点</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="profilePoint"
									placeholder="型材点" />
								<p class="help-block">&nbsp;</p>
							</div>
        
        </div>
        
    
        <div class="row">
							<label for="createTime" class="col-sm-2 control-label">创建时间，数据生成时间</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>
					<div class="input-group date">
						<sf:input cssClass="form-control" path="createTime"
							data-date-format="yyyy-mm-dd" />
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-calendar"></i></span>
					</div>
								<p class="help-block">&nbsp;</p>
							</div>
        
        
        
    
        
							<label for="tableName" class="col-sm-2 control-label"></label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="tableName"
									placeholder="" />
								<p class="help-block">&nbsp;</p>
							</div>
        
        </div>
        
    
						<div class="row">
							<sf:label path="description" cssClass="col-sm-2 control-label">备注</sf:label>
							<div class="col-sm-10">
								<sf:textarea cssClass="form-control" rows="3" path="description"
									placeholder="备注，500字以内" />
								<p class="help-block">&nbsp;</p>
							</div>
						</div>
                        
						<button type="submit" class="btn btn-info pull-right">
							<span class="glyphicon glyphicon-ok"></span> 提 交
						</button>
						<a href='<s:url value="/projectsummary" />' class="btn btn-link"><span
							class="glyphicon glyphicon-share-alt"></span> 返 回 </a>
                        
				</div>
			</div>
				<c:if test="${not empty errors}">
					<div id="alert-error" class="col-sm-6 col-sm-offset-5">
						<div class="alert alert-danger alert-dismissible fade in"
							role="alert">
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
		</div><!--/panel-body-->
	</div><!--/panel-->
</div><!--/container main -->
<script type="text/javascript">
	$(function() {
		$("form").validate({
			errorElement : "p",
			success: function(label) {
				label.text("　").addClass("success");
			},
			errorPlacement: function(error, element) {
				error.appendTo(element.parent("div").next("div"));
			},
			rules : { 	
                serialId : {
                }, 
                trice : {
                }, 
                description : {
                }, 
                projectId : {
                }, 
                organizationId : {
                }, 
                projectCode : {
                }, 
                projectName : {
                }, 
                contractAmount : {
                }, 
                changeAmount : {
                }, 
                changeTotalAmount : {
                }, 
                settlementAmount : {
                }, 
                managementRate : {
                }, 
                managementPlanAmount : {
                }, 
                managementRealAmount : {
                }, 
                managementTotalAmount : {
                }, 
                managementOweAmount : {
                }, 
                partyBillingAmount : {
                }, 
                partyBillingTotalAmount : {
                }, 
                collectionsAmount : {
                }, 
                collectionsTotalAmount : {
                }, 
                collectionsRate : {
                }, 
                customerBillingAmount : {
                }, 
                customerBillingTotalAmount : {
                }, 
                paymentAmount : {
                }, 
                paymentTotalAmount : {
                }, 
                taxRate : {
                }, 
                taxPlanAmount : {
                }, 
                taxRealAmount : {
                }, 
                taxTotalAmount : {
                }, 
                taxOweAmount : {
                }, 
                arrearsAmount : {
                }, 
                expectedValue : {
                }, 
                profilePoint : {
                }, 
                createTime : {
                }, 
                tableName : {
                }, 
			}
		});
	});
</script>
<%@ include file="bottom.jsp"%>
