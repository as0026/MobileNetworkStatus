<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'judgeByJs.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript">
	var connection = navigator.connection || navigator.mozConnection
			|| navigator.webkitConnection || {
				type : 'unknown'
			};
	var type_text = [ 'unknown', 'ethernet', 'wifi', '2g', '3g', '4g', 'none' ];

	//alert(connection.type);
	function get_status() {
		if (typeof (connection.type) == "number") {
			connection.type_text = type_text[connection.type];
		} else {
			connection.type_text = connection.type;
		}
		if (typeof (connection.bandwidth) == "number") {
			if (connection.bandwidth > 10) {
				connection.type = 'wifi';
			} else if (connection.bandwidth > 2) {
				connection.type = '3g';
			} else if (connection.bandwidth > 0) {
				connection.type = '2g';
			} else if (connection.bandwidth == 0) {
				connection.type = 'none';
			} else {
				connection.type = 'unknown';
			}
		}
		var html = 'Type : ' + connection.type_text;
		html += '<br>Bandwidth : ' + connection.bandwidth;
		html += '<br>isOnline : ' + navigator.onLine;
		var showResultDiv=document.getElementById("showResult");
		showResultDiv.innerHTML = html;
	}

</script>
</head>

<body>
	<button id="btn" onclick="get_status()">查看网络类型</button>
	<br>
	<p id="showResult"></p>
</body>
</html>
