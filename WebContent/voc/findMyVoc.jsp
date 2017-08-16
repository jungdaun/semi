
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>

<link rel="stylesheet" type="text/css" href="/semi/css/mainLayout.css">
<meta charset=UTF-8">
<title>Insert title here</title>

<style>
	h2{
		text-align: center;
		color: white; 
		
	}
	table{
		width: 450px;
		border-top: 4px double white;
		border-bottom: 4px double white;
		margin: 0px auto;
		border-spacing: 0px;
		background-color: white ; 
	}
	table th{
		background: #BF0920;
		color: white; 
		text-align: center;
	}
	table td{
		text-align: center
		
		;
	}
	
	tfoot {
		border-top: 4px double #BF0920;
		
	
	}
	
</style>

</head>
<body>



<%@include file="/header.jsp"%>
		<div id="bodywrap">

<!-- -------------------------------------------------------------- -->

<h2><%=request.getParameter("mySid") %>님이 작성하신 질문입니다. </h2>

<!-- -------------------------------------------------------------- -->
		</div>
<%@include file="/footer.jsp"%>


</body>
</html>