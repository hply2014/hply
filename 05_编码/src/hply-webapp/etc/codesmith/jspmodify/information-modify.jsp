<%@ page isELIgnored="false"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib
	uri="http://www.springframework.org/tags" prefix="s"%><%@ taglib
	uri="http://www.springframework.org/tags/form" prefix="sf"%><%@ page
	language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%><%@ include file="header.jsp"%>
<div class="container main"><div class="panel panel-default">
	<div class="panel-heading">
		<strong>${page_title}</strong>
	</div>
	<div class="panel-body">
		<sf:form modelAttribute="information" cssClass="form-horizontal"
			role="form">
				<div class="row"><div class="col-sm-8">
        <div class="row">
							<label for="organizationId" class="col-sm-2 control-label">所在部门</label>
							<div class="col-sm-4 ">
								<sf:input cssClass="form-control" path="organizationId"
									placeholder="所在部门" />
								<p class="help-block">&nbsp;</p>
							</div>
        
							<label for="projectName" class="col-sm-2 control-label">项目名称</label>
							<div class="col-sm-4 ">
								<sf:input cssClass="form-control" path="projectName"
									placeholder="项目名称" />
								<p class="help-block">&nbsp;</p>
							</div></div>
        <div class="row">
							<label for="address" class="col-sm-2 control-label">地址</label>
							<div class="col-sm-4 ">
								<sf:input cssClass="form-control" path="address"
									placeholder="地址" />
								<p class="help-block">&nbsp;</p>
							</div>
        
							<label for="developer" class="col-sm-2 control-label">开发商</label>
							<div class="col-sm-4 ">
								<sf:input cssClass="form-control" path="developer"
									placeholder="开发商" />
								<p class="help-block">&nbsp;</p>
							</div></div>
        <div class="row">
							<label for="epcCorporation" class="col-sm-2 control-label">总包单位</label>
							<div class="col-sm-4 ">
								<sf:input cssClass="form-control" path="epcCorporation"
									placeholder="总包单位" />
								<p class="help-block">&nbsp;</p>
							</div>
        
							<label for="variety" class="col-sm-2 control-label">品种</label>
							<div class="col-sm-4 ">
								<sf:input cssClass="form-control" path="variety"
									placeholder="品种" />
								<p class="help-block">&nbsp;</p>
							</div></div>
        <div class="row">
							<label for="totalArea" class="col-sm-2 control-label">总面积</label>
							<div class="col-sm-4 ">
								<sf:input cssClass="form-control" path="totalArea"
									placeholder="总面积" />
								<p class="help-block">&nbsp;</p>
							</div>
        
							<label for="realName" class="col-sm-2 control-label">姓名</label>
							<div class="col-sm-4 ">
								<sf:input cssClass="form-control" path="realName"
									placeholder="姓名" />
								<p class="help-block">&nbsp;</p>
							</div></div>
        <div class="row">
							<label for="identification" class="col-sm-2 control-label">身份证号</label>
							<div class="col-sm-4 ">
								<sf:input cssClass="form-control" path="identification"
									placeholder="身份证号" />
								<p class="help-block">&nbsp;</p>
							</div>
        
							<label for="contact" class="col-sm-2 control-label">联系方式</label>
							<div class="col-sm-4 ">
								<sf:input cssClass="form-control" path="contact"
									placeholder="联系方式" />
								<p class="help-block">&nbsp;</p>
							</div></div>
        <div class="row">
							<label for="subscriber" class="col-sm-2 control-label">登记人</label>
							<div class="col-sm-4 ">
								<sf:input cssClass="form-control" path="subscriber"
									placeholder="登记人" />
								<p class="help-block">&nbsp;</p>
							</div>
        
							<label for="trice" class="col-sm-2 control-label">登记时间</label>
							<div class="col-sm-4 ">
					<div class="input-group date">
						<sf:input cssClass="form-control" path="trice"
							data-date-format="yyyy-mm-dd" />
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-calendar"></i></span>
					</div>
								<p class="help-block">&nbsp;</p>
							</div></div>
						<div class="row">
							<sf:label path="description" cssClass="col-sm-2 control-label">备注</sf:label>
							<div class="col-sm-10">
								<sf:textarea cssClass="form-control" rows="3" path="description"
									placeholder="备注，500字以内" />
								<p class="help-block">&nbsp;</p>
							</div>
						</div>
                        
						<button type="submit" class="btn btn-info pull-right">
							<span class="glyphicon glyphicon-ok"></span> 提 交
						</button>
						<a href='<s:url value="/information" />' class="btn btn-link"><span
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
							<h4>请求错误</h4>
							<p>
								<sf:errors path="*" />
							</p>
						</div>
					</div>
				</c:if>
		</sf:form>
		</div><!--/panel-body-->
	</div><!--/panel-->
</div><!--/container main -->
<script type="text/javascript">
	$(function() {
		$("form").validate({
			errorElement : "i",
			success : function(label, element) {
				$(element)
						.next()
						.html(
								'<b class="glyphicon glyphicon-ok text-success"></b><i>正确</i>');
			},
			errorPlacement : function(error, element) {
				element.next().html(
						'<b class="glyphicon glyphicon-remove text-danger"></b><i>'
								+ error.html() + "</i>");
			},
			rules : { 	
                organizationId : {
                }, 
                projectName : {
                }, 
                address : {
                }, 
                developer : {
                }, 
                epcCorporation : {
                }, 
                variety : {
                }, 
                totalArea : {
                }, 
                realName : {
                }, 
                identification : {
                }, 
                contact : {
                }, 
                subscriber : {
                }, 
                trice : {
                }, 
                description : {
                }, 
			}
		});
	});
</script>
<%@ include file="bottom.jsp"%>
