<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html >


<%


request.setCharacterEncoding("utf-8");
String sid = (String )session.getAttribute("sid");

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
write page 

<form name="vocWrite" action="vocWrite_ok.jsp">
	<table>
		<tr>
			<th>제목</th>
			<td><input type="text" name="title"> </td>
		</tr>
		<tr>
			<th>글쓴이</th>
			<td>
			<%
			if (sid == null || sid.equals("")){
				
				
				out.println ("<input type='text' name='writer'> ");
				
			}
			else {
				out.println ("<input type='text' name='writer' value = '"+sid+"' readonly='readonly'> ");
			}
			
			%>
			</td>
			
			
		</tr>
		<tr>
			<th>본문</th>
			<td><textarea rows="10" cols="45" name="content"></textarea> </td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="pwd" > </td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="submit"> </td>
		</tr>
	</table>
</form>

</body>
</html>