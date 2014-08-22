<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="container main">
	<div class="panel panel-default">
		<div class="panel-heading">
			<strong>${page_title}</strong>
		</div>
		<div class="panel-body">
			<div class="btn-toolbar" role="toolbar">
				<div class="btn-group">
					<a href="<s:url value="/fieldtypes" />" class="btn btn-info"><span
						class="glyphicon glyphicon-share-alt"></span> 返 回 </a>
				</div>
				<div class="btn-group">
					<a
						href="<s:url value="/fieldtypes/modify/{id}"><s:param name="id" value="${fieldTypes.id }" /></s:url>"
						class="btn btn-info"><span class="glyphicon glyphicon-pencil"></span>
						修 改 </a>
				</div>
				<div class="btn-group">
					<a
						data-confirm-message="一个Demo测试样表数据：<c:out value="${fieldTypes.id}" />，将被永久删除，操作不可撤销，是否确认？"
						href="<s:url value="/fieldtypes/delete/{id}"><s:param name="id" value="${fieldTypes.id }" /></s:url>"
						class="btn btn-info delete"><span
						class="glyphicon glyphicon-trash"></span> 删 除 </a>
				</div>
			</div>

			<sf:form modelAttribute="fieldTypes" cssClass="form-horizontal"
				role="form">
				<div class="form-group">
					<sf:label path="fieldT01" cssClass="col-sm-2 control-label">字段一</sf:label>
					<div class="col-sm-10">
						<p class="form-control-static">
							<c:out value="${fieldTypes.fieldT01}" />
						</p>
					</div>
				</div>

				<div class="form-group">
					<sf:label path="fieldT02" cssClass="col-sm-2 control-label">字段二</sf:label>
					<div class="col-sm-10">
						<p class="form-control-static">
							<fmt:formatNumber pattern="#,##0.00"
								value="${fieldTypes.fieldT02}" />
						</p>
					</div>
				</div>

				<div class="form-group">
					<sf:label path="fieldT03" cssClass="col-sm-2 control-label">字段三</sf:label>
					<div class="col-sm-10">
						<p class="form-control-static">
							<fmt:formatDate value="${fieldTypes.fieldT03}"
								pattern="yyyy-MM-dd HH:mm:ss" />
						</p>
					</div>
				</div>

				<div class="form-group">
					<sf:label path="fieldT04" cssClass="col-sm-2 control-label">字段四</sf:label>
					<div class="col-sm-10">
						<p class="form-control-static">
							<fmt:formatNumber pattern="#,##0.00"
								value="${fieldTypes.fieldT04}" />
						</p>
					</div>
				</div>

				<div class="form-group">
					<sf:label path="fieldT05" cssClass="col-sm-2 control-label">自端午</sf:label>
					<div class="col-sm-10">
						<p class="form-control-static">
							<c:out value="${fieldTypes.fieldT05}" />
						</p>
					</div>
				</div>

				<div class="form-group">
					<sf:label path="fieldT06" cssClass="col-sm-2 control-label">字段六</sf:label>
					<div class="col-sm-10">
						<p class="form-control-static">
							<fmt:formatDate value="${fieldTypes.fieldT06}"
								pattern="yyyy-MM-dd HH:mm:ss" />
						</p>
					</div>
				</div>

				<div class="form-group">
					<sf:label path="fieldT07" cssClass="col-sm-2 control-label">字段七</sf:label>
					<div class="col-sm-10">
						<p class="form-control-static">
							<fmt:formatNumber pattern="#,##0.00"
								value="${fieldTypes.fieldT07}" />
						</p>
					</div>
				</div>

				<div class="form-group">
					<sf:label path="fieldT08" cssClass="col-sm-2 control-label">字段八</sf:label>
					<div class="col-sm-10">
						<p class="form-control-static">
							<c:out value="${fieldTypes.fieldT08}" />
						</p>
					</div>
				</div>
			</sf:form>
		</div>
	</div>
</div>
<%@ include file="bottom.jsp"%>