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
		<sf:form modelAttribute="partyBilling" cssClass="form-horizontal"
			role="form">
				<div class="row"><div class="col-sm-8">
        <div class="row">
							<label for="projectId" class="col-sm-2 control-label">项目ID</label>
							<div class="col-sm-4 ">
								<sf:input cssClass="form-control" path="projectId"
									placeholder="项目ID" />
								<p class="help-block">&nbsp;</p>
							</div>
        
							<label for="invoiceCode" class="col-sm-2 control-label">发票票号</label>
							<div class="col-sm-4 ">
								<sf:input cssClass="form-control" path="invoiceCode"
									placeholder="发票票号" />
								<p class="help-block">&nbsp;</p>
							</div></div>
        <div class="row">
							<label for="amount" class="col-sm-2 control-label">发票金额</label>
							<div class="col-sm-4 ">
								<sf:input cssClass="form-control" path="amount"
									placeholder="发票金额" />
								<p class="help-block">&nbsp;</p>
							</div>
        
							<label for="trice" class="col-sm-2 control-label">开票时间</label>
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
							<label for="taxRate" class="col-sm-2 control-label">税率</label>
							<div class="col-sm-4 ">
								<sf:input cssClass="form-control" path="taxRate"
									placeholder="税率" />
								<p class="help-block">&nbsp;</p>
							</div>
        
							<label for="taxAmount" class="col-sm-2 control-label">应收税金</label>
							<div class="col-sm-4 ">
								<sf:input cssClass="form-control" path="taxAmount"
									placeholder="应收税金" />
								<p class="help-block">&nbsp;</p>
							</div></div>
        <div class="row">
							<label for="step1Idea" class="col-sm-2 control-label">审核意见</label>
							<div class="col-sm-4 ">
								<sf:input cssClass="form-control" path="step1Idea"
									placeholder="审核意见" />
								<p class="help-block">&nbsp;</p>
							</div>
        
							<label for="step1User" class="col-sm-2 control-label">审核人</label>
							<div class="col-sm-4 ">
								<sf:input cssClass="form-control" path="step1User"
									placeholder="审核人" />
								<p class="help-block">&nbsp;</p>
							</div></div>
        <div class="row">
							<label for="step1Time" class="col-sm-2 control-label">审核时间</label>
							<div class="col-sm-4 ">
					<div class="input-group date">
						<sf:input cssClass="form-control" path="step1Time"
							data-date-format="yyyy-mm-dd" />
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-calendar"></i></span>
					</div>
								<p class="help-block">&nbsp;</p>
							</div>
        
							<label for="stepStatus" class="col-sm-2 control-label">流程状态</label>
							<div class="col-sm-4 ">
								<sf:input cssClass="form-control" path="stepStatus"
									placeholder="流程状态" />
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
						<a href='<s:url value="/partybilling" />' class="btn btn-link"><span
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
                invoiceCode : {
                }, 
                amount : {
                }, 
                trice : {
                }, 
                taxRate : {
                }, 
                taxAmount : {
                }, 
                step1Idea : {
                }, 
                step1User : {
                }, 
                step1Time : {
                }, 
                stepStatus : {
                }, 
                description : {
                }, 
			}
		});
	});
</script>
<%@ include file="bottom.jsp"%>
