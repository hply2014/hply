<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="container main">
    <div class="panel panel-default">
        <div class="panel-heading">
            <strong>${page_title}</strong>
        </div>
        <div class="panel-body">
            <sf:form modelAttribute="sysResource" cssClass="form-horizontal" role="form">
                <div class="row">
                    <div class="col-sm-8">
                        <div class="row">
                            <label for="resCode" class="col-sm-2 control-label">资源编码</label>
                            <div class="col-sm-4 ">
                                <sf:input cssClass="form-control" path="resCode" placeholder="资源编码" />
                                <p class="help-block" />
                            </div>

                            <label for="resName" class="col-sm-2 control-label">资源名称</label>
                            <div class="col-sm-4 ">
                                <sf:input cssClass="form-control" path="resName" placeholder="资源名称" />
                                <p class="help-block" />
                            </div>
                        </div>
                        <div class="row">
                            <label for="icon" class="col-sm-2 control-label">图标路径</label>
                            <div class="col-sm-4 ">
                                <sf:input cssClass="form-control" path="icon" placeholder="图标路径" />
                                <p class="help-block" />
                            </div>

                            <label for="resUrl" class="col-sm-2 control-label">URL地址</label>
                            <div class="col-sm-4 ">
                                <sf:input cssClass="form-control" path="resUrl" placeholder="URL地址" />
                                <p class="help-block" />
                            </div>
                        </div>
                        <div class="row">
                            <label for="resType" class="col-sm-2 control-label">资源类型</label>
                            <div class="col-sm-4 ">
                                <sf:input cssClass="form-control" path="resType" placeholder="资源类型" />
                                <p class="help-block" />
                            </div>

                            <label for="orderBy" class="col-sm-2 control-label">顺序号</label>
                            <div class="col-sm-4 ">
                                <sf:input cssClass="form-control" path="orderBy" placeholder="顺序号" />
                                <p class="help-block" />
                            </div>
                        </div>
                        <div class="row">
                            <label for="parentId" class="col-sm-2 control-label">父ID</label>
                            <div class="col-sm-4 ">
                                <sf:input cssClass="form-control" path="parentId" placeholder="父ID" />
                                <p class="help-block" />
                            </div>

                            <label for="enabled" class="col-sm-2 control-label">是否禁用</label>
                            <div class="col-sm-4 ">
                                <sf:input cssClass="form-control" path="enabled" placeholder="是否禁用" />
                                <p class="help-block" />
                            </div>
                        </div>
                        <div class="row">
                            <sf:label path="description" cssClass="col-sm-2 control-label">备注</sf:label>
                            <div class="col-sm-10">
                                <sf:textarea cssClass="form-control" rows="3" path="description" placeholder="备注，500字以内" />
                                <p class="help-block" />
                            </div>
                        </div>

                        <button type="submit" class="btn btn-info pull-right">
                            <span class="glyphicon glyphicon-ok"></span> 提 交
                        </button>
                        <a href='<s:url value="/sysresource" />' class="btn btn-link"><span
                            class="glyphicon glyphicon-share-alt"></span> 返 回 </a>

                    </div>
                </div>
                <c:if test="${not empty errors}">
                    <div id="alert-error" class="col-sm-6 col-sm-offset-5">
                        <div class="alert alert-danger alert-dismissible fade in" role="alert">
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
        </div>
        <!--/panel-body-->
    </div>
    <!--/panel-->
</div>
<!--/container main -->
<script type="text/javascript">
	$(function() {
		$("form").validate({
			errorElement : "i",
			success : function(label, element) {
				$(element).next().html('<b class="glyphicon glyphicon-ok text-success"></b><i>正确</i>');
			},
			errorPlacement : function(error, element) {
				element.next().html('<b class="glyphicon glyphicon-remove text-danger"></b><i>' + error.html() + "</i>");
			},
			rules : {
				resCode : {},
				resName : {},
				icon : {},
				resUrl : {},
				resType : {},
				orderBy : {},
				parentId : {},
				enabled : {},
				description : {},
			}
		});
	});
</script>
<%@ include file="bottom.jsp"%>
