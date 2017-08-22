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
<style>
#joinselectwrap {
	width: 850px;
	height: 100%;
	margin-top: 200px;
}
</style>
</head>
<body>
	
		<%@include file="/header.jsp"%>
		
		<div id="bodywrap">
		<div id="joinselectwrap">
			<img src="/semi/img/joina.jpg" onclick="join()" width=250px;
				height=250px;> <img src="/semi/img/joinb.jpg"
				onclick="joinceo()" width=250px; height=250px;>
		
		<%@include file="/footer.jsp"%>
		</div>
	</div>
</body>
</html>