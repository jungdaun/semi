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
<link rel="stylesheet" type="text/css" href="/semi/css/mainLayout.css">
<%
String stype1 = (String) session.getAttribute("stype");
if(stype1 == null || stype1.equals("")) {
	stype1 = "테스트";
}

String sid1 = (String) session.getAttribute("sid");


MemberDTO dto = mdao.memberUpdate(mdto, stype1, sid1);


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
	
	document.update.id.value = '<%=sid1%>';
	
	
	var email = '<%=dto.getEmail()%>'.split('@');
	
	document.update.email1.value = email[0];
	document.update.email2.value = email[1];
	
	var ask = '<%=dto.getAsk()%>';
	z = document.update.ask.length;
	for(i = 0; i < z; i++) {
		if(document.update.ask[i].value==ask) {
			document.update.ask.options[i].selected = true;
		}
	}
	
	var ans = '<%=dto.getAns()%>';
	document.update.ans.value = ans;
	
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
<%@include file="/header.jsp"%>
<div id="bodywrap">

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
						
						<li><label>2차비밀번호질문</label>
						<select name = "ask">
							<option value = "나의 첫 사랑은?">나의 첫 사랑은?</option>
							<option value = "나의 출신 초등학교는?">나의 출신 초등학교는?</option>
							<option value = "내 보물 1호는?">내 보물 1호는?</option>
						</select></li>
						
						<li><label>2차비밀번호답변</label> <input type="text" name="ans" required="required"></li>
						
					</ul>

					<p>
						<input type = "button" value = "회원 탈퇴" onclick = "goOut()">
						<input type = "button" value = "비밀번호 변경" onclick = "changePwd()">
						<input type="button" onclick="javascript:aa()" value="수정하기">
					</p>
				</fieldset>
			</form>
		</article>
	</section>
	</div>
	<%@include file="/footer.jsp"%>
</body>
</html>