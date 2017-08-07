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
<script>

function findAddress() {
	window.open('findAddress.jsp', 'findAddress', 'width = 800, height = 400');
}

function aa() {

	var a = document.join.password.value;
	var b = document.join.pwd2.value;
	
	
	var tel1 = document.join.tel1.value;
	var tel2 = document.join.tel2.value;
	var tel3 = document.join.tel3.value;
	
	var email1= document.join.email1.value;
	var email2 = document.join.email2.value;


	if (a == b) {
		
		document.join.tel.value = tel1+tel2+tel3;
		document.join.email.value = email1 + "@" + email2;
		
		join.submit();
	} else {
		window.alert('비밀번호와 비밀번호확인 값이 다릅니다.');
	}
	

}

function selectEmail() {
	
	if(document.join.email3.value!="0") {
		document.join.email2.value = document.join.email3.value;
		document.join.email2.readOnly = true;
	} else {
		document.join.email2.value = "";
		document.join.email2.readOnly = false;
	}
	
	
	
}


</script>
</head>
<%
String stype = (String) session.getAttribute("stype");
if(stype == null || stype.equals("")) {
	stype = "테스트";
}

String sid = (String) session.getAttribute("sid");


MemberDTO dto = mdao.memberUpdate(mdto, stype, sid);


%>
<body>
<section>
		<article>
			<h2>회원정보수정</h2>
			<form name="update" action="memberUpdate_ok.jsp" method = "post">
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