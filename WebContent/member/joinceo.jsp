<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/semi/css/mainLayout.css">
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
#joinceowrap{
width: 850px;
height: 100%;
margin-top: 200px;
margin-left: 30px;
   margin-right: 30px;
}

</style>
<script>
	function openIdCheck() {
		window.open('ceoCheck.jsp', 'ceoCheck', 'width = 400, height = 200');
	}

	function aa() {

		var a = document.joinceo.password.value;
		var b = document.joinceo.pwd2.value;

		var email1 = document.joinceo.email1.value;
		var email2 = document.joinceo.email2.value;

		if (a == b) {

			document.joinceo.email.value = email1 + "@" + email2;

			joinceo.submit();
		} else {
			window.alert('비밀번호와 비밀번호확인 값이 다릅니다.');
		}

	}

	function selectEmail() {

		if (document.joinceo.email3.value != "0") {
			document.joinceo.email2.value = document.joinceo.email3.value;
			document.joinceo.email2.readOnly = true;
		} else {
			document.joinceo.email2.value = "";
			document.joinceo.email2.readOnly = false;
		}

	}
</script>

</head>
<body>
	<%@include file="/header.jsp"%>
	<div id="bodywrap">
	<div id="joinceowrap">
	<h1>사장회원가입</h1>
		<section>
			<article>
				<form name="joinceo" action="joinceo_ok.jsp" method="post">
						<div style="display: inline-block; text-align: center;">
						<table>
							<tr>
								<th>ID</th>
								<td><input type="text" name="id" readonly="readonly"
									onclick="openIdCheck()" size="27"></td>
								<td><input type="button" value="중복검사"
									onclick="openIdCheck()"></td>
							</tr>
							<tr>
								<th>이름</th>
								<td><input type="text" name="name" required="required" size="27">
								</td>
							</tr>

							<tr>
								<th>비밀번호</th>
								<td><input type="password" name="password"
									required="required" placeholder="영문 숫자조합" size="27"></td>
							</tr>

							<tr>
								<th>비밀번호 확인</th>
								<td><input type="password" name="pwd2" required="required"
									placeholder="8~12자" size="27"></td>
							</tr>
							<tr>
								<th>E-Mail</th>
								<td><input type="text" name="email1" required="required"
									size="10">@
								<input type="text" name="email2" required="required" size="10">
								</td>
								<td><select name="email3" onchange="selectEmail()">

										<option value="0">직접입력</option>
										<option value="naver.com">네이버</option>
										<option value="daum.net">다음</option>
								</select></td>
								<td><input type="hidden" name="email"></td>
							</tr>

							<tr>
								<th>2차비밀번호 질문</th>
								<td><select name="ask" style="width:210px;">
										<option value="나의 첫 사랑은?">나의 첫 사랑은?</option>
										<option value="나의 출신 초등학교는?">나의 출신 초등학교는?</option>
										<option value="내 보물 1호는?">내 보물 1호는?</option>
								</select></td>
							</tr>

							<tr>
								<th>2차비밀번호 답변</th>
								<td><input type="text" name="ans" required="required" size="27"></td>
							</tr>
							<tr>
								<td id="aa" align="center" colspan="3"><input type="button"
									onclick="javascript:aa()" value="회원가입">&nbsp&nbsp&nbsp&nbsp&nbsp
									<input type="reset" value="다시작성"></td>
							</tr>

						</table>
						</div>
				</form>
			</article>
		</section>
	</div>
	<%@include file="/footer.jsp"%>
</div>	
</body>
</html>