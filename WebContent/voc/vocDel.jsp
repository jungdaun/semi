<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/semi/css/mainLayout.css">
<style>
	h2{
		text-align: center;
		color: white; 
		
	}
	table{
		width: 450px;

		  

		
		margin: 0px auto;
		border-spacing: 0px;
		background-color: white ; 
		
	}
	table th{
	
		  			border-top: 1px solid #BF0920;
		border-bottom: 1px solid #BF0920;
		color: black; 
		text-align: center;
	}
	table td{
	
	
		text-align: left
		;
					border-top: 1px solid #BF0920;
		border-bottom: 1px solid #BF0920;
		
		color: black; 
	
		;
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
	
	String voc_idx = request.getParameter("voc_idx");
	%>
	<form action="vocDel_ok.jsp" name="vocDel">
	<font color="white">비밀번호:</font>
		<input type="hidden" name="voc_idx" value="<%=voc_idx%>" >
		<input type="password" name="pwd">
		<input type="submit" value="확인">
	</form>
	
	

<!-- -------------------------------------------------------------- -->
		</div>
<%@include file="/footer.jsp"%>
	
	
	
	
	
</body>
</html>