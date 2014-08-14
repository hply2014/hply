<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="container main">
    <div class="panel panel-default">
        <div class="panel-heading">
            <strong>${page_title}</strong>
        </div>
        <div class="panel-body">
            <sf:form modelAttribute="project" cssClass="form-horizontal" role="form">
                <div class="row">
                    <div class="col-sm-8">
                        <div class="row">
                            <label for="projectCode" class="col-sm-2 control-label">项目编号</label>
                            <div class="col-sm-4 required-field-block">
                                <b class="required-icon">*</b>
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
                            <label for="manager" class="col-sm-2 control-label">项目经理</label>
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
                            <div class="col-sm-4 ">
                                <sf:input cssClass="form-control" path="contractAmount" placeholder="合同金额" />
                                <p class="help-block" />
                            </div>
                        </div>
                        <div class="row">
                            <label for="managementRate" class="col-sm-2 control-label">管理费率（%）</label>
                            <div class="col-sm-4 ">
                                <sf:input cssClass="form-control" path="managementRate" placeholder="管理费率" />
                                <p class="help-block" />
                            </div>
                            <label for="managementPlanAmount" class="col-sm-2 control-label">应收管理费</label>
                            <div class="col-sm-4 ">
                                <sf:input cssClass="form-control" path="managementPlanAmount" placeholder="应收管理费" />
                                <p class="help-block" />
                            </div>
                        </div>
                        <div class="row">
                            <label for="taxRate" class="col-sm-2 control-label">税金比率（%）</label>
                            <div class="col-sm-4 ">
                                <sf:input cssClass="form-control" path="taxRate" placeholder="税金比率" />
                                <p class="help-block" />
                            </div>
                            <label for="taxPlanAmount" class="col-sm-2 control-label">应缴税金</label>
                            <div class="col-sm-4 ">
                                <sf:input cssClass="form-control" path="taxPlanAmount" placeholder="应缴税金" />
                                <p class="help-block" />
                            </div>
                        </div>
                        <div class="row">
                            <label for="settlementAmount" class="col-sm-2 control-label">结算金额</label>
                            <div class="col-sm-4 ">
                                <sf:input cssClass="form-control" path="settlementAmount" placeholder="结算金额" />
                                <p class="help-block" />
                            </div>
                            <div class="col-sm-4 col-sm-offset-2 checkbox">
                                <sf:checkbox cssClass="icheckbox" path="capitalOccupied" id="capitalOccupied" value="1" />
                                <label for="capitalOccupied">占用资金情况</label>
                                <p class="help-block" /><input type="hidden" name="capitalOccupied" value="0" />
                            </div>
                        </div>
                        <div class="panel with-nav-tabs panel-default">
                            <div class="panel-heading">
                                <ul class="nav nav-tabs">
                                    <li class="active"><a href="#tab1warning" data-toggle="tab"> 甲方信息 </a></li>
                                    <li><a href="#tab2warning" data-toggle="tab"> 合同信息 </a></li>
                                    <li><a href="#tab3warning" data-toggle="tab"> 印花税上缴 </a></li>
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
                                            <label for="partyAddress" class="col-sm-2 control-label">甲方地址</label>
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

                        <button type="submit" class="btn btn-info pull-right">
                            <span class="glyphicon glyphicon-ok"></span> 提 交
                        </button>
                        <a href='<s:url value="/project" />' class="btn btn-link"><span
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

		$("#contractAmount, #taxRate").keyup(function() {
			if ($("#settlementAmount").val() > 0)
				return;
			var amount = $("#contractAmount").val() * $("#taxRate").val() / 100;
			$("#taxPlanAmount").val(amount.toFixed(2));
		});

		$("#settlementAmount").keyup(function() {
			var amount = $("#settlementAmount").val() > 0 ? $("#settlementAmount").val() : $("#contractAmount").val();
			var a1 = amount * $("#managementRate").val() / 100;
			$("#managementPlanAmount").val(a1.toFixed(2));
			var a2 = amount * $("#taxRate").val() / 100;
			$("#taxPlanAmount").val(a2.toFixed(2));
		});

		$("form").validate({
			errorElement : "i",
			success : function(label, element) {

				$(element).next().html('<b class="glyphicon glyphicon-ok text-success"></b>');//<i>正确</i>
			},
			errorPlacement : function(error, element) {
				element.next().html('<b class="glyphicon glyphicon-remove text-danger"></b><i>' + error.html() + "</i>");
			},
			rules : {
				projectCode : {
					required : true
				},
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
				taxRate : {
					number : true,
					range : [ 0, 100 ]
				},
				contractAmount : {
					number : true,
					min : 1
				},
				settlementAmount : {
					number : true,
					min : 0
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
					min : 0
				},
				taxPlanAmount : {
					number : true,
					min : 0
				},
			}
		});
	});
</script>
<%@ include file="bottom.jsp"%>
