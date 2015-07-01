<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<title>navigator.network.connection.type Example</title>
<script type="text/javascript" src="jquery-2.0.2.min.js"></script>
<script type="text/javascript">
	var t1 = new Date().getTime();
</script>

</head>

<body>

	<script type="text/javascript">
		var t2;
		window.onload = function() {
			this.t2 = new Date().getTime();

			document.getElementById("TimeShow").innerHTML = "加载本页耗时"
					+ (t2 - t1) + "毫秒";

			if ((t2 - t1) < 9) {
				document.getElementById("NetworkType").innerHTML = "WIFI网络";
			}
		}
	</script>
	<script type="text/javascript">
		$(document).ready(function() {
			var t3 = new Date().getTime();
			var aj = $.ajax({
				url : 'judgeNetType',
				data : {
					beginTime : t1,
					endTime : t3
				},
				type : 'post',
				cache : false,
				dataType : 'json',
				sucess : function(data) {
					alert(data);
					if (data.msg == "wifi") {
						alert("ok!");
					}else{
						alert("ko!");
					}
				},
				error : function() {
					alert("no!");
				}
			});
			
		});
	</script>
	<div id="TimeShow"></div>
	<div id="NetworkType"></div>
	<p><a href="judgeByJs.jsp">通过JS检测类型</a></a></p>
	<br />
</body>
</html>
