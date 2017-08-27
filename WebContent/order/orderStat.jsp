<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
 %>
<!DOCTYPE html >


<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
<style>
#orderStat{
	width: 850px;
	height: 100%;
	margin-top: 200px;
	margin-bottom: 160px;
	margin-left: 30px;
   margin-right: 30px;
   color: white;
   font-size: 30px;
}
button{
width: 20px;

}
</style>
</head>
<body>
<%@include file="/header.jsp" %>
<div id="bodywrap">
<div id="orderStat">
<form action="orderStat_ok.jsp" name="orderStat"  >

<input type="radio" name="key" value="1">일간매출조회
<input type="radio" name="key" value="3">월간매출조회
<input type="submit" value="조회" style="width: 70px; height: 40px;">

</form>

</div>
<%@include file="/footer.jsp" %>
</div>
</body>
</html>