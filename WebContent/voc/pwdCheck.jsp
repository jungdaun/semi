<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	

request.setCharacterEncoding("utf-8");
	
	String voc_idx = request.getParameter("idx");
	%>
	<form action="vocContent.jsp" name="vocDel">
	pwd:
		<input type="hidden" name="idx" value="<%=voc_idx%>" >
		<input type="password" name="pwd">
		<input type="submit" value="ok">
	</form>
</body>
</html>


