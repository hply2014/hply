<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="container main">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <strong>${page_title}</strong>
        </div>
        <div class="panel-body">
			<div class="btn-toolbar" role="toolbar">
				<div class="btn-group">
					<a href="<s:url value="/information" />" class="btn btn-default"><span
						class="glyphicon glyphicon-share-alt"></span> 返 回 </a>
				</div>
			</div>
            <c:if test="${information.status == 3 || information.status == 4 }">
			<div class="panel-body">
				<div class="panel with-nav-tabs panel-default"
					id="informationModify">
					<div class="panel-heading">
						<ul class="nav nav-tabs">
							<li target="information" class="active"><a
								href="#tabInformation" data-toggle="tab">总览信息</a></li>
							<li target="certificateAmount"><a
								href="#tabCertificateAmount" data-toggle="tab">证书费</a></li>
						</ul>
					</div>
					<div class="panel-body">
						<div class="tab-content">
							<div
								class="tab-pane fade in active"
								id="tabInformation">
			</c:if>
					            <sf:form modelAttribute="information" cssClass="form-horizontal" role="form">
					                <div class="row">
					                    <div class="col-sm-8">
					                        <div class="row">
					                            <label for="organizationId" class="col-sm-2 control-label">所属部门</label>
					                            <div class="col-sm-4 required-field-block">
					                                <p class="form-control-static"><c:out value="${refInfo.organizationName}" /></p>
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
					                        	<c:if test="${information.status >= 2 }">
						                        	<label for="serviceAmount" class="col-sm-2 control-label">综合服务费</label>
						                            <div class="col-sm-4 required-field-block">
														<p class="form-control-static"><fmt:formatNumber pattern="#,##0.00" value="${information.serviceAmount}" /></p>
						                            </div>
					                            </c:if>
					                        	<label for="statusName" class="col-sm-2 control-label">状态</label>
					                            <div class="col-sm-4 required-field-block">
													<p class="form-control-static"><c:out value="${refInfo.statusName}" /></p>
					                            </div>
					                        </div>
					                        <c:if test="${(list)!= null && fn:length(list) > 0}">
						                        <div class="panel with-nav-tabs panel-default">
						                            <div class="panel-heading">
						                                <ul class="nav nav-tabs" id="informationChangeNav">
							                                <li class="active"><a href="#tab1warning" data-toggle="tab">补充修改</a></li>
						                                </ul>
						                            </div>
						                            <div class="panel-body">
						                                <div class="tab-content">
						                                    <div class="tab-pane fade in active" id="tab1warning">
						                                        <table class="table table-hover">
													                <thead>
													                    <tr>
													                        <th>#</th>
													                        <th>原值</th>
													                        <th>新值</th>
													                        <th>修改人</th>
													                        <th>修改时间</th>
													                    </tr>
													                </thead>
													                <tbody>
													                    <%int i = 0;%>
													                    <c:forEach items="${list}" var="informationChange">
													                        <tr>
													                            <td><%=++i%></td>
													                            <td><c:out value="${informationChange.originalData}" escapeXml="false"/></td>
													                            <td><c:out value="${informationChange.newData}" escapeXml="false"/></td>
													                            <td><c:out value="${informationChange.createUser}" /></td>
													                            <td><fmt:formatDate value="${informationChange.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
													                        </tr>
													                    </c:forEach>
													                </tbody>
													            </table>
						                                    </div>
						                                </div>
						                            </div>
						                        </div>
					                        </c:if>
					                        <div class="row">
					                            <label for="subscriber" class="col-sm-2 control-label">登记人</label>
					                            <div class="col-sm-4 ">
					                                <p class="form-control-static"><c:out value="${refInfo.subscriberName}" /></p>
					                            </div>
					
					                            <label for="trice" class="col-sm-2 control-label">登记时间</label>
					                            <div class="col-sm-4 ">
					                                <p class="form-control-static"><fmt:formatDate value="${information.trice}" pattern="yyyy-MM-dd" /></p>
					                            </div>
					                        </div>
					                        <div class="row">
					                            <sf:label path="description" cssClass="col-sm-2 control-label">备注</sf:label>
					                            <div class="col-sm-10">
					                                <p class="form-control-static"><c:out value="${information.description}" /></p>
					                            </div>
					                        </div>
					                    </div>
					                </div>
					            </sf:form>
        	<c:if test="${information.status == 3 || information.status == 4 }">
							</div>
							<div class="tab-pane fade"
								id="tabCertificateAmount">
								<div class="panel-body">
									<div class="btn-toolbar" role="toolbar">
										<div style="float: right;">
											<h4>
												总笔数：<span>${fn:length(lCertificateAmount) }</span>；应收合计：<span
													id="planAmountTotal">0.00</span>；已收合计：<span
													id="realAmountTotal">0.00</span><!-- ；尚欠合计：<span
													id="oweAmountTotal">0.00</span> -->
											</h4>
										</div>
									</div>
									<table class="table table-hover">
										<thead>
											<tr>
												<th>#</th>
												<th>证书使用人员姓名</th>
												<th>使用起止时间</th>
												<th>证书类别</th>
												<th class="amount">应收证书费</th>
												<th class="amount">实收证书费</th>
												<!-- <th class="amount">尚欠证书费</th> -->
												<th>登记人</th>
												<th>登记时间</th>
												<th>备注</th>
											</tr>
										</thead>
										<tbody>
											<c:set var="planAmountTotal" value="0" />
											<c:set var="realAmountTotal" value="0" />
											<%-- <c:set var="oweAmountTotal" value="0" /> --%>
											<c:forEach items="${lCertificateAmount}" var="certificate"
												varStatus="status">
												<c:set var="planAmountTotal"
													value="${planAmountTotal + certificate.planAmount}" />
												<c:set var="realAmountTotal"
													value="${realAmountTotal + certificate.realAmount}" />
												<%-- <c:set var="oweAmountTotal"
													value="${oweAmountTotal + certificate.oweAmount}" /> --%>
												<tr>
													<td>${status.count}</td>
													<td><c:out value="${certificate.realName}" /></td>
													<td><fmt:formatDate value="${certificate.beginTime}"
															pattern="yyyy-MM-dd" />至<fmt:formatDate
															value="${certificate.endTime}" pattern="yyyy-MM-dd" /></td>
													<td><c:out value="${certificate.type}" />
														<c:if test="${certificate.lockFlag =='1' }">
															&emsp;
															<i class="glyphicon glyphicon-lock"></i>
														</c:if></td>
													<td class="amount"><fmt:formatNumber
															value="${certificate.planAmount}" pattern="0.00" /></td>
													<td class="amount"><fmt:formatNumber
															value="${certificate.realAmount}" pattern="0.00" /></td>
													<%-- <td class="amount"><fmt:formatNumber
															value="${certificate.oweAmount}" pattern="0.00" /></td> --%>
													<td><c:out value="${certificate.createUser}" /></td>
													<td><fmt:formatDate value="${certificate.createTime}"
															pattern="yyyy-MM-dd" /></td>
													<td><c:out value="${certificate.description}" /></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--/panel-body-->
			</div>
			<!--/panel-body-->
			</c:if>
        </div>
        <!--/panel-body-->
    </div>
    <!--/panel-->
</div>
<!--/container main -->
<script type="text/javascript">
	$(function() {
		var planAmountTotal = "<fmt:formatNumber value='${planAmountTotal}' pattern='###,###,###,###,##0.00' />";
		var realAmountTotal = "<fmt:formatNumber value='${realAmountTotal}' pattern='###,###,###,###,##0.00' />";
		//var oweAmountTotal = "<fmt:formatNumber value='${oweAmountTotal}' pattern='###,###,###,###,##0.00' />";
		$("#planAmountTotal").text(planAmountTotal);
		$("#realAmountTotal").text(realAmountTotal);
		//$("#oweAmountTotal").text(oweAmountTotal);
	});
</script>
<%@ include file="bottom.jsp"%>
