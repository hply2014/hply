<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="container main">
	<div class="panel panel-default">
		<div class="panel-heading">
			<strong>${page_title}</strong>
		</div>
		<div class="panel-body">
			<sf:form modelAttribute="fieldTypes" cssClass="form-horizontal"
				role="form">
				<div class="row">
					<div class="col-sm-8">
						<div class="row">
							<label for="fieldT01" class="col-sm-2 control-label">字段一</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>
								<sf:hidden path="fieldT01" />
									<div id="_fieldT01"></div>
								<p class="help-block">&nbsp;</p>
							</div>





							<label for="fieldT02" class="col-sm-2 control-label">字段二</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="fieldT02"
									placeholder="字段二" />
								<p class="help-block">&nbsp;</p>
							</div>

						</div>


						<div class="row">
							<label for="fieldT03" class="col-sm-2 control-label">字段三</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>
								<div class="input-group date">
									<sf:input cssClass="form-control" path="fieldT03"
										data-date-format="yyyy-mm-dd" />
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-calendar"></i></span>
								</div>
								<p class="help-block">&nbsp;</p>
							</div>





							<label for="fieldT04" class="col-sm-2 control-label">字段四</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="fieldT04"
									placeholder="字段四" />
								<p class="help-block">&nbsp;</p>
							</div>

						</div>


						<div class="row">
							<label for="fieldT05" class="col-sm-2 control-label">自端午</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="fieldT05"
									placeholder="自端午" />
								<p class="help-block">&nbsp;</p>
							</div>





							<label for="fieldT06" class="col-sm-2 control-label">字段六</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>
								<div class="input-group date">
									<sf:input cssClass="form-control" path="fieldT06"
										data-date-format="yyyy-mm-dd" />
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-calendar"></i></span>
								</div>
								<p class="help-block">&nbsp;</p>
							</div>

						</div>


						<div class="row">
							<label for="fieldT07" class="col-sm-2 control-label">字段七</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="fieldT07"
									placeholder="字段七" />
								<p class="help-block">&nbsp;</p>
							</div>





							<label for="fieldT08" class="col-sm-2 control-label">字段八</label>
							<div class="col-sm-4 required-field-block">
								<b class="required-icon">*</b>

								<sf:input cssClass="form-control" path="fieldT08"
									placeholder="字段八" />
								<p class="help-block">&nbsp;</p>
							</div>

						</div>


						<button type="submit" class="btn btn-info pull-right">
							<span class="glyphicon glyphicon-ok"></span> 提 交
						</button>
						<a href='<s:url value="/fieldtypes" />' class="btn btn-link"><span
							class="glyphicon glyphicon-share-alt"></span> 返 回 </a>

					</div>
					<div class="col-sm-4">
						<div class="bs-callout bs-callout-danger">
							<h4>需要手动设置宽度</h4>
							<p>
								在 Bootstrap 中，输入框和单选/多选框控件默认被设置为
								<code>width: 100%;</code>
								宽度。在内联表单，我们将这些元素的宽度设置为
								<code>width: auto;</code>
								，因此，多个控件可以排列在同一行。根据你的布局需求，可能需要一些额外的定制化组件。
							</p>
						</div>
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
		</div>
		<!--/panel-body-->
	</div>
	<!--/panel-->
</div>
<!--/container main -->
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
				fieldT07 : {
					required : true,
					number : true
				},
				fieldT08 : {},
			}
		});

		var ms = $('#_fieldT01').magicSuggest({
			allowFreeEntries : false,
			highlight: false,
			maxSelection: 1,
			expandOnFocus: true,
			placeholder: '选择一个合同项目',
			noSuggestionText: '必选',
			data : [ {
				id : 1,
				name : '第一个项目',
				nb : 34
			}, {
				id : 2345,
				name : '第二项目XyZ',
				nb : 106
			} , {
				id : 23,
				name : '一二项目',
				nb : 106
			} , {
				id : 26,
				name : '第一二',
				nb : 106
			}  ],
		}).setValue([26]);
		$(ms).on('selectionchange', function(e,m){
			$("#fieldT01").val(this.getValue());
			// alert("values: " + this.getValue());
		});
	});
</script>
<%@ include file="bottom.jsp"%>
