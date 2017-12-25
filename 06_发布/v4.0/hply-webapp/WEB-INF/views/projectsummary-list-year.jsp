<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@page import="hply.core.*"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${page_title}-工程项目核算系统</title>
<link rel="stylesheet" href="<s:url value="/assets/bootstrap/css/bootstrap.min.css" />">
<link rel="stylesheet" href="<s:url value="/assets/bootstrap-icheck/skins/all.css" />">
<link rel="stylesheet" href="<s:url value="/assets/select2/3.5.1/select2.css" />">
<link rel="stylesheet" href="<s:url value="/assets/select2/3.5.1/select2-bootstrap.css" />">

<script src="<s:url value="/assets/jquery.min.js" />"></script>
<script src="<s:url value="/assets/jquery-ui.min.js" />"></script>
<script src="<s:url value="/assets/bootstrap/js/bootstrap.min.js" />"></script>
<script src="<s:url value="/assets/select2/3.5.1/select2.min.js" />"></script>
<script src="<s:url value="/assets/select2/3.5.1/select2_locale_zh-CN.js" />"></script>
<script src="<s:url value="/assets/doT.min.js" />"></script>
<script src="<s:url value="/assets/utils.js" />"></script>
<!--[if lt IE 9]>
      <script src="<s:url value="/assets/html5shiv.js" />"></script>
      <script src="<s:url value="/assets/respond.min.js" />"></script>
    <![endif]-->

<style type="text/css">
body {
	padding: 10px;
	margin: 10px;
}

strong, h1, h2, h3, h4 {
	font-family: 微软雅黑, 黑体;
}

th, .nowrap {
	word-break: keep-all;
	white-space: nowrap;
}

th {
	text-align: center;
}

.amount {
	text-align: right;
}
</style>
</head>
<body>
    <h4>
        <strong>年度汇总报表</strong>（ 共
        <c:out value="${list.size()}" />
        行 ）
        <c:if test='${not empty orglist}'>
            <select class="select2" id="orgSelect">
                <c:forEach items="${orglist}" var="org">
                    <option ${org.id == orgId ? 'selected' : '' } value="${org.id}">${org.organizationName}</option>
                </c:forEach>
            </select></c:if>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <a href="<c:url value="/projectsummary/export-year?orgid=${orgId}" />" class="btn btn-danger"><span
                        class="glyphicon glyphicon-floppy-save"></span>导出到Excel . . . </a>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <a href="javascript:;" id="btn-setting" class="btn btn-info"><span
                        class="glyphicon glyphicon-cog"></span>设置列</a>
    </h4>
   	<c:set var="rowspan" value="1"/>
   	<c:set var="colspan" value="0"/>
   	<c:if test="${empty columns || fn:contains(columns,'managementPlanAmount') || fn:contains(columns,'managementTotalAmount') || fn:contains(columns,'field02') || fn:contains(columns,'field03')}">
   		<c:set var="rowspan" value="2"/>
   		<c:if test="${empty columns || fn:contains(columns,'managementPlanAmount') }">
   			<c:set var="colspan" value="${colspan+1 }"/>
   		</c:if>
   		<c:if test="${empty columns || fn:contains(columns,'managementTotalAmount') }">
   			<c:set var="colspan" value="${colspan+1 }"/>
   		</c:if>
   		<c:if test="${empty columns || fn:contains(columns,'field02') }">
   			<c:set var="colspan" value="${colspan+1 }"/>
   		</c:if>
   		<c:if test="${empty columns || fn:contains(columns,'field03') }">
   			<c:set var="colspan" value="${colspan+1 }"/>
   		</c:if>
   	</c:if>
    <table class="table table-hover table-striped table-bordered">
        <thead>
            <tr>
                <c:if test="${empty columns || fn:contains(columns,'field01') }"><th rowspan="${rowspan }">年份</th></c:if>
                <c:if test="${empty columns || fn:contains(columns,'field04') }"><th rowspan="${rowspan }">工程数</th></c:if>
                <c:if test="${empty columns || fn:contains(columns,'contractAmount') }"><th rowspan="${rowspan }">累计合同金额</th></c:if>
                <c:if test="${empty columns || fn:contains(columns,'changeTotalAmount') }"><th rowspan="${rowspan }">合同调增额</th></c:if>
                <c:if test="${empty columns || fn:contains(columns,'settlementAmount') }"><th rowspan="${rowspan }">合同结算额</th></c:if>
                <c:if test="${empty columns || fn:contains(columns,'partyBillingAmount') }"><th rowspan="${rowspan }">累计甲方开票</th></c:if>
                <c:if test="${empty columns || fn:contains(columns,'collectionsTotalAmount') }"><th rowspan="${rowspan }">累计收款</th></c:if>
                <c:if test="${empty columns || fn:contains(columns,'customerBillingAmount') }"><th rowspan="${rowspan }">累计客户开票</th></c:if>
                <c:if test="${empty columns || fn:contains(columns,'paymentAmount') }"><th rowspan="${rowspan }">累计支付工程款</th></c:if>
                <c:if test="${empty columns || fn:contains(columns,'taxBearingTotalRealAmount') }"><th rowspan="${rowspan }">累计已收税负率税金</th></c:if>
                <c:if test="${colspan > 0 }"><th colspan="${colspan }">管理费及其他收入情况</th></c:if>
                <c:if test="${empty columns || fn:contains(columns,'arrearsAmount') }"><th rowspan="${rowspan }">往来欠款</th></c:if>
                <c:if test="${empty columns || fn:contains(columns,'expectedValueTon') }"><th rowspan="${rowspan }">型材（吨）</th></c:if>
                <c:if test="${empty columns || fn:contains(columns,'expectedValueSquareMeter') }"><th rowspan="${rowspan }">型材（平米）</th></c:if>
            </tr>
            <c:if test="${colspan > 0 }">
            <tr>
                <c:if test="${empty columns || fn:contains(columns,'managementPlanAmount') }"><th>应收管理费</th></c:if>
                <c:if test="${empty columns || fn:contains(columns,'managementTotalAmount') }"><th>累计收管理费</th></c:if>
                <c:if test="${empty columns || fn:contains(columns,'field02') }"><th>其他收入</th></c:if>
                <c:if test="${empty columns || fn:contains(columns,'field03') }"><th>管理费及其他收入累计</th></c:if>
            </tr>
            </c:if>
            <tr class="hidden">
                <c:if test="${empty columns || fn:contains(columns,'field01') }"><th>年份</th></c:if>
                <c:if test="${empty columns || fn:contains(columns,'field04') }"><th>工程数</th></c:if>
                <c:if test="${empty columns || fn:contains(columns,'contractAmount') }"><th>累计合同金额</th></c:if>
                <c:if test="${empty columns || fn:contains(columns,'changeTotalAmount') }"><th>合同调增额</th></c:if>
                <c:if test="${empty columns || fn:contains(columns,'settlementAmount') }"><th>合同结算额</th></c:if>
                <c:if test="${empty columns || fn:contains(columns,'partyBillingAmount') }"><th>累计甲方开票</th></c:if>
                <c:if test="${empty columns || fn:contains(columns,'collectionsTotalAmount') }"><th>累计收款</th></c:if>
                <c:if test="${empty columns || fn:contains(columns,'customerBillingAmount') }"><th>累计客户开票</th></c:if>
                <c:if test="${empty columns || fn:contains(columns,'paymentAmount') }"><th>累计支付工程款</th></c:if>
                <c:if test="${empty columns || fn:contains(columns,'taxBearingTotalRealAmount') }"><th>累计已收税负率税金</th></c:if>
                <c:if test="${colspan > 0 }">
	                <c:if test="${empty columns || fn:contains(columns,'managementPlanAmount') }"><th>应收管理费</th></c:if>
	                <c:if test="${empty columns || fn:contains(columns,'managementTotalAmount') }"><th>累计收管理费</th></c:if>
	                <c:if test="${empty columns || fn:contains(columns,'field02') }"><th>其他收入</th></c:if>
	                <c:if test="${empty columns || fn:contains(columns,'field03') }"><th>管理费及其他收入累计</th></c:if>
                </c:if>
                <c:if test="${empty columns || fn:contains(columns,'arrearsAmount') }"><th>往来欠款</th></c:if>
                <c:if test="${empty columns || fn:contains(columns,'expectedValueTon') }"><th>型材（吨）</th></c:if>
                <c:if test="${empty columns || fn:contains(columns,'expectedValueSquareMeter') }"><th>型材（平米）</th></c:if>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${list}" var="projectSummary">
                <tr>
	                <c:if test="${empty columns || fn:contains(columns,'field01') }"><td class="nowrap" id="field01"><a target="_blank" href="<s:url value='/projectsummary/yeardetail?orgid=${orgId}&p1=${projectSummary.field01}' />" class="btn btn-link">${projectSummary.field01}</a></td></c:if>
	                <c:if test="${empty columns || fn:contains(columns,'field04') }"><td class="amount">${projectSummary.field04}</td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'contractAmount') }"><td class="amount"><fmt:formatNumber value="${projectSummary.contractAmount}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'changeTotalAmount') }"><td class="amount"><fmt:formatNumber value="${projectSummary.changeTotalAmount}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'settlementAmount') }"><td class="amount"><fmt:formatNumber value="${projectSummary.settlementAmount}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'partyBillingAmount') }"><td class="amount"><fmt:formatNumber value="${projectSummary.partyBillingAmount}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'collectionsTotalAmount') }"><td class="amount"><fmt:formatNumber value="${projectSummary.collectionsTotalAmount}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'customerBillingAmount') }"><td class="amount"><fmt:formatNumber value="${projectSummary.customerBillingAmount}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'paymentAmount') }"><td class="amount"><fmt:formatNumber value="${projectSummary.paymentAmount}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'taxBearingTotalRealAmount') }"><td class="amount"><fmt:formatNumber value="${projectSummary.taxBearingTotalRealAmount}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    <c:if test="${colspan > 0 }">
                    <c:if test="${empty columns || fn:contains(columns,'managementPlanAmount') }"><td class="amount"><fmt:formatNumber value="${projectSummary.managementPlanAmount}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'managementTotalAmount') }"><td class="amount"><fmt:formatNumber value="${projectSummary.managementTotalAmount}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'field02') }"><td class="amount"><fmt:formatNumber value="${projectSummary.field02}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'field03') }"><td class="amount"><fmt:formatNumber value="${projectSummary.field03}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    </c:if>
                    <c:if test="${empty columns || fn:contains(columns,'arrearsAmount') }"><td class="amount"><fmt:formatNumber value="${projectSummary.arrearsAmount}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'expectedValueTon') }"><td class="amount"><fmt:formatNumber value="${projectSummary.expectedValueTon}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                    <c:if test="${empty columns || fn:contains(columns,'expectedValueSquareMeter') }"><td class="amount"><fmt:formatNumber value="${projectSummary.expectedValueSquareMeter}"
                            pattern="###,###,###,###,##0.00" /></td></c:if>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
	<script type="text/template" charset="utf-8" id='settingTemplate'>
    	<form class="form-horizontal" role="form">
        	<div class="row">
        		<div class="col-sm-12">
        			<div class="row">
		                <div class="col-sm-6 checkbox">
		                    <input type="checkbox" class="icheckbox" id="selectAll"/>
		                    <label for="selectAll">全选</label>
		                    <p class="help-block" />
		            	</div>
		            </div>
		        	<div class="row">
		                <div class="col-sm-6 checkbox">
		                    <input type="checkbox" class="icheckbox check-item" id="field01" value="年份"/>
		                    <label for="field01">年份</label>
		            	</div>
		                <div class="col-sm-6 checkbox">
		                    <input type="checkbox" class="icheckbox check-item" id="field04" value="工程数" />
		                    <label for="field04">工程数</label>
		            	</div>
        			</div>
		        	<div class="row">
		                <div class="col-sm-6 checkbox">
		                    <input type="checkbox" class="icheckbox check-item" id="contractAmount" value="累计合同金额" />
		                    <label for="contractAmount">累计合同金额</label>
		            	</div>
		                <div class="col-sm-6 checkbox">
		                    <input type="checkbox" class="icheckbox check-item" id="changeTotalAmount" value="合同调增额" />
		                    <label for="changeTotalAmount">合同调增额</label>
		            	</div>
        			</div>
		        	<div class="row">
		                <div class="col-sm-6 checkbox">
		                    <input type="checkbox" class="icheckbox check-item" id="settlementAmount" value="合同结算额" />
		                    <label for="settlementAmount">合同结算额</label>
		            	</div>
		                <div class="col-sm-6 checkbox">
		                    <input type="checkbox" class="icheckbox check-item" id="partyBillingAmount" value="累计甲方开票" />
		                    <label for="partyBillingAmount">累计甲方开票</label>
		            	</div>
        			</div>
		        	<div class="row">
		                <div class="col-sm-6 checkbox">
		                    <input type="checkbox" class="icheckbox check-item" id="collectionsTotalAmount" value="累计收款" />
		                    <label for="collectionsTotalAmount">累计收款</label>
		            	</div>
		                <div class="col-sm-6 checkbox">
		                    <input type="checkbox" class="icheckbox check-item" id="customerBillingAmount" value="累计客户开票" />
		                    <label for="customerBillingAmount">累计客户开票</label>
		            	</div>
        			</div>
		        	<div class="row">
		                <div class="col-sm-6 checkbox">
		                    <input type="checkbox" class="icheckbox check-item" id="paymentAmount" value="累计支付工程款" />
		                    <label for="paymentAmount">累计支付工程款</label>
		            	</div>
		                <%--
		                <div class="col-sm-6 checkbox">
		                    <input type="checkbox" class="icheckbox check-item" id="taxRealAmount" value="累计已缴税金" />
		                    <label for="taxRealAmount">累计已缴税金</label>
		            	</div>
		            	--%>
		                <div class="col-sm-6 checkbox">
		                    <input type="checkbox" class="icheckbox check-item" id="taxBearingTotalRealAmount" value="累计已收税负率税金" />
		                    <label for="taxBearingTotalRealAmount">累计已收税负率税金</label>
		            	</div>
        			</div>
					<div class="panel panel-default" style="margin-top: 10px;margin-bottom: 0px;">
					  	<div class="panel-heading">管理费及其他收入情况</div>
					  	<div class="panel-body">
							<div class="row">
				                <div class="col-sm-6 checkbox">
				                    <input type="checkbox" class="icheckbox check-item" id="managementPlanAmount" value="应收管理费" />
				                    <label for="managementPlanAmount">应收管理费</label>
				            	</div>
				                <div class="col-sm-6 checkbox">
				                    <input type="checkbox" class="icheckbox check-item" id="managementTotalAmount" value="累计收管理费" />
				                    <label for="managementTotalAmount">累计收管理费</label>
				            	</div>
		        			</div>
				        	<div class="row">
				                <div class="col-sm-6 checkbox">
				                    <input type="checkbox" class="icheckbox check-item" id="field02" value="其他收入" />
				                    <label for="field02">其他收入</label>
				            	</div>
				                <div class="col-sm-6 checkbox">
				                    <input type="checkbox" class="icheckbox check-item" id="field03" value="管理费及其他收入累计" />
				                    <label for="field03">管理费及其他收入累计</label>
				            	</div>
		        			</div>
					  	</div>
					</div>
		        	<div class="row">
		                <div class="col-sm-6 checkbox">
		                    <input type="checkbox" class="icheckbox check-item" id="arrearsAmount" value="往来欠款" />
		                    <label for="arrearsAmount">往来欠款</label>
		            	</div>
		                <div class="col-sm-6 checkbox">
		                    <input type="checkbox" class="icheckbox check-item" id="expectedValueTon" value="型材（吨）" />
		                    <label for="expectedValueTon">型材（吨）</label>
		            	</div>
        			</div>
		        	<div class="row">
		                <div class="col-sm-6 checkbox">
		                    <input type="checkbox" class="icheckbox check-item" id="expectedValueSquareMeter" value="型材（平米）" />
		                    <label for="expectedValueSquareMeter">型材（平米）</label>
		            	</div>
        			</div>
        		</div>
            </div>
        </form>
    </script>
    <script type="text/javascript">
		$(function() {
			$("select").change(function() {
				var orgid = $("#orgSelect").val() || "${orgId}";
				///alert(orgid + "," + $("#monthsSelect").val());
				self.location = "<s:url value='/projectsummary/year' />" + "?orgid=" + orgid;
			});
			var columns = "${columns}";
			$("#btn-setting").click(function(){
				$("#myModal .modal-title").html("设置列");
				$("#myModalContent").html(templateContent("settingTemplate"));
				$("#myModalContent").find(".icheckbox").iCheck({
					checkboxClass : 'icheckbox_minimal',
					radioClass : 'iradio_minimal',
					increaseArea : '20%'
				});
				var ischeck = "check";
				if(columns){
					$("#myModalContent").find(".check-item").each(function(){
						if(columns.indexOf($(this).attr("id")) > -1){
							$(this).iCheck("check");
						}else{
							$(this).iCheck("uncheck");
							ischeck = "uncheck";
						}
					});
				}else{
					$("#myModalContent").find(".check-item").iCheck(ischeck);
				}
				$("#myModalContent").find("#selectAll").iCheck(ischeck);
				$("#myModalContent").find("#selectAll").on('ifChecked', function(){
					$("#myModalContent").find(".check-item").iCheck('check');
				}).on("ifUnchecked",function(){
					$("#myModalContent").find(".check-item").iCheck('uncheck');
				});
				$("#myModal .btn-danger").off("click").on("click",function() {
					var data = {},heads=[],columns=[];
					$("#myModalContent").find('.check-item:checked').each(function(){
						columns.push($(this).attr("id"));
						heads.push($(this).val());
					});
					data.columns = columns.join(",");
					data.heads = heads.join(",");
			    	$.post("<s:url value='/sysuser/setting/year'/>", {setting: JSON.stringify(data)},
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
				});
				$('#myModal').modal('show');
			});
		});
	</script>

    <%@ include file="bottom.jsp"%>