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
			<sf:form modelAttribute="information" cssClass="form-horizontal"
				role="form">
				<div class="form-group">
					<sf:label path="organizationId" cssClass="col-sm-2 control-label">所在部门</sf:label>
					<div class="col-sm-4">
						<sf:select cssClass="form-control selectpicker"
							path="organizationId" items="${orglist }" itemValue="id"
							itemLabel="organizationName" />
						<sf:errors path="organizationId" cssClass="error" />
					</div>
					<div class="col-sm-4"></div>
				</div>

				<div class="form-group">
					<sf:label path="projectName" cssClass="col-sm-2 control-label">项目名称</sf:label>
					<div class="col-sm-4">
						<sf:input cssClass="form-control" path="projectName"
							placeholder="请输入文字..." />
						<sf:errors path="projectName" cssClass="error" />
					</div>
					<div class="col-sm-4"></div>
				</div>

				<div class="form-group">
					<sf:label path="address" cssClass="col-sm-2 control-label">地址</sf:label>
					<div class="col-sm-4">
						<sf:input cssClass="form-control" path="address"
							placeholder="请输入文字..." />
						<sf:errors path="address" cssClass="error" />
					</div>
					<div class="col-sm-4"></div>
				</div>

				<div class="form-group">
					<sf:label path="developer" cssClass="col-sm-2 control-label">开发商</sf:label>
					<div class="col-sm-4">
						<sf:input cssClass="form-control" path="developer"
							placeholder="请输入文字..." />
						<sf:errors path="developer" cssClass="error" />
					</div>
					<div class="col-sm-4"></div>
				</div>

				<div class="form-group">
					<sf:label path="epcCorporation" cssClass="col-sm-2 control-label">总包单位</sf:label>
					<div class="col-sm-4">
						<sf:input cssClass="form-control" path="epcCorporation"
							placeholder="请输入文字..." />
						<sf:errors path="epcCorporation" cssClass="error" />
					</div>
					<div class="col-sm-4"></div>
				</div>

				<div class="form-group">
					<sf:label path="variety" cssClass="col-sm-2 control-label">品种</sf:label>
					<div class="col-sm-4">
						<sf:input cssClass="form-control" path="variety"
							placeholder="请输入文字..." />
						<sf:errors path="variety" cssClass="error" />
					</div>
					<div class="col-sm-4"></div>
				</div>

				<div class="form-group">
					<sf:label path="totalArea" cssClass="col-sm-2 control-label">总面积</sf:label>
					<div class="col-sm-4">
						<sf:input cssClass="form-control" path="totalArea"
							placeholder="请输入文字..." />
						<sf:errors path="totalArea" cssClass="error" />
					</div>
					<div class="col-sm-4"></div>
				</div>

				<div class="form-group">
					<sf:label path="realName" cssClass="col-sm-2 control-label">姓名</sf:label>
					<div class="col-sm-4">
						<sf:input cssClass="form-control" path="realName"
							placeholder="请输入文字..." />
						<sf:errors path="realName" cssClass="error" />
					</div>
					<div class="col-sm-4"></div>
				</div>

				<div class="form-group">
					<sf:label path="identification" cssClass="col-sm-2 control-label">身份证号</sf:label>
					<div class="col-sm-4">
						<sf:input cssClass="form-control" path="identification"
							placeholder="请输入文字..." />
						<sf:errors path="identification" cssClass="error" />
					</div>
					<div class="col-sm-4"></div>
				</div>

				<div class="form-group">
					<sf:label path="contact" cssClass="col-sm-2 control-label">联系方式</sf:label>
					<div class="col-sm-4">
						<sf:input cssClass="form-control" path="contact"
							placeholder="请输入文字..." />
						<sf:errors path="contact" cssClass="error" />
					</div>
					<div class="col-sm-4"></div>
				</div>

				<div class="form-group">
					<sf:label path="subscriber" cssClass="col-sm-2 control-label">登记人</sf:label>
					<div class="col-sm-4">
						<sf:input cssClass="form-control" path="subscriber"
							placeholder="请输入文字..." />
						<sf:errors path="subscriber" cssClass="error" />
					</div>
					<div class="col-sm-4"></div>
				</div>

				<div class="form-group">
					<sf:label path="trice" cssClass="col-sm-2 control-label">登记时间</sf:label>
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
						<a href='<s:url value="/information" />' class="btn btn-default"><span
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
				organizationId : {},
				projectName : {},
				address : {},
				developer : {},
				epcCorporation : {},
				variety : {},
				totalArea : {},
				realName : {},
				identification : {},
				contact : {},
				subscriber : {},
				trice : {},
				description : {},
				status : {},
			}
		});
	});
</script>
<%@ include file="bottom.jsp"%>
