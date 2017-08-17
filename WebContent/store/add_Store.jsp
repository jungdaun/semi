<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<jsp:useBean id="sdao" class="semi.store.StoreDAO" scope="page" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/semi/css/mainLayout.css">
<script>
	function findAddress() {
		window.open('/semi/member/findAddress.jsp', 'findAddress', 'width = 800, height = 400');
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

	
</script>
</head>    

<body>
<%@include file="/header.jsp"%>
		<div id="bodywrap">
			<h3>가게 기본 정보 입력하기</h3>
			<form name = "join">
			<table id="maintable">
           

            <tr>
               <th>이름</th>
               <td><input type="text" name="name" required="required" size="27"></td>
            </tr>
            
            <tr>
            	<th>음식 종류</th>
            	<td><select name="what">
                     <option value="chicken">chicken</option>
                     <option value="011">011</option>
                     <option value="017">017</option>
               </select></td>
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
               <td id="aa"align="center" colspan="3"><input type="button" onclick="javascript:aa()"value="회원가입">&nbsp&nbsp&nbsp&nbsp&nbsp<input
                  type="reset" value="다시작성"></td>
            </tr>
         </table>
			
			</form>
		</div>
<%@include file="/footer.jsp"%>
</body>
</html>