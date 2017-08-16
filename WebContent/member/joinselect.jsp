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
		<div id="bodywrap">
			<input type = "button" onclick = "join()" value = "고객회원가입">
			<input type = "button" onclick = "joinceo()" value = "사장회원가입">
		</div>
<%@include file="/footer.jsp"%>
</body>
</html>