<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="container main"><div class="panel panel-default">
	<div class="panel-heading">
		<strong>${page_title}</strong>
	</div>
	<div class="panel-body">
		<sf:form modelAttribute="fieldTypes" cssClass="form-horizontal"
			role="form">
				<div class="row"><div class="col-sm-8">
        <div class="row">
							<label for="fieldT01" class="col-sm-2 control-label"></label>
							<div class="col-sm-4 ">
								<sf:input cssClass="form-control" path="fieldT01"
									placeholder="" />
								<p class="help-block" />
							</div>
        
							<label for="fieldT02" class="col-sm-2 control-label"></label>
							<div class="col-sm-4 ">
								<sf:input cssClass="form-control" path="fieldT02"
									placeholder="" />
								<p class="help-block" />
							</div></div>
        <div class="row">
							<label for="fieldT03" class="col-sm-2 control-label"></label>
							<div class="col-sm-4 ">
								<sf:input cssClass="form-control" path="fieldT03"
									placeholder="" />
								<p class="help-block" />
							</div>
        
							<label for="fieldT04" class="col-sm-2 control-label"></label>
							<div class="col-sm-4 ">
								<sf:input cssClass="form-control" path="fieldT04"
									placeholder="" />
								<p class="help-block" />
							</div></div>
        <div class="row">
							<label for="fieldT05" class="col-sm-2 control-label"></label>
							<div class="col-sm-4 ">
								<sf:input cssClass="form-control" path="fieldT05"
									placeholder="" />
								<p class="help-block" />
							</div>
        
							<label for="fieldT06" class="col-sm-2 control-label"></label>
							<div class="col-sm-4 ">
					<div class="input-group date">
						<sf:input cssClass="form-control" path="fieldT06"
							data-date-format="yyyy-mm-dd" />
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-calendar"></i></span>
					</div>
								<p class="help-block" />
							</div></div>
        <div class="row">
							<label for="fieldT07" class="col-sm-2 control-label"></label>
							<div class="col-sm-4 ">
								<sf:input cssClass="form-control" path="fieldT07"
									placeholder="" />
								<p class="help-block" />
							</div>
        
							<label for="fieldT08" class="col-sm-2 control-label"></label>
							<div class="col-sm-4 ">
								<sf:input cssClass="form-control" path="fieldT08"
									placeholder="" />
								<p class="help-block" />
							</div></div>
        <div class="row">
							<label for="fieldT09" class="col-sm-2 control-label"></label>
							<div class="col-sm-4 ">
								<sf:input cssClass="form-control" path="fieldT09"
									placeholder="" />
								<p class="help-block" />
							</div></div>                        
						<button type="submit" class="btn btn-info pull-right">
							<span class="glyphicon glyphicon-ok"></span> 提 交
						</button>
						<a href='<s:url value="/fieldtypes" />' class="btn btn-link"><span
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
                fieldT01 : {
                }, 
                fieldT02 : {
                }, 
                fieldT03 : {
                }, 
                fieldT04 : {
                }, 
                fieldT05 : {
                }, 
                fieldT06 : {
                }, 
                fieldT07 : {
                }, 
                fieldT08 : {
                }, 
                fieldT09 : {
                }, 
			}
		});
	});
</script>
<%@ include file="bottom.jsp"%>
