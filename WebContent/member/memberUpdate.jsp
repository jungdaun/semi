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
	if (stype1 == null || stype1.equals("")) {
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
	
	document.update.id.value = '<%=sid1%>';
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
h1 {
	text-align: center;
	color: white;
}
th{
height: 25px;
font-size: 15px;
text-align: left;
border: 1px solid black;
background-color: #e4e4e4;
}
td{
text-align: left;
}
#memberup{
width: 850px;
	height: 100%;
	margin-top: 200px;
}
</style>
</head>

<body onload="show()">
	<%@include file="/header.jsp"%>
	<div id="bodywrap">
	<div id="memberup">
	
		<h1>회원정보수정</h1>
		<section>
			<article>
				<form name="update" action="memberUpdate_ok.jsp" method="post">
					<input type="hidden" name="id">
					<div style="display: inline-block; text-align: center;">
					<table>
						<tr>
							<th>이름</th>
							<td><input type="text" name="name" size="23"
								value="<%=dto.getName()%>"></td>
						</tr>

						<tr>
							<th>전화번호</th>
							<td><select name="tel1">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="017">017</option>
							</select> - <input type="text" name="tel2" size="4" required="required">-
								<input type="text" name="tel3" size="4" required="required">
								<input type="hidden" name="tel"></td>
						</tr>

						<tr>
							<th>주소</th>
							<td><input type="text" name="address" readonly="readonly"
								onclick="findAddress()" size="23"> <input type="button"
								value="주소찾기" onclick="findAddress()"></td>
						</tr>

						<tr>
							<th>상세주소</th>
							<td><input type="text" name="address2" readonly="readonly" size="23">
							</td>
						</tr>
						
						<tr>
						<th>E-Mail</th> 
						<td><input type="text" name="email1"
							required="required" size="8">@<input type="text"
							name="email2" required="required" size="8"> 
							<select name="email3"
							onchange="selectEmail()">
								<option value="0">직접입력</option>
								<option value="naver.com">네이버</option>
								<option value="daum.net">다음</option>
						</select> 
						<input type="hidden" name="email">
						</td>
						</tr>
						
						<tr>
						<th>2차비밀번호 질문</th> 
						<td><select name="ask" style="width:180px;">
								<option value="나의 첫 사랑은?">나의 첫 사랑은?</option>
								<option value="나의 출신 초등학교는?">나의 출신 초등학교는?</option>
								<option value="내 보물 1호는?">내 보물 1호는?</option>
						</select>
						</td>
						</tr>
						
						<tr>
						<th>2차비밀번호 답변</th>
						<td><input type="text" name="ans"
							required="required" size="23"></td>
							</tr>
					</table>
					</div>
					<p>
						<input type="button" value="회원 탈퇴" onclick="goOut()"> <input
							type="button" value="비밀번호 변경" onclick="changePwd()"> <input
							type="button" onclick="javascript:aa()" value="수정하기">
					</p>

				</form>
			</article>
		</section>
	
	<%@include file="/footer.jsp"%>
	</div>
	</div>
</body>
</html>