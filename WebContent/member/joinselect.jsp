<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/semi/css/mainLayout.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function join() {
	location.href = 'join.jsp';
}
function joinceo() {
	location.href = 'joinceo.jsp';
}
</script>
</head>
<body>
<%@include file="/header.jsp"%>
<br><br><br><br><br><br>
		<div id="bodywrap">
			<img src = "/semi/img/joina.jpg" onclick = "join()" width = 250px; height = 250px;>
			<img src = "/semi/img/joinb.jpg" onclick = "joinceo()" width = 250px; height = 250px;>
		</div>
<%@include file="/footer.jsp"%>
</body>
</html>