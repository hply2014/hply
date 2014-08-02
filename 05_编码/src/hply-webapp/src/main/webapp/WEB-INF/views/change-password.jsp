<%@ page isELIgnored="false"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib
	uri="http://www.springframework.org/tags" prefix="s"%><%@ taglib
	uri="http://www.springframework.org/tags/form" prefix="sf"%><%@ page
	language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%><%@ include file="header.jsp"%><div
	class="container main">
	<div class="panel panel-default">
		<div class="panel-heading">
			<strong>${page_title}</strong>
		</div>
		<div class="panel-body">
			<sf:form cssClass="form-horizontal" role="form">
				<div class="form-group">
					<sf:label path="chopCode" cssClass="col-sm-2 control-label">编号</sf:label>
					<div class="col-sm-10">
						<sf:input cssClass="form-control" path="chopCode"
							placeholder="请输入文字..." />
						<sf:errors path="chopCode" cssClass="error" />
					</div>
				</div>

				<div class="form-group">
					<sf:label path="projectId" cssClass="col-sm-2 control-label">项目ID</sf:label>
					<div class="col-sm-10">
						<sf:input cssClass="form-control" path="projectId"
							placeholder="请输入文字..." />
						<sf:errors path="projectId" cssClass="error" />
					</div>
				</div>
				<div>
					<div class="col-sm-5 control-label">
						<button type="submit" class="btn btn-primary">
							<span class="glyphicon glyphicon-ok"></span> 提 交
						</button>
					</div>
					<div class="col-sm-1 control-label">
						<a href='<s:url value="/chop" />' class="btn btn-default"><span
							class="glyphicon glyphicon-share-alt"></span> 返 回 </a>
					</div>
				</div>
			</sf:form>
		</div>
	</div>
</div>
<%@ include file="bottom.jsp"%>