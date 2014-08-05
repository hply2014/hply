<%@ page isELIgnored="false"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib
	uri="http://www.springframework.org/tags" prefix="s"%><%@ taglib
	uri="http://www.springframework.org/tags/form" prefix="sf"%><%@ page
	language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%><%@ include file="header.jsp"%>
<div class="container main"><div class="panel panel-default">
	<div class="panel-heading">
		<strong>${page_title}</strong>
	</div>
	<div class="panel-body">
		<sf:form modelAttribute="project" cssClass="form-horizontal"
			role="form">
				<div class="row"><div class="col-sm-8">
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
							</div></div>
        <div class="row">
							<label for="organizationId" class="col-sm-2 control-label">所在部门</label>
							<div class="col-sm-4 ">
								<sf:input cssClass="form-control" path="organizationId"
									placeholder="所在部门" />
								<p class="help-block">&nbsp;</p>
							</div>
        
							<label for="partyName" class="col-sm-2 control-label">甲方名称</label>
							<div class="col-sm-4 ">
								<sf:input cssClass="form-control" path="partyName"
									placeholder="甲方名称" />
								<p class="help-block">&nbsp;</p>
							</div></div>
        <div class="row">
							<label for="partyAddress" class="col-sm-2 control-label">甲方地址</label>
							<div class="col-sm-4 ">
								<sf:input cssClass="form-control" path="partyAddress"
									placeholder="甲方地址" />
								<p class="help-block">&nbsp;</p>
							</div>
        
							<label for="manager" class="col-sm-2 control-label">项目经理</label>
							<div class="col-sm-4 ">
								<sf:input cssClass="form-control" path="manager"
									placeholder="项目经理" />
								<p class="help-block">&nbsp;</p>
							</div></div>
        <div class="row">
							<label for="contractCode" class="col-sm-2 control-label">合同号</label>
							<div class="col-sm-4 ">
								<sf:input cssClass="form-control" path="contractCode"
									placeholder="合同号" />
								<p class="help-block">&nbsp;</p>
							</div>
        
							<label for="corperation" class="col-sm-2 control-label">合作单位</label>
							<div class="col-sm-4 ">
								<sf:input cssClass="form-control" path="corperation"
									placeholder="合作单位" />
								<p class="help-block">&nbsp;</p>
							</div></div>
        <div class="row">
							<label for="legalAssignee" class="col-sm-2 control-label">法人代表</label>
							<div class="col-sm-4 ">
								<sf:input cssClass="form-control" path="legalAssignee"
									placeholder="法人代表" />
								<p class="help-block">&nbsp;</p>
							</div>
        
							<label for="isWithholdingOffsite" class="col-sm-2 control-label">异地代扣代缴</label>
							<div class="col-sm-4 ">
								<sf:input cssClass="form-control" path="isWithholdingOffsite"
									placeholder="异地代扣代缴" />
								<p class="help-block">&nbsp;</p>
							</div></div>
        <div class="row">
							<label for="managementRate" class="col-sm-2 control-label">管理费率</label>
							<div class="col-sm-4 ">
								<sf:input cssClass="form-control" path="managementRate"
									placeholder="管理费率" />
								<p class="help-block">&nbsp;</p>
							</div>
        
							<label for="taxRate" class="col-sm-2 control-label">税金比率</label>
							<div class="col-sm-4 ">
								<sf:input cssClass="form-control" path="taxRate"
									placeholder="税金比率" />
								<p class="help-block">&nbsp;</p>
							</div></div>
        <div class="row">
							<label for="contractAmount" class="col-sm-2 control-label">合同金额</label>
							<div class="col-sm-4 ">
								<sf:input cssClass="form-control" path="contractAmount"
									placeholder="合同金额" />
								<p class="help-block">&nbsp;</p>
							</div>
        
							<label for="settlementAmount" class="col-sm-2 control-label">结算金额</label>
							<div class="col-sm-4 ">
								<sf:input cssClass="form-control" path="settlementAmount"
									placeholder="结算金额" />
								<p class="help-block">&nbsp;</p>
							</div></div>
        <div class="row">
							<label for="dutyPaidTime" class="col-sm-2 control-label">印花税上交时间</label>
							<div class="col-sm-4 ">
					<div class="input-group date">
						<sf:input cssClass="form-control" path="dutyPaidTime"
							data-date-format="yyyy-mm-dd" />
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-calendar"></i></span>
					</div>
								<p class="help-block">&nbsp;</p>
							</div>
        
							<label for="dutyPaidAmount" class="col-sm-2 control-label">印花税上交金额</label>
							<div class="col-sm-4 ">
								<sf:input cssClass="form-control" path="dutyPaidAmount"
									placeholder="印花税上交金额" />
								<p class="help-block">&nbsp;</p>
							</div></div>
        <div class="row">
							<label for="dutyPaidCode" class="col-sm-2 control-label">印花税收据编号</label>
							<div class="col-sm-4 ">
								<sf:input cssClass="form-control" path="dutyPaidCode"
									placeholder="印花税收据编号" />
								<p class="help-block">&nbsp;</p>
							</div>
        
							<label for="capitalOccupied" class="col-sm-2 control-label">占用资金情况</label>
							<div class="col-sm-4 ">
								<sf:input cssClass="form-control" path="capitalOccupied"
									placeholder="占用资金情况" />
								<p class="help-block">&nbsp;</p>
							</div></div>
        <div class="row">
							<label for="projectStatus" class="col-sm-2 control-label">项目状态</label>
							<div class="col-sm-4 ">
								<sf:input cssClass="form-control" path="projectStatus"
									placeholder="项目状态" />
								<p class="help-block">&nbsp;</p>
							</div>
        
							<label for="trice" class="col-sm-2 control-label">登记时间</label>
							<div class="col-sm-4 ">
					<div class="input-group date">
						<sf:input cssClass="form-control" path="trice"
							data-date-format="yyyy-mm-dd" />
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-calendar"></i></span>
					</div>
								<p class="help-block">&nbsp;</p>
							</div></div>
        <div class="row">
							<label for="managementPlanAmount" class="col-sm-2 control-label">应收管理费</label>
							<div class="col-sm-4 ">
								<sf:input cssClass="form-control" path="managementPlanAmount"
									placeholder="应收管理费" />
								<p class="help-block">&nbsp;</p>
							</div>
        
							<label for="taxPlanAmount" class="col-sm-2 control-label">应缴税金</label>
							<div class="col-sm-4 ">
								<sf:input cssClass="form-control" path="taxPlanAmount"
									placeholder="应缴税金" />
								<p class="help-block">&nbsp;</p>
							</div></div>
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
						<a href='<s:url value="/project" />' class="btn btn-link"><span
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
			errorElement : "i",
			success : function(label, element) {
				$(element)
						.next()
						.html(
								'<b class="glyphicon glyphicon-ok text-success"></b><i>正确</i>');
			},
			errorPlacement : function(error, element) {
				element.next().html(
						'<b class="glyphicon glyphicon-remove text-danger"></b><i>'
								+ error.html() + "</i>");
			},
			rules : { 	
                projectCode : {
                }, 
                projectName : {
                }, 
                organizationId : {
                }, 
                partyName : {
                }, 
                partyAddress : {
                }, 
                manager : {
                }, 
                contractCode : {
                }, 
                corperation : {
                }, 
                legalAssignee : {
                }, 
                isWithholdingOffsite : {
                }, 
                managementRate : {
                }, 
                taxRate : {
                }, 
                contractAmount : {
                }, 
                settlementAmount : {
                }, 
                dutyPaidTime : {
                }, 
                dutyPaidAmount : {
                }, 
                dutyPaidCode : {
                }, 
                capitalOccupied : {
                }, 
                projectStatus : {
                }, 
                trice : {
                }, 
                description : {
                }, 
                managementPlanAmount : {
                }, 
                taxPlanAmount : {
                }, 
			}
		});
	});
</script>
<%@ include file="bottom.jsp"%>
