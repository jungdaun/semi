<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>

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
#noticeWrite{
	width: 850px;
	height: 100%;
	margin-top: 200px;
	margin-bottom: 50px;
	margin-left: 30px;
   margin-right: 30px;
}
</style>
<meta charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/semi/css/mainLayout.css">

<title>Insert title here</title>
</head>
<body>

	<%@include file="/header.jsp"%>
	<div id="bodywrap">
	<div id="noticeWrite">

		<!-- -------------------------------------------------------------- -->


		<h2>공지사항 글쓰기</h2>
		<form action="noticeWrite_ok.jsp" name="noticeWrite">
			<table>

				<tr>
					<th>제목</th>
					<td colspan="3"><input type="text" name="notice_title"
						required="required" size="40"></td>
				</tr>

				<tr>
					<th>글쓴이</th>
					<td><input type="text" name="notice_writer"
						required="required"></td>


				</tr>



				<tr>
					<td colspan="4"><textarea rows="10" cols="45"
							name="notice_content" maxlength="4000"></textarea></td>

				</tr>
				<tfoot>
					<tr>
						<td colspan="4" style="text-align: center;"><input
							type="submit" value="글쓰기"> <input type="reset"
							value="초기화"></td>
					</tr>
				</tfoot>



			</table>


		</form>

		<!-- -------------------------------------------------------------- -->
	</div>
	<%@include file="/footer.jsp"%>
</div>


</body>
</html>