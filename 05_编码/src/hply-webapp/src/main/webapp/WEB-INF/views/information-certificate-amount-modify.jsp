<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="container main">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <strong>${page_title}</strong>
        </div>
        <div class="panel-body">
            <sf:form modelAttribute="informationCertificateAmount" cssClass="form-horizontal" role="form">
            	<div class="row">
                    <div class="col-sm-8">
                    	<div class="row">
                            <label for="organizationId" class="col-sm-2 control-label">所属部门</label>
                            <div class="col-sm-4 required-field-block">
                                <p class="form-control-static"><c:out value="${information.organizationId}" /></p>
                            </div>

                            <label for="projectName" class="col-sm-2 control-label">工程名称</label>
                            <div class="col-sm-4 required-field-block">
                                <p class="form-control-static"><c:out value="${information.projectName}" /></p>
                            </div>
                        </div>
                        <div class="row">
                            <label for="address" class="col-sm-2 control-label">工程地点</label>
                            <div class="col-sm-4 required-field-block">
                                <p class="form-control-static"><c:out value="${information.address}" /></p>
                            </div>

                            <label for="constructionCompany" class="col-sm-2 control-label">建设单位</label>
                            <div class="col-sm-4 required-field-block">
                                <p class="form-control-static"><c:out value="${information.constructionCompany}" /></p>
                            </div>
                        </div>
                        <div class="row">
                            <label for="generalContractor" class="col-sm-2 control-label">总包方</label>
                            <div class="col-sm-4 required-field-block">
                                <p class="form-control-static"><c:out value="${information.generalContractor}" /></p>
                            </div>
                            
                            <label for="joinRealName" class="col-sm-2 control-label">加盟客户姓名</label>
                            <div class="col-sm-4 required-field-block">
								<p class="form-control-static"><c:out value="${information.joinRealName}" /></p>
                            </div>
                        </div>
                        <div class="row">
                            <label for="decorationType" class="col-sm-2 control-label">装饰类别</label>
                            <div class="col-sm-4 required-field-block">
                                <p class="form-control-static"><c:out value="${information.decorationType}" /></p>
                            </div>
                            
                            <label for="quantities" class="col-sm-2 control-label">工程量</label>
                            <div class="col-sm-4 required-field-block">
								<p class="form-control-static"><c:out value="${information.quantities}" /></p>
                            </div>
                        </div>
                        <div class="row">
                        	<label for="serviceAmount" class="col-sm-2 control-label">综合服务费</label>
                            <div class="col-sm-4 required-field-block">
								<p class="form-control-static"><fmt:formatNumber pattern="#,##0.00" value="${information.serviceAmount}" /></p>
                            </div>
                        	<label for="statusName" class="col-sm-2 control-label">状态</label>
                            <div class="col-sm-4 required-field-block">
								<p class="form-control-static"><c:out value="${refInfo.statusName}" /></p>
                            </div>
                        </div>
                    	<div class="row">
                            <label for="realName" class="col-sm-2 control-label">证书使用人员姓名</label>
                            <div class="col-sm-4 ">
                                <sf:input cssClass="form-control" path="realName" placeholder="证书使用人员姓名" />
                                <p class="help-block" />
                            </div>

                            <label for="beginTime" class="col-sm-2 control-label">使用起止时间</label>
                            <div class="col-sm-4 ">
                                <div class="input-daterange input-group" id="datepicker">
                                    <sf:input cssClass="form-control" path="beginTime" data-date-format="yyyy-mm-dd" />
								    <span class="input-group-addon">至</span>
								    <sf:input cssClass="form-control" path="endTime" data-date-format="yyyy-mm-dd" />
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
								</div>
                                <p class="help-block" />
                            </div>
                        </div>
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
                            <div class="col-sm-2 col-sm-offset-2 checkbox">
                                <sf:checkbox cssClass="icheckbox" path="lockFlag" id="lockFlag"
                                    value="1" />
                                <label for="lockFlag">是否锁证</label>
                                <p class="help-block" />
                            </div>
                        </div>
                        <div class="row">
                            <label for="planAmount" class="col-sm-2 control-label">应收证书费</label>
                            <div class="col-sm-4 ">
                                <input type="text" class="form-control" id="planAmount" name="planAmount" placeholder="应收证书费"
                                    value="<fmt:formatNumber value="${informationCertificateAmount.planAmount}" pattern="0.00" />" />
                                <p class="help-block" />
                            </div>
                        </div>
                        <%-- <div class="row">
                            <label for="realAmount" class="col-sm-2 control-label">实收证书费</label>
                            <div class="col-sm-4 ">
                                <input type="text" class="form-control" id="realAmount" name="realAmount" placeholder="实收证书费"
                                    value="<fmt:formatNumber value="${informationCertificateAmount.realAmount}" pattern="0.00" />" />
                                <p class="help-block" />
                            </div>
                            <label for="oweAmount" class="col-sm-2 control-label">尚欠证书费</label>
                            <div class="col-sm-4 ">
                                <input type="text" class="form-control" id="oweAmount" name="oweAmount" placeholder="尚欠证书费"
                                    value="<fmt:formatNumber value="${informationCertificateAmount.oweAmount}" pattern="0.00" />" />
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
                        <a href='<s:url value="/information/modify/" />${information.id}?targat=certificateAmount' onclick="return goback();" class="btn btn-link"><span
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
		if($(".input-daterange")){
			$('.input-daterange').datepicker({
				language : "zh-CN",
				autoclose : true,
				todayHighlight : true
			});
		}
		/* var getAmount = function(){
			var type = $("#type").val();
			var lockFlag = $("#lockFlag").is(':checked') ? "1" : "0";
			var data = {
				type : $("#type").val(),
				lockFlag : $("#lockFlag").is(':checked') ? "1" : "0"
			};
			$.get("<s:url value='/information/certificate/get.json'/>", data,
   			function(result) {
				if(result){
					debugger
					if(result.payFlag == "0"){
						var months = 0;
						// 计算月数
						months = monthsBetween($("#beginTime").val(),$("#endTime").val()) || 0;
						var planAmount = Number(result.amount*months).toFixed(2);
						$("#planAmount").val(planAmount);
						$("#oweAmount").val(Number(planAmount-Number($("#realAmount").val())).toFixed(2));
					}else{
						$("#planAmount").val(Number(result.amount).toFixed(2));
						$("#oweAmount").val(Number(Number(result.amount)-Number($("#realAmount").val())).toFixed(2));
					}
				}
   			}, "json");
		};
		$("#beginTime").change(getAmount);
		$("#endTime").change(getAmount);
		$("#type").change(getAmount);
		$("#lockFlag").on('ifChecked', getAmount).on("ifUnchecked",getAmount);
		$("#realAmount").keyup(function() {
			var planAmount = Number($("#planAmount").val()).toFixed(2);
			var realAmount = Number($("#realAmount").val()).toFixed(2);
			$("#oweAmount").val(Number(planAmount-realAmount).toFixed(2));
		}); */
		$("#informationCertificateAmount").validate({
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
				realName : {},
				beginTime : {},
				endTime : {},
				lockFlag : {},
				planAmount : {},
				/* realAmount : {},
				oweAmount : {}, */
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
