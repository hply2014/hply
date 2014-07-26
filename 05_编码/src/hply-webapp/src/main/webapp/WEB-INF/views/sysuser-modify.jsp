<%@ page isELIgnored="false"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib
	uri="http://www.springframework.org/tags" prefix="s"%><%@ taglib
	uri="http://www.springframework.org/tags/form" prefix="sf"%><%@ page
	language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%><%@ include file="header.jsp"%>
<div class="panel panel-default">
	<div class="panel-heading">
		<strong>${page_title}</strong>
	</div>
	<div class="panel-body">
		<sf:form modelAttribute="sysUser" cssClass="form-horizontal"
			role="form">
	<div class="form-group">
		<sf:label path="loginName" cssClass="col-sm-2 control-label">登陆名</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="loginName" placeholder="请输入文字..." />
            <sf:errors path="loginName" cssClass="error" />
		</div>
	</div>

	<div class="form-group">
		<sf:label path="realName" cssClass="col-sm-2 control-label">姓名</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="realName" placeholder="请输入文字..." />
            <sf:errors path="realName" cssClass="error" />
		</div>
	</div>

	<div class="form-group">
		<sf:label path="organizationId" cssClass="col-sm-2 control-label">所在部门</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="organizationId" placeholder="请输入文字..." />
            <sf:errors path="organizationId" cssClass="error" />
		</div>
	</div>

	<div class="form-group">
		<sf:label path="password" cssClass="col-sm-2 control-label">密码</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="password" placeholder="请输入文字..." />
            <sf:errors path="password" cssClass="error" />
		</div>
	</div>

	<div class="form-group">
		<sf:label path="lastLoginIp" cssClass="col-sm-2 control-label">最后登陆IP</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="lastLoginIp" placeholder="请输入文字..." />
            <sf:errors path="lastLoginIp" cssClass="error" />
		</div>
	</div>

	<div class="form-group">
		<sf:label path="lastLoginTime" cssClass="col-sm-2 control-label">最后登陆时间</sf:label>
		<div class="col-sm-10">
					<div class="input-group date">
						<sf:input cssClass="form-control" path="lastLoginTime"
							data-date-format="yyyy-mm-dd" />
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-calendar"></i></span>
					</div>
            <sf:errors path="lastLoginTime" cssClass="error" />
		</div>
	</div>

	<div class="form-group">
		<sf:label path="fails" cssClass="col-sm-2 control-label">连续登录失败次数</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="fails" placeholder="请输入文字..." />
            <sf:errors path="fails" cssClass="error" />
		</div>
	</div>

	<div class="form-group">
		<sf:label path="logined" cssClass="col-sm-2 control-label">登陆总次数</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="logined" placeholder="请输入文字..." />
            <sf:errors path="logined" cssClass="error" />
		</div>
	</div>

	<div class="form-group">
		<sf:label path="position" cssClass="col-sm-2 control-label">职务</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="position" placeholder="请输入文字..." />
            <sf:errors path="position" cssClass="error" />
		</div>
	</div>

	<div class="form-group">
		<sf:label path="enabled" cssClass="col-sm-2 control-label">是否禁用</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="enabled" placeholder="请输入文字..." />
            <sf:errors path="enabled" cssClass="error" />
		</div>
	</div>

	<div class="form-group">
		<sf:label path="orderBy" cssClass="col-sm-2 control-label">顺序号</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="orderBy" placeholder="请输入文字..." />
            <sf:errors path="orderBy" cssClass="error" />
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
			<sf:input cssClass="form-control" path="createUser" placeholder="请输入文字..." />
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
			<sf:input cssClass="form-control" path="updateUser" placeholder="请输入文字..." />
            <sf:errors path="updateUser" cssClass="error" />
		</div>
	</div>

	<div class="form-group">
		<sf:label path="description" cssClass="col-sm-2 control-label">备注</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="description" placeholder="请输入文字..." />
            <sf:errors path="description" cssClass="error" />
		</div>
	</div>

	<div class="form-group">
		<sf:label path="mustChangePassword" cssClass="col-sm-2 control-label">下次登录是否必须修改密码</sf:label>
		<div class="col-sm-10">
			<sf:input cssClass="form-control" path="mustChangePassword" placeholder="请输入文字..." />
            <sf:errors path="mustChangePassword" cssClass="error" />
		</div>
	</div>
			<div>
				<div class="col-sm-5 control-label">
					<button type="submit" class="btn btn-primary">
						<span class="glyphicon glyphicon-ok"></span> 提 交
					</button>
				</div>
				<div class="col-sm-1 control-label">
					<a href='<s:url value="/sysuser" />' class="btn btn-default"><span
						class="glyphicon glyphicon-share-alt"></span> 返 回 </a>
				</div>
			</div>

		</sf:form>
	</div>
</div>

<%@ include file="bottom.jsp"%>
