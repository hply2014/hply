<%@ page isELIgnored="false"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib
	uri="http://www.springframework.org/tags" prefix="s"%><%@ taglib
	uri="http://www.springframework.org/tags/form" prefix="sf"%><%@ page
	language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%><%@ include file="header.jsp"%>
<div class="container main">
	<div class="panel panel-default">
		<div class="panel-heading">
			<strong>${page_title}</strong>
		</div>
		<div class="panel-body">
			<sf:form modelAttribute="collections" cssClass="form-horizontal"
				role="form">
				<div class="form-group">
					<sf:label path="projectId" cssClass="col-sm-2 control-label">项目ID</sf:label>
					<div class="col-sm-4">
						<sf:input cssClass="form-control" path="projectId"
							placeholder="请输入文字..." />
						<sf:errors path="projectId" cssClass="error" />
					</div>
					<div class="col-sm-4"></div>
				</div>

				<div class="form-group">
					<sf:label path="ticketCode" cssClass="col-sm-2 control-label">凭证号</sf:label>
					<div class="col-sm-4">
						<sf:input cssClass="form-control" path="ticketCode"
							placeholder="请输入文字..." />
						<sf:errors path="ticketCode" cssClass="error" />
					</div>
					<div class="col-sm-4"></div>
				</div>

				<div class="form-group">
					<sf:label path="sourceOf" cssClass="col-sm-2 control-label">款项来源</sf:label>
					<div class="col-sm-4">
						<sf:input cssClass="form-control" path="sourceOf"
							placeholder="请输入文字..." />
						<sf:errors path="sourceOf" cssClass="error" />
					</div>
					<div class="col-sm-4"></div>
				</div>

				<div class="form-group">
					<sf:label path="paymentType" cssClass="col-sm-2 control-label">收款方式</sf:label>
					<div class="col-sm-4">
						<sf:input cssClass="form-control" path="paymentType"
							placeholder="请输入文字..." />
						<sf:errors path="paymentType" cssClass="error" />
					</div>
					<div class="col-sm-4"></div>
				</div>

				<div class="form-group">
					<sf:label path="amount" cssClass="col-sm-2 control-label">收款金额</sf:label>
					<div class="col-sm-4">
						<sf:input cssClass="form-control" path="amount"
							placeholder="请输入数字，可以带小数..." />
						<sf:errors path="amount" cssClass="error" />
					</div>
					<div class="col-sm-4"></div>
				</div>

				<div class="form-group">
					<sf:label path="bankAccount" cssClass="col-sm-2 control-label">银行账号</sf:label>
					<div class="col-sm-4">
						<sf:input cssClass="form-control" path="bankAccount"
							placeholder="请输入文字..." />
						<sf:errors path="bankAccount" cssClass="error" />
					</div>
					<div class="col-sm-4"></div>
				</div>

				<div class="form-group">
					<sf:label path="bankName" cssClass="col-sm-2 control-label">开户行名称</sf:label>
					<div class="col-sm-4">
						<sf:input cssClass="form-control" path="bankName"
							placeholder="请输入文字..." />
						<sf:errors path="bankName" cssClass="error" />
					</div>
					<div class="col-sm-4"></div>
				</div>

				<div class="form-group">
					<sf:label path="trice" cssClass="col-sm-2 control-label">收款时间</sf:label>
					<div class="col-sm-4">
						<div class="input-group date">
							<sf:input cssClass="form-control" path="trice"
								data-date-format="yyyy-mm-dd" />
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-calendar"></i></span>
						</div>
						<sf:errors path="trice" cssClass="error" />
					</div>
					<div class="col-sm-4"></div>
				</div>

				<div class="form-group">
					<sf:label path="description" cssClass="col-sm-2 control-label">备注</sf:label>
					<div class="col-sm-4">
						<sf:input cssClass="form-control" path="description"
							placeholder="请输入文字..." />
						<sf:errors path="description" cssClass="error" />
					</div>
					<div class="col-sm-4"></div>
				</div>
				<div>
					<div class="col-sm-4 control-label">
						<button type="submit" class="btn btn-primary">
							<span class="glyphicon glyphicon-ok"></span> 提 交
						</button>
					</div>
					<div class="col-sm-1 control-label">
						<a href='<s:url value="/collections" />' class="btn btn-default"><span
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
							<h4>数据提交错误</h4>
							<p>
								<sf:errors path="*" />
							</p>
						</div>
					</div>
				</c:if>
			</sf:form>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(function() {
		$("form").validate({
			errorElement : "p",
			success : function(label) {
				label.text("　").addClass("success");
			},
			errorPlacement : function(error, element) {
				error.appendTo(element.parent("div").next("div"));
			},
			rules : {
				projectId : {},
				ticketCode : {},
				sourceOf : {},
				paymentType : {},
				amount : {},
				bankAccount : {},
				bankName : {},
				trice : {},
				description : {},
				status : {},
			}
		});
	});
</script>
<%@ include file="bottom.jsp"%>
