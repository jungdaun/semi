<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">

<link rel="stylesheet" type="text/css" href="/semi/css/mainLayout.css">
<style type="text/css">
	h2{
		text-align: center;
		color: white; 
		
	}

</style>
<title>Insert title here</title>
</head>
<body>



<%@include file="/header.jsp"%>
		<div id="bodywrap">

<!-- -------------------------------------------------------------- -->
	<h2>비밀번호를 입력하세요</h2>
	<%
	

request.setCharacterEncoding("utf-8");
	
	String voc_idx = request.getParameter("idx");
	%>
	<form action="vocContent.jsp" name="pwdCheck">
	<font color="white">비밀번호:</font>
		<input type="hidden" name="idx" value="<%=voc_idx%>" >
		<input type="password" name="pwd">
		<input type="submit" value="확인">
	</form>
<!-- -------------------------------------------------------------- -->
		</div>
<%@include file="/footer.jsp"%>



</body>
</html>


