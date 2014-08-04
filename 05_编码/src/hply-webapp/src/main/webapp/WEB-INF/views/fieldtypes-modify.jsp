﻿<%@ page isELIgnored="false"%><%@ taglib
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
			<sf:form modelAttribute="fieldTypes" cssClass="form-horizontal"
				role="form">
				<div class="form-group">
					<sf:label path="fieldT01" cssClass="col-sm-2 control-label"></sf:label>
					<div class="col-sm-4">
						<sf:input cssClass="form-control" path="fieldT01"
							placeholder="请输入文字..." />
						<sf:errors path="fieldT01" cssClass="error" />
					</div>
					<div class="col-sm-4"></div>
				</div>

				<div class="form-group">
					<sf:label path="fieldT02" cssClass="col-sm-2 control-label"></sf:label>
					<div class="col-sm-4">
						<sf:input cssClass="form-control" path="fieldT02"
							placeholder="请输入数字，可以带小数..." />
						<sf:errors path="fieldT02" cssClass="error" />
					</div>
					<div class="col-sm-4"></div>
				</div>

				<div class="form-group">
					<sf:label path="fieldT03" cssClass="col-sm-2 control-label"></sf:label>
					<div class="col-sm-4">
						<sf:input cssClass="form-control" path="fieldT03"
							placeholder="请输入文字..." />
						<sf:errors path="fieldT03" cssClass="error" />
					</div>
					<div class="col-sm-4"></div>
				</div>

				<div class="form-group">
					<sf:label path="fieldT04" cssClass="col-sm-2 control-label"></sf:label>
					<div class="col-sm-4">
						<sf:input cssClass="form-control" path="fieldT04"
							placeholder="请输入文字..." />
						<sf:errors path="fieldT04" cssClass="error" />
					</div>
					<div class="col-sm-4"></div>
				</div>

				<div class="form-group">
					<sf:label path="fieldT05" cssClass="col-sm-2 control-label"></sf:label>
					<div class="col-sm-4">
						<sf:input cssClass="form-control" path="fieldT05"
							placeholder="请输入文字..." />
						<sf:errors path="fieldT05" cssClass="error" />
					</div>
					<div class="col-sm-4"></div>
				</div>

				<div class="form-group">
					<sf:label path="fieldT06" cssClass="col-sm-2 control-label"></sf:label>
					<div class="col-sm-4">
						<div class="input-group date">
							<sf:input cssClass="form-control" path="fieldT06"
								data-date-format="yyyy-mm-dd" />
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-calendar"></i></span>
						</div>
						<sf:errors path="fieldT06" cssClass="error" />
					</div>
					<div class="col-sm-4"></div>
				</div>

				<div class="form-group">
					<sf:label path="fieldT07" cssClass="col-sm-2 control-label"></sf:label>
					<div class="col-sm-4">
						<sf:input cssClass="form-control" path="fieldT07"
							placeholder="请输入文字..." />
						<sf:errors path="fieldT07" cssClass="error" />
					</div>
					<div class="col-sm-4"></div>
				</div>

				<div class="form-group">
					<sf:label path="fieldT08" cssClass="col-sm-2 control-label"></sf:label>
					<div class="col-sm-4">
						<sf:input cssClass="form-control" path="fieldT08"
							placeholder="请输入文字..." />
						<sf:errors path="fieldT08" cssClass="error" />
					</div>
					<div class="col-sm-4"></div>
				</div>

				<div class="form-group">
					<sf:label path="fieldT09" cssClass="col-sm-2 control-label"></sf:label>
					<div class="col-sm-4">
						<sf:input cssClass="form-control" path="fieldT09"
							placeholder="请输入文字..." />
						<sf:errors path="fieldT09" cssClass="error" />
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
						<a href='<s:url value="/fieldtypes" />' class="btn btn-default"><span
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
				fieldT01 : {},
				fieldT02 : {},
				fieldT03 : {},
				fieldT04 : {},
				fieldT05 : {},
				fieldT06 : {},
				fieldT07 : {},
				fieldT08 : {},
				fieldT09 : {},
				status : {},
			}
		});
	});
</script>
<%@ include file="bottom.jsp"%>
