<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%><!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
	<title>幻想的表格树 # Demo</title>

	<script src="assets/jquery.min.js" type="text/javascript"></script>
	<script src="assets/jquery-ui.min.js" type="text/javascript"></script>
	<link href="assets/ui.fancytree.css" rel="stylesheet" type="text/css">
	<script src="assets/jquery.fancytree.js" type="text/javascript"></script>

<script type="text/javascript">
	$(function(){
		$("#tree").fancytree({
			icons: false,
			checkbox: true,
			source: {
				url: encodeURI("api/tree/中文"),
				cache: false
			},
			activate: function(event, data) {
				data.node.setSelected(true);
			},
			select: function(event, data) {
				var s = data.node.key;
				alert(s);
				//TODO: 保存数据...
				
			}
		});
	});
</script>
</head>

<body>
	<div id="tree"></div>
</body>
</html>
