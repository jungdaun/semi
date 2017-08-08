<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<html>
<head>

<style type="text/css">



</style>

<meta charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h2>공지사항 글쓰기</h2>
		<form action="noticeWrite_ok.jsp" name="noticeWrite">
			<table border="1">
			
				<tr>
					<td>writer</td> 
					<td><input type="text" name="notice_writer" required="required"> </td> 
					
			
				</tr>
				
				
				<tr >
					<td>title</td> 
					<td colspan="3"><input type="text" name="notice_title" required="required" size="40" > </td> 
				</tr>
				
				<tr >
					<td>content</td> 
					<td colspan="3"><textarea rows="10" cols="45" name="notice_content" maxlength="4000"></textarea></td>
					
				</tr>
				<tr>
					<td colspan="4" align="center"><input type="submit" value="submit"> 
					<input type="reset" value="reset"> </td>
				</tr>
			
				
			</table>
			
		
		</form>


</body>
</html>