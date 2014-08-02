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
			<sf:form modelAttribute="paymentItem" cssClass="form-horizontal"
				role="form">
				<div class="form-group">
					<sf:label path="itemName" cssClass="col-sm-2 control-label">付款科目名称</sf:label>
					<div class="col-sm-10">
						<sf:input cssClass="form-control" path="itemName"
							placeholder="请输入文字..." />
						<sf:errors path="itemName" cssClass="error" />
					</div>
				</div>

				<div class="form-group">
					<sf:label path="reimbursementCap" cssClass="col-sm-2 control-label">报销比例上限</sf:label>
					<div class="col-sm-10">
						<sf:input cssClass="form-control" path="reimbursementCap"
							placeholder="请输入数字，可以带小数..." />
						<sf:errors path="reimbursementCap" cssClass="error" />
					</div>
				</div>

				<div class="form-group">
					<sf:label path="createTime" cssClass="col-sm-2 control-label">创建时间</sf:label>
					<div class="col-sm-10">
						<div class="input-group date">
							<sf:input cssClass="form-control" path="createTime"
								data-date-format="yyyy-mm-dd" />
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-calendar"></i></span>
						</div>
						<sf:errors path="createTime" cssClass="error" />
					</div>
				</div>

				<div class="form-group">
					<sf:label path="createUser" cssClass="col-sm-2 control-label">创建用户</sf:label>
					<div class="col-sm-10">
						<sf:input cssClass="form-control" path="createUser"
							placeholder="请输入文字..." />
						<sf:errors path="createUser" cssClass="error" />
					</div>
				</div>

				<div class="form-group">
					<sf:label path="updateTime" cssClass="col-sm-2 control-label">修改时间</sf:label>
					<div class="col-sm-10">
						<div class="input-group date">
							<sf:input cssClass="form-control" path="updateTime"
								data-date-format="yyyy-mm-dd" />
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-calendar"></i></span>
						</div>
						<sf:errors path="updateTime" cssClass="error" />
					</div>
				</div>

				<div class="form-group">
					<sf:label path="updateUser" cssClass="col-sm-2 control-label">修改用户</sf:label>
					<div class="col-sm-10">
						<sf:input cssClass="form-control" path="updateUser"
							placeholder="请输入文字..." />
						<sf:errors path="updateUser" cssClass="error" />
					</div>
				</div>

				<div class="form-group">
					<sf:label path="description" cssClass="col-sm-2 control-label">备注</sf:label>
					<div class="col-sm-10">
						<sf:input cssClass="form-control" path="description"
							placeholder="请输入文字..." />
						<sf:errors path="description" cssClass="error" />
					</div>
				</div>
				<div>
					<div class="col-sm-5 control-label">
						<button type="submit" class="btn btn-primary">
							<span class="glyphicon glyphicon-ok"></span> 提 交
						</button>
					</div>
					<div class="col-sm-1 control-label">
						<a href='<s:url value="/paymentitem" />' class="btn btn-default"><span
							class="glyphicon glyphicon-share-alt"></span> 返 回 </a>
					</div>
				</div>

			</sf:form>
		</div>
	</div>
</div>
<%@ include file="bottom.jsp"%>
