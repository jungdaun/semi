<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
html {
	height: 100%;
	width: 100%;
	min-height:100%;
	min-width:100%;
	background-repeat: no-repeat;
	background-image: url("img/backgroundImg.jpg") ;
	background-size: cover;
	text-align: center;
}

#wrap {
	width: 1280px;
	height: 1024px;
	display: inline-block;
}
</style>
</head>
<body>
	<div id="wrap">
		<%@include file="header.jsp"%>
		<div id=bodywrap></div>
		<%@include file="footer.jsp"%>
	</div>

</body>
</html>

