<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >


<%
	request.setCharacterEncoding("utf-8");
	//String sid = (String )session.getAttribute("sid");
%>
<html>
<head>



<title>Insert title here</title>
<meta charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/semi/css/mainLayout.css">

<style>
h2 {
	text-align: center;
	color: white;
}

table {
	width: 450px;
	margin: 0px auto;
	border-spacing: 0px;
	background-color: white;
}

table th {
	border-top: 1px solid #BF0920;
	border-bottom: 1px solid #BF0920;
	color: black;
	text-align: center;
}

table td {
	text-align: left;
	border-top: 1px solid #BF0920;
	border-bottom: 1px solid #BF0920;
	color: black;
	
}
#vocwrite{
	width: 850px;
	height: 100%;
	margin-top: 200px;
	margin-bottom: 160px;
	margin-left: 30px;
   margin-right: 30px;
}
</style>


</head>
<body>




	<%@include file="/header.jsp"%>
	<div id="bodywrap">

		<!-- -------------------------------------------------------------- -->
		<div id="vocwrite">
			<h2>1:1 문의하기</h2>

			<form name="vocWrite" action="vocWrite_ok.jsp">
				<div style="display: inline-block; text-align: center;">
					<table>
						<tr>
							<th>제목</th>
							<td colspan="3"><input type="text" name="title"
								required="required"></td>
						</tr>
						<tr>
							<th>글쓴이</th>
							<td colspan="3"><input type="text" name="writer"
								value="<%=sname%>" readonly="readonly" required="required">

							</td>


						</tr>
						<tr>
							<td colspan="4"><textarea rows="10" cols="45" name="content"
									required="required"></textarea></td>
						</tr>

						<!-- 
	
		<tr>
			<th>비밀번호</th>
			<td colspan="4"><input type="password" name="pwd" required="required" > </td>
		</tr>
		
		 -->

						<tr>
							<td colspan="4" style="text-align: center;"><input
								type="submit" value="submit"></td>
						</tr>
					</table>
				</div>

			</form>

			<!-- -------------------------------------------------------------- -->

			<%@include file="/footer.jsp"%>
		</div>
	</div>






</body>
</html>