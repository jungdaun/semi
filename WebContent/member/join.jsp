<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/semi/css/mainLayout.css">
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
<script>
	function openIdCheck() {
		window.open('idCheck.jsp', 'idCheck', 'width = 400, height = 200');
	}
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
<body>
<%@include file="/header.jsp"%>
<div id="bodywrap">
	<section>
		<article>
			<h2>고객회원가입</h2>
			<form name="join" action="join_ok.jsp" method = "post">
				<fieldset>
					<legend>회원 가입 정보</legend>
					<ul>
						<li><label>ID</label> <input type="text" name="id"
							readonly="readonly" onclick="openIdCheck()"> <input type="button" value="중복검사"
							onclick="openIdCheck()"></li>


						<li><label>이름</label> <input type="text" name="name" required="required">
						</li>

						<li><label>비밀번호</label> <input type="password" name="password" required="required"> <font size=1px;>영문 숫자 조합</font>
						</li>

						<li><label>비밀번호확인</label> <input type="password" name="pwd2" required="required"> <font size=1px;>8~12자</font>
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
						<input type="button" onclick="javascript:aa()" value="회원가입">
						<input type="reset" value="다시작성">
					</p>
				</fieldset>
			</form>
		</article>
	</section>
	</div>
	<%@include file="/footer.jsp"%>
</body>
</html>