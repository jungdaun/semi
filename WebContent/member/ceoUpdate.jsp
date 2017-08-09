<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <jsp:useBean id="mdto" class="semi.member.MemberDTO" />
<jsp:setProperty property="*" name="mdto" />
<jsp:useBean id="mdao" class="semi.member.MemberDAO" />

<%@ page import="java.sql.*"%>
<%@ page import="semi.member.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
String stype = (String) session.getAttribute("stype");
if(stype == null || stype.equals("")) {
	stype = "테스트";
}

String sid = (String) session.getAttribute("sid");


MemberDTO dto = mdao.memberUpdate(mdto, stype, sid);


%>
<script>

function findAddress() {
	window.open('findAddress2.jsp', 'findAddress', 'width = 800, height = 400');
}

function aa() {
	
	
	var email1= document.update.email1.value;
	var email2 = document.update.email2.value;
	document.update.email.value = email1 + "@" + email2;
	update.submit();
}

function selectEmail() {
	
	if(document.update.email3.value!="0") {
		document.update.email2.value = document.update.email3.value;
		document.update.email2.readOnly = true;
	} else {
		document.update.email2.value = "";
		document.update.email2.readOnly = false;
	}
	
	
	
}

function goOut() {
	location.href = 'memberOut.jsp';
}

function show(){
	
	document.update.id.value = '<%=sid%>';
	
	
	var email = '<%=dto.getEmail()%>'.split('@');
	
	document.update.email1.value = email[0];
	document.update.email2.value = email[1];
	
}
function changePwd() {
	location.href = 'changePwd.jsp';
}
</script>
<style>
h2 {
	text-align: center;
}

fieldset {
	width: 450px;
	margin: 0px auto;
}

section li {
	list-style-type: none;
}

label {
	width: 130px;
	float: left;
}

section p {
	text-align: center;
}
</style>
</head>

<body onload = "show()">
<input type = "button" value = "회원 탈퇴" onclick = "goOut()">
<input type = "button" value = "비밀번호 변경" onclick = "changePwd()">
<section>
		<article>
			<h2>회원정보수정</h2>
			<form name="update" action="ceoUpdate_ok.jsp" method = "post">
			<input type = "hidden" name = "id">
				<fieldset>
					<legend>회원  정보</legend>
					<ul>

						<li><label>이름</label> <input type="text" name="name" value = "<%=dto.getName()%>">
						</li>

						
						<li><label>이메일</label> <input type="text" name="email1" required="required" size = "10">@</li>
						
						<li><label>&nbsp;&nbsp;&nbsp;</label>
						<input type = "text" name = "email2" required="required">
						<select name = "email3" onchange = "selectEmail()">
						
						<option value = "0">직접입력</option>
						<option value = "naver.com">네이버</option>
						<option value = "daum.net">다음</option>
						</select>
						<input type="hidden" name="email"></li>
						
					</ul>

					<p>
						<input type="button" onclick="javascript:aa()" value="수정하기">
					</p>
				</fieldset>
			</form>
		</article>
	</section>
</body>
</html>