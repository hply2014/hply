﻿<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="container main"><div class="panel panel-default">
	<div class="panel-heading">
		<strong>${page_title}</strong>
	</div>
	<div class="panel-body">
		<sf:form modelAttribute="arrears" cssClass="form-horizontal"
			role="form">
				<div class="row"><div class="col-sm-8">
        <div class="row">
							<label for="projectId" class="col-sm-2 control-label">项目ID</label>
							<div class="col-sm-4 ">
								<sf:input cssClass="form-control" path="projectId"
									placeholder="项目ID" />
								<p class="help-block">&nbsp;</p>
							</div>
        
							<label for="fundsUsing" class="col-sm-2 control-label">资金使用方</label>
							<div class="col-sm-4 ">
								<sf:input cssClass="form-control" path="fundsUsing"
									placeholder="资金使用方" />
								<p class="help-block">&nbsp;</p>
							</div></div>
        <div class="row">
							<label for="arrearsType" class="col-sm-2 control-label">欠款分类</label>
							<div class="col-sm-4 ">
								<sf:input cssClass="form-control" path="arrearsType"
									placeholder="欠款分类" />
								<p class="help-block">&nbsp;</p>
							</div>
        
							<label for="payType" class="col-sm-2 control-label">支付方式</label>
							<div class="col-sm-4 ">
								<sf:input cssClass="form-control" path="payType"
									placeholder="支付方式" />
								<p class="help-block">&nbsp;</p>
							</div></div>
        <div class="row">
							<label for="amount" class="col-sm-2 control-label">金额</label>
							<div class="col-sm-4 ">
								<sf:input cssClass="form-control" path="amount"
									placeholder="金额" />
								<p class="help-block">&nbsp;</p>
							</div>
        
							<label for="interestAmount" class="col-sm-2 control-label">利息额</label>
							<div class="col-sm-4 ">
								<sf:input cssClass="form-control" path="interestAmount"
									placeholder="利息额" />
								<p class="help-block">&nbsp;</p>
							</div></div>
        <div class="row">
							<label for="interestRate" class="col-sm-2 control-label">利率</label>
							<div class="col-sm-4 ">
								<sf:input cssClass="form-control" path="interestRate"
									placeholder="利率" />
								<p class="help-block">&nbsp;</p>
							</div>
        
							<label for="bankAccount" class="col-sm-2 control-label">银行账号</label>
							<div class="col-sm-4 ">
								<sf:input cssClass="form-control" path="bankAccount"
									placeholder="银行账号" />
								<p class="help-block">&nbsp;</p>
							</div></div>
        <div class="row">
							<label for="bankName" class="col-sm-2 control-label">开户行名称</label>
							<div class="col-sm-4 ">
								<sf:input cssClass="form-control" path="bankName"
									placeholder="开户行名称" />
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
							<label for="arrearsCode" class="col-sm-2 control-label">凭证号</label>
							<div class="col-sm-4 ">
								<sf:input cssClass="form-control" path="arrearsCode"
									placeholder="凭证号" />
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
						<a href='<s:url value="/arrears" />' class="btn btn-link"><span
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
                projectId : {
                }, 
                fundsUsing : {
                }, 
                arrearsType : {
                }, 
                payType : {
                }, 
                amount : {
                }, 
                interestAmount : {
                }, 
                interestRate : {
                }, 
                bankAccount : {
                }, 
                bankName : {
                }, 
                trice : {
                }, 
                description : {
                }, 
                arrearsCode : {
                }, 
			}
		});
	});
</script>
<%@ include file="bottom.jsp"%>
