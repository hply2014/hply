<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="container main">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <strong>${page_title}</strong>
        </div>
        <div class="panel-body">
            <sf:form id="projectForm" modelAttribute="project" cssClass="form-horizontal" role="form">
                <div class="row">
                    <div class="col-sm-8">
                        <div class="row">
                            <label for="projectCode" class="col-sm-2 control-label">项目编号</label>
                            <div class="col-sm-4 required-field-block">
                                <sf:input cssClass="form-control" path="projectCode" placeholder="项目编号" />
                                <p class="help-block" />
                            </div>

                            <label for="projectName" class="col-sm-2 control-label">项目名称</label>
                            <div class="col-sm-4 required-field-block">
                                <b class="required-icon">*</b>
                                <sf:input cssClass="form-control" path="projectName" placeholder="项目名称" />
                                <p class="help-block" />
                            </div>
                        </div>
                        <div class="row">
                            <label for="organizationId" class="col-sm-2 control-label">所在部门</label>
                            <div class="col-sm-4 ">
                                <sf:select cssClass="form-control selectpicker" path="organizationId"
                                    items="${orglist }" itemValue="id" itemLabel="organizationName" />
                                <p class="help-block" />
                            </div>
                            <label for="manager" class="col-sm-2 control-label">项目实施人</label>
                            <div class="col-sm-4 ">
                                <sf:input cssClass="form-control" path="manager" placeholder="项目经理" />
                                <p class="help-block" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-4 col-sm-offset-2 checkbox">
                                <sf:checkbox cssClass="icheckbox" path="isWithholdingOffsite" id="isWithholdingOffsite"
                                    value="1" />
                                <label for="isWithholdingOffsite">异地代扣代缴</label>
                                <p class="help-block" />
                            </div>
                            <label for="contractAmount" class="col-sm-2 control-label">合同金额</label>
                            <div class="col-sm-4 required-field-block">
                                <input type="text" class="form-control" id="contractAmount" name="contractAmount" placeholder="合同金额"
                                    value="<fmt:formatNumber value="${project.contractAmount}"
                                                pattern="0.00" />" />
                                <p class="help-block" />
                            </div>
                        </div>
                        <div class="row">
                            <label for="managementRate" class="col-sm-2 control-label">管理费率（%）</label>
                            <div class="col-sm-4 required-field-block">
                                <sf:input cssClass="form-control" path="managementRate" placeholder="管理费率" />
                                <p class="help-block" />
                            </div>
                            <label for="managementPlanAmount" class="col-sm-2 control-label">应收管理费</label>
                            <div class="col-sm-4 required-field-block">
                                <input type="text" class="form-control" id="managementPlanAmount" name="managementPlanAmount" placeholder="应收管理费"
                                    value="<fmt:formatNumber value="${project.managementPlanAmount}"
                                                pattern="0.00" />" />
                                <p class="help-block" />
                            </div>
                        </div>
                        <div class="row">
                            <label for="contractDate" class="col-sm-2 control-label">合同签订时间</label>
                            <div class="col-sm-4 required-field-block">
                                <b class="required-icon">*</b>
                                <div class="input-group date">
                                    <sf:input cssClass="form-control" path="contractDate"
                                        data-date-format="yyyy-mm-dd" />
                                    <span class="input-group-addon"><i
                                        class="glyphicon glyphicon-calendar"></i></span>
                                </div>
                                <p class="help-block" />
                            </div>
                            <label for="taxBearingRate" class="col-sm-2 control-label">税负率（%）</label>
                            <div class="col-sm-4 ">
                                <sf:input cssClass="form-control" path="taxBearingRate" placeholder="税负率" />
                                <p class="help-block" />
                            </div>
                        </div>
                        <div class="row">
                            <label for="contractType" class="col-sm-2 control-label">合同分类</label>
                            <div class="col-sm-3 required-field-block">
                                <sf:select cssClass="form-control selectpicker" path="contractType"
                                    items="${contractType }" />
                                <p class="help-block" />
                            </div>
                            <div class="col-sm-1">
                            	<a href="javascript:showContractTypeFormDialog('${contractTypeId }');" class="btn btn-link"><span
                                        class="glyphicon glyphicon-cog"></span> 设置 </a>
                            </div>
                            <label for="contractTaxRate" class="col-sm-2 control-label">合同税率</label>
                            <div class="col-sm-4 required-field-block">
                                <sf:select cssClass="form-control selectpicker" path="contractTaxRate"
                                    items="${contractTaxRate }" />
                                <p class="help-block" />
                            </div>
                        </div>
                        <!-- 删除：税金比率、应交税金   2017-09-06 tyc
                        <div class="row">
                            <label for="taxRate" class="col-sm-2 control-label">税金比率（%）</label>
                            <div class="col-sm-4 ">
                                <sf:input cssClass="form-control" path="taxRate" placeholder="税金比率" />
                                <p class="help-block" />
                            </div>
                            <label for="taxPlanAmount" class="col-sm-2 control-label">应缴税金</label>
                            <div class="col-sm-4 ">
                                <input type="text" class="form-control" id="taxPlanAmount" name="taxPlanAmount" placeholder="应缴税金"
                                    value="<fmt:formatNumber value="${project.taxPlanAmount}"
                                                pattern="0.00" />" />
                                <p class="help-block" />
                            </div>
                        </div>
                        -->
                        <div class="row">
                            <label for="settlementAmount" class="col-sm-2 control-label">结算金额</label>
                            <div class="col-sm-4 ">
                                <input type="text" class="form-control" id="settlementAmount" name="settlementAmount" placeholder="结算金额"
                                    value="<fmt:formatNumber value="${project.settlementAmount}"
                                                pattern="0.00" />" />
                                <p class="help-block" />
                            </div>
                            <div class="col-sm-4 col-sm-offset-2 checkbox">
                                <sf:checkbox cssClass="icheckbox" path="capitalOccupied" id="capitalOccupied" value="1" />
                                <label for="capitalOccupied">占用资金情况</label>
                                <p class="help-block" />
                                <input type="hidden" name="capitalOccupied" value="0" />
                            </div>
                        </div>
                        <div class="row">
                            <label for="vatAdditionalCoefficient" class="col-sm-2 control-label">增值税及附加系数</label>
                            <div class="col-sm-4 required-field-block">
                                <b class="required-icon">*</b>
                                <input type="text" class="form-control" id="vatAdditionalCoefficient" name="vatAdditionalCoefficient" placeholder="增值税及附加系数"
                                    value="<fmt:formatNumber value="${project.vatAdditionalCoefficient}"
                                                pattern="0.00" />" />
                                <p class="help-block" />
                            </div>
                        </div>
                        <div class="panel with-nav-tabs panel-default">
                            <div class="panel-heading">
                                <ul class="nav nav-tabs" id="projectNav">
                                    <li class="active"><a href="#tab1warning" data-toggle="tab"> 甲方信息 </a></li>
                                    <li><a href="#tab2warning" data-toggle="tab"> 合同信息 </a></li>
                                    <li><a href="#tab3warning" data-toggle="tab"> 印花税上缴 </a></li>
                                    <li><a href="#tab4warning" data-toggle="tab"> 混合税率 </a></li>
                                    <!-- 
                                    <li class="dropdown"><a href="#" data-toggle="dropdown">Dropdown <span
                                            class="caret"></span></a>
                                        <ul class="dropdown-menu" role="menu">
                                            <li><a href="#tab4warning" data-toggle="tab">Warning 4</a></li>
                                            <li><a href="#tab5warning" data-toggle="tab">Warning 5</a></li>
                                        </ul></li> -->
                                </ul>
                            </div>
                            <div class="panel-body">
                                <div class="tab-content">
                                    <div class="tab-pane fade in active" id="tab1warning">
                                        <div class="row">
                                            <label for="partyName" class="col-sm-2 control-label">甲方名称</label>
                                            <div class="col-sm-4 ">
                                                <sf:input cssClass="form-control" path="partyName" placeholder="甲方名称" />
                                                <p class="help-block" />
                                            </div>
                                            <label for="partyAddress" class="col-sm-2 control-label">工程地址</label>
                                            <div class="col-sm-4 ">
                                                <sf:input cssClass="form-control" path="partyAddress" placeholder="甲方地址" />
                                                <p class="help-block" />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <label for="corperation" class="col-sm-2 control-label">合作单位</label>
                                            <div class="col-sm-4 ">
                                                <sf:input cssClass="form-control" path="corperation" placeholder="合作单位" />
                                                <p class="help-block" />
                                            </div>
                                            <label for="legalAssignee" class="col-sm-2 control-label">法人代表</label>
                                            <div class="col-sm-4 ">
                                                <sf:input cssClass="form-control" path="legalAssignee"
                                                    placeholder="法人代表" />
                                                <p class="help-block" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="tab2warning">
                                        <div class="row">
                                            <label for="contractCode" class="col-sm-2 control-label">合同号</label>
                                            <div class="col-sm-4 ">
                                                <sf:input cssClass="form-control" path="contractCode" placeholder="合同号" />
                                                <p class="help-block" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="tab3warning">
                                        <div class="row">
                                            <label for="dutyPaidCode" class="col-sm-2 control-label">印花税收据编号</label>
                                            <div class="col-sm-4 ">
                                                <sf:input cssClass="form-control" path="dutyPaidCode"
                                                    placeholder="印花税收据编号" />
                                                <p class="help-block" />
                                            </div>
                                            <label for="dutyPaidAmount" class="col-sm-2 control-label">印花税上缴金额</label>
                                            <div class="col-sm-4 ">
                                                <sf:input cssClass="form-control" path="dutyPaidAmount"
                                                    placeholder="印花税上缴金额" />
                                                <p class="help-block" />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <label for="dutyPaidTime" class="col-sm-2 control-label">印花税上缴时间</label>
                                            <div class="col-sm-4 ">
                                                <div class="input-group date">
                                                    <sf:input cssClass="form-control" path="dutyPaidTime"
                                                        data-date-format="yyyy-mm-dd" />
                                                    <span class="input-group-addon"><i
                                                        class="glyphicon glyphicon-calendar"></i></span>
                                                </div>
                                                <p class="help-block" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="tab4warning">
                                    	<!-- 混合税率 -->
                                    	<div class="panel-body">
		                                    <div class="btn-toolbar" role="toolbar">
		                                        <shiro:hasPermission name="`projecttaxrate_create`">
		                                            <div class="btn-group">
		                                                <a href="javascript:;" id="addProjectTaxRate" class="btn btn-info"><span class="glyphicon glyphicon-plus"></span> 新 建 </a>
		                                            </div>
		                                        </shiro:hasPermission>
		                                    </div>
		                                    <table class="table table-hover">
		                                        <thead>
		                                            <tr>
		                                                <th>名称<b class="required-icon">*</b></th>
		                                                <th>税率（%）<b class="required-icon">*</b></th>
		                                                <th>金额<b class="required-icon">*</b></th>
		                                                <th></th>
		                                            </tr>
		                                        </thead>
		                                        <tbody id="projectTaxRateList">
		                                            <c:forEach items="${lProjectTaxRate}" var="projectTaxRate">
		                                                <tr>
		                                                    <td>
		                                                    	<input type="text" class="form-control" id="trNames" name="trNames" placeholder="名称" value="<c:out value="${projectTaxRate.name}" />"/>
																<p class="help-block" />
		                                                    </td>
		                                                    <td>
																<input type="text" class="form-control" id="trTaxRates" name="trTaxRates" placeholder="税率" value="<fmt:formatNumber value="${projectTaxRate.taxRate}" pattern="##0.00" />"/>
																<p class="help-block" />
		                                                    </td>
		                                                    <td>
			                                                    <input type="text" class="form-control" id="trAmounts" name="trAmounts" placeholder="金额" value="<fmt:formatNumber value="${projectTaxRate.amount}" pattern="##0.00" />"/>
																<p class="help-block" />
															</td>
		                                               		<td>
																<input type="hidden" id="trIds" name="trIds" value="${projectTaxRate.id}"/>
																<input type="hidden" id="trStatuss" name="trStatuss" value="${projectTaxRate.status}"/>
							                                    <shiro:hasPermission name="`projecttaxrate_create`">
							                                        <a class="delete" id="${projectTaxRate.id}"
							                                            data-confirm-message="混合税金：<c:out value="${projectTaxRate.id}" />，将被永久删除，操作不可撤销，是否确认？"
							                                            href="javascript:deleteProjectTaxTate('${projectTaxRate.id}');">删除</a>
							                                    </shiro:hasPermission>
		                                					</td>
		                                				</tr>
		                                            </c:forEach>
		                                        </tbody>
		                                    </table>
		                                </div>
                                    </div>
                                    <!--  
                                    <div class="tab-pane fade" id="tab4warning">Warning 4</div>
                                    <div class="tab-pane fade" id="tab5warning">Warning 5</div> 
                                    -->
                                </div>
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
                        <a href='<s:url value="/project" />' onclick="return goback();" class="btn btn-link"><span
                            class="glyphicon glyphicon-share-alt"></span> 返 回 </a>

                    </div>
                    <div class="col-sm-4">
                        <div class="bs-callout bs-callout-danger">
                            <h4>操作提示</h4>
                            <p>1、当项目尚未结算（结算金额 = 0.00）时，应收管理费 = 合同金额 × 管理费率；应缴税金 = 合同金额 × 税金比率。</p>
                            <p>2、当项目已结算（结算金额 > 0.00）时，应收管理费 = 结算金额 × 管理费率；应缴税金 = 结算金额 × 税金比率。</p>
                            <p>3、管理费率默认3.6%，税金比率默认3.4%，可由管理员在系统设置中修改。</p>
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
<script type="text/template" charset="utf-8" id='projectTaxRateAddTemplate'>
	<tr>
		<td>
			<input type="text" class="form-control" id="trNames" name="trNames" placeholder="名称" value=""/>
			<p class="help-block" />
		</td>
		<td>
			<input type="text" class="form-control" id="trTaxRates" name="trTaxRates" placeholder="税率" value=""/>
			<p class="help-block" />
		</td>
		<td>
			<input type="text" class="form-control" id="trAmounts" name="trAmounts" placeholder="金额" value="{{=it.amount}}"/>
			<p class="help-block" />
		</td>
		<td>
			<input type="hidden" id="trIds" name="trIds" value=" "/>
			<input type="hidden" id="trStatuss" name="trStatuss" value="0"/>
			<shiro:hasPermission name="`projecttaxrate_create`">
				<a id="{{=it.id}}" class="delete js-delete" data-confirm-message="混合税金将被永久删除，操作不可撤销，是否确认？" href="javascript:deleteProjectTaxTate('{{=it.id}}');">删除</a>
			</shiro:hasPermission>
		</td>
	</tr>
</script>
<script type="text/template" charset="utf-8" id='contractTypeEditTemplate'>
<form id="contractTypeForm" class="form-horizontal" role="form">
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
		$.post("<s:url value='/api/capitaloccupied/${project.id}' />", {}, function(result) {
			$("#capitalOccupied").html(result + "，（往来欠款累计）");
		}, "text");

		$("#contractAmount, #managementRate").keyup(function() {
			if ($("#settlementAmount").val() > 0)
				return;
			var amount = $("#contractAmount").val() * $("#managementRate").val() / 100;
			$("#managementPlanAmount").val(amount.toFixed(2));
		});

		/* $("#contractAmount, #taxRate").keyup(function() {
			if ($("#settlementAmount").val() > 0)
				return;
			var amount = $("#contractAmount").val() * $("#taxRate").val() / 100;
			$("#taxPlanAmount").val(amount.toFixed(2));
		}); */

		$("#settlementAmount").keyup(function() {
			var amount = $("#settlementAmount").val() > 0 ? $("#settlementAmount").val() : $("#contractAmount").val();
			var a1 = amount * $("#managementRate").val() / 100;
			$("#managementPlanAmount").val(a1.toFixed(2));
			/* var a2 = amount * $("#taxRate").val() / 100;
			$("#taxPlanAmount").val(a2.toFixed(2)); */
		});
		
		$("#projectTaxRateList").delegate("input[type=text]","keyup",function(){
			// 修改过，状态为2
			$(this).parent().parent().find("#trStatuss").val(2);
			if($(this).attr("id")=="trAmounts"){
				// $(this).val(Number($(this).val()).toFixed(2));
				var totalTaxRateAmount = 0;// 混合税率中金额和
				$("#projectTaxRateList").find("tr").each(function(){
					var trStatus = $(this).find("#trStatuss").val();
					if(trStatus != -1){
						var trAmount = $(this).find("#trAmounts").val();
						totalTaxRateAmount+=Number(trAmount);
					}
				});
				$("#contractAmount").val(totalTaxRateAmount.toFixed(2));
			}
		});
		
		$("#addProjectTaxRate").click(function(){
			// 计算剩余合同金额
			var totalTaxRateAmount = 0;// 混合税率中金额和
			$("#projectTaxRateList").find("tr").each(function(){
				var trStatus = $(this).find("#trStatuss").val();
				if(trStatus != -1){
					var trAmount = $(this).find("#trAmounts").val();
					totalTaxRateAmount+=Number(trAmount);
				}
			});
			var amount = ($("#contractAmount").val() - totalTaxRateAmount).toFixed(2);// 剩余金额
			if(amount < 0){
				amount = 0;
			}
			$("#projectTaxRateList").append(templateContent("projectTaxRateAddTemplate",{id: UUID(),amount: amount}));
		});
		
		$("#contractTaxRate").change(function(){
			var value = $(this).val();
			if(value == "混合税率"){
				$("#contractAmount").attr("readonly","true");
				$("#projectNav li:eq(3)").show().children().click();
				// 选择混合税率时表格中没有数据默认添加一条
				if($("#projectTaxRateList").find('tr:not([style])').length < 1){
					$("#addProjectTaxRate").click();
				}
			}else{
				$("#contractAmount").removeAttr("readonly");
				$("#projectNav li:eq(3)").hide();
				if($("#projectNav li:eq(3)").hasClass("active")){
					$("#projectNav li:eq(0)").children().click();
				}
				$("#projectTaxRateList").find('tr').each(function(){
					deleteProjectTaxTate($(this).find("a").eq(0).attr("id"));
				});
			}
		}).change();

		$("#projectForm").validate({
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
				projectCode : {},
				projectName : {
					required : true
				},
				organizationId : {},
				partyName : {},
				partyAddress : {},
				manager : {},
				contractCode : {},
				corperation : {},
				legalAssignee : {},
				isWithholdingOffsite : {},
				managementRate : {
					number : true,
					range : [ 0, 100 ]
				},
				/* taxRate : {
					number : true,
					range : [ 0, 100 ]
				}, */
				contractAmount : {
					number : true,
				},
				settlementAmount : {
					number : true,
				},
				dutyPaidTime : {},
				dutyPaidAmount : {
					number : true
				},
				dutyPaidCode : {},
				capitalOccupied : {},
				projectStatus : {},
				trice : {},
				description : {},
				managementPlanAmount : {
					number : true,
				},
				contractDate : {required : true,},
				taxBearingRate : {
					number : true,
					range : [ 0, 100 ]
				},
				contractType : {},
				contractTaxRate : {},
				/* taxPlanAmount : {
					number : true,
				}, */
				trNames : {
					required : true,
				},
				trTaxRates : {
					required : true,
					number : true,
					range : [ 0, 100 ]
				},
				trAmounts : {
					required : true,
					number : true,
					//checktaxamount : true,
				},
				vatAdditionalCoefficient : {
					required : true,
					number : true,
				},
			}
		});
		
		$("#myModalContent").delegate("#paramValue","blur",function(){
			if($('#contractTypeForm').find("#paramValue").val()){
				$('#contractTypeForm').find(".help-block").html("参数值以“/”分隔，前后不需要“/”。");
			}else{
				$('#contractTypeForm').find(".help-block").html('参数值以“/”分隔，前后不需要“/”。<br><b class="glyphicon glyphicon-remove text-danger"></b><i>必须填写</i>');
			}
		});
		
	});
	function showContractTypeFormDialog(id) {
    	$.get("<s:url value='/sysparameter/get/'/>" + id + ".json", {},
			function(result) {
				$("#myModal .modal-title").html("合同分类参数修改");
				$("#myModalContent").html(templateContent("contractTypeEditTemplate"));
				$('#contractTypeForm').find("#id").val(result.id);
				$('#contractTypeForm').find("#paramValue").val(result.paramValue);
				$("#myModal .btn-danger").off("click").on("click",function() {
					var data = {
						id: $('#contractTypeForm').find("#id").val(),
						paramValue: $('#contractTypeForm').find("#paramValue").val(),
					};
					if(data.paramValue){
						$('#contractTypeForm').find(".help-block").html("参数值以“/”分隔，前后不需要“/”。");
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
						$('#contractTypeForm').find(".help-block").html('参数值以“/”分隔，前后不需要“/”。<br><b class="glyphicon glyphicon-remove text-danger"></b><i>必须填写</i>');
					}
				});
				$('#myModal').modal('show');
			}, "json");
	}
	
	function deleteProjectTaxTate(selector){
		var $tr = $("#"+selector).parent().parent();
		var trStatus = $tr.find("#trStatuss").val();
		if(trStatus == 0){
			// 新增未修改，删除TR
			$tr.remove();
		}else{
			var trId = $tr.find("#trIds").val();
			if(trId){
				// 修改过ID不为空，状态为-1
				$tr.find("#trStatuss").val(-1);
				$tr.hide();
			}else{
				// 修改过ID为空，删除TR
				$tr.remove();
			}
		}
	}
</script>
<%@ include file="bottom.jsp"%>
