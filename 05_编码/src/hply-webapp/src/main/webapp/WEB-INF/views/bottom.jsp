<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<div class="modal fade" id="myModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title">操作提示</h4>
			</div>
			<div class="modal-body">
				<p id="myModalContent">One fine body&hellip;</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger">
					<span class="glyphicon glyphicon-saved"></span> 确定
				</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">
					<span class="glyphicon glyphicon-share-alt"></span> 取消
				</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<script src="<s:url value="/assets/bootstrap-datepicker/js/bootstrap-datepicker.js" />"></script>
<script src="<s:url value="/assets/bootstrap-datepicker/js/bootstrap-datepicker.zh-CN.js" />" charset="UTF-8"></script>
<script type="text/javascript">
	$(function() {
		$(".delete").click(function() {
			$("#myModalContent").html($(this).attr("data-confirm-message"));
			$('#myModal').data("href", $(this).attr("href")).modal("show");
			return false;
		});

		$("#myModal .btn-danger").click(function() {
			$('#myModal').modal("hide");
			self.location.replace($("#myModal").data("href"));
		});

		$(".input-group.date").datepicker({
			language : "zh-CN",
			autoclose : true,
			todayHighlight : true
		});

	});
</script>
</body>
</html>