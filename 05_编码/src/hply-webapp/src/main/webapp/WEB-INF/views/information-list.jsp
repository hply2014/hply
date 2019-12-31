<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>
<style type="text/css">
#custom-search-form {
    margin: 0;
    margin-top: 5px;
    padding: 0;
}

#custom-search-form .search-query {
    padding-right: 3px;
    padding-right: 4px \9;
    padding-left: 3px;
    padding-left: 4px \9;
    /* IE7-8 doesn't have border-radius, so don't indent the padding */
    margin-bottom: 0;
    -webkit-border-radius: 3px;
    -moz-border-radius: 3px;
    border-radius: 3px;
    -webkit-transition: width 0.2s ease-in-out;
    -moz-transition: width 0.2s ease-in-out;
    -o-transition: width 0.2s ease-in-out;
    transition: width 0.2s ease-in-out;
}

#custom-search-form button {
    border: 0;
    background: none;
    /** belows styles are working good */
    padding: 2px 5px;
    margin-top: 2px;
    position: relative;
    left: -28px;
    /* IE7-8 doesn't have border-radius, so don't indent the padding */
    margin-bottom: 0;
    -webkit-border-radius: 3px;
    -moz-border-radius: 3px;
    border-radius: 3px;
}

.search-query:focus+button {
    z-index: 3;
}

.search-query:focus {
    width: 260px;
}
.bootstrap-select{
	width: 100px !important;
}
</style>

<div class="container main">
    <c:if test="${not empty message}">
        <div class="alert alert-success alert-dismissible col-md-offset-4 affix" role="alert">
            <button type="button" class="close" data-dismiss="alert">
                <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
            </button>
            <strong><a href="<s:url value="/information/detail/${information.id }" />"> ${information.id }</a></strong>
            ，${message}
        </div>
    </c:if>
    <c:if test="${not empty delMessage}">
        <div class="alert alert-warning alert-dismissible col-md-offset-4 affix" role="alert">
            <button type="button" class="close" data-dismiss="alert">
                <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
            </button>
            <strong>${information.id }</strong> ，${delMessage}
        </div>
    </c:if>
    <div class="panel panel-primary">
        <div class="panel-heading">
            <strong>信息登记</strong>（ 共
            <c:out value="${rowCount}" />
            行
            <c:if test="${pageCount > 1 }">，第${pageIndex+1 }页 &nbsp;/&nbsp;共${pageCount }页</c:if>
            ）
        </div>
        <div class="panel-body">
        	<div class="row">
        		<div class="col-sm-2 col-md-5">
		            <div class="btn-toolbar" role="toolbar">
		                <shiro:hasPermission name="`information_create`">
		                    <div class="btn-group">
		                        <a href="<c:url value="/information/create" />" class="btn btn-info"><span
		                            class="glyphicon glyphicon-plus"></span> 新 建 </a>
		                    </div>
		                </shiro:hasPermission>
		                <shiro:hasPermission name="`information_certificate`">
		                    <div class="btn-group">
		                        <a href="<c:url value="/information/certificate" />" class="btn btn-info"><span
		                            class="glyphicon glyphicon-cog"></span> 设置证书类别 </a>
		                    </div>
		                </shiro:hasPermission>
		                <a target="_blank" href="<s:url value='/information/full' />" class="btn btn-link"><span
                			class="glyphicon glyphicon-share-alt"></span>【汇总报表】</a>
		            </div>
	            </div>
        		<div class="col-sm-10 col-md-7 text-right">
					<form class="form-inline">
						<div class="form-group">
						    <label for="organizationId">所属部门</label>
						    <select class="form-control selectpicker" id="organizationId" name="organizationId" style="width: 100px;">
		                        <option value="">全部</option>
						        <c:forEach items="${orglist}" var="org">
						        	<option value="${org.id}">${org.organizationName}</option>
						        </c:forEach>
	                        </select>
						</div>
						<div class="form-group">
						    <label for="projectName">工程检索</label>
						    <input type="text" class="form-control" id="projectName" value="${projectName }" placeholder="工程检索" style="width: 150px;">
						</div>
						<div class="form-group">
						    <label for="trice">登记时间</label>
						    <div class="input-daterange input-group" id="trice">
							    <input type="text" class="form-control" id="triceBeginTime" value="${triceBeginTime }" style="width: 100px;">
							    <span class="input-group-addon">至</span>
							    <input type="text" class="form-control" id="triceEndTime" value="${triceEndTime }" style="width: 100px;">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
							</div>
						</div>
						<div class="form-group">
						    <label for="payFlag">确认缴费</label>
                            <select class="form-control selectpicker" id="payFlag" name="payFlag" style="width: 100px;">
		                        <option value="">全部</option>
		                        <option value="0">未缴费</option>
		                        <option value="1">已缴费</option>
	                        </select>
						</div>
						<div class="form-group">
						    <label for="sealFlag">确认盖章</label>
                            <select class="form-control selectpicker" id="sealFlag" name="sealFlag" style="width: 100px;">
		                        <option value="">全部</option>
		                        <option value="0">未盖章</option>
		                        <option value="1">已盖章</option>
	                        </select>
						</div>
						<button type="button" class="btn btn-warning" id="btn-search-information">
	                        <span class="glyphicon glyphicon-search"></span>搜索
	                    </button>
					</form>
	            </div>
            </div>

            <table class="table table-hover">
                <thead>
                    <tr>
                        <th></th>
                        <th>#</th>
                        <th>所属部门</th>
                        <th>工程名称</th>
                        <th>工程地点</th>
                        <th>建设单位</th>
                        <th>总包方</th>
                        <th>加盟客户姓名</th>
                        <th>状态</th>
                        <th>登记人</th>
                        <th>最后修改</th>
                        <th>备注</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    	int i = Integer.parseInt(request.getAttribute("currentPageStarted").toString());
                    %>
                    <c:forEach items="${list}" var="information">
                        <tr>
                            <td><span class="glyphicon <c:out value="${information.status == 4 ? 'glyphicon-file' : ''}" />"></span></td>
                            <td><%=++i%></td>
                            <td><c:out value="${information.organizationId}" /></td>
                            <td>
                            	<c:choose>
                            		<c:when test="${currentUser.organizationId == information.field01 || currentUser.organizationId == '0ed4d3a1-0c3a-11e4-9300-001c42328937'}">
                            			<a href="<s:url value="/information/detail/{id}"><s:param name="id" value="${information.id }" /></s:url>"><c:out value="${information.projectName}" /></a>
								    </c:when>
                            		<c:otherwise>
                            			<c:out value="${information.projectName}" />
    								</c:otherwise>
								</c:choose>
                            </td>
                            <td><c:out value="${information.address}" /></td>
                            <td><c:out value="${information.constructionCompany}" /></td>
                            <td><c:out value="${information.generalContractor}" /></td>
                            <td>
                            	<c:if test="${currentUser.organizationId == information.field01 || currentUser.organizationId == '0ed4d3a1-0c3a-11e4-9300-001c42328937'}">
                            		<c:out value="${information.joinRealName}" />
								</c:if>
                            </td>
                            <td>
                            	<c:choose>
                            		<c:when test="${information.payFlag == 1 }">
										<span class="label label-success" data-toggle="tooltip" data-placement="top" title="已确认缴费"><i class="glyphicon glyphicon-yen"></i></span>&emsp;
								    </c:when>
								    <c:otherwise>
										<span class="label label-danger" data-toggle="tooltip" data-placement="top" title="未确认缴费"><i class="glyphicon glyphicon-yen"></i></span>&emsp;
								    </c:otherwise>
								</c:choose>
                            	<c:choose>
                            		<c:when test="${information.sealFlag == 1 }">
										<span class="label label-success" data-toggle="tooltip" data-placement="top" title="已确认盖章"><i class="glyphicon glyphicon-pawn"></i></span>
								    </c:when>
								    <c:otherwise>
										<span class="label label-danger" data-toggle="tooltip" data-placement="top" title="未确认盖章"><i class="glyphicon glyphicon-pawn"></i></span>
								    </c:otherwise>
								</c:choose>
							</td>
                            <td><c:out value="${information.subscriber}" /><br /><fmt:formatDate value="${information.trice}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                            <td><c:out value="${information.updateUser}" /><br /><fmt:formatDate value="${information.updateTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                            <td><c:out value="${information.description}" /></td>
                            <td>
                            	<c:if test="${currentUser.organizationId == information.field01 || currentUser.organizationId == '0ed4d3a1-0c3a-11e4-9300-001c42328937'}">
                            		<c:if test="${information.status != 4 }">
		                            	<c:choose>
		                            		<c:when test="${information.status == -1 }">
			                                    <shiro:hasPermission name="`information_agree`">
			                                        <a class="agree" data-confirm-message="信息登记数据：<c:out value="${information.id}" />，同意后数据方可正常操作，是否确认？"
			                                        	href="<s:url value="/information/agree/{id}"><s:param name="id" value="${information.id }" /></s:url>">同意</a>
				                                    <a class="delete" data-confirm-message="信息登记数据：<c:out value="${information.id}" />，将被永久删除，操作不可撤销，是否确认？"
				                                        href="<s:url value="/information/delete/{id}"><s:param name="id" value="${information.id }" /></s:url>">删除</a>
			                                    </shiro:hasPermission>
										    </c:when>
		                            		<c:when test="${information.status == 1 }">
		                            			<c:if test="${currentUser.id == information.field02 }">
			                                    <shiro:hasPermission name="`information_manage`">
			                                        <a href="<s:url value="/information/modify/{id}"><s:param name="id" value="${information.id }" /></s:url>">补充修改</a>
			                                    </shiro:hasPermission>
			                                    </c:if>
			                                    <shiro:hasPermission name="`information_pay`">
			                                        <a class="pay" data-confirm-message="信息登记数据：<c:out value="${information.id}" />，确认缴费后数据将不可补充修改，是否确认？"
			                                        	href="<s:url value="/information/pay/{id}"><s:param name="id" value="${information.id }" /></s:url>">确认缴费</a>
			                                    </shiro:hasPermission>
										    </c:when>
		                            		<c:when test="${information.status == 2}">
			                                    <shiro:hasPermission name="`information_seal`">
			                                        <a class="seal" data-confirm-message="信息登记数据：<c:out value="${information.id}" />，确认盖章后可以补录数据，是否确认？"
			                                        	href="<s:url value="/information/seal/{id}"><s:param name="id" value="${information.id }" /></s:url>">确认盖章</a>
			                                    </shiro:hasPermission>
										    </c:when>
		                            		<c:when test="${information.status == 3 }">
			                                    <shiro:hasPermission name="`information_manage`">
			                                        <a href="<s:url value="/information/modify/{id}"><s:param name="id" value="${information.id }" /><s:param name="target" value="certificateAmount" /></s:url>">补录</a>
			                                    </shiro:hasPermission>
			                                    <shiro:hasPermission name="`information_check`">
			                                        <a class="check" data-confirm-message="信息登记数据：<c:out value="${information.id}" />，审核后所有数据将不能被修改，是否确认？"
			                                        	href="<s:url value="/information/audit/{id}"><s:param name="id" value="${information.id }" /></s:url>">审核</a>
			                                    </shiro:hasPermission>
										    </c:when>
										</c:choose>
										<c:if test="${currentUser.id == information.field02 && information.status > -1}">
											<shiro:hasPermission name="`information_manage`">
			                                    <a class="delete" data-confirm-message="信息登记数据：<c:out value="${information.id}" />，将被永久删除，操作不可撤销，是否确认？"
			                                        href="<s:url value="/information/delete/{id}"><s:param name="id" value="${information.id }" /></s:url>">删除</a>
			                                </shiro:hasPermission>
		                                </c:if>
	                                </c:if>
	                                <c:if test="${information.status == 4 }">
	                                    <shiro:hasPermission name="`information_manage`">
	                                        <a href="<s:url value="/information/modify/{id}"><s:param name="id" value="${information.id }" /><s:param name="target" value="certificateAmount" /></s:url>">补录</a>
	                                    </shiro:hasPermission>
	                                </c:if>
								</c:if>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <c:if test="${pageCount > 1 }">
                <div class="row">
                    <div class="col-sm-2 pager">
                        <span>共<c:out value="${rowCount}" /> 行，第${pageIndex+1 }页 &nbsp;/&nbsp;共${pageCount }页
                        </span>
                    </div>
                    <div class="col-sm-8">
                        <ul class="pager">
                            <li class="${pageIndex <= 0 ? 'disabled' :'' }"><a
                                href="<s:url value='information'><s:param name='organizationId' value='${organizationId}'/><s:param name='projectName' value='${projectName}'/><s:param name='triceBeginTime' value='${triceBeginTime}'/><s:param name='triceEndTime' value='${triceEndTime}'/><s:param name='joinRealName' value='${joinRealName}'/><s:param name='payFlag' value='${payFlag}'/><s:param name='sealFlag' value='${sealFlag}'/><s:param name='p' value='${pageIndex - 1}'/></s:url>">上一页</a></li>
                            <li class="${pageIndex + 1 >= pageCount ? 'disabled' :'' }"><a
                                href="<s:url value='information'><s:param name='organizationId' value='${organizationId}'/><s:param name='projectName' value='${projectName}'/><s:param name='triceBeginTime' value='${triceBeginTime}'/><s:param name='triceEndTime' value='${triceEndTime}'/><s:param name='joinRealName' value='${joinRealName}'/><s:param name='payFlag' value='${payFlag}'/><s:param name='sealFlag' value='${sealFlag}'/><s:param name='p' value='${pageIndex + 1}'/></s:url>">下一页</a></li>
                        </ul>
                    </div>
                    <div class="col-sm-2">&nbsp;</div>
                </div>
            </c:if>
        </div>
    </div>
</div>
<script type="text/template" charset="utf-8" id='serviceAmountTemplate'>
<form id="information" class="form-horizontal" role="form" >
	<div class="row">
		<label for="serviceAmount" class="col-sm-2 control-label">综合服务费</label>
		<div class="col-sm-10">
			<input id="serviceAmount" name="serviceAmount" class="form-control" placeholder="综合服务费" type="number" value="0">
			<p class="help-block"></p>
		</div>
	</div>
</form>
</script>
<script type="text/javascript">
$(function(){
	$('.input-daterange').datepicker({
		language : "zh-CN",
		autoclose : true,
		todayHighlight : true
	});
	$("#organizationId").val("${organizationId}");
	$("#payFlag").val("${payFlag}");
	$("#sealFlag").val("${sealFlag}");
    $("#btn-search-information").click(function(){
        self.location = "<s:url value='/information' />?organizationId=" + $("#organizationId").val()+"&projectName=" + $("#projectName").val()+"&triceBeginTime=" + $("#triceBeginTime").val()+"&triceEndTime=" + $("#triceEndTime").val()+"&payFlag=" + $("#payFlag").val()+"&sealFlag=" + $("#sealFlag").val();
    });

	$("body").delegate(".pay","click",function() {
		debugger
		$("#myModal .modal-title").html("录入综合服务费");
		$("#myModalContent").html(templateContent("serviceAmountTemplate"));
		$("#information").validate({
			errorElement : "i",
			success : function(label, element) {
				$(element).parent().addClass("valid");
				$(element).next().html('');
			},
			errorPlacement : function(error, element) {
				element.parent().addClass("invalid");
				element.next().html('<b class="glyphicon glyphicon-remove text-danger"></b><i>' + error.html() + "</i>");
			},
			rules : {
				serviceAmount : {required : true}
			}
		});
		$("#myModal").data("data-confirm-message", $(this).attr("data-confirm-message"));
		$('#myModal').data("href", $(this).attr("href"));
		$("#myModal .btn-danger").off("click").on("click",function() {
			if($("#information").valid()){
				var serviceAmount = $("#serviceAmount").val();
				$("#myModal .modal-title").html("操作提示");
				$("#myModalContent").html($("#myModal").data("data-confirm-message"));
				$("#myModal").removeData("data-confirm-message");
				$("#myModal .btn-danger").off("click").on("click",function() {
					var href = $("#myModal").data("href");
					if(href != null){
						self.location.replace(href+"?serviceAmount="+serviceAmount);
					}
					$('#myModal').modal("hide");
				});
			}
		});
		$('#myModal').modal("show");
		return false;
	});
});
</script>
<%@ include file="bottom.jsp"%>
