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
								<p class="form-control-static"><c:out value="${statusName}" /></p>
                            </div>
                        </div>
                    	<div class="row">
                            <label for="realName" class="col-sm-2 control-label">证书使用人员姓名</label>
                            <div class="col-sm-4 ">
								<p class="form-control-static"><c:out value="${informationCertificateAmount.realName}" /></p>
                            </div>

                            <label for="beginTime" class="col-sm-2 control-label">使用起止时间</label>
                            <div class="col-sm-4 ">
								<p class="form-control-static"><fmt:formatDate value="${informationCertificateAmount.beginTime}" pattern="yyyy-MM-dd" />至<fmt:formatDate value="${informationCertificateAmount.endTime}" pattern="yyyy-MM-dd" /></p>
                            </div>
                        </div>
                        <div class="row">
                            <label for="type" class="col-sm-2 control-label">证书类别</label>
                            <div class="col-sm-4">
                                <p class="form-control-static">
                                	<c:out value="${informationCertificateAmount.type}" />
                                	<c:if test="${informationCertificateAmount.lockFlag =='1' }">
										&emsp;
										<i class="glyphicon glyphicon-lock"></i>
									</c:if>
								</p>
                            </div>
                            <label for="planAmount" class="col-sm-2 control-label">应收证书费</label>
                            <div class="col-sm-4 ">
                                <p class="form-control-static"><fmt:formatNumber value="${informationCertificateAmount.planAmount}" pattern="0.00" /></p>
                            </div>
                        </div>
                        <div class="row">
                            <sf:label path="description" cssClass="col-sm-2 control-label">备注</sf:label>
                            <div class="col-sm-10">
                                <p class="form-control-static"><c:out value="${informationCertificateAmount.description}" /></p>
                            </div>
                        </div>
                        <div class="row">
                            <label for="realAmount" class="col-sm-2 control-label">本期收证书费</label>
                            <div class="col-sm-4 ">
                                <input type="text" class="form-control" id="realAmount" name="realAmount" placeholder="本期收证书费"
                                    value="<fmt:formatNumber value="${informationCertificateAmount.realAmount}" pattern="0.00" />" />
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
<script type="text/javascript">
	$(function() {
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
				realAmount : {}
			}
		});
	});
	
	
</script>
<%@ include file="bottom.jsp"%>
