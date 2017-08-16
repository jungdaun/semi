<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<thead>
		<tr>
			<th>ID</th> <td>아이디 불러오기</td>
			<th>Password</th> <td><input type="password" value="4자리 숫자 입력" name="pwd"></td>
		</tr>
		<tr>
			<th>별점주기</th>
			<td><select name="start">
			<% for(int i=1; i<6; i++){%>
				<option value="<%=i%>"><%=i %></option>
			<%}
			%>
			</select></td>
			<th>날짜</th> <td>자동으로 날짜 올리기</td>
		</tr></thead>
		
		<tbody>
		<tr>
			<th>사진 올리기 : </th> <td colspan="3">사진 찾아서 upload</td>
		</tr>
		<tr>
			<td colspan="4">
			<textarea rows="25%" cols="65%" name="contents"></textarea>
			</td>
		</tr>
		</tbody>
	</table>

</body>
</html>