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
	document.findPwd.type.value = opener.document.login.what.value;
}
</script>
</head>
<body onload = "a()">

	<section>
		<article>
			<form name="findPwd" action="findPwd_ok.jsp">
				<fieldset>
					<legend>비밀번호 찾기</legend>
					<label>아이디 : </label><input type="text" name="id"
						required="required"> <label>2차비밀번호질문</label> <select
						name="ask">
						<option value="나의 첫 사랑은?">나의 첫 사랑은?</option>
						<option value="나의 출신 초등학교는?">나의 출신 초등학교는?</option>
						<option value="내 보물 1호는?">내 보물 1호는?</option>
					</select>< <label>2차비밀번호답변</label> <input type="text" name="ans"
						required="required"> <input type="submit" value="찾기">
				</fieldset>
				<input type = "hidden" name = "type">
			</form>

		</article>
	</section>
</body>
</html>