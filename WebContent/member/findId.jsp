<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table img {
	width: 350px;
	height: 300px;
}

table {
	margin: 0px auto;
	border-collapse: separate;
	border-spacing: 10px;
}

table td {
	text-align: center;
	font-weight: bold;
}

.a {
	margin: 0px auto;
}
fieldset {
width: 550px;
margin: 0px auto;
}

</style>
<script>
function a() {
	document.findId.type.value = opener.document.login.what.value;
	document.findId.name.value = opener.document.login.what.value;
}
</script>
</head>
<body onload = "a()">
	<section>
		<article>
		<form name = "findId" action = "findId_ok.jsp">
		<fieldset>
		<legend>아이디 찾기</legend>
		<label>이름 : </label><input type="text" name="name" required="required">
		<label>이메일주소 : </label><input type="text" name="email" required="required">
		<input type = "hidden" name = "type">
		<input type = "submit" value = "찾기">
		</fieldset>
		</form>
			
		</article>
	</section>
</body>
</html>