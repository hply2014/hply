<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="container main"><div class="panel panel-default">
	<div class="panel-heading">
		<strong>${page_title}</strong>
	</div>
	<div class="panel-body">
		<sf:form modelAttribute="arrearsInterest" cssClass="form-horizontal"
			role="form">
				<div class="row"><div class="col-sm-8">
        <div class="row">
							<label for="serialId" class="col-sm-2 control-label">流水号</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="serialId"
									placeholder="流水号" />
								<p class="help-block">&nbsp;</p>
							</div>
        
        
        
    
        
							<label for="arrearsId" class="col-sm-2 control-label"></label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="arrearsId"
									placeholder="" />
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
        
        
        
    
        
							<label for="trice" class="col-sm-2 control-label">计息时间</label>
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
							<label for="amount" class="col-sm-2 control-label">计息基数</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="amount"
									placeholder="计息基数" />
								<p class="help-block">&nbsp;</p>
							</div>
        
        
        
    
        
							<label for="offsetAmount" class="col-sm-2 control-label">已还的利息，拆分到天的</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="offsetAmount"
									placeholder="已还的利息，拆分到天的" />
								<p class="help-block">&nbsp;</p>
							</div>
        
        </div>
        
    
        <div class="row">
							<label for="interestAmount" class="col-sm-2 control-label">当天的利息</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="interestAmount"
									placeholder="当天的利息" />
								<p class="help-block">&nbsp;</p>
							</div>
        
        
        
    
        
							<label for="createTime" class="col-sm-2 control-label"></label>
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
						<a href='<s:url value="/arrearsinterest" />' class="btn btn-link"><span
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
                arrearsId : {
                }, 
                projectId : {
                }, 
                trice : {
                }, 
                amount : {
                }, 
                offsetAmount : {
                }, 
                interestAmount : {
                }, 
                createTime : {
                }, 
                description : {
                }, 
			}
		});
	});
</script>
<%@ include file="bottom.jsp"%>
