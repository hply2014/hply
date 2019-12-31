<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="container main">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <strong>${page_title}</strong>
        </div>
        <div class="panel-body">
            <sf:form modelAttribute="informationCertificate" cssClass="form-horizontal" role="form">
                <div class="row">
                    <div class="col-sm-8">
                        <div class="row">
                            <label for="type" class="col-sm-2 control-label">证书类别</label>
                            <div class="col-sm-3">
                                <sf:select cssClass="form-control selectpicker" path="type" items="${type}"/>
                                <p class="help-block" />
                            </div>
                            <div class="col-sm-1">
                            	<a href="javascript:showCertificateTypeFormDialog('${certificateTypeId }');" class="btn btn-link"><span
                                        class="glyphicon glyphicon-cog"></span> 设置 </a>
                            </div>
                            <div class="col-sm-4 col-sm-offset-2 checkbox">
                                <sf:checkbox cssClass="icheckbox" path="lockFlag" id="lockFlag"
                                    value="1" />
                                <label for="lockFlag">是否锁证</label>
                                <p class="help-block" />
                            </div>
                        </div>
                        <div class="row">
                            <label for="type" class="col-sm-2 control-label">缴费方式</label>
                            <div class="col-sm-4">
                                <select class="form-control selectpicker" id="payFlag" name="payFlag">
		                        	<option value="0">按月付</option>
		                        	<option value="1">一次性付清</option>
		                        </select>
                                <p class="help-block" />
                            </div>
                            
                            <label for="amount" class="col-sm-2 control-label">金额</label>
                            <div class="col-sm-4 ">
                                <input type="text" class="form-control" id="amount" name="amount" placeholder="金额"
                                    value="<fmt:formatNumber value="${informationCertificate.amount}" pattern="0.00" />" />
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
                        <a href='<s:url value="/information/certificate" />' onclick="return goback();" class="btn btn-link"><span
                            class="glyphicon glyphicon-share-alt"></span> 返 回 </a>

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
<script type="text/template" charset="utf-8" id='certificateTypeEditTemplate'>
<form id="certificateTypeForm" class="form-horizontal" role="form">
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
<script type="text/javascript">
	$(function() {
		$("#payFlag").val("${informationCertificate.payFlag}");
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
				type : {required : true},
				projectName : {required : true},
				address : {required : true},
				partyName : {required : true},
				partyRealName : {required : true},
				partyPhone : {required : true},
				joinRealName : {required : true},
				certificateRealName : {},
				certificateBeginTime : {},
				certificateEndTime : {},
				certificateLockFlag : {},
				amount : {},
				description : {},
			}
		});
	});
	function showCertificateTypeFormDialog(id) {
    	$.get("<s:url value='/sysparameter/get/'/>" + id + ".json", {},
			function(result) {
				$("#myModal .modal-title").html("证书类别参数修改");
				$("#myModalContent").html(templateContent("certificateTypeEditTemplate"));
				$('#certificateTypeForm').find("#id").val(result.id);
				$('#certificateTypeForm').find("#paramValue").val(result.paramValue);
				$("#myModal .btn-danger").off("click").on("click",function() {
					var data = {
						id: $('#certificateTypeForm').find("#id").val(),
						paramValue: $('#certificateTypeForm').find("#paramValue").val(),
					};
					if(data.paramValue){
						$('#certificateTypeForm').find(".help-block").html("参数值以“/”分隔，前后不需要“/”。");
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
						$('#certificateTypeForm').find(".help-block").html('参数值以“/”分隔，前后不需要“/”。<br><b class="glyphicon glyphicon-remove text-danger"></b><i>必须填写</i>');
					}
				});
				$('#myModal').modal('show');
			}, "json");
	}
</script>
<%@ include file="bottom.jsp"%>
