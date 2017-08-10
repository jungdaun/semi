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
	
	var tel1 = document.update.tel1.value;
	var tel2 = document.update.tel2.value;
	var tel3 = document.update.tel3.value;
	
	var email1= document.update.email1.value;
	var email2 = document.update.email2.value;
	document.update.tel.value = tel1+tel2+tel3;
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
	j = document.update.tel1.length;
	var a = '<%=dto.getTel().substring(0, 3)%>';
	var b = '<%=dto.getTel().substring(3, 7)%>';
	var c = '<%=dto.getTel().substring(7, 11)%>';
	document.update.tel2.value = b;
	document.update.tel3.value = c;
	for(i = 0; i < j; i++) {
		if(document.update.tel1[i].value==a) {
			document.update.tel1.options[i].selected = true;
		}
	}
	
	var add1 = '<%=dto.getAddress()%>';
	var add2 = '<%=dto.getAddress2()%>';
	
	document.update.address.value = add1;
	document.update.address2.value = add2;
	
	var email = '<%=dto.getEmail()%>'.split('@');
	
	document.update.email1.value = email[0];
	document.update.email2.value = email[1];
	
	
	//반대로 가져오는 오류가 있어..
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
<input type = "button" value = "회원 탈퇴" onclick = "goOut()">
<input type = "button" value = "비밀번호 변경" onclick = "changePwd()">
<section>
		<article>
			<h2>회원정보수정</h2>
			<form name="update" action="memberUpdate_ok.jsp" method = "post">
			<input type = "hidden" name = "id">
				<fieldset>
					<legend>회원  정보</legend>
					<ul>

						<li><label>이름</label> <input type="text" name="name" value = "<%=dto.getName()%>">
						</li>
						
						<li><label>전화번호</label>
						<select name = "tel1">
							<option value = "010">010</option>
							<option value = "011">011</option>
							<option value = "017">017</option>
						</select> 
						-<input type="text" name="tel2" size = "4" required="required">-<input type="text" name="tel3" size = "4" required="required">
						<input type="hidden" name="tel">
						</li>

						<li><label>주소</label> <input type="text" name="address"
						readonly="readonly" onclick="findAddress()">
						<input type="button" value="주소찾기" onclick="findAddress()"></li>
						
						<li><label>상세주소</label><input type="text" name="address2" readonly="readonly"></li>
						
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
						<input type="button" onclick="javascript:aa()" value="수정하기">
					</p>
				</fieldset>
			</form>
		</article>
	</section>
</body>
</html>