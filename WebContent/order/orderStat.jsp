<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >


<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="orderStat_ok.jsp" name="orderStat">

<input type="radio" name="key" value="1">일간
<input type="radio" name="key" value="2">주간
<input type="radio" name="key" value="3">월간
<input type="radio" name="key" value="4">시간대별

<input type="submit" value="조회">
</form>

</body>
</html>