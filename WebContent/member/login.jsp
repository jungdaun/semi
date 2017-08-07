<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
fieldset li {
	list-style-type: none;
}
fieldset label {
	width: 90px;
	float: Left;
}
fieldset p {
	text-align: right;
}
</style>
<script>
	function findId() {
		window.open('findId.jsp', 'findId', 'width = 600, height = 200');
		
	}
	function findPwd() {
		window.self.close();
		opener.location.href = 'findPwd.jsp';
	}
</script>
</head>
<%
Cookie cks[] = request.getCookies();
String saveid = "";
if(cks!=null) {
	for(int i = 0; i < cks.length; i++) {
		if(cks[i].getName().equals("saveid")) {
			saveid = cks[i].getValue();
		}
	}
}

%>
<body>
	<form name="login" action="login_ok.jsp" method="post">
		<!-- 주소창에 비밀번호 안보이게 하려겅 -->
		<fieldset>
			<legend>LOGIN</legend>
			<ul>
				<li><input type = "radio" name = "what" value = "고객" checked="checked">고객<input type = "radio" name = "what" value = "사장">사장</li>
				<li><label>ID</label> <input type="text" name="userid" placeholder="아이디" value = "<%=saveid%>">
				</li>
				<li><label>Password</label> <input type="password" name="userpwd" placeholder="비밀번호">
				</li>
			</ul>
			<input type="checkbox" name="saveid" value="on"
			<%=saveid.equals("")?"":"checked"%>> ID 기억하기
			<p><input type = "submit" value = "Login"></p>
			
			<input type = "button" value = "아이디 찾기" onclick = "findId()"> <input type = "button" value = "비밀번호 찾기" onclick = "findPwd()">
		</fieldset>



	</form>

</body>
</html>