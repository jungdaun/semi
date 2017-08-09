<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function a() {
	document.changePwd.id.value = opener.document.happy.id.value;
	
}
</script>
</head>
<body onload = "a()">
	<form name="changePwd" action="changePwd_ok.jsp" method = "post">
		<fieldset>
			<legend>새 비밀번호 입력</legend>
			<ul>
				<li><label>비밀번호</label> <input type="password" name="password"
					required="required"> <font size=1px;>영문 숫자 조합</font></li>

				<li><label>비밀번호확인</label> <input type="password" name="password2"
					required="required"> <font size=1px;>8~12자</font></li>
					
					
						 
				<li><input type = "submit" value = "변경"></li>
			</ul>
			<input type = "hidden" name = "id">
			<input type = "hidden" name = "type">
		</fieldset>


	</form>

</body>
</html>