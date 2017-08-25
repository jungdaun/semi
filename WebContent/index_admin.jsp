<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html><head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="css/mainLayout.css">

</head>
<body>
	<%@include file="header.jsp"%>
	<div id="bodywrap">
	<h2>관리자 페이지</h2>
	<a href="/semi/notice/noticeList.jsp">공지사항 관리</a><br>
	<a href="/semi/coupon/couponList.jsp">쿠폰관리</a><br>
	<a href="/semi/voc/vocList.jsp">voc 관리</a><br>

	</div>
</body>
</html>