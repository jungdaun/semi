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
#maintable{
margin: 0px auto;
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
#aa{
text-align: center;
}
#joinwrap{
width: 850px;
	height: 100%;
	margin-top: 200px;
	margin-left: 30px;
   margin-right: 30px;
	
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
<div id="joinwrap">
<h1>배·민 회원가입</h1>
<form action="join_ok.jsp" name="join" method="post">
         <table id="maintable">
            <tr>
               <th>ID</th>
               <td><input type="text" name="id" 
               required="required" size="27" 
               readonly="readonly" onclick="openIdCheck()"></td>
               <td><input type="button" value="중복검사" onclick="openIdCheck"></td>
            </tr>

            <tr>
               <th>이름</th>
               <td><input type="text" name="name" required="required" size="27"></td>
            </tr>

            <tr>
               <th>비밀번호</th>
               <td><input type="password" name="password" required="required" placeholder="영문 ·숫자 (8~12) 조합" size="27">
               </td>
               
            </tr>

            <tr>
               <th>비밀번호 확인</th>
               <td><input type="password" name="pwd2" required="required" size="27"></td>
            </tr>

            <tr>
               <th>전화번호</th>
               <td><select name="tel1">
                     <option value="010">010</option>
                     <option value="011">011</option>
                     <option value="017">017</option>
               </select> - <input type="text" name="tel2" size="4" maxlength="4" required="required"> -
                  <input type="text" name="tel3" size="4" maxlength="4" required="required">
                  <input type="hidden" name="tel">
                  </td>
            </tr>

            <tr>
               <th>주소</th>
               <td><input type="text" name="address" size="27" readonly="readonly" onclick="findAddress()"></td>
               <td><input type="button" value="주소찾기" onclick="findAddress()"></td>
            </tr>

            <tr>
               <th>상세주소</th>
               <td><input type="text" name="address2" size="27" readonly="readonly"></td>
            </tr>

            <tr>
               <th>E-Mail</th>
               <td><input type="text" size="9" name="email1" required="required"> @ <input
                  type="text" size="9" name="email2" required="required"></td>
               <td><select name="email3"  onchange = "selectEmail()">
                     <option value="0">직접입력</option>
                     <option value="naver.com">naver.com</option>
                     <option value="daum.net">daum.net</option>
               </select><input type="hidden" name="email"></td> 
            </tr>

            <tr>
               <th>2차비밀번호 질문</th>
               <td><select name="ask" style="width:215px;">
                     <option value="나의 첫 사랑은?">나의 첫사랑은?</option>
                     <option value="나의 출신 초등학교는?">나의 초등학교 출신은?</option>
                     <option value="내 보물 1호는?">내 보물 1호는?</option>
               </select></td>
            </tr>

            <tr>
               <th>2차비밀번호 답변</th>
               <td><input type="text" name="ans" size="27" required="required"></td>
            </tr>

            <tr>
               <td id="aa"align="center" colspan="3"><input type="button" onclick="javascript:aa()"value="회원가입">&nbsp&nbsp&nbsp&nbsp&nbsp<input
                  type="reset" value="다시작성"></td>
            </tr>
         </table>
      </form>

	<%@include file="/footer.jsp"%>
	</div>
</div>
	
</body>
</html>