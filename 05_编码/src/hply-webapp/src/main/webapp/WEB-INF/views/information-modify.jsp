<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="container main">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<strong>${page_title}</strong>
		</div>
		<div class="panel-body">
			<c:if test="${information.status == 3 || information.status == 4 }">
			<div class="btn-toolbar" role="toolbar">
				<div class="btn-group">
					<a href="<s:url value="/information" />" class="btn btn-default"><span
						class="glyphicon glyphicon-share-alt"></span> 返 回 </a>
				</div>
			</div>
			<div class="panel-body">
				<div class="panel with-nav-tabs panel-default"
					id="informationModify">
					<div class="panel-heading">
						<ul class="nav nav-tabs">
							<li target="information"
								${target=='information'?'class="active"':'' }><a
								href="#tabInformation" data-toggle="tab">总览信息</a></li>
							<li target="certificateAmount"
								${target=='certificateAmount'?'class="active"':'' }><a
								href="#tabCertificateAmount" data-toggle="tab">证书费</a></li>
						</ul>
					</div>
					<div class="panel-body">
						<div class="tab-content">
							<div
								class="tab-pane fade${target=='information'?' in active':'' }"
								id="tabInformation">
			</c:if>
								<sf:form modelAttribute="information" cssClass="form-horizontal"
									role="form">
									<input type="hidden" id="status" name="status" value="${information.status}" />
									<input type="hidden" id="field01" name="field01" />
									<div class="row">
										<div class="col-sm-8">
											<div class="row">
												<label for="organizationId" class="col-sm-2 control-label">所属部门</label>
												<div class="col-sm-4 required-field-block">
													<c:choose>
														<c:when
															test="${information.status == 0 && currentUser.organizationId == '0ed4d3a1-0c3a-11e4-9300-001c42328937'}">
															<b class="required-icon">*</b>
															<sf:select cssClass="form-control selectpicker"
																path="organizationId" items="${orglist }" itemValue="id"
																itemLabel="organizationName" />
															<p class="help-block" />
														</c:when>
														<c:otherwise>
															<p class="form-control-static">
																<c:out value="${refInfo.organizationName}" />
																<input type="hidden" id="organizationId"
																	name="organizationId"
																	value="${information.organizationId}" />
															</p>
														</c:otherwise>
													</c:choose>
												</div>

												<label for="projectName" class="col-sm-2 control-label">工程名称</label>
												<div class="col-sm-4 required-field-block">
													<c:choose>
														<c:when test="${information.status < 2 }">
															<b class="required-icon">*</b>
															<sf:input cssClass="form-control" path="projectName"
																placeholder="工程名称" />
															<p class="help-block" />
														</c:when>
														<c:otherwise>
															<p class="form-control-static">
																<c:out value="${information.projectName}" />
															</p>
														</c:otherwise>
													</c:choose>
												</div>
											</div>
											<div class="row">
												<label for="address" class="col-sm-2 control-label">工程地点</label>
												<div class="col-sm-4 required-field-block">
													<c:choose>
														<c:when test="${information.status < 2 }">
															<b class="required-icon">*</b>
															<sf:input cssClass="form-control" path="address"
																placeholder="工程地点" />
															<p class="help-block" />
														</c:when>
														<c:otherwise>
															<p class="form-control-static">
																<c:out value="${information.address}" />
															</p>
														</c:otherwise>
													</c:choose>
												</div>

												<label for="constructionCompany"
													class="col-sm-2 control-label">建设单位</label>
												<div class="col-sm-4 required-field-block">
													<c:choose>
														<c:when test="${information.status < 2 }">
															<b class="required-icon">*</b>
															<sf:input cssClass="form-control"
																path="constructionCompany" placeholder="建设单位" />
															<p class="help-block" />
														</c:when>
														<c:otherwise>
															<p class="form-control-static">
																<c:out value="${information.constructionCompany}" />
															</p>
														</c:otherwise>
													</c:choose>
												</div>
											</div>
											<div class="row">
												<label for="generalContractor"
													class="col-sm-2 control-label">总包方</label>
												<div class="col-sm-4 required-field-block">
													<c:choose>
														<c:when test="${information.status < 2 }">
															<b class="required-icon">*</b>
															<sf:input cssClass="form-control"
																path="generalContractor" placeholder="总包方" />
															<p class="help-block" />
														</c:when>
														<c:otherwise>
															<p class="form-control-static">
																<c:out value="${information.generalContractor}" />
															</p>
														</c:otherwise>
													</c:choose>
												</div>
												<label for="joinRealName" class="col-sm-2 control-label">加盟客户姓名</label>
												<div class="col-sm-4 required-field-block">
													<c:choose>
														<c:when test="${information.status < 2 }">
															<b class="required-icon">*</b>
															<sf:input cssClass="form-control" path="joinRealName"
																placeholder="加盟客户姓名" />
															<p class="help-block" />
														</c:when>
														<c:otherwise>
															<p class="form-control-static">
																<c:out value="${information.joinRealName}" />
															</p>
														</c:otherwise>
													</c:choose>
												</div>
											</div>
											<div class="row">
												<label for="decorationType" class="col-sm-2 control-label">装饰类别</label>
												<div class="col-sm-4 required-field-block">
													<c:choose>
														<c:when test="${information.status < 2 }">
															<sf:input cssClass="form-control" path="decorationType"
																placeholder="装饰类别" />
															<p class="help-block" />
														</c:when>
														<c:otherwise>
															<p class="form-control-static">
																<c:out value="${information.decorationType}" />
															</p>
														</c:otherwise>
													</c:choose>
												</div>
												<label for="quantities" class="col-sm-2 control-label">工程量</label>
												<div class="col-sm-4 required-field-block">
													<c:choose>
														<c:when test="${information.status < 2 }">
															<sf:input cssClass="form-control" path="quantities"
																placeholder="工程量" />
															<p class="help-block" />
														</c:when>
														<c:otherwise>
															<p class="form-control-static">
																<c:out value="${information.quantities}" />
															</p>
														</c:otherwise>
													</c:choose>
												</div>
											</div>
											<c:if test="${information.status >= 2 }">
												<div class="row">
													<label for="serviceAmount" class="col-sm-2 control-label">综合服务费</label>
													<div class="col-sm-4 required-field-block">
														<p class="form-control-static">
															<fmt:formatNumber pattern="#,##0.00"
																value="${information.serviceAmount}" />
														</p>
													</div>
													<label for="statusName" class="col-sm-2 control-label">状态</label>
													<div class="col-sm-4 required-field-block">
														<p class="form-control-static">
															<c:out value="${refInfo.statusName}" />
														</p>
													</div>
												</div>
											</c:if>
											<c:if test="${(list)!= null && fn:length(list) > 0}">
												<div class="panel with-nav-tabs panel-default">
													<div class="panel-heading">
														<ul class="nav nav-tabs" id="informationChangeNav">
															<li class="active"><a
																href="#tabInformationChangeNav" data-toggle="tab">补充修改</a></li>
														</ul>
													</div>
													<div class="panel-body">
														<div class="tab-content">
															<div class="tab-pane fade in active"
																id="tabInformationChangeNav">
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
																		<%
																			int i = 0;
																		%>
																		<c:forEach items="${list}" var="informationChange">
																			<tr>
																				<td><%=++i%></td>
																				<td><c:out
																						value="${informationChange.originalData}"
																						escapeXml="false" /></td>
																				<td><c:out value="${informationChange.newData}"
																						escapeXml="false" /></td>
																				<td><c:out
																						value="${informationChange.createUser}" /></td>
																				<td><fmt:formatDate
																						value="${informationChange.createTime}"
																						pattern="yyyy-MM-dd HH:mm:ss" /></td>
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
													<p class="form-control-static">
														<c:out value="${refInfo.subscriberName}" />
													</p>
												</div>

												<label for="trice" class="col-sm-2 control-label">登记时间</label>
												<div class="col-sm-4 ">
													<p class="form-control-static">
														<fmt:formatDate value="${information.trice}"
															pattern="yyyy-MM-dd" />
													</p>
												</div>
											</div>
											<div class="row">
												<sf:label path="description"
													cssClass="col-sm-2 control-label">备注</sf:label>
												<div class="col-sm-10">
													<sf:textarea cssClass="form-control" rows="3"
														path="description" placeholder="备注，500字以内" />
													<p class="help-block" />
												</div>
											</div>
											
											<c:choose>
					                			<c:when test="${information.status == 0 }">
						                			<button type="submit" id="btn_submit"
														class="btn btn-info pull-right" style="display:none;">
														<span class="glyphicon glyphicon-ok"></span> 提 交
													</button>
													<button type="button" id="btn_validate"
														class="btn btn-info pull-right">
														<span class="glyphicon glyphicon-ok"></span> 提 交
													</button>
										    	</c:when>
						                        <c:otherwise>
						                			<button type="submit" id="btn_submit"
														class="btn btn-info pull-right">
														<span class="glyphicon glyphicon-ok"></span> 提 交
													</button>
						 						</c:otherwise>
											</c:choose>
					                        <a href='<s:url value="/information" />' onclick="return goback();" class="btn btn-link"><span
					                            class="glyphicon glyphicon-share-alt"></span> 返 回 </a>
										</div>
									</div>
									<c:if test="${not empty errors}">
										<div id="alert-error" class="col-sm-6 col-sm-offset-5">
											<div class="alert alert-danger alert-dismissible fade in"
												role="alert">
												<button type="button" class="close" data-dismiss="alert">
													<span aria-hidden="true">&times;</span><span
														class="sr-only">Close</span>
												</button>
												<h4>请求错误</h4>
												<p>
													<sf:errors path="*" />
												</p>
											</div>
										</div>
									</c:if>
								</sf:form>
			<c:if test="${information.status == 3 || information.status == 4 }">
							</div>
							<div
								class="tab-pane fade${target=='certificateAmount'?' in active':'' }"
								id="tabCertificateAmount">
								<div class="panel-body">
									<div class="btn-toolbar" role="toolbar">
										<div class="btn-group">
											<a
												href="<c:url value="/information/certificate/amount/create?informationId=${information.id}" />"
												class="btn btn-info"><span
												class="glyphicon glyphicon-plus"></span> 新 建 </a>
										</div>
										<div style="float: right;">
											<h4>
												总笔数：<span>${fn:length(lCertificateAmount) }</span>；应收合计：<span
													id="planAmountTotal">0.00</span>；本期收合计：<span
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
												<th class="amount">本期收证书费</th>
												<!-- <th class="amount">尚欠证书费</th> -->
												<th>登记人</th>
												<th>登记时间</th>
												<th>备注</th>
												<th></th>
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
													<td>
														<c:if test="${certificate.field01 == currentUser.id }">
															<a href="<s:url value="/information/certificate/amount/modify/{id}"><s:param name="id" value="${certificate.id }" /></s:url>">修改</a>
															<a class="delete"
																data-confirm-message="信息登记数据：<c:out value="${information.id}" />，将被永久删除，操作不可撤销，是否确认？"
																href="<s:url value="/information/certificate/amount/delete/{id}"><s:param name="id" value="${certificate.id }" /></s:url>">删除</a>
														</c:if>
														<shiro:hasPermission name="`information_certificate_amount_charge`">
					                                        <a href="<s:url value="/information/certificate/amount/charge/{id}"><s:param name="id" value="${certificate.id }" /></s:url>">收费</a>
					                                    </shiro:hasPermission>
													</td>
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
<script type="text/template" charset="utf-8"
	id='certificateTypeEditTemplate'>
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
<script type="text/template" charset="utf-8"
	id='sameTemplate'>
<form id="sameForm" class="form-horizontal" role="form">
	<div class="row">
    	<div class="col-sm-12">
			<p class="form-control-static">录入信息与已有信息相似度达到70%，信息如下</p>
    	</div>
    </div>
	<div class="row">
		<label for="orgName" class="col-sm-2 control-label">所属部门</label>
    	<div class="col-sm-10">
			<p class="form-control-static" id="orgName"></p>
    	</div>
    </div>
	<div class="row">
		<label for="projectName" class="col-sm-2 control-label">工程名称</label>
    	<div class="col-sm-10">
			<p class="form-control-static" id="projectName"></p>
    	</div>
    </div>
	<div class="row">
		<label for="subscriber" class="col-sm-2 control-label">登记人</label>
    	<div class="col-sm-10">
			<p class="form-control-static" id="subscriber"></p>
    	</div>
    </div>
	<div class="row">
		<label for="trice" class="col-sm-2 control-label">登记时间</label>
    	<div class="col-sm-10">
			<p class="form-control-static" id="trice"></p>
    	</div>
    </div>
</form>
</script>
<script type="text/javascript">
	$(function() {
		var planAmountTotal = "<fmt:formatNumber value='${planAmountTotal}' pattern='###,###,###,###,##0.00' />";
		var realAmountTotal = "<fmt:formatNumber value='${realAmountTotal}' pattern='###,###,###,###,##0.00' />";
		/* var oweAmountTotal = "<fmt:formatNumber value='${oweAmountTotal}' pattern='###,###,###,###,##0.00' />"; */
		$("#planAmountTotal").text(planAmountTotal);
		$("#realAmountTotal").text(realAmountTotal);
		/* $("#oweAmountTotal").text(oweAmountTotal); */


		if($("li[target]").length>0){
			$("#informationModify li").click(
				function() {
					debugger
					var url;
					var target = $(this).attr("target");
					if(target=="certificateAmount"){
						var selfurl = self.location.href;
						url = selfurl.split('?')[0] + "?target="
								+ target;
					}else{
						url = "/information";
					}
					$.post("<s:url value='/api/setlasturl'/>", {
						url : url
					});
			});
			$("li[target=${target}]").click();
		}

		$("form").validate(
				{
					errorElement : "i",
					success : function(label, element) {
						$(element).parent().addClass("valid");
						$(element).next().html('');
						//.next().html('<b class="glyphicon glyphicon-ok text-success"></b><i>正确</i>');
					},
					errorPlacement : function(error, element) {
						element.parent().addClass("invalid");
						element.next().html(
								'<b class="glyphicon glyphicon-remove text-danger"></b><i>'
										+ error.html() + "</i>");
					},
					submitHandler:function(form){
			            console("提交事件!");
			            form.submit();
			        },
					rules : {
						organizationId : {
							required : true
						},
						projectName : {
							required : true
						},
						address : {
							required : true
						},
						constructionCompany : {
							required : function() {
								if ($.trim($("#constructionCompany").val())
										|| $
												.trim($("#generalContractor")
														.val())) {
									return;
								}
								return true;
							}
						},
						generalContractor : {
							required : function() {
								if ($.trim($("#constructionCompany").val())
										|| $
												.trim($("#generalContractor")
														.val())) {
									return;
								}
								return true;
							}
						},
						joinRealName : {
							required : true
						},
						decorationType : {},
						quantities : {},
						description : {},
					}
				});
		if($("#btn_validate")){
			$("#btn_validate").click(function(){
				if($("form").valid()){
					$.get("<s:url value='/information/similarity'/>",
							{text: $.trim($("#projectName").val()+$("#address").val()+$("#constructionCompany").val()+$("#generalContractor").val()+$("#joinRealName").val())},
							function(result){
								console.log(result.ratio);
								if(result.ratio >= 70){
									$("#myModal .modal-title").html("操作提示");
									$("#myModalContent").html(templateContent("sameTemplate"));
									var $sameForm = $("#sameForm");
									$sameForm.find("#orgName").html(result.organization_name);
									$sameForm.find("#projectName").html(result.project_name);
									$sameForm.find("#subscriber").html(result.real_name);
									$sameForm.find("#trice").html(result.trice);
									var field01 = "录入信息与已有信息相似度达到70%，所属部门："+result.organization_name+"，工程名称："+result.project_name+"，登记人："+result.real_name+"，登记时间："+result.trice+"。";
									$("#field01").val(field01);
									$("#myModal .btn-danger").off("click").on("click",function() {
										$('#myModal').modal("hide");
										$("#status").val(-1);
										$("#btn_submit").click();
									});
									$('#myModal').modal("show");
								}else{
									$("#btn_submit").click();
								}
							}
					);
				}
			});
		}
	});
	function showCertificateTypeFormDialog(id) {
		$
				.get(
						"<s:url value='/sysparameter/get/'/>" + id + ".json",
						{},
						function(result) {
							$("#myModal .modal-title").html("证书类别参数修改");
							$("#myModalContent")
									.html(
											templateContent("certificateTypeEditTemplate"));
							$('#certificateTypeForm').find("#id")
									.val(result.id);
							$('#certificateTypeForm').find("#paramValue").val(
									result.paramValue);
							$("#myModal .btn-danger")
									.off("click")
									.on(
											"click",
											function() {
												var data = {
													id : $(
															'#certificateTypeForm')
															.find("#id").val(),
													paramValue : $(
															'#certificateTypeForm')
															.find("#paramValue")
															.val(),
												};
												if (data.paramValue) {
													$('#certificateTypeForm')
															.find(".help-block")
															.html(
																	"参数值以“/”分隔，前后不需要“/”。");
													$
															.post(
																	"<s:url value='/sysparameter/modify.json'/>",
																	data,
																	function(
																			result) {
																		//未提交成功，提示错误
																		if (result.message != "OK") {
																			alert(result.message);
																			return;
																		}
																		self.location
																				.reload();
																		return;
																	}, "json");
													$('#myModal').modal("hide");
												} else {
													$('#certificateTypeForm')
															.find(".help-block")
															.html(
																	'参数值以“/”分隔，前后不需要“/”。<br><b class="glyphicon glyphicon-remove text-danger"></b><i>必须填写</i>');
												}
											});
							$('#myModal').modal('show');
						}, "json");
	}
</script>
<%@ include file="bottom.jsp"%>
