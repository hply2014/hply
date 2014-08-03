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
					<a href="<s:url value="/project" />" class="btn btn-info"><span
						class="glyphicon glyphicon-share-alt"></span> 返 回 </a>
				</div>
				<div class="btn-group">
					<a
						href="<s:url value="/project/modify/{id}"><s:param name="id" value="${project.id }" /></s:url>"
						class="btn btn-info"><span class="glyphicon glyphicon-pencil"></span>
						修 改 </a>
				</div>
				<div class="btn-group">
					<a
						data-confirm-message="删除后不可恢复，您确认要删除【<c:out value="${project.projectName}" />】么？"
						href="<s:url value="/project/delete/{id}"><s:param name="id" value="${project.id }" /></s:url>"
						class="btn btn-info delete"><span
						class="glyphicon glyphicon-trash"></span> 删 除 </a>
				</div>
			</div>

			<sf:form modelAttribute="project" cssClass="form-horizontal"
				role="form">
				<div class="form-group">
					<sf:label path="projectCode" cssClass="col-sm-2 control-label">项目编号</sf:label>
					<div class="col-sm-10">
						<p class="form-control-static">
							<c:out value="${project.projectCode}" />
						</p>
					</div>
				</div>

				<div class="form-group">
					<sf:label path="projectName" cssClass="col-sm-2 control-label">项目名称</sf:label>
					<div class="col-sm-10">
						<p class="form-control-static">
							<c:out value="${project.projectName}" />
						</p>
					</div>
				</div>

				<div class="form-group">
					<sf:label path="organizationId" cssClass="col-sm-2 control-label">所在部门</sf:label>
					<div class="col-sm-10">
						<p class="form-control-static">
							<c:out value="${project.organizationId}" />
						</p>
					</div>
				</div>

				<div class="form-group">
					<sf:label path="partyName" cssClass="col-sm-2 control-label">甲方名称</sf:label>
					<div class="col-sm-10">
						<p class="form-control-static">
							<c:out value="${project.partyName}" />
						</p>
					</div>
				</div>

				<div class="form-group">
					<sf:label path="partyAddress" cssClass="col-sm-2 control-label">甲方地址</sf:label>
					<div class="col-sm-10">
						<p class="form-control-static">
							<c:out value="${project.partyAddress}" />
						</p>
					</div>
				</div>

				<div class="form-group">
					<sf:label path="manager" cssClass="col-sm-2 control-label">项目经理</sf:label>
					<div class="col-sm-10">
						<p class="form-control-static">
							<c:out value="${project.manager}" />
						</p>
					</div>
				</div>

				<div class="form-group">
					<sf:label path="contractCode" cssClass="col-sm-2 control-label">合同号</sf:label>
					<div class="col-sm-10">
						<p class="form-control-static">
							<c:out value="${project.contractCode}" />
						</p>
					</div>
				</div>

				<div class="form-group">
					<sf:label path="corperation" cssClass="col-sm-2 control-label">合作单位</sf:label>
					<div class="col-sm-10">
						<p class="form-control-static">
							<c:out value="${project.corperation}" />
						</p>
					</div>
				</div>

				<div class="form-group">
					<sf:label path="legalAssignee" cssClass="col-sm-2 control-label">法人代表</sf:label>
					<div class="col-sm-10">
						<p class="form-control-static">
							<c:out value="${project.legalAssignee}" />
						</p>
					</div>
				</div>

				<div class="form-group">
					<sf:label path="isWithholdingOffsite"
						cssClass="col-sm-2 control-label">异地代扣代缴</sf:label>
					<div class="col-sm-10">
						<p class="form-control-static">
							<c:out value="${project.isWithholdingOffsite}" />
						</p>
					</div>
				</div>

				<div class="form-group">
					<sf:label path="managementRate" cssClass="col-sm-2 control-label">管理费率</sf:label>
					<div class="col-sm-10">
						<p class="form-control-static">
							<fmt:formatNumber pattern="#,##0.00"
								value="${project.managementRate}" />
						</p>
					</div>
				</div>

				<div class="form-group">
					<sf:label path="taxRate" cssClass="col-sm-2 control-label">税金比率</sf:label>
					<div class="col-sm-10">
						<p class="form-control-static">
							<fmt:formatNumber pattern="#,##0.00" value="${project.taxRate}" />
						</p>
					</div>
				</div>

				<div class="form-group">
					<sf:label path="contractAmount" cssClass="col-sm-2 control-label">合同金额</sf:label>
					<div class="col-sm-10">
						<p class="form-control-static">
							<fmt:formatNumber pattern="#,##0.00"
								value="${project.contractAmount}" />
						</p>
					</div>
				</div>

				<div class="form-group">
					<sf:label path="settlementAmount" cssClass="col-sm-2 control-label">结算金额</sf:label>
					<div class="col-sm-10">
						<p class="form-control-static">
							<fmt:formatNumber pattern="#,##0.00"
								value="${project.settlementAmount}" />
						</p>
					</div>
				</div>

				<div class="form-group">
					<sf:label path="dutyPaidTime" cssClass="col-sm-2 control-label">印花税上交时间</sf:label>
					<div class="col-sm-10">
						<p class="form-control-static">
							<fmt:formatDate value="${project.dutyPaidTime}"
								pattern="yyyy-MM-dd HH:mm:ss" />
						</p>
					</div>
				</div>

				<div class="form-group">
					<sf:label path="dutyPaidAmount" cssClass="col-sm-2 control-label">印花税上交金额</sf:label>
					<div class="col-sm-10">
						<p class="form-control-static">
							<fmt:formatNumber pattern="#,##0.00"
								value="${project.dutyPaidAmount}" />
						</p>
					</div>
				</div>

				<div class="form-group">
					<sf:label path="dutyPaidCode" cssClass="col-sm-2 control-label">印花税收据编号</sf:label>
					<div class="col-sm-10">
						<p class="form-control-static">
							<c:out value="${project.dutyPaidCode}" />
						</p>
					</div>
				</div>

				<div class="form-group">
					<sf:label path="capitalOccupied" cssClass="col-sm-2 control-label">占用资金情况</sf:label>
					<div class="col-sm-10">
						<p class="form-control-static">
							<fmt:formatNumber pattern="#,##0.00"
								value="${project.capitalOccupied}" />
						</p>
					</div>
				</div>

				<div class="form-group">
					<sf:label path="projectStatus" cssClass="col-sm-2 control-label">项目状态</sf:label>
					<div class="col-sm-10">
						<p class="form-control-static">
							<c:out value="${project.projectStatus}" />
						</p>
					</div>
				</div>

				<div class="form-group">
					<sf:label path="trice" cssClass="col-sm-2 control-label">登记时间</sf:label>
					<div class="col-sm-10">
						<p class="form-control-static">
							<fmt:formatDate value="${project.trice}"
								pattern="yyyy-MM-dd HH:mm:ss" />
						</p>
					</div>
				</div>

				<div class="form-group">
					<sf:label path="createTime" cssClass="col-sm-2 control-label">创建时间</sf:label>
					<div class="col-sm-10">
						<p class="form-control-static">
							<fmt:formatDate value="${project.createTime}"
								pattern="yyyy-MM-dd HH:mm:ss" />
						</p>
					</div>
				</div>

				<div class="form-group">
					<sf:label path="createUser" cssClass="col-sm-2 control-label">创建用户</sf:label>
					<div class="col-sm-10">
						<p class="form-control-static">
							<c:out value="${project.createUser}" />
						</p>
					</div>
				</div>

				<div class="form-group">
					<sf:label path="updateTime" cssClass="col-sm-2 control-label">修改时间</sf:label>
					<div class="col-sm-10">
						<p class="form-control-static">
							<fmt:formatDate value="${project.updateTime}"
								pattern="yyyy-MM-dd HH:mm:ss" />
						</p>
					</div>
				</div>

				<div class="form-group">
					<sf:label path="updateUser" cssClass="col-sm-2 control-label">修改用户</sf:label>
					<div class="col-sm-10">
						<p class="form-control-static">
							<c:out value="${project.updateUser}" />
						</p>
					</div>
				</div>

				<div class="form-group">
					<sf:label path="description" cssClass="col-sm-2 control-label">备注</sf:label>
					<div class="col-sm-10">
						<p class="form-control-static">
							<c:out value="${project.description}" />
						</p>
					</div>
				</div>
			</sf:form>
		</div>
	</div>
</div>
<%@ include file="bottom.jsp"%>
