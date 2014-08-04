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
			<sf:form modelAttribute="sysParameter" cssClass="form-horizontal"
				role="form">
				<div class="form-group">
					<sf:label path="enName" cssClass="col-sm-2 control-label">参数英文名称</sf:label>
					<div class="col-sm-4">
						<sf:input cssClass="form-control" path="enName"
							placeholder="请输入文字..." />
						<sf:errors path="enName" cssClass="error" />
					</div>
					<div class="col-sm-4"></div>
				</div>

				<div class="form-group">
					<sf:label path="cnName" cssClass="col-sm-2 control-label">参数中文名称</sf:label>
					<div class="col-sm-4">
						<sf:input cssClass="form-control" path="cnName"
							placeholder="请输入文字..." />
						<sf:errors path="cnName" cssClass="error" />
					</div>
					<div class="col-sm-4"></div>
				</div>

				<div class="form-group">
					<sf:label path="paramValue" cssClass="col-sm-2 control-label">参数值</sf:label>
					<div class="col-sm-4">
						<sf:input cssClass="form-control" path="paramValue"
							placeholder="请输入文字..." />
						<sf:errors path="paramValue" cssClass="error" />
					</div>
					<div class="col-sm-4"></div>
				</div>

				<div class="form-group">
					<sf:label path="defaultValue" cssClass="col-sm-2 control-label">默认值</sf:label>
					<div class="col-sm-4">
						<sf:input cssClass="form-control" path="defaultValue"
							placeholder="请输入文字..." />
						<sf:errors path="defaultValue" cssClass="error" />
					</div>
					<div class="col-sm-4"></div>
				</div>

				<div class="form-group">
					<sf:label path="isInner" cssClass="col-sm-2 control-label">是否系统内置</sf:label>
					<div class="col-sm-4">
						<sf:input cssClass="form-control" path="isInner"
							placeholder="请输入文字..." />
						<sf:errors path="isInner" cssClass="error" />
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
						<a href='<s:url value="/sysparameter" />' class="btn btn-default"><span
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
				enName : {},
				cnName : {},
				paramValue : {},
				defaultValue : {},
				isInner : {},
				description : {},
			}
		});
	});
</script>
<%@ include file="bottom.jsp"%>
