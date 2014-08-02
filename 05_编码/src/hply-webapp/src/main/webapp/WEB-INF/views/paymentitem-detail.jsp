<%@ page isELIgnored="false"%><%@ 
taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ 
taglib
	uri="http://www.springframework.org/tags" prefix="s"%><%@ 
taglib
	uri="http://www.springframework.org/tags/form" prefix="sf"%><%@ 
taglib
	uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%><%@ 
page
	language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%><%@ include file="header.jsp"%><div
	class="container main">
	<div class="panel panel-default">
		<div class="panel-heading">
			<strong>${page_title}</strong>
		</div>
		<div class="panel-body">
			<div class="btn-toolbar" role="toolbar">
				<div class="btn-group">
					<a href="<s:url value="/paymentitem" />" class="btn btn-info"><span
						class="glyphicon glyphicon-share-alt"></span> 返 回 </a>
				</div>
				<div class="btn-group">
					<a
						href="<s:url value="/paymentitem/modify/{id}"><s:param name="id" value="${paymentItem.id }" /></s:url>"
						class="btn btn-info"><span class="glyphicon glyphicon-pencil"></span>
						修 改 </a>
				</div>
				<div class="btn-group">
					<a
						data-confirm-message="删除后不可恢复，您确认要删除【<c:out value="${paymentItem.id}" />】么？"
						href="<s:url value="/paymentitem/delete/{id}"><s:param name="id" value="${paymentItem.id }" /></s:url>"
						class="btn btn-info delete"><span
						class="glyphicon glyphicon-trash"></span> 删 除 </a>
				</div>
			</div>

			<sf:form modelAttribute="paymentItem" cssClass="form-horizontal"
				role="form">
				<div class="form-group">
					<sf:label path="itemName" cssClass="col-sm-2 control-label">付款科目名称</sf:label>
					<div class="col-sm-10">
						<p class="form-control-static">
							<c:out value="${paymentItem.itemName}" />
						</p>
					</div>
				</div>

				<div class="form-group">
					<sf:label path="reimbursementCap" cssClass="col-sm-2 control-label">报销比例上限</sf:label>
					<div class="col-sm-10">
						<p class="form-control-static">
							<fmt:formatNumber pattern="#,##0.00"
								value="${paymentItem.reimbursementCap}" />
						</p>
					</div>
				</div>

				<div class="form-group">
					<sf:label path="createTime" cssClass="col-sm-2 control-label">创建时间</sf:label>
					<div class="col-sm-10">
						<p class="form-control-static">
							<fmt:formatDate value="${paymentItem.createTime}"
								pattern="yyyy-MM-dd HH:mm:ss" />
						</p>
					</div>
				</div>

				<div class="form-group">
					<sf:label path="createUser" cssClass="col-sm-2 control-label">创建用户</sf:label>
					<div class="col-sm-10">
						<p class="form-control-static">
							<c:out value="${paymentItem.createUser}" />
						</p>
					</div>
				</div>

				<div class="form-group">
					<sf:label path="updateTime" cssClass="col-sm-2 control-label">修改时间</sf:label>
					<div class="col-sm-10">
						<p class="form-control-static">
							<fmt:formatDate value="${paymentItem.updateTime}"
								pattern="yyyy-MM-dd HH:mm:ss" />
						</p>
					</div>
				</div>

				<div class="form-group">
					<sf:label path="updateUser" cssClass="col-sm-2 control-label">修改用户</sf:label>
					<div class="col-sm-10">
						<p class="form-control-static">
							<c:out value="${paymentItem.updateUser}" />
						</p>
					</div>
				</div>

				<div class="form-group">
					<sf:label path="description" cssClass="col-sm-2 control-label">备注</sf:label>
					<div class="col-sm-10">
						<p class="form-control-static">
							<c:out value="${paymentItem.description}" />
						</p>
					</div>
				</div>
			</sf:form>
		</div>
	</div>
</div>
<%@ include file="bottom.jsp"%>
