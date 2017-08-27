<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.oreilly.servlet.*"%>
    <jsp:useBean id="wf" class="semi.image.ImageDAO" scope="session" />
    <%
request.setCharacterEncoding("utf-8");
    wf.userFolderExixts();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function aa() {
	document.image.a.value = document.image.upload.value;
	image.submit();
}
</script>
</head>
<body>
<form name="image" action="image_ok.jsp" method="post" enctype="multipart/form-data">
<fieldset>
	<legend>파일 선택하기</legend>
	File:<input type="file" name="upload">
	
	<input type = "hidden" name = "a">
	<input type = "button" value="올리기" onclick = "aa()">
</fieldset>
</form>
</body>
</html>